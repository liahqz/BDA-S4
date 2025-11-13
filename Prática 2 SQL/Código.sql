-- 1) Criar banco de dados e selecionar para uso
CREATE DATABASE IF NOT EXISTS empresa_tech;

USE empresa_tech;

-- 2) Tabela DEPARTAMENTOS 
CREATE TABLE departamentos (
    cod_depto INT NOT NULL PRIMARY KEY,
    nome      CHAR(50)
) ENGINE = InnoDB;

-- 3) Tabela FUNCIONARIOS
CREATE TABLE funcionarios (
    matricula INT NOT NULL PRIMARY KEY,
    nome      VARCHAR(100) NOT NULL,
    rg        VARCHAR(20),
    sexo      CHAR(1),
    salario   DECIMAL(10,2),
    depto     INT,
    cidade    VARCHAR(60) NOT NULL DEFAULT 'Cedro',
    CONSTRAINT chk_func_sexo
        CHECK (sexo IN ('M','F')),
    CONSTRAINT fk_func_depto
        FOREIGN KEY (depto) REFERENCES departamentos(cod_depto)
) ENGINE = InnoDB;

-- 4) Tabela PROJETOS
CREATE TABLE projetos (
    codigo    INT NOT NULL PRIMARY KEY,
    nome      VARCHAR(100) NOT NULL,
    orcamento DECIMAL(12,2)
) ENGINE = InnoDB;

-- 5) Tabela ALOCACOES
CREATE TABLE alocacoes (
    id             INT NOT NULL AUTO_INCREMENT,
    matricula_func INT NOT NULL,
    cod_projeto    INT NOT NULL,
    horas_semanais INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_aloc_func
        FOREIGN KEY (matricula_func) REFERENCES funcionarios(matricula),
    CONSTRAINT fk_aloc_proj
        FOREIGN KEY (cod_projeto)    REFERENCES projetos(codigo)
) ENGINE = InnoDB;

-- 6) Tabela DEPENDENTES 
CREATE TABLE dependentes (
    id             INT NOT NULL AUTO_INCREMENT,
    nome           VARCHAR(100) NOT NULL,
    parentesco     VARCHAR(50) NOT NULL,
    matricula_func INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_dep_func
        FOREIGN KEY (matricula_func) REFERENCES funcionarios(matricula)
) ENGINE = InnoDB;

-- =========================
-- QUESTÃO DESAFIO (CURSOS)
-- =========================

-- 7) Tabela CURSO
--    (com FK opcional para projetos)
CREATE TABLE curso (
    codigo       INT NOT NULL AUTO_INCREMENT,
    titulo       VARCHAR(120) NOT NULL,
    carga_horaria INT NOT NULL,
    cod_projeto  INT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_curso_projeto
        FOREIGN KEY (cod_projeto) REFERENCES projetos(codigo)
) ENGINE = InnoDB;

-- 8) Tabela CONCLUSAO_CURSO
--    (relaciona funcionário x curso, com nota 0–100 e data)
CREATE TABLE conclusao_curso (
    matricula_func INT NOT NULL,
    codigo_curso   INT NOT NULL,
    data_conclusao DATE NOT NULL,
    nota           DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_conclusao
        PRIMARY KEY (matricula_func, codigo_curso),
    CONSTRAINT fk_conc_func
        FOREIGN KEY (matricula_func) REFERENCES funcionarios(matricula),
    CONSTRAINT fk_conc_curso
        FOREIGN KEY (codigo_curso)   REFERENCES curso(codigo),
    CONSTRAINT chk_conc_nota
        CHECK (nota >= 0 AND nota <= 100)
) ENGINE = InnoDB;

-- 9) Índices

-- Índice ÚNICO para RG dos funcionários
CREATE UNIQUE INDEX idx_func_rg
    ON funcionarios (rg);

-- Índice para buscas por (matricula_func, data_conclusao)
CREATE INDEX idx_conc_func_data
    ON conclusao_curso (matricula_func, data_conclusao);