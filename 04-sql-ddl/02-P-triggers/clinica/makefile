test: FORCE
	rm -f clinica.db
	sqlite3 clinica.db ".read clinica-estrutura.sql"
	sqlite3 clinica.db ".read a.sql"
	sqlite3 clinica.db ".read b.sql"
	sqlite3 clinica.db ".read clinica-dados.sql"
	
FORCE:
