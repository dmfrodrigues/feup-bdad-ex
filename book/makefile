all:

test: FORCE
	rm -f 2-3-1.db
	sqlite3 2-3-1.db ".read 2-3-1-a.sql"
	sqlite3 2-3-1.db ".read 2-3-1-b.sql"
	sqlite3 2-3-1.db ".read 2-3-1-c.sql"
	sqlite3 2-3-1.db ".read 2-3-1-d.sql"
	sqlite3 2-3-1.db ".read 2-3-1-f.sql"

	rm -f 2-3-2.db
	sqlite3 2-3-2.db ".read 2-3-2-a.sql"
	sqlite3 2-3-2.db ".read 2-3-2-b.sql"
	sqlite3 2-3-2.db ".read 2-3-2-c.sql"
	sqlite3 2-3-2.db ".read 2-3-2-d.sql"
	sqlite3 2-3-2.db ".read 2-3-2-f.sql"

	rm -rf 2-4-1.db
	sqlite3 2-4-1.db ".read 2-4-1-create.sql"

FORCE:
