CREATE DATABASE concessionarias;
 
-- DROP DATABASE concessionarias;
 
USE concessionarias;
 
CREATE TABLE carros (
id INT(11) NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
marca VARCHAR(255) NOT NULL,
ano YEAR,
PRIMARY KEY (id)
);
 
CREATE TABLE lojas (
id INT(11) NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
endereco VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);
  
CREATE TABLE marcas (
id INT(11) NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE carros_marcas (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	id_lojas INT(11) NOT NULL,
	id_marcas INT(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_lojas) REFERENCES lojas(id),
	FOREIGN KEY (id_marcas) REFERENCES marcas(id)
);

CREATE TABLE carros_lojas (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	id_carros INT(11) NOT NULL,
	id_lojas INT(11) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_lojas) REFERENCES lojas(id),
	FOREIGN KEY (id_carros) REFERENCES carros(id)
);
-- Inserir dados no banco
INSERT INTO carros (nome, marca, ano) VALUES ('Fiesta', 'Forde', '1988');
INSERT INTO carros (nome, marca, ano) VALUES ('Civic', 'Honda', '2008');
INSERT INTO carros (nome, marca, ano) VALUES ('HILUX', 'Toyota', '2012');
INSERT INTO carros (nome, marca, ano) VALUES ('Celta', 'Chevrolet', '2001');
SELECT *FROM carros;

INSERT INTO lojas (nome, endereco) VALUES ('Ford Conauto Consórcios', 'Rua A');
INSERT INTO lojas (nome, endereco) VALUES ('Honda Motolider', 'Rua B');
INSERT INTO lojas (nome, endereco) VALUES ('Osaka Toyota', 'Rua C');
INSERT INTO lojas (nome, endereco) VALUES ('Chevrolet Líder', 'Rua D');
SELECT *FROM lojas;

INSERT INTO marcas (nome) VALUES ('Forde');
INSERT INTO marcas (nome) VALUES ('Honda');
INSERT INTO marcas (nome) VALUES ('Toyota');
INSERT INTO marcas (nome) VALUES ('Chevrolet');
SELECT *FROM marcas;

INSERT INTO carros_marcas (id_lojas, id_marcas) VALUES (1, 3);
INSERT INTO carros_marcas (id_lojas, id_marcas) VALUES (2, 1);
INSERT INTO carros_marcas (id_lojas, id_marcas) VALUES (3, 3);
INSERT INTO carros_marcas (id_lojas, id_marcas) VALUES (4, 2);
SELECT * FROM carros_marcas;

INSERT INTO carros_lojas (id_carros, id_lojas) VALUES (1, 1);
INSERT INTO carros_lojas (id_carros, id_lojas) VALUES (1, 2);
INSERT INTO carros_lojas (id_carros, id_lojas) VALUES (2, 2);
INSERT INTO carros_lojas (id_carros, id_lojas) VALUES (3, 3);
INSERT INTO carros_lojas (id_carros, id_lojas) VALUES (4, 4);
SELECT * FROM carros_lojas;

-- Busca para retorna os carros
SELECT * FROM carros WHERE nome LIKE 'Ci%';

SELECT carros.nome AS nome_carro, marcas.nome AS nome_marca
FROM carros
INNER JOIN marcas ON carros.marca = marcas.nome;
