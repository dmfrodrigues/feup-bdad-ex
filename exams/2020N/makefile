all:

test: FORCE
	rm -f ronda1.db
	sqlite3 ronda1.db ".read ronda1.sql"
	sqlite3 ronda1.db ".read 2020N_16.sql"
	sqlite3 ronda1.db ".read 2020N_17.sql"
	sqlite3 ronda1.db ".read 2020N_18.sql"
	sqlite3 ronda1.db ".read 2020N_19.sql"
	sqlite3 ronda1.db ".read 2020N_19_2.sql"

FORCE:
