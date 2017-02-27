/datum/round_event/radiation_storm/announce()
	priority_announce("High levels of radiation detected near the station. Maintenance is best shielded from radiation.", "Anomaly Alert", 'sound/AI/radiation.ogg')
	//sound not longer matches the text, but an audible warning is probably good
	make_maint_all_access()

/datum/round_event/radiation_storm/end()
	priority_announce("The station has passed the radiation belt. Please report to medbay if you experience any unusual symptoms. Maintenance will lose all access again shortly.", "Anomaly Alert")
	revoke_maint_all_access()