
CREATE DATABASE empresas_rh;

USE empresas_rh;

CREATE TABLE Empresa (
   empresa_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(255) NOT NULL,
   endereco VARCHAR(255) NOT NULL,
   bairro VARCHAR(255),
   cidade VARCHAR(255),
   estado CHAR(2),
   numero INT(10),
   telefone VARCHAR(100)
);

CREATE TABLE Endereco_funcionarios (
   endereco_id INT AUTO_INCREMENT PRIMARY KEY,
   endereco VARCHAR(255) NOT NULL,
   cidade VARCHAR(255),
   estado CHAR(2)
);

CREATE TABLE Funcionario (
   funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
   matricula VARCHAR(20) NOT NULL,
   nome VARCHAR(255) NOT NULL,
   data_nascimento DATE NOT NULL,
   data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   setor VARCHAR(255) NOT NULL,
   cargo VARCHAR(100) NOT NULL,
   salario DECIMAL(10, 2) NOT NULL,
   empresa_id INT,
   endereco_id INT,
   FOREIGN KEY (empresa_id) REFERENCES Empresa(empresa_id) ON DELETE CASCADE,
   FOREIGN KEY (endereco_id) REFERENCES Endereco_funcionarios(endereco_id) ON DELETE SET NULL
);

INSERT INTO Empresa (nome, endereco, bairro, cidade, estado, numero, telefone) 
VALUES 
  ('Sucesso RH', 'RUA ATALEIA', 'MATINHA', 'TEOFILO OTONI', 'MG', 50, '(33)2534-7899'),
  ('Pegasus RH', 'RUA DEZE DE OUTRUBRO', 'VILA BETEL', 'ITAMBACURI', 'MG', 100, '(33)2687-4456'),
  ('Giraia RH', 'RUA ITACHI', 'VILA DA AREIA', 'GOVERNADOR VALADRES', 'MG', 30, '(33)3933-4358'),
  ('Futuro RH', 'RUA CHILE', 'ARAPUAN', 'IPATINGA', 'MG', 11, '(31)2982-5622'),
  ('Santos RH', 'RUA MARIA DE FATIMA', 'SAO JOSE', 'POTE', 'MG', 12, '(33)3933-4360');

INSERT INTO Endereco_funcionarios (endereco, cidade, estado)
VALUES
  ('RUA BARRIL','TEOFILO OTONI', 'MG'),
  ('RUA ATALEIA','POTE', 'MG'),
  ('RUA CINQUENTE E TRES', 'ITAMBACURI','MG'),
  ('RUA JAMAICA', 'GOVERNADOR VALADARES','MG'),
  ('RUA SUICA', 'IPATINGA','MG');

INSERT INTO Funcionario (matricula, nome, data_nascimento, setor, cargo, salario, empresa_id, endereco_id) 
VALUES
   ('12345', 'João Silva', '1990-05-15', 'Tecnologia', 'Analista Redes', 5000.00, 1, 1),
   ('54321', 'Maria Santos', '1988-08-10', 'Administração', 'Gerente TI', 6000.00, 2, 2),
   ('98765', 'Pedro Souza', '1995-02-25', 'Desenvolvimento', 'Desenvolvedor PHP', 4500.00, 3, 3),
   ('99126', 'Gilmar Araujo','1991-02-08', 'Tecnologia', 'Técnico de Suporte Pleno', 2300.00, 4, 4),
   ('99127', 'Adriana Urach','1988-03-01', 'Tecnologia', 'Analista de Suporte Pleno', 6000.00, 5, 5);

-- Consulta que junta informações de funcionários, endereços e empresas
SELECT 
   Funcionario.funcionario_id,
   Funcionario.nome AS nome_funcionario,
   Funcionario.matricula,
   Funcionario.data_nascimento,
   Funcionario.data_cadastro,
   Funcionario.setor,
   Funcionario.cargo,
   Funcionario.salario,
   Endereco_funcionarios.endereco AS endereco_funcionario,
   Endereco_funcionarios.cidade AS cidade_funcionario,
   Endereco_funcionarios.estado AS estado_funcionario,
   Empresa.nome AS nome_empresa,
   Empresa.endereco AS endereco_empresa,
   Empresa.cidade AS cidade_empresa,
   Empresa.estado AS estado_empresa
FROM Funcionario
JOIN Empresa ON Funcionario.empresa_id = Empresa.empresa_id
JOIN Endereco_funcionarios ON Funcionario.endereco_id = Endereco_funcionarios.endereco_id;


-- Selecionar todos os funcionários:
SELECT * FROM Funcionario;

-- Selecionar funcionários com informações de suas respectivas empresas: 
SELECT Funcionario.*, Empresa.nome AS nome_empresa
FROM Funcionario
JOIN Empresa ON Funcionario.empresa_id = Empresa.empresa_id;

-- Selecionar funcionários de uma empresa específica:
SELECT * FROM Funcionario
WHERE empresa_id = 1; -- Troque pelo ID da empresa desejada

-- Selecionar funcionários com salário maior que um determinado valor:
SELECT * FROM Funcionario
WHERE salario > 5500.00; -- Troque pelo valor desejado

-- Selecionar funcionários com idade maior que uma determinada idade:
SELECT *,
   TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM Funcionario
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 30; -- Troque pela idade desejada
