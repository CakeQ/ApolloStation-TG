/datum/controller/subsystem/job
	init_order = 5
	var/list/inductee_occupations = list() 	//List of all jobs chars unlock.

/datum/controller/subsystem/job/SetupOccupations(faction = "Station")
	occupations = list()
	var/list/all_jobs = subtypesof(/datum/job)
	if(!all_jobs.len)
		world << "<span class='boldannounce'>Error setting up jobs, no job datums found</span>"
		return 0

	for(var/J in all_jobs)
		var/datum/job/job = new J()
		if(!job)
			continue
		if(job.faction != faction)
			continue
		if(!job.config_check())
			continue
		if(job.rank_succession_level == INDUCTEE_SUCCESSION_LEVEL)
			inductee_occupations += job
			//setup base roles cause of bullshit ~
		occupations += job
		name_occupations[job.title] = job
		type_occupations[J] = job

	for(var/mob/dead/new_player/player/p in mob_list)
		if(!p.client.prefs.roles || !p.client.prefs.roles.len)
			p.client.prefs.roles = GetInducteeJobsRanks()

	return 1

/datum/controller/subsystem/job/proc/GetInducteeJobsRanks()
	var/list/iJobs = new/list()
	for(var/datum/job/j in inductee_occupations)
		iJobs += j.title

/datum/controller/subsystem/job/FindOccupationCandidates(datum/job/job, level, flag)
	Debug("Running FOC, Job: [job], Level: [level], Flag: [flag]")
	var/list/candidates = list()
	for(var/mob/dead/new_player/player/player in unassigned)
		if(jobban_isbanned(player, job.title))
			Debug("FOC isbanned failed, Player: [player]")
			continue
		if(!job.player_old_enough(player.client))
			Debug("FOC player not old enough, Player: [player]")
			continue
		if(flag && (!(flag in player.client.prefs.be_special)))
			Debug("FOC flag failed, Player: [player], Flag: [flag], ")
			continue
		if(player.mind && job.title in player.mind.restricted_roles)
			Debug("FOC incompatible with antagonist role, Player: [player]")
			continue
		if(config.enforce_human_authority && !player.client.prefs.pref_species.qualifies_for_rank(job.title, player.client.prefs.features))
			Debug("FOC non-human failed, Player: [player]")
			continue
		if(player.client.prefs.GetJobDepartment(job, level))
			Debug("FOC pass, Player: [player], Level:[level]")
			candidates += player
	return candidates

/datum/controller/subsystem/job/FillAIPosition(unassigned)
	var/ai_selected = 0
	var/datum/job/job = GetJob("AI")
	if(!job)
		return 0
	for(var/i = job.total_positions, i > 0, i--)
		for(var/level = 1 to 3)
			var/list/candidates = list()
			candidates = FindOccupationCandidates(job, level)
			if(candidates.len)
				var/mob/dead/new_player/player/candidate = pick(candidates)
				if(AssignRole(candidate, "AI"))
					ai_selected++
					break
	if(ai_selected)
		return 1
	return 0


/** Proc DivideOccupations
 *  fills var "assigned_role" for all ready players.
 *  This proc must not have any side effect besides of modifying "assigned_role".
 *	Totally redone for Artemis Station's role system ~rj
 **/
/datum/controller/subsystem/job/DivideOccupations()
	//Setup new player list and get the jobs list
	Debug("Running DO")

	//Holder for Triumvirate is stored in the ticker, this just processes it
	if(ticker)
		for(var/datum/job/ai/A in occupations)
			if(ticker.triai)
				A.spawn_positions = 3

	//Get the players who are ready
	for(var/mob/dead/new_player/player in player_list)
		if(player.ready && player.mind && !player.mind.assigned_role)
			unassigned += player

	initial_players_to_assign = unassigned.len

	Debug("DO, Len: [unassigned.len]")
	if(unassigned.len == 0)
		return 0

	//Scale number of open security officer slots to population
	setup_officer_positions()

	//Jobs will have fewer access permissions if the number of players exceeds the threshold defined in game_options.txt
	if(config.minimal_access_threshold)
		if(config.minimal_access_threshold > unassigned.len)
			config.jobs_have_minimal_access = 0
		else
			config.jobs_have_minimal_access = 1

	//Shuffle players and jobs
	unassigned = shuffle(unassigned)

	HandleFeedbackGathering()

	//People who have assistant as high should just get that role
	Debug("DO, Running Assistant Check 1")
	var/tmp/assigned = 0
	for(var/mob/dead/new_player/player/player in unassigned)
		if(player.client.prefs.roles["Assistant"] == "HIGH")
			Debug("AC1 pass, Player: [player]")
			AssignRole(player, "Assistant")
			unassigned -= player
			assigned ++
		if(assigned >= STARTING_ASSISTANTS)
			break

	Debug("DO, AC1 end")

	Debug("DO, Standart Check start")
	var/list/to_assign = unassigned.Copy()
	var/list/never_jobs = new/list()
	for(var/mob/dead/new_player/player in to_assign)
		if(PopcapReached())
			RejectPlayer(player)
			Debug("DO, Standart Check start, POPCAP REACHED!")
			break

		var/datum/job/high = null
		var/list/med_jobs = new/list()
		var/list/low_jobs = new/list()

		for(var/role in player.client.prefs.roles)
			if(player.client.prefs.roles[role] == "HIGH")
				high = GetJob(role)
			if(player.client.prefs.roles[role] == "MEDIUM")
				med_jobs += GetJob(role)
			if(player.client.prefs.roles[role] == "LOW")
				low_jobs += GetJob(role)
			if(player.client.prefs.roles[role] == "NEVER")
				never_jobs += GetJob(role)

		//Assign first choise
		if(!isnull(high) && istype(high))
			if(high.spawn_positions >= high.current_positions || high.spawn_positions == -1)
				AssignRole(player, high.title)
				unassigned -= player
				continue

		var/succes = 0

		//Assign seccond choise
		if(!isnull(med_jobs) && med_jobs.len)
			for(var/datum/job/job in shuffle(med_jobs))
				if(job.spawn_positions >= job.current_positions || job.spawn_positions == -1)
					succes = 1
					AssignRole(player, job.title)
					unassigned -= player
					break
			if(succes)
				continue

		//Assign thirth choise
		if(!isnull(low_jobs) && low_jobs.len)
			for(var/datum/job/job in shuffle(low_jobs))
				if(job.spawn_positions >= job.current_positions || job.spawn_positions == -1)
					succes = 1
					AssignRole(player, job.title)
					unassigned -= player
					break
			if(succes)
				continue
	Debug("DO, Standard Check end")

	to_assign = unassigned.Copy()

	Debug("DO, Running AC2")

	// For those who wanted to be assistant if their preferences were filled, here you go.
	for(var/mob/dead/new_player/player/p in to_assign)
		if(PopcapReached())
			RejectPlayer(p)
		if(p.client.prefs.joblessrole == BEASSISTANT)
			Debug("AC2 Assistant located, Player: [p]")
			AssignRole(p, "Assistant")
			unassigned -= p
		else // For those who don't want to play if their preference were filled, back you go.
			RejectPlayer(p)

	to_assign = unassigned.Copy()

	//Assign random job that the player has unlocked.
	for(var/mob/dead/new_player/player in to_assign)
		if(!isnull(never_jobs) && never_jobs.len)
			var/succes = 0
			for(var/datum/job/job in shuffle(never_jobs))
				if(job.spawn_positions >= job.current_positions || job.spawn_positions == -1)
					succes = 1
					AssignRole(player, job.title)
					unassigned -= player
					break
			if(succes)
				continue

	//Finally players that really cannot join because all the jobs they can occcupie are taken.
	for(var/mob/dead/new_player/player/p in unassigned)
		RejectPlayer(p)
	return 1

/datum/controller/subsystem/job/HandleFeedbackGathering()
	for(var/datum/job/job in occupations)
		var/tmp_str = "|[job.title]|"

		var/level1 = 0 //high
		var/level2 = 0 //medium
		var/level3 = 0 //low
		var/level4 = 0 //never
		var/level5 = 0 //banned
		var/level6 = 0 //account too young
		for(var/mob/dead/new_player/player/player in player_list)
			if(!(player.ready && player.mind && !player.mind.assigned_role))
				continue //This player is not ready
			if(jobban_isbanned(player, job.title))
				level5++
				continue
			if(!job.player_old_enough(player.client))
				level6++
				continue
			if(player.client.prefs.GetJobDepartment(job, 1))
				level1++
			else if(player.client.prefs.GetJobDepartment(job, 2))
				level2++
			else if(player.client.prefs.GetJobDepartment(job, 3))
				level3++
			else level4++ //not selected

		tmp_str += "HIGH=[level1]|MEDIUM=[level2]|LOW=[level3]|NEVER=[level4]|BANNED=[level5]|YOUNG=[level6]|-"
		feedback_add_details("job_preferences",tmp_str)