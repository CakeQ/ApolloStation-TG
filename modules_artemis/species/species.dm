//Overrided for custom eyes
/datum/species/handle_body(mob/living/carbon/human/H)
	H.remove_overlay(BODY_LAYER)

	var/list/standing	= list()

	var/obj/item/bodypart/head/HD = H.get_bodypart("head")


	// eyes
	var/has_eyes = TRUE

	if(!H.getorgan(/obj/item/organ/eyes) && HD)
		standing += image("icon"='icons/mob/human_face.dmi', "icon_state" = "eyes_missing", "layer" = -BODY_LAYER)
		has_eyes = FALSE

	if(!(H.disabilities & HUSK))
		// lipstick
		if(H.lip_style && (LIPS in species_traits) && HD)
			var/image/lips = image("icon"='icons/mob/human_face.dmi', "icon_state"="lips_[H.lip_style]", "layer" = -BODY_LAYER)
			lips.color = H.lip_color
			standing	+= lips

		// eyes
		if((EYECOLOR in species_traits) && HD && has_eyes)
			var/image/img_eyes
			if(H.getorgan(/obj/item/organ/eyes/skrell))
				img_eyes = image("icon" = 'icons/mob/human_face.dmi', "icon_state" = "skrelleyes", "layer" = -BODY_LAYER)
			else if(H.getorgan(/obj/item/organ/eyes/spacer))
				img_eyes = image("icon" = 'icons/mob/human_face.dmi', "icon_state" = "spaceeyes", "layer" = -BODY_LAYER)
			else
				img_eyes = image("icon" = 'icons/mob/human_face.dmi', "icon_state" = "eyes", "layer" = -BODY_LAYER)
			img_eyes.color = "#" + H.eye_color
			standing	+= img_eyes

	//Underwear, Undershirts & Socks
	if(H.underwear)
		var/datum/sprite_accessory/underwear/underwear = underwear_list[H.underwear]
		if(underwear)
			standing	+= image("icon"=underwear.icon, "icon_state"="[underwear.icon_state]", "layer"=-BODY_LAYER)

	if(H.undershirt)
		var/datum/sprite_accessory/undershirt/undershirt = undershirt_list[H.undershirt]
		if(undershirt)
			if(H.dna.species.sexes && H.gender == FEMALE)
				standing	+=	wear_female_version("[undershirt.icon_state]", undershirt.icon, BODY_LAYER)
			else
				standing	+= image("icon"=undershirt.icon, "icon_state"="[undershirt.icon_state]", "layer"=-BODY_LAYER)

	if(H.socks && H.get_num_legs() >= 2 && !(DIGITIGRADE in species_traits))
		var/datum/sprite_accessory/socks/socks = socks_list[H.socks]
		if(socks)
			standing	+= image("icon"=socks.icon, "icon_state"="[socks.icon_state]", "layer"=-BODY_LAYER)

	if(standing.len)
		H.overlays_standing[BODY_LAYER] = standing

	H.apply_overlay(BODY_LAYER)
	handle_mutant_bodyparts(H)