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

#if !defined(MAP_FILE)

		#define MINETYPE "lavaland"

		#include "map_files\artemisStation\artemis_areas.dm"
		#include "map_files\ArtemisStation\artemis-1.dmm"

#ifndef TRAVIS_MASS_MAP_BUILD

		#define MAP_PATH "map_files/ArtemisStation"
        #define MAP_FILE "artemis-1.dmm"
        #define MAP_NAME "Artemis Station"

		#define MAP_TRANSITION_CONFIG DEFAULT_MAP_TRANSITION_CONFIG
#endif
#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring artemis station.

#endif