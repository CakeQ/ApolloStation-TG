/client/verb/looc(msg as text)
	set name = "LOOC"
	set category = "OOC"

	if(say_disabled)	//This is here to try to identify lag problems
		usr << "<span class='danger'>Speech is currently admin-disabled.</span>"
		return

	if(!mob)
		return

	if(IsGuestKey(key))
		src << "Guests may not use OOC."
		return

	msg = copytext(sanitize(msg), 1, MAX_MESSAGE_LEN)
	var/raw_msg = msg

	if(!msg)
		return

	msg = emoji_parse(msg)

	if((copytext(msg, 1, 2) in list(".",";",":","#")) || (findtext(lowertext(copytext(msg, 1, 5)), "say")))
		if(alert("Your message \"[raw_msg]\" looks like it was meant for in game communication, say it in LOOC?", "Meant for LOOC?", "No", "Yes") != "Yes")
			return

	if(!(prefs.toggles & CHAT_OOC))
		src << "<span class='alert'>You have LOOC muted.</span>"
		return

	if(!holder)
		if(!ooc_allowed)
			src << "<span class='danger'>OOC is globally muted.</span>"
			return
		if(!dooc_allowed && (mob.stat == DEAD))
			usr << "<span class='danger'>OOC for dead mobs has been turned off.</span>"
			return
		if(prefs.muted & MUTE_OOC)
			src << "<span class='danger'>You cannot use OOC (muted).</span>"
			return
		if(src.mob)
			if(jobban_isbanned(src.mob, "OOC"))
				src << "<span class='danger'>You have been banned from OOC.</span>"
				return
		if(handle_spam_prevention(msg,MUTE_OOC))
			return
		if(findtext(msg, "byond://"))
			src << "<B>Advertising other servers is not allowed.</B>"
			log_admin("[key_name(src)] has attempted to advertise in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise in OOC: [msg]")
			return

	log_ooc("(LOCAL) [mob.name]/[key] : [msg]")
	mob.log_message("[key]: [raw_msg]", INDIVIDUAL_OOC_LOG)

	var/mob/source = src.mob
	var/list/heard = get_hearers_in_view(7, source)
	var/display_name

	var/keyname = key
	if(prefs.unlock_content)
		if(prefs.toggles & MEMBER_PUBLIC)
			keyname = "<font color='[prefs.ooccolor ? prefs.ooccolor : normal_ooc_colour]'><img style='width:9px;height:9px;' class=icon src=\ref['icons/member_content.dmi'] iconstate=blag>[keyname]</font>"

	if(source.stat != DEAD)
		display_name = source.name
	else
		display_name = capitalize(source.ckey)

	for(var/client/C in clients)
		if(C.prefs.chat_toggles & CHAT_OOC)
			if(C.mob in heard)
				if(!(key in C.prefs.ignoring))
					C << "<font color='#3A9696'><span class='ooc'><span class='prefix'>LOOC:</span> <EM>[display_name]: </EM> <span class='message'>[msg]</span></span></font>"
