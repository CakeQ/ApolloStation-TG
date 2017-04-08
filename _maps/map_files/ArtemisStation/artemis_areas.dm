//artemis Station
var/list/the_station_areas = list (
	/area/shuttle/arrival,
	/area/shuttle/escape/station,
	/area/shuttle/escape_pod1/station,
	/area/shuttle/escape_pod2/station,
	/area/shuttle/escape_pod3/station,
	/area/shuttle/escape_pod5/station,
	/area/atmos,
	/area/maintenance,
	/area/hallway,
	/area/bridge,
	/area/crew_quarters,
	/area/holodeck,
	/area/library,
	/area/chapel,
	/area/lawoffice,
	/area/engine,
	/area/solar,
	/area/assembly,
	/area/teleporter,
	/area/medical,
	/area/security,
	/area/quartermaster,
	/area/janitor,
	/area/hydroponics,
	/area/toxins,
	/area/storage,
	/area/ai_monitored/storage/eva, //do not try to simplify to "/area/ai_monitored" --rastaf0
	/area/ai_monitored/storage/secure,
	/area/ai_monitored/storage/emergency,
	/area/ai_monitored/turret_protected/ai_upload, //do not try to simplify to "/area/turret_protected" --rastaf0
	/area/ai_monitored/turret_protected/ai_upload_foyer,
	/area/ai_monitored/turret_protected/ai,
)

/*=========================================
================01 - artemis================
===========================================*/

/area/shuttle/transport1/station
	icon_state = "shuttle"
	name = "Transport Shuttle"

/area/shuttle/arrival/artemis
	icon_state = "shuttle"
	name = "NOS Artemis Arrival Shuttle"

//Escape Pods
/area/shuttle/escape_pod1/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod2/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod3/station
	icon_state = "shuttle2"

/area/shuttle/escape_pod5/station //Pod 4 was lost to meteors
	icon_state = "shuttle2"

//Hallways
/area/hallway/

/area/hallway/primary/fore_port
	name = "Fore Port Primary Hallway"
	icon_state = "hallP"

/area/hallway/primary/fore
	name = "Fore Primary Hallway"
	icon_state = "hallF"

/area/hallway/primary/fore_starboard
	name = "Fore Starboard Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/starboard
	name = "Starboard Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/aft_starboard
	name = "Aft Starboard Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/aft
	name = "Aft Primary Hallway"
	icon_state = "hallA"

/area/hallway/primary/aft_port
	name = "Aft Port Primary Hallway"
	icon_state = "hallP"

/area/hallway/primary/port
	name = "Port Primary Hallway"
	icon_state = "hallP"

/area/hallway/arrival
	name = "Arrivals"
	icon_state = "entry_2"


//Security
/area/crew_quarters/courtroom
	name = "Courtroom"
	icon_state = "courtroom"

/area/security/main
	name = "Security Office"
	icon_state = "security"

/area/security/interrogate
	name = "Security Interrogation"
	icon_state = "security"

/area/security/meeting
	name = "Security Meeting Room"
	icon_state = "security"

/area/security/tribunal
	name = "Courtroom"
	icon_state = "security"

/area/security/evidence
	name = "Security Evidence"
	icon_state = "security"

/area/security/brig
	name = "Brig"
	icon_state = "brig"

/area/security/brig/processing
	name = "Brig Processing"
	icon_state = "brig"

/area/security/brig/solitaryA
	name = "Solitary Confinement A"
	icon_state = "brig"

/area/security/brig/solitaryB
	name = "Solitary Confinement B"
	icon_state = "brig"

/area/security/brig/interrogation
	name = "Brig Interrogation"
	icon_state = "brig"

/area/security/lobby
	name = "Security Lobby"
	icon_state = "brig"

/area/security/prison
	name = "Prison Wing"
	icon_state = "sec_prison"

/area/security/prison/restroom
	name = "Prison Wing Restroom"
	icon_state = "sec_prison"

/area/security/prison/dorm
	name = "Prison Wing Dorm"
	icon_state = "sec_prison"

/area/security/warden
	name = "Warden"
	icon_state = "Warden"

/area/security/armoury
	name = "Armory"
	icon_state = "Warden"

/area/security/detectives_office
	name = "Detective's Office"
	icon_state = "detective"

