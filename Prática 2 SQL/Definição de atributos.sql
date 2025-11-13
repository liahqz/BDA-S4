SELECT * FROM departamentos;
-- DELETE FROM departamentos WHERE cod_depto = 2;

-- Tabelas sem chave estrangeira primeiro
INSERT INTO departamentos (cod_depto, nome) VALUES (1, "HelloKitty");
INSERT INTO departamentos (cod_depto, nome) VALUES (2, "RougeViolet");
INSERT INTO departamentos (cod_depto, nome) VALUES (3, "ShadowThings");
INSERT INTO departamentos (cod_depto, nome) VALUES (4, "ProfsTask");
INSERT INTO departamentos (cod_depto, nome) VALUES (5, "Plants&Flowers");

INSERT INTO projetos (codigo, nome, orcamento) VALUES (11, "Bolsas", 1100);
INSERT INTO projetos (codigo, nome, orcamento) VALUES (22, "Fantasias", 2200);
INSERT INTO projetos (codigo, nome, orcamento) VALUES (33, "Fantaias", 3300);
INSERT INTO projetos (codigo, nome, orcamento) VALUES (44, "Cadernos Digitais", 4400);
INSERT INTO projetos (codigo, nome, orcamento) VALUES (55, "Vasos para plantar", 5500);

-- Tabelas com chave estrangeira depois
INSERT INTO funcionarios (matricula, nome, rg, sexo, salario, depto, cidade) VALUES (111, "Sara", 11111111111, "F", 11000, 1, "Cedro");
INSERT INTO funcionarios (matricula, nome, rg, sexo, salario, depto, cidade) VALUES (222, "Lívia", 22222222222, "F", 22000, 2, "Fortaleza");
INSERT INTO funcionarios (matricula, nome, rg, sexo, salario, depto, cidade) VALUES (333, "Aron", 33333333333, "M", 33000, 3, "Crato");
INSERT INTO funcionarios (matricula, nome, rg, sexo, salario, depto, cidade) VALUES (444, "Helder", 44444444444, "M", 44000, 4, "Fortaleza");
INSERT INTO funcionarios (matricula, nome, rg, sexo, salario, depto, cidade) VALUES (555, "Rosilda", 55555555555, "F", 55000, 5, "Cedro");

INSERT INTO alocacoes (id, matricula_func, cod_projeto, horas_semanais) VALUES (1111, 111, 11, 10);
INSERT INTO alocacoes (id, matricula_func, cod_projeto, horas_semanais) VALUES (2222, 222, 22, 20);
INSERT INTO alocacoes (id, matricula_func, cod_projeto, horas_semanais) VALUES (3333, 333, 33, 30);
INSERT INTO alocacoes (id, matricula_func, cod_projeto, horas_semanais) VALUES (4444, 444, 44, 40);
INSERT INTO alocacoes (id, matricula_func, cod_projeto, horas_semanais) VALUES (5555, 555, 55, 50);

INSERT INTO dependentes (id, nome, parentesco, matricula_func) VALUES (101, "Dependência em HelloKitty", "Todos", 111);
INSERT INTO dependentes (id, nome, parentesco, matricula_func) VALUES (202, "Dependência em RougeVIolet", "Pai e mãe", 222);
INSERT INTO dependentes (id, nome, parentesco, matricula_func) VALUES (303, "Dependência em ShadowThings", "Mãe e irmãs", 333);
INSERT INTO dependentes (id, nome, parentesco, matricula_func) VALUES (404, "Dependência em ProfsTask", "Irmãos", 444);
INSERT INTO dependentes (id, nome, parentesco, matricula_func) VALUES (505, "Dependência em Plants&Flowers", "Pai, mãe e irmãos", 555);

INSERT INTO curso (codigo, titulo, carga_horaria, cod_projeto) VALUES (110, "Como fazer bolsas", 10, 11);
INSERT INTO curso (codigo, titulo, carga_horaria, cod_projeto) VALUES (220, "Como fazer fantasias", 20, 22);
INSERT INTO curso (codigo, titulo, carga_horaria, cod_projeto) VALUES (330, "Como fazer fantasias", 30, 33);
INSERT INTO curso (codigo, titulo, carga_horaria, cod_projeto) VALUES (440, "Como fazer cadernos digitais", 40, 44);
INSERT INTO curso (codigo, titulo, carga_horaria, cod_projeto) VALUES (550, "Como fazert vasos para plantas", 50, 55);

INSERT INTO conclusao_curso (matricula_func, codigo_curso, data_conclusao, nota) VALUES (111, 110, "2009-01-25", 10);
INSERT INTO conclusao_curso (matricula_func, codigo_curso, data_conclusao, nota) VALUES (222, 220, "2009-02-16", 10);
INSERT INTO conclusao_curso (matricula_func, codigo_curso, data_conclusao, nota) VALUES (333, 330, "2008-02-27", 10);
INSERT INTO conclusao_curso (matricula_func, codigo_curso, data_conclusao, nota) VALUES (444, 440, "1972-07-26", 10);
INSERT INTO conclusao_curso (matricula_func, codigo_curso, data_conclusao, nota) VALUES (555, 550, "1982-10-17", 10);
