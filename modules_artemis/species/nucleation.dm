/datum/species/nucleation
	name = "Nucleation"
	id = "nucleation"
	say_mod = "rattles"
	meat = /obj/item/weapon/shard/supermatter
	species_traits = list(NOBLOOD,RESISTCOLD,RADIMMUNE,NOTRANSSTING,VIRUSIMMUNE,NOHUNGER,RESISTPRESSURE,NOBREATH)
	//mutantlungs = /obj/item/organ/lungs/supermatter
	//mutanteyes = /obj/item/organ/eyes/supermatter
	burnmod = 4 // holy shite, poor guys wont survive half a second cooking smores
	brutemod = 2 // damn, double wham, double dam
	var/coreLevel = 1

/datum/species/nucleation/highlevel
	dangerous_existence = 1 //So so much
	blacklisted = 1 //See above
	breathid = "plasma"
	damage_overlay_type = ""//let's not show bloody wounds or burns over bones.
	var/internal_fire = FALSE //If the bones themselves are burning clothes won't help you much
	coreLevel = 4

/datum/species/nucleation/highlevel/spec_life(mob/living/carbon/human/H)
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
	var/datum/outfit/plasmaman/O = new /datum/outfit/plasmaman
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
		N = H.set_species(var/datum/species/nucleation/highlevel)
	else
		N = H.set_species(var/datum/species/nucleation)
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
		icon_state = "nuc_crystal"

/datum/sprite_accessory/supermatter/nuc_betaburns
		name = "Nucleation Beta Burns"
		icon_state = "nuc_betaburns"

/datum/sprite_accessory/supermatter/nuc_fallout
		name = "Nucleation Fallout"
		icon_state = "nuc_fallout"

/datum/sprite_accessory/supermatter/nuc_frission
		name = "Nucleation Frission"
		icon_state = "nuc_frission"

/datum/sprite_accessory/supermatter/nuc_radical
		name = "Nucleation Free Radical"
		icon_state = "nuc_radical"

/datum/sprite_accessory/supermatter/nuc_gammaray
		name = "Nucleation Gamma Ray"
		icon_state = "nuc_gammaray"

/datum/sprite_accessory/supermatter/nuc_neutron
		name = "Nucleation Neutron Bomb"
		icon_state = "nuc_neutron"