/area/security/range
	name = "Firing Range"
	icon_state = "firingrange"

/area/security/tactical
	name = "Tactical Equipment"
	icon_state = "Tactical"

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/ai_monitored/storage/secure
	name = "Secure Storage"
	icon_state = "storage"

/area/ai_monitored/storage/emergency
	name = "Emergency Storage"
	icon_state = "storage"

//Command
/area/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/bridge/bridgedorm
	name = "Bridge Dormitory"
	icon_state = "bridge"

/area/bridge/bridgelocker
	name = "Bridge Locker Room"
	icon_state = "bridge"

/area/bridge/meeting_room
	name = "Heads of Staff Meeting Room"
	icon_state = "bridge"

/area/crew_quarters/captain
	name = "Captain's Office"
	icon_state = "captain"

/area/crew_quarters/captain/quarters
	name = "Captain's Quarters"

/area/crew_quarters/heads/hop
	name = "Head of Personnel's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/hor
	name = "Research Director's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/hos
	name = "Head of Security's Office"
	icon_state = "head_quarters"

/area/crew_quarters/heads/cmo
	name = "Chief Medical Officer's Office"
	icon_state = "head_quarters"

/area/teleporter
	name = "Teleporter"
	icon_state = "teleporter"

/area/lawoffice
	name = "Internal Affairs"
	icon_state = "law"

/area/lawoffice/meeting
	name = "Internal Affairs Meeting Room"

/area/security/vacantoffice
	name = "Bridge Vacant Office"
	icon_state = "security"

/area/security/nuke_storage
	name = "Vault"
	icon_state = "nuke_storage"

/area/security/checkpoint
	name = "Security Checkpoint"
	icon_state = "checkpoint1"

/area/security/solgov
	name = "SolGov Office"
	icon_state = "law"

//Medical
/area/medical/hallway_fore
	name = "Medbay Hallway - Fore"
	icon_state = "medbay3"

/area/medical/hallway_aft
	name = "Medbay Hallway - Aft"
	icon_state = "medbay3"

/area/medical/biostorage
	name = "Secondary Storage"
	icon_state = "medbay2"

/area/medical/reception
	name = "Medbay Reception"
	icon_state = "medbay"

/area/medical/psych
	name = "Psych Room"
	icon_state = "medbay3"

/area/crew_quarters/medbreak
	name = "Break Room"
	icon_state = "medbay3"

/area/medical/patients_roomA
	name = "Patient Room A"
	icon_state = "patients"

/area/medical/patients_roomB
	name = "Patient Room B"
	icon_state = "patients"

/area/medical/patients_roomC
	name = "Patient Room C"
	icon_state = "patients"

/area/medical/patients_roomD
	name = "Patient Room D"
	icon_state = "patients"

/area/medical/ward
	name = "Recovery Ward"
	icon_state = "patients"

/area/medical/patient_wing
	name = "Patient Wing"
	icon_state = "patients"

/area/medical/cmostore
	name = "Secure Storage"
	icon_state = "CMO"

/area/medical/virology
	name = "Virology"
	icon_state = "virology"

/area/medical/virologyaccess
	name = "Virology Access"
	icon_state = "virology"

/area/medical/morgue
	name = "Morgue"
	icon_state = "morgue"

/area/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/medical/surgery
	name = "Operating Theatre 1"
	icon_state = "surgery"

/area/medical/surgery2
	name = "Operating Theatre 2"
	icon_state = "surgery"

/area/medical/surgeryobs
	name = "Operation Observation Room"
	icon_state = "surgery"

/area/medical/surgeryprep
	name = "Pre-Op Prep Room"
	icon_state = "surgery"

/area/medical/surgerystorage
	name = "Surgery Freezer Room"
	icon_state = "surgery"

/area/medical/cryo
	name = "Cryogenics"
	icon_state = "cryo"

/area/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/medical/storage
	name = "Storage Room"
	icon_state = "medbay3"

/area/medical/medicinestorage
	name = "Medical Supplies"
	icon_state = "medbay3"

/area/medical/biostorage
	name = "Biogear Storage Room"
	icon_state = "medbay3"

/*
//ONE DAY
/area/medical/genetics
	name = "Genetics Lab"
	icon_state = "genetics"
*/

/area/medical/genetics_cloning
	name = "Cloning Lab"
	icon_state = "cloning"

/area/medical/sleeper
	name = "Emergency Treatment Centre"
	icon_state = "exam_room"

//Science
/area/assembly/robotics
	name = "Robotics Lab"
	icon_state = "robotics"

/area/assembly/chargebay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/toxins/research
	name = "Research and Development"
	icon_state = "research"

/area/toxins/researchhalla
	name = "Research Main Hallway"
	icon_state = "research"

/area/toxins/researchhallb
	name = "Research Hazardous Materials Hallway"
	icon_state = "research"

/area/toxins/researchbreak
	name = "Research Break Room"
	icon_state = "research"

/area/toxins/lab
	name = "Research Lab"
	icon_state = "toxlab"

/area/toxins/rdoffice
	name = "Research Director's Office"
	icon_state = "head_quarters"

/area/toxins/xenobiology
	name = "Xenobiology Lab"
	icon_state = "xeno_lab"

/area/toxins/xenobiology/xenoflora
	name = "Xenoflora Lab"
	icon_state = "xeno_f_lab"

/area/toxins/storage
	name = "Toxins Storage"
	icon_state = "toxstorage"

/area/toxins/test_area
	name = "Toxins Test Area"
	icon_state = "toxtest"

/area/toxins/mixing
	name = "Toxins Mixing Room"
	icon_state = "toxmix"

/area/toxins/misc_lab
	name = "Miscellaneous Research"
	icon_state = "toxmisc"

/area/tcomms/chamber
	name = "Telecomms Central Compartment"
	icon_state = "tcomsatcham"

/area/ai_monitored/turret_protected/tcommbreaker
	name = "Telecomms Breaker Room"
	icon_state = "tcomsatcomp"

/area/tcomms/computer
	name = "Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/ai_monitored/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"


/area/ai_monitored/turret_protected/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"

/area/ai_monitored/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"

/area/ai_monitored/turret_protected/ai_cyborg_station
	name = "Cyborg Station"
	icon_state = "ai_cyborg"

//Civilian
/area/crew_quarters
	name = "Dormitories"
	icon_state = "Sleep"
	//flags = RAD_SHIELDED

/area/crew_quarters/observe
	name = "Observatory"
	icon_state = "green"

/area/crew_quarters/sleep
	name = "Dormitories"
	icon_state = "Sleep"

/area/crew_quarters/sleep/engi_wash
	name = "Engineering Washroom"
	icon_state = "toilet"

/area/crew_quarters/sleep/cryo
	name = "Cryogenic Storage"
	icon_state = "Sleep"

/area/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"

/area/crew_quarters/fitness
	name = "Fitness Room"
	icon_state = "fitness"

/area/crew_quarters/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/crew_quarters/kitchen/backroom
	name = "Kitchen Backroom"
	icon_state = "kitchen"

/area/crew_quarters/kitchen/freezer
	name = "Kitchen"
	icon_state = "kitchen"

/area/crew_quarters/bar
	name = "Bar"
	icon_state = "bar"

/area/crew_quarters/bar/backroom
	name = "Bar Backroom"
	icon_state = "bar"

/area/crew_quarters/lounge
	name = "Lounge"
	icon_state = "Break Room"

/area/crew_quarters/diner
	name = "Diner"
	icon_state = "bar"

/area/library
	name = "Library"
	icon_state = "library"

/area/chapel/main
	name = "Chapel"
	icon_state = "chapel"

/area/chapel/crematorium
	name = "Chapel Crematorium"
	icon_state = "chapel"

/area/chapel/office
	name = "Chapel Office"
	icon_state = "chapeloffice"

/area/holodeck
	name = "Holodeck"
	icon_state = "Holodeck"
	luminosity = 1

/area/holodeck/alphadeck
	name = "Holodeck Alpha"

/area/janitor/
	name = "Custodial Closet"
	icon_state = "janitor"

/area/janitor/secondary
	name = "Secondary Custodial Closet"
	icon_state = "janitor"

/area/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"


/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/art
	name = "Art Supply Storage"
	icon_state = "storage"

/area/security/vacantoffice2
	name = "Vacant Office"
	icon_state = "security"

//Cargo

