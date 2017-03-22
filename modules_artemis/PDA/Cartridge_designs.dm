////////////////////////////////////////
/////////////PDA CARTRIDGES/////////////
////////////////////////////////////////

/*
	This file adds designs for all the PDA cartridges aviable to the crew.
	They have been placed under the category "Electronics" for protolathe fabrication and their research levels increase with rank:
		-Base job: Programming 3
		-Head of department job: Programming 5
		-Captain: Programming 7
*/




//Engineering Carts
/datum/design/engineering_cart
	name = "Power-ON cartridge"
	desc = "Cartridge with basic engineering functions"
	id = "engineering_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/engineering
	category = list("Electronics")

/datum/design/atmos_cart
	name = "BreatheDeep cartridge"
	desc = "Cartridge with basic atmospheric functions"
	id = "engineering_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/atmos
	category = list("Electronics")

//Medical Carts
/datum/design/medical_cart
	name = "Med-U cartridge"
	desc = "Cartridge with basic medical functions"
	id = "medical_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/medical
	category = list("Electronics")

/datum/design/chemistry_cart
	name = "ChemWhiz cartridge"
	desc = "Cartridge with basic chemical functions"
	id = "chemistry_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/chemistry
	category = list("Electronics")

//Security Carts
/datum/design/security_cart
	name = "R.O.B.U.S.T. cartridge"
	desc = "Cartridge with basic security functions"
	id = "secuirty_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/security
	category = list("Electronics")

/datum/design/detective_cart
	name = "D.E.T.E.C.T. cartridge"
	desc = "Cartridge with basic detective functions"
	id = "detective_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/detective
	category = list("Electronics")

//Civillian Carts
/datum/design/janitor_cart
	name = "CustodiPRO cartridge"
	desc = "Cartridge with basic cleaning functions"
	id = "secuirty_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/janitor
	category = list("Electronics")

/datum/design/lawyer_cart
	name = "P.R.O.V.E. cartridge"
	desc = "Cartridge with basic lawyering functions"
	id = "lawyer_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/lawyer
	category = list("Electronics")

/datum/design/clown_cart
	name = "Honkworks 5.0 cartridge"
	desc = "Cartridge with basic clowning functions"
	id = "clown_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/clown
	category = list("Electronics")

/datum/design/mime_cart
	name = "CustodiPRO cartridge"
	desc = "Cartridge with basic miming functions"
	id = "mime_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/mime
	category = list("Electronics")

/datum/design/librarian_cart
	name = "Lib-Tweet cartridge"
	desc = "Cartridge with basic booking functions"
	id = "librarian_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/librarian
	category = list("Electronics")

//Science carts
/datum/design/roboticist_cart
	name = "B.O.O.P. Remote Control cartridge"
	desc = "Cartridge with basic roboting functions"
	id = "rotobiticist_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/roboticist
	category = list("Electronics")

/datum/design/signal_cart
	name = "Generic signaling cartridge"
	desc = "Cartridge with basic signaling functions"
	id = "signal_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/signal
	category = list("Electronics")

/datum/design/toxins_cart
	name = "Signal Ace 2 cartridge"
	desc = "Cartridge with basic toxiquing functions"
	id = "librarian_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/signal/toxins
	category = list("Electronics")

//Cargo carts
/datum/design/quartermaster_cart
	name = "Generic signaling cartridge"
	desc = "Cartridge with basic signaling functions"
	id = "quartermaster_cart"
	req_tech = list("programming" = 3)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/quartermaster
	category = list("Electronics")


//Command carts
/datum/design/hop_cart
	name = "HumanResources9001 cartridge"
	desc = "Cartridge with advanced human resourcing functions"
	id = "hop_cart"
	req_tech = list("programming" = 5)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/hop
	category = list("Electronics")

/datum/design/hos_cart
	name = "R.O.B.U.S.T. DELUXE cartridge"
	desc = "Cartridge with advanced securiting functions"
	id = "hos_cart"
	req_tech = list("programming" = 5)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/hos
	category = list("Electronics")

/datum/design/ce_cart
	name = "Power-On DELUXE cartridge"
	desc = "Cartridge with advanced engineering functions"
	id = "ce_cart"
	req_tech = list("programming" = 5)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/ce
	category = list("Electronics")

/datum/design/cmo_cart
	name = "Med-U DELUXE cartridge"
	desc = "Cartridge with advanced mediquing functions"
	id = "cmo_cart"
	req_tech = list("programming" = 5)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/cmo
	category = list("Electronics")

/datum/design/rd_cart
	name = "Signal Ace DELUXE cartridge"
	desc = "Cartridge with advanced researching functions"
	id = "rd_cart"
	req_tech = list("programming" = 5)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/rd
	category = list("Electronics")

/datum/design/captain_cart
	name = "Value-PAK cartridge"
	desc = "Cartridge with advanced commanding functions"
	id = "captain_cart"
	req_tech = list("programming" = 7)
	build_type = PROTOLATHE
	materials = list(MAT_GLASS = 500, MAT_METAL = 500)
	build_path = /obj/item/weapon/cartridge/captain
	category = list("Electronics")