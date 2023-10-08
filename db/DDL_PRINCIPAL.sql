CREATE DATABASE db_curso_uniruy;

USE db_curso_uniruy;

CREATE TABLE tb_cliente(
	idcliente INT IDENTITY(1,1) NOT NULL,
	nome VARCHAR(90) NOT NULL,
	datanascimento DATETIME NOT NULL,
	cpf VARCHAR(12) NOT NULL,
	email VARCHAR(90) NOT NULL,
	telefone VARCHAR(90) NOT NULL,
	PRIMARY KEY(idcliente)
);

CREATE TABLE tb_curso(
	idcurso INT IDENTITY(1,1) NOT NULL,
	nome VARCHAR(90) NOT NULL,
	cargahoraria INT NOT NULL,
	descricao VARCHAR(120) NOT NULL,
	PRIMARY KEY(idcurso)
);

CREATE TABLE tb_inscricao(
	idcurso INT NOT NULL,
	idcliente INT NOT NULL,
	datainscricao DATETIME NOT NULL,
	datacancelamento DATETIME NOT NULL,
	PRIMARY KEY(idcurso,idcliente),
	FOREIGN KEY (idcurso) REFERENCES tb_curso (idcurso),
	FOREIGN KEY (idcliente) REFERENCES tb_cliente (idcliente)
);