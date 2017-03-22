//previously, this would have been named 'process()' but that name is used everywhere for different things!
//fire() seems more suitable. This is the procedure that gets called every 'wait' deciseconds.
//fire(), and the procs it calls, SHOULD NOT HAVE ANY SLEEP OPERATIONS in them!
//YE BE WARNED!
var/global/datum/controller/subsystem/sql_checker/sql_checker

/datum/controller/subsystem/sql_checker
	name = "SQL Checker"
	init_order = 12
	priority = 40

	var/initialized = FALSE
	var/old_initialized

/datum/controller/subsystem/sql_checker/New()
	NEW_SS_GLOBAL(sql_checker)

/datum/controller/subsystem/sql_checker/Initialize(timeofdayl)
	initialized = TRUE
	. = ..()

/datum/controller/subsystem/sql_checker/stat_entry()
	..("C:[handlers.len]")


/datum/controller/subsystem/sql_checker/fire(resumed = 0)
	world << "FIRING sql_checker"
	var/DBQuery/testQuery = dbcon.NewQuery("SELECT MAX(round_id) AS round_id FROM [format_table_name("feedback")]")
	if(!testQuery.Execute())
		world << "SQL Checker no connection deteced!"
		dbcon.Connect()

/datum/controller/subsystem/sql_checker/Recover()
	initialized = sql_checker.initialized
	old_initialized = sql_checker.old_initialized