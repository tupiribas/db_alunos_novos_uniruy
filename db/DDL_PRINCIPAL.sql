CREATE DATABASE db_curso_uniruy;

USE db_curso_uniruy;

CREATE TABLE tb_pessoa(
	idcliente INT IDENTITY(1,1) UNIQUE NOT NULL,
	matricula varchar(30) UNIQUE NOT NULL,
	nome VARCHAR(90) NOT NULL,
	datanascimento DATETIME NOT NULL,
	cpf VARCHAR(12) NOT NULL,
	email VARCHAR(90) NOT NULL,
	telefone VARCHAR(90) NOT NULL,
	PRIMARY KEY(idcliente)
);

CREATE TABLE tb_curso(
	idcurso INT IDENTITY(1,1) UNIQUE NOT NULL,
	nome VARCHAR(90) NOT NULL,
	cargahoraria numeric NOT NULL,
	descricao VARCHAR(120) NOT NULL,
	PRIMARY KEY(idcurso)
);

CREATE TABLE tb_inscricao(
	idcurso INT NOT NULL,
	idpessoa INT NOT NULL,
	datainscricao DATETIME NOT NULL,
	datacancelamento DATETIME NOT NULL,
	PRIMARY KEY(idcurso,idpessoa),
	FOREIGN KEY (idcurso) REFERENCES tb_curso (idcurso),
	FOREIGN KEY (idpessoa) REFERENCES tb_pessoa (idcliente)
);

/* Alterações no projeto 
	1. Nome da tabela "tb_curso" -"tb_pessoa";
	2. Criar tabela tb_disciplina
	3. Incrementando regra de negócio
*/

-- EXEC sp_rename "tb_cliente","tb_pessoa";

CREATE TABLE tb_disciplina(
	iddisciplina INT IDENTITY(1,1) UNIQUE NOT NULL,
	codigoincricao VARCHAR(30) UNIQUE NOT NULL,
	nome VARCHAR(90) NOT NULL,
	descricao VARCHAR(120) NOT NULL,
	cargahoraria NUMERIC NOT NULL,
	idprereq INT NULL, -- Regra de negocio
	idcurso INT NOT NULL,
	PRIMARY KEY (iddisciplina),
	FOREIGN KEY (idcurso) REFERENCES tb_curso (idcurso)
);

-- Regra de negocio: Caso o aluno esteja dependendo cursar outra disciplina para poder se matricular na outra.

ALTER TABLE tb_disciplina
ADD CONSTRAINT
Fk_Disciplina_Prereq
FOREIGN KEY (idprereq)
REFERENCES tb_disciplina (iddisciplina);