/area/quartermaster
	name = "Quartermasters"
	icon_state = "quart"

/area/quartermaster/office
	name = "Cargo Office"
	icon_state = "quartoffice"

/area/quartermaster/storage
	name = "Cargo Bay"
	icon_state = "quartstorage"

/area/quartermaster/qm
	name = "Quartermaster's Office"
	icon_state = "quart"

/area/quartermaster/miningstorage
	name = "Mining Storage"
	icon_state = "mining"

/area/quartermaster/sorting
	name = "Delivery Office"
	icon_state = "quartstorage"

//Hangar
/area/podbay
	name = "Podbay"
	icon_state = "yellow"

/area/hangar/A
	name = "Hangar A"
	icon_state = "green"

/area/hangar/B
	name = "Hangar B"
	icon_state = "green"

/area/hangar
	name = "Central Hangar"
	icon_state = "green"

/area/hangar/base_construction
	name = "Auxiliary Base Construction"
	icon_state = "yellow"

/area/hallway/secondary/exit
	name = "Departures Lobby"
	icon_state = "escape"

/area/shuttle/escape/station
	name = "Emergency Shuttle Station"
	icon_state = "shuttle2"

//Engineering
/area/desubber
	name = "Phoron Desublimation Room"
	icon_state = "yellow"

/area/atmos
	name = "Atmospherics"
	icon_state = "atmos"

/area/engine/chiefs_office
	name = "Chief Engineer's Office"
	icon_state = "head_quarters"

/area/engine/engine_smes
		name = "Engineering SMES"
		icon_state = "engine_smes"

/area/engine/storage
		name = "Engineering Storage"
		icon_state = "engineering_storage"

/area/engine/storage_hard
		name = "Engineering Hard-Storage"
		icon_state = "engineering_storage"

/area/engine/engine_room
		name = "Engine Room"
		icon_state = "engine"

/area/engine/engine_airlock
		name = "Engine Room Airlock"
		icon_state = "engine"

/area/engine/engine_monitoring
		name = "Engine Monitoring Room"
		icon_state = "engine_monitoring"

/area/engine/engine_waste
		name = "Engine Waste Handling"
		icon_state = "engine_waste"

/area/engine/engineering_monitoring
		name = "Engineering Monitoring Room"
		icon_state = "engine_monitoring"

/area/engine/atmos_monitoring
		name = "Atmospherics Monitoring Room"
		icon_state = "engine_monitoring"

/area/engine/engineering
		name = "Engineering"
		icon_state = "engineering"

/area/engine/engineering_foyer
		name = "Engineering Foyer"
		icon_state = "engineering_foyer"

/area/engine/engineering_supply
		name = "Engineering Supply"
		icon_state = "engineering_storage"

/area/engine/break_room
		name = "Engineering Break Room"
		icon_state = "engineering_break"


/area/engine/hallway
		name = "Engineering Hallway"
		icon_state = "engineering_foyer"


/area/engine/engine_hallway
		name = "Engine Room Hallway"
		icon_state = "engineering_foyer"


/area/engine/workshop
		name = "Engineering Workshop"
		icon_state = "engineering_workshop"

/area/engine/locker_room
		name = "Engineering Locker Room"
		icon_state = "engineering_locker"


/area/engine/gravity
		name = "Gravity Generator Control Room"
		icon_state = "engineering"


/area/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"

//Solars
/area/solar
	requires_power = 1
	always_unpowered = 1
	luminosity = 1

/area/solar/starboard
	name = "Aft Starboard Solar Array"
	icon_state = "panelsS"

/area/solar/port
	name = "Aft Port Solar Array"
	icon_state = "panelsP"

//Maintenance
/area/maintenance
	//flags = RAD_SHIELDED

/area/maintenance/fore_port
	name = "Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/port
	name = "Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/bridge_port
	name = "Bridge Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/bridge_starboard
	name = "Bridge Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/bridge_aft
	name = "Central Maintenance"
	icon_state = "maintcentral"

/area/maintenance/fore_starboard
	name = "Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/maintenance/aft_starboard
	name = "Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/aft
	name = "Aft Maintenance"
	icon_state = "amaint"

/area/maintenance/engi_engine
	name = "Engine Maintenance"
	icon_state = "maint_engine"

/area/maintenance/engineering
	name = "Engineering Maintenance"
	icon_state = "fpmaint"

/area/maintenance/central_port
	name = "Central Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/central_starboard
	name = "Central Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/central
	name = "Central Aft Maintenance"
	icon_state = "maintcentral"

/area/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/maintenance/incinerator
	name = "Incinerator"
	icon_state = "disposal"

/area/engine/drone_fabrication
	name = "Drone Fabrication"
	icon_state = "engine"

	//Crew Quarters
/area/crew_quarters/maintrooms/medroom
	name = "Fore Port Private Quarter"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/secroom1
	name = "Fore Starboard Private Quarter One"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/arrivalroom1
	name = "Port Private Quarter One"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/secroom2
	name = "Fore Starboard Private Quarter Two"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/secroom3
	name = "Fore Starboard Private Quarter Three"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/sciroom1
	name = "Aft Starboard Private Quarter One"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/sciroom2
	name = "Aft Starboard Private Quarter Two"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/sciroom3
	name = "Aft Starboard Private Quarter Three"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/civroom
	name = "Aft Port Private Quarter"
	icon_state = "Sleep"

/area/crew_quarters/maintrooms/centroom
	name = "Central Private Quarter"
	icon_state = "Sleep"

	//Substations
/area/maintenance/substation
	name = "Substation"
	icon_state = "substation"

/area/maintenance/substation/engineering //Engineering
	name = "Engineering Substation"

/area/maintenance/substation/medical //Medbay
	name = "Medical Substation"

/area/maintenance/substation/research //Research
	name = "Research Substation"

/area/maintenance/substation/civilian_east //Cargo, Vacant Office, Custodial, Holodeck
	name = "Civilian Starboard Substation"

/area/maintenance/substation/civilian_west //Bar, Kitchen, Diner, Chapel, Observatory, Dorms, Locker Room, Library
	name = "Civilian Port Substation"

/area/maintenance/substation/security // Security, Brig, Permabrig, etc.
	name = "Security Substation"

/area/maintenance/substation/hangar // Hangar, Pod Hangar, Arrivals, Depatures, etc...
	name = "Hangar Substation"

	//Solars
/area/maintenance/starboard_solar
	name = "Aft Starboard Solar Maintenance"
	icon_state = "SolarcontrolS"

/area/maintenance/port_solar
	name = "Aft Port Solar Maintenance"
	icon_state = "SolarcontrolP"

	//Secret Rooms
/area/maintenance/secret/
	icon_state = "south"

/area/maintenance/secret/room1
	name = "Secret Room - Rainbow Outfits"
	icon_state = "south"

/area/maintenance/secret/room2
	name = "Secret Room - Ghetto Surgery"

/area/maintenance/secret/room3
	name = "Secret Room - Hidden Bar"

/area/maintenance/secret/room4
	name = "Secret Room - Slums"

/area/maintenance/secret/room5
	name = "Secret Room - Slum"

/area/maintenance/secret/room6
	name = "Secret Room - Weed Room"

/area/maintenance/secret/room7
	name = "Secret Room - Torture"

/area/maintenance/secret/room8
	name = "Secret Room - Memories"

/area/maintenance/secret/room9
	name = "Secret Room - AI Laws"

/area/maintenance/secret/room10
	name = "Secret Room - Balloons"

/*
/*=========================================
=========02 - Engineering outpost==========
===========================================*/

/area/engioutpost
	name = "Engineering Outpost"
	icon_state = "LP"

/area/engioutpost/solars
	name = "Engineering Outpost Solars"
	icon_state = "LPS"

/area/engioutpost/dock
	name = "Engineering Outpost"
	icon_state = "LP"


/*=========================================
==============03 - NMV Slater==============
===========================================*/

/area/slater


/area/slater/hallway1
	name = "Primary Hallway"
	icon_state = "hallP"


/area/slater/hallway2
	name = "Secondary Hallway"
	icon_state = "hallS"


/area/slater/bridge
	name = "NMV Slater Bridge"
	icon_state = "bridge"

/area/slater/bridge
	name = "NMV Slater Bridge"
	icon_state = "bridge"

/area/slater/foreman
	name = "NMV Slater Foreman's Office"
	icon_state = "bridge"

/area/slater/maint1
	name = "NMV Slater Fore Maintenance"
	icon_state = "fmaint"

/area/slater/maint2
	name = "NMV Slater Aft Maintenance"
	icon_state = "amaint"

/area/slater/maint3
	name = "NMV Slater Secondary Maintenance"
	icon_state = "pmaint"

/area/slater/engine
	name = "NMV Slater Engine Room"
	icon_state = "engine"

/area/slater/disposals
	name = "NMV Slater Disposals Control"
	icon_state = "disposal"

/area/slater/refinery
	name = "NMV Slater Refinery"
	icon_state = "mining_production"

/area/slater/cargo
	name = "NMV Slater Cargo Hold"
	icon_state = "storage"

/area/slater/hangar
	name = "NMV Slater Hangar"
	icon_state = "green"

/area/slater/expeditionprep
	name = "NMV Slater Expedition Prep"
	icon_state = "mining_eva"

/area/slater/medbay
	name = "NMV Slater Medbay"
	icon_state = "medbay"

/area/slater/lounge
	name = "NMV Slater Break Room"
	icon_state = "cafeteria"

/area/slater/dorm
	name = "NMV Slater Dormitory"
	icon_state = "Sleep"

/*=========================================
==============04 - Centcomm================
===========================================*/

/area/shuttle/transport1/centcom
	icon_state = "shuttle"
	name = "Transport Shuttle"

/area/shuttle/pizza/centcom
	icon_state = "shuttle"
	name = "Pizza Shuttle"

/area/shuttle/trade/centcom
	icon_state = "shuttle"
	name = "Trade Shuttle"

/area/shuttle/hippie/centcom
	icon_state = "shuttle"
	name = "Hippie Shuttle"

//Central command
/area/shuttle/escape/centcom
	name = "Emergency Shuttle Centcom"
	icon_state = "shuttle"

/area/centcom
	name = "Centcom"
	icon_state = "centcom"
	requires_power = 0

/area/centcom/event/mansion
	name = "Haunted Mansion"
	icon_state = "centcom"
	requires_power = 0

/area/centcom/control
	name = "Centcom Control"

/area/centcom/supply
	name = "Centcom Supply Shuttle"

/area/centcom/ferry
	name = "Centcom Transport Shuttle"

/area/centcom/shuttle
	name = "Centcom Administration Shuttle"

/area/centcom/test
	name = "Centcom Testing Facility"

/area/centcom/living
	name = "Centcom Living Quarters"

/area/centcom/holding
	name = "Holding Facility"

//ERT Ship
/area/shuttle/specops/centcom
	name = "Special Ops Shuttle"
	icon_state = "shuttlered"

/area/centcom/specops
	name = "Centcom Special Ops"

//Pod Ship
/area/shuttle/escape_pod1/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod2/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod3/centcom
	icon_state = "shuttle"

/area/shuttle/escape_pod5/centcom //Pod 4 was lost to meteors
	icon_state = "shuttle"

/area/centcom/evac
	name = "Centcom Emergency Shuttle"

//Thunderdome
/area/tdome
	name = "Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	lighting_use_dynamic = 0
	ambience = list('sound/music/THUNDERDOME.ogg')

/area/tdome/arena
	name = "Thunderdome Arena"
	icon_state = "thunder"
	requires_power = 0

/area/tdome/tdome1
	name = "Thunderdome (Team 1)"
	icon_state = "red"

/area/tdome/tdome2
	name = "Thunderdome (Team 2)"
	icon_state = "blue"

/area/tdome/tdomeadmin
	name = "Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "Thunderdome (Observer.)"
	icon_state = "purple"

//Trade Station
/area/centcom/trade
	name = "Remote Trade Outpost"
	icon_state = "green"
	requires_power = 0

//Pizzaland!!!!
/area/pizzaland
	name = "Pizzaland"
	icon_state = "red"
	requires_power = 0
	ambience = list('sound/music/1.ogg')

//Antag Areas
	//Syndicate Base
/area/antagasteroid
	name = "Antagonist Hideout"
	icon_state = "red"
	requires_power = 0
	lighting_use_dynamic = 0
	ambience = list('sound/music/traitor.ogg')

/area/syndicate_mothership
	name = "Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	lighting_use_dynamic = 0

