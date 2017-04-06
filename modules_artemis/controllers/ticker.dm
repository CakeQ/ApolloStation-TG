/datum/controller/subsystem/ticker/New()
	NEW_SS_GLOBAL(ticker)

	login_music = pickweight(list('sound/ambience/space_asshole.ogg' =10, 'sound/ambience/title3.ogg' =15, 'sound/ambience/title4.ogg' =15, 'sound/misc/i_did_not_grief_them.ogg' =15, 'sound/ambience/fire_fire.ogg' = 15, 'sound/ambience/space_oddity.ogg' = 15, 'sound/ambience/mining_song2.ogg' = 15, 'sound/ambience/mining_song3.ogg' = 15)) // choose title music!
	if(SSevent.holidays && SSevent.holidays[APRIL_FOOLS])
		login_music = 'sound/ambience/clown.ogg'


//Editing the fire method so the game setup cycles back to Startup if setup fails.
/datum/controller/subsystem/ticker/fire()
	switch(current_state)
		if(GAME_STATE_STARTUP)
			if(Master.initializations_finished_with_no_players_logged_in)
				start_at = world.time + (config.lobby_countdown * 10)
			for(var/client/C in clients)
				window_flash(C, ignorepref = TRUE) //let them know lobby has opened up.
			to_chat(world, "<span class='boldnotice'>Welcome to [station_name()]!</span>")
			current_state = GAME_STATE_PREGAME
			fire()
		if(GAME_STATE_PREGAME)
			if(ticker.start_immediately == FALSE && gamemodevoted == FALSE && clients.len > 0)
				SSvote.autogamemode()
				gamemodevoted = TRUE

				//lobby stats for statpanels
			if(isnull(timeLeft))
				timeLeft = max(0,start_at - world.time)
			totalPlayers = 0
			totalPlayersReady = 0
			for(var/mob/dead/new_player/player in player_list)
				++totalPlayers
				if(player.ready)
					++totalPlayersReady

			if(start_immediately)
				timeLeft = 0

			//check for gamemode vote
			if(SSvote.mode == "gamemode")
				return

			if(ticker.start_immediately == TRUE)
				SSvote.reset()

			//countdown
			if(timeLeft < 0)
				return
			timeLeft -= wait

			if(timeLeft <= 300 && !tipped)
				send_tip_of_the_round()
				tipped = TRUE

			if(timeLeft <= 0)
				current_state = GAME_STATE_SETTING_UP
				if(start_immediately)
					fire()

		if(GAME_STATE_SETTING_UP)
			if(!setup())
				//setup failed

				//Added code to cycle back to the pregame state and allow another calling of the vote.
				current_state = GAME_STATE_PREGAME
				gamemodevoted = FALSE
				fire()

		if(GAME_STATE_PLAYING)
			mode.process(wait * 0.1)
			check_queue()
			check_maprotate()
			scripture_states = scripture_unlock_alert(scripture_states)

			if(!mode.explosion_in_progress && mode.check_finished() || force_ending)
				current_state = GAME_STATE_FINISHED
				toggle_ooc(1) // Turn it on
				declare_completion(force_ending)