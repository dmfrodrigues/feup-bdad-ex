PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS MedicamentoPrescricao;
DROP TABLE IF EXISTS Medicamento;
DROP TABLE IF EXISTS Prescricao;
DROP TABLE IF EXISTS ConsultasMarcadas;
DROP TABLE IF EXISTS Disponibilidade;
DROP TABLE IF EXISTS HorarioConsultas;
DROP TABLE IF EXISTS Doente;
DROP TABLE IF EXISTS Medico;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Especialidade;

PRAGMA foreign_keys=ON;

CREATE TABLE Especialidade (
	idespec numeric PRIMARY KEY,
	nome TEXT);

CREATE TABLE Pessoa (
	codigo numeric PRIMARY KEY,
	nome TEXT,
	nif TEXT UNIQUE,
	morada TEXT,
	codPostal TEXT,
	telefone TEXT,
	datanasc DATE);

CREATE TABLE Medico (
	codigo numeric PRIMARY KEY REFERENCES Pessoa,
	idespec numeric REFERENCES Especialidade(idespec));

CREATE TABLE Doente (
	codigo numeric PRIMARY KEY REFERENCES Pessoa,
	profissao TEXT);

CREATE TABLE HorarioConsultas (
	idhorarioconsulta numeric PRIMARY KEY,
	horainicio numeric,
	numdoentes numeric);

CREATE TABLE Disponibilidade (
	codigo numeric REFERENCES Medico(codigo),
	dia DATE,
	idhorarioconsulta numeric REFERENCES HorarioConsultas(idhorarioconsulta),
	CONSTRAINT pk_disponibilidade PRIMARY KEY (codigo, dia));

CREATE TABLE ConsultasMarcadas (
	idConsultaMarcada numeric PRIMARY KEY,
	data TEXT,
	horainicio numeric,
	preco numeric,
	relatorio TEXT,
	classificacao TEXT,
	codmedico numeric REFERENCES Medico(codigo),
	coddoente numeric REFERENCES Doente(codigo));

CREATE TABLE Prescricao (
	idprescricao numeric PRIMARY KEY,
	data DATE,
	codmedico numeric REFERENCES Medico(codigo),
	coddoente numeric REFERENCES Doente(codigo));

CREATE TABLE Medicamento (
	idmedicamento numeric PRIMARY KEY,
	nome TEXT,
	laboratorio TEXT,
	modo TEXT,
	quantidade numeric);

CREATE TABLE MedicamentoPrescricao (
	idprescricao numeric REFERENCES Prescricao(idprescricao),
	idmedicamento numeric REFERENCES Medicamento(idmedicamento),
	numembalagens numeric,
	CONSTRAINT pk_prescricaomedicamento PRIMARY KEY (idprescricao, idmedicamento));