/area/syndicate_mothership/offsite_hanger
	name = "Elite Mercenary Squad"
	icon_state = "syndie-elite"

/area/syndicate_mothership/elite_squad
	name = "Elite Mercenary Squad"
	icon_state = "syndie-elite"

	//Wizard Room
/area/wizard_station
	name = "Wizard's Den"
	icon_state = "yellow"
	requires_power = 0
	lighting_use_dynamic = 0

	//Admin Prep Room
/area/adminprep/valanspreparea
	name = "valan prep room"
	icon_state = "red"
	requires_power = 0


//Holodeck Sources
/area/holodeck/source_plating
	name = "Holodeck - Off"
	icon_state = "Holodeck"

/area/holodeck/source_emptycourt
	name = "Holodeck - Empty Court"

/area/holodeck/source_boxingcourt
	name = "Holodeck - Boxing Court"

/area/holodeck/source_basketball
	name = "Holodeck - Basketball Court"

/area/holodeck/source_thunderdomecourt
	name = "Holodeck - Thunderdome Court"

/area/holodeck/source_beach
	name = "Holodeck - Beach"
	icon_state = "Holodeck" // Lazy.

/area/holodeck/source_wildlife
	name = "Holodeck - Wildlife Simulation"

/area/holodeck/source_meetinghall
	name = "Holodeck - Meeting Hall"

/area/holodeck/source_theatre
	name = "Holodeck - Theatre"

/area/holodeck/source_picnicarea
	name = "Holodeck - Picnic Area"

/area/holodeck/source_snowfield
	name = "Holodeck - Snow Field"

/area/holodeck/source_desert
	name = "Holodeck - Desert"

/area/holodeck/source_space
	name = "Holodeck - Space"
	has_gravity = 0

//Splash Screen
/area/start
	name = "start area"
	icon_state = "start"
	requires_power = 0
	has_gravity = 1
	lighting_use_dynamic = 0

var/list/centcom_areas = list (
	/area/centcom,
	/area/shuttle/escape/centcom,
	/area/shuttle/escape_pod1/centcom,
	/area/shuttle/escape_pod2/centcom,
	/area/shuttle/escape_pod3/centcom,
	/area/shuttle/escape_pod5/centcom,
	///area/shuttle/transport1/centcom,
	///area/shuttle/administration/centcom,
	/area/shuttle/specops/centcom,
)

/*=========================================
=================05 - Moon=================
===========================================*/

/area/planet/moon
	name = "moon"
	icon_state = "moon"


	base_turf = /turf/simulated/floor/plating/airless/asteroid/lunar

//Exterior Zones
/area/planet/moon/exterior
	name = "moon"
	icon_state = "moon"


	ambience = list( 'sound/ambience/ambience_outpost.ogg' )
	music = list( 'sound/ambience/ambispace.ogg','sound/ambience/ambispace1.ogg','sound/ambience/ambispace2.ogg' )

/area/planet/moon/exterior/explored
	name = "explored moon"
	icon_state = "explored"

//Landing Zones
/area/planet/moon/landing_zone
	name = "landing zone"
	icon_state = "south"
	light_range = 1

/area/planet/moon/landing_zone/central
	name = "Central Outpost"

/area/planet/moon/landing_zone/engineering
	name = "Engineering Outpost"

/area/planet/moon/landing_zone/science
	name = "Research Outpost"

/area/planet/moon/landing_zone/mining
	name = "Mining Outpost"

/area/planet/moon/landing_zone/security
	name = "Security Prison"

/area/planet/moon/outpost
	name = "outpost"
	icon_state = "south"
	requires_power = 1


//Main Outpost
/area/planet/moon/outpost/central
	name = "Central Outpost"
	icon_state = "bridge"

/area/planet/moon/outpost/central/medical
	name = "Central Outpost Medbay"
	icon_state = "medbay"

/area/planet/moon/outpost/central/EVA
	name = "Central Outpost EVA"
	icon_state = "eva"

/area/planet/moon/outpost/central/hallway
	name = "Central Outpost Hallway"

/area/planet/moon/outpost/central/lounge
	name = "Central Outpost Lounge"
	icon_state = "Sleep"

/area/planet/moon/outpost/central/incinerator
	name = "Central Outpost Incinerator"
	icon_state = "disposal"

/area/planet/moon/outpost/central/substation
	name = "Central Outpost Substation"
	icon_state = "substation"

//Security Outpost
/area/planet/moon/outpost/security
	name = "Security Outpost"
	icon_state = "security"

/area/planet/moon/outpost/security/hallway
	name = "Security Outpost Hallway"

/area/planet/moon/outpost/security/processing
	name = "Security Outpost Processing"
	icon_state = "brig"

/area/planet/moon/outpost/security/breakroom
	name = "Security Outpost Break Room"
	icon_state = "Sleep"

/area/planet/moon/outpost/security/brig
	name = "Security Outpost Brig"
	icon_state = "brig"

/area/planet/moon/outpost/security/substation
	name = "Security Outpost Substation"
	icon_state = "substation"

//Engineering Outpost
/area/planet/moon/outpost/engineering
	name = "Engineering Outpost"
	icon_state = "engine"

/area/planet/moon/outpost/engineering/lounge
	name = "Engineering Outpost Lounge"
	icon_state = "Sleep"

/area/planet/moon/outpost/engineering/storage
	name = "Engineering Outpost Storage"
	icon_state = "engine_storage"

/area/planet/moon/outpost/engineering/EVA
	name = "Engineering Outpost EVA"
	icon_state = "eva"

/area/planet/moon/outpost/engineering/atmospherics
	name = "Engineering Outpost Atmospherics"
	icon_state = "atmos"

/area/planet/moon/outpost/engineering/SMES
	name = "Engineering Outpost SMES Storage"
	icon_state = "engine_smes"

/area/planet/moon/outpost/engineering/hallway
	name = "Engineering Outpost Hallway"
	icon_state = "engine"

/area/planet/moon/outpost/engineering/solars
	name = "Engineering Outpost Solars"
	icon_state = "panelsA"

//Mining Outpost
/area/planet/moon/outpost/mining
	name = "Mining Outpost"
	icon_state = "mining"

/area/planet/moon/outpost/mining/EVA
	name = "Mining Outpost EVA"
	icon_state = "eva"

/area/planet/moon/outpost/mining/lounge
	name = "Mining Outpost Lounge"
	icon_state = "mining_living"

/area/planet/moon/outpost/mining/refinery
	name = "Mining Outpost Refinery"
	icon_state = "mining_production"

/area/planet/moon/outpost/mining/maintenance
	name = "Mining Outpost Maintenance"
	icon_state = "fmaint"

/area/planet/moon/outpost/mining/foreman
	name = "Mining Outpost Foreman Office"

/area/planet/moon/outpost/mining/hallway
	name = "Mining Outpost"

/area/planet/moon/outpost/mining/substation
	name = "Mining Outpost Substation"
	icon_state = "substation"

//Research Outpost
/area/planet/moon/outpost/science
	name = "Research Outpost"
	icon_state = "anomaly"

/area/planet/moon/outpost/science/EVA
	name = "Research Outpost EVA"
	icon_state = "eva"

/area/planet/moon/outpost/science/hallway
	name = "Research Outpost Hallway"
	icon_state = "anohallway"

/area/planet/moon/outpost/science/lounge
	name = "Research Outpost Lounge"
	icon_state = "Sleep"

/area/planet/moon/outpost/science/chemistry
	name = "Research Outpost Chemistry Lab"
	icon_state = "chem"

/area/planet/moon/outpost/science/exotic
	name = "Research Outpost Exotic Particle Harvesting"
	icon_state = "anomaly"

/area/planet/moon/outpost/science/containment
	name = "Research Outpost Isolation"
	icon_state = "iso1"

/area/planet/moon/outpost/science/lab
	name = "Research Outpost Laboratory"
	icon_state = "anolab"

/area/planet/moon/outpost/science/anomaly
	name = "Research Outpost Anomaly Lab"
	icon_state = "anosample"

/area/planet/moon/outpost/science/spectromotry
	name = "Research Outpost Spectromotry"
	icon_state = "anospectro"

/area/planet/moon/outpost/science/substation
	name = "Research Outpost Substation"
	icon_state = "substation"

/area/planet/moon/outpost/science/tcomms
	name = "Research Outpost Telecomms"
	icon_state = "tcomsat"*/