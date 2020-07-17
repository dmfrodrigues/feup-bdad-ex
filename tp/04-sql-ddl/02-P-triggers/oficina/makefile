test: FORCE
	rm -f oficina.db
	sqlite3 oficina.db ".read oficina-estrutura.sql"
	sqlite3 oficina.db ".read a.sql"
	sqlite3 oficina.db ".read b.sql"
	sqlite3 oficina.db ".read c.sql"
	sqlite3 oficina.db ".read d.sql"
	sqlite3 oficina.db ".read oficina-dados.sql"

FORCE:
