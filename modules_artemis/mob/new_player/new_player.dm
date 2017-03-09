/mob/new_player/IsJobAvailable(rank)
	var/datum/job/job = SSjob.GetJob(rank)
	if(!job)
		return 0
	if((job.current_positions >= job.total_positions) && job.total_positions != -1)
		if(job.title == "Assistant")
			if(isnum(client.player_age) && client.player_age <= 14) //Newbies can always be assistants
				return 1
			for(var/datum/job/J in SSjob.occupations)
				if(J && J.current_positions < J.total_positions && J.title != job.title)
					return 0
		else
			return 0

	//Check if the char has the role is unlocked.
	if(!client.prefs.has_role(rank))
		return 0
	//Check if the char has a jobban.
	if(jobban_isbanned(src,rank))
		return 0
	if(!job.player_old_enough(src.client))
		return 0
	if(config.enforce_human_authority && !client.prefs.pref_species.qualifies_for_rank(rank, client.prefs.features))
		return 0
	return 1