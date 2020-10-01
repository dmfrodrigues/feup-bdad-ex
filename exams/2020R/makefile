all:

test: FORCE
	rm -f conference.db
	sqlite3 conference.db ".read informatics-conference.sql"
	sqlite3 conference.db ".read 2020R_16.sql"
	sqlite3 conference.db ".read 2020R_17.sql"
	sqlite3 conference.db ".read 2020R_18.sql"
	sqlite3 conference.db ".read 2020R_19.sql"

FORCE:
