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