-- passo 1
CREATE DATABASE empresa_tech;
USE empresa_tech;
 -- passo 2
CREATE TABLE departamentos (
	codigo INT PRIMARY KEY,
    nome VARCHAR(30)
);

-- passo 3
CREATE TABLE funcionarios (
	matricula_func INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL, -- passo 5
    rg INT(11) UNIQUE, -- passo 6
    sexo VARCHAR(1) CHECK (sexo IN ('M', 'F')), -- passo 7
    salario INT,
    codigo INT REFERENCES departamentos(codigo) -- passo 4
);

-- passo 8
ALTER TABLE funcionarios ADD cidade VARCHAR(30) DEFAULT('CEDRO');

-- passo 9
CREATE TABLE projetos (
	codigo_pjt INT PRIMARY KEY,
    nome_pjt VARCHAR(30) NOT NULL,
    orcamento INT
);

-- passo 10
CREATE TABLE alocacoes (
	id INT PRIMARY KEY,
    matricula_func INT REFERENCES funcionarios(matricula_func),
    codigo_pjt INT REFERENCES projetos(codigo_pjt),
    horas_semanais TIME
);

-- passo 11
CREATE INDEX idx_func_nome ON funcionarios(nome); 

-- passo 12
CREATE UNIQUE INDEX idx_func_rg ON funcionarios(rg); 

-- passo 13
ALTER TABLE departamentos MODIFY COLUMN nome CHAR(50); 

-- passo 14
ALTER TABLE departamentos RENAME COLUMN codigo TO cod_dpto; 

-- passo 15
ALTER TABLE funcionarios DROP sexo; 

-- passo 16
ALTER TABLE funcionarios ADD sexo CHAR(1) CHECK (sexo IN ('M', 'F')); 

-- passo 17
CREATE TABLE dependente (
	id INT PRIMARY KEY,
    nome VARCHAR(30),
    parentesco VARCHAR(30),
    matricula_func INT REFERENCES funcionarios(matricula_func)
);

-- passo 18
DROP TABLE dependente; 

-- passo 19
DROP INDEX idx_func_nome ON funcionarios;

-- passo 20
CREATE TABLE dependentes (
	id INT PRIMARY KEY,
    nome VARCHAR(30),
    parentesco VARCHAR(30),
    matricula_func INT REFERENCES funcionarios(matricula_func)
);