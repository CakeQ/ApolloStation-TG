/datum/species/nucleation
	name = "Nucleation"
	id = "nucleation"
	say_mod = "rattles"
	meat = /obj/item/weapon/shard/supermatter
	species_traits = list(NOBLOOD,RESISTCOLD,RADIMMUNE,NOTRANSSTING,VIRUSIMMUNE,NOHUNGER,RESISTPRESSURE,NOBREATH,EASYDISMEMBER)
	mutant_bodyparts = list("ears", "wings", "supermatter")
	default_features = list("ears" = "None", "wings" = "None", "supermatter" = "Nucleation Crystals")
	damage_overlay_type = ""//let's not show bloody wounds or burns over bones.
	burnmod = 4 // holy shite, poor guys wont survive half a second cooking smores
	brutemod = 2 // damn, double wham, double dam
	var/coreLevel = 1
	fixed_mut_color = SM_DEFAULT_COLOR

/datum/species/nucleation/highlevel
	id = "highlevelnucleation"
	species_traits = list(NOBLOOD,RESISTCOLD,RADIMMUNE,NOTRANSSTING,VIRUSIMMUNE,NOHUNGER,RESISTPRESSURE,EASYDISMEMBER)
	dangerous_existence = 1 //So so much
	blacklisted = 1 //See above
	breathid = "n2"
	var/internal_fire = FALSE //If the bones themselves are burning clothes won't help you much
	coreLevel = 4

/datum/species/nucleation/before_equip_job(datum/job/J, mob/living/carbon/human/H, visualsOnly = FALSE)
	H.disabilities += NOCLONE

/datum/species/nucleation/highlevel/spec_life(mob/living/carbon/human/H)
	..()
	var/datum/gas_mixture/environment = H.loc.return_air()
	var/atmos_sealed = (H.wear_suit && (H.wear_suit.flags & STOPSPRESSUREDMAGE)) && (H.head && (H.head.flags & STOPSPRESSUREDMAGE))
	if((!istype(H.w_uniform, /obj/item/clothing/under/plasmaman) || !istype(H.head, /obj/item/clothing/head/helmet/space/plasmaman)) && !atmos_sealed)
		if(environment)
			if(environment.total_moles())
				if(environment.gases["o2"] && (environment.gases["o2"][MOLES]) >= 1) //Same threshhold that extinguishes fire
					H.adjust_fire_stacks(0.5)
					if(!H.on_fire && H.fire_stacks > 0)
						H.visible_message("<span class='danger'>[H]'s body reacts with the atmosphere and bursts into flames!</span>","<span class='userdanger'>Your body reacts with the atmosphere and bursts into flame!</span>")
					H.IgniteMob()
					internal_fire = TRUE
	else
		if(H.fire_stacks)
			var/obj/item/clothing/under/plasmaman/P = H.w_uniform
			if(istype(P))
				P.Extinguish(H)
				internal_fire = FALSE
		else
			internal_fire = FALSE
	H.update_fire()

/datum/species/nucleation/highlevel/handle_fire(mob/living/carbon/human/H, no_protection)
	if(internal_fire)
		no_protection = TRUE
	..()

/datum/species/nucleation/highlevel/before_equip_job(datum/job/J, mob/living/carbon/human/H, visualsOnly = FALSE)
	var/datum/outfit/nucleation/O = new /datum/outfit/nucleation
	H.equipOutfit(O, visualsOnly)
	H.internal = H.get_item_for_held_index(2)
	H.update_internals_hud_icon(1)
	return 0

/datum/species/nucleation/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H)
	if(chem.id == "radium")
		H.adjustToxLoss(-0.5*REM, 0)
		H.adjustOxyLoss(-0.5*REM, 0)
		H.adjustBruteLoss(-0.5*REM, 0)
		H.adjustFireLoss(-0.5*REM, 0)
		H.reagents.remove_reagent(chem.id, REAGENTS_METABOLISM)
		return 1

/mob/living/carbon/human/proc/makeNucleation(mob/living/carbon/human/H, makeLevel)
	var/datum/species/nucleation/N
	if(makeLevel > 9)
		makeLevel = 9
	if(makeLevel > 3)
		H.set_species(/datum/species/nucleation/highlevel)
	else
		H.set_species(/datum/species/nucleation)
	N = H
	N.coreLevel = makeLevel

/datum/species/nucleation/spec_death(gibbed, mob/living/carbon/human/H)
	var/turf/T = get_turf(H)
	var/datum/species/nucleation/S = H.dna.species
	H.visible_message("<span class='alert'>[H]'s body explodes, leaving behind a pile of microscopic crystals!</span>")
	supermatter_delamination( T, 4, S.coreLevel, 0, 0 ) // Create a small supermatter burst upon death
	qdel(H)

//Head crystals

/datum/sprite_accessory/supermatter
	icon = 'icons/mob/nucleation_hair.dmi'

/datum/sprite_accessory/supermatter/nuc_crystals
		name = "Nucleation Crystals"
		icon_state = "crystal"

/datum/sprite_accessory/supermatter/nuc_betaburns
		name = "Nucleation Beta Burns"
		icon_state = "betaburns"

/datum/sprite_accessory/supermatter/nuc_fallout
		name = "Nucleation Fallout"
		icon_state = "fallout"

/datum/sprite_accessory/supermatter/nuc_frission
		name = "Nucleation Frission"
		icon_state = "frission"

/datum/sprite_accessory/supermatter/nuc_radical
		name = "Nucleation Free Radical"
		icon_state = "radical"

/datum/sprite_accessory/supermatter/nuc_gammaray
		name = "Nucleation Gamma Ray"
		icon_state = "gammaray"

/datum/sprite_accessory/supermatter/nuc_neutron
		name = "Nucleation Neutron Bomb"
		icon_state = "neutron"

/datum/outfit/nucleation
	name = "Nucleation"

	head = /obj/item/clothing/head/helmet/space/plasmaman
	uniform = /obj/item/clothing/under/plasmaman
	r_hand= /obj/item/weapon/tank/internals/nucleation/belt/full
	mask = /obj/item/clothing/mask/breath

/obj/item/weapon/tank/internals/nucleation
	name = "nitrogen internals tank"
	desc = "A tank of nitrogen gas designed specifically for use as internals, particularly for nitrogen-based lifeforms. If you're not a Nucleation, you probably shouldn't use this."
	icon_state = "plasmaman_tank"
	item_state = "plasmaman_tank"
	force = 10
	distribute_pressure = TANK_DEFAULT_RELEASE_PRESSURE

/obj/item/weapon/tank/internals/nucleation/New()
	..()
	air_contents.assert_gas("n2")
	air_contents.gases["n2"][MOLES] = (3*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C)
	return

/obj/item/weapon/tank/internals/nucleation/full/New()
	..()
	air_contents.assert_gas("n2")
	air_contents.gases["n2"][MOLES] = (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C)
	return

/obj/item/weapon/tank/internals/nucleation/belt
	icon_state = "plasmaman_tank_belt"
	item_state = "plasmaman_tank_belt"
	slot_flags = SLOT_BELT
	force = 5

/obj/item/weapon/tank/internals/nucleation/belt/full/New()
	..()
	air_contents.assert_gas("n2")
	air_contents.gases["n2"][MOLES] = (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C)
	return

/proc/isnucleation(A)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		return istype(H.dna.species, /datum/species/nucleation)
	return 0