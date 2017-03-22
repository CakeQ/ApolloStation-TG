DBQuery/Execute(sql_query=src.sql,cursor_handler=default_cursor, log_error = 1)
	Close()
	. = _dm_db_execute(_db_query,sql_query,db_connection._db_con,cursor_handler,null)
	if(!.)
		if(dbcon.Connect())
			_dm_db_execute(_db_query,sql_query,db_connection._db_con,cursor_handler,null)
		else
			to_chat(usr, "<span class='danger'>A SQL error occured during this operation, reconnection has failed.</span>")
		if(log_error)
			log_sql("[ErrorMsg()] | Query used: [sql]")

#define FAILED_DB_CONNECTION_CUTOFF 5

DBConnection/Connect()
	if(failed_connections > FAILED_DB_CONNECTION_CUTOFF)	//If it failed to establish a connection more than 5 times in a row, don't bother attempting to connect anymore.
		return FALSE

	var/user = sqlfdbklogin
	var/pass = sqlfdbkpass
	var/db = sqlfdbkdb
	var/address = sqladdress
	var/port = sqlport

	doConnect("dbi:mysql:[db]:[address]:[port]","[user]","[pass]")
	. = IsConnected()
	if (!. && config.sql_enabled)
		log_sql("Connect() failed | [ErrorMsg()]")
		++failed_connections

#undef FAILED_DB_CONNECTION_CUTOFF