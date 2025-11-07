CREATE DATABASE jogo;
USE jogo;

CREATE TABLE heroi(
	codigo INT NOT NULL PRIMARY KEY,
    nome VARCHAR(30),
    classe VARCHAR(30)
);

CREATE TABLE guilda(
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR(40)
);

ALTER TABLE heroi ADD guilda_id INT NOT NULL;
ALTER TABLE heroi ADD CONSTRAINT fk_guilda_id FOREIGN KEY (guilda_id) REFERENCES guilda(id); 

CREATE TABLE jogador(
	id INT NOT NULL PRIMARY KEY,
    nickname VARCHAR(30) NOT NULL UNIQUE,
    nivel INT DEFAULT 1 CHECK (nivel >= 1),
	classe CHAR(15) check (classe IN('Mago', 'Guerreiro', 'Arqueiro'))
);

ALTER TABLE jogador ADD email VARCHAR(80);
ALTER TABLE heroi RENAME COLUMN codigo TO id_heroi;
ALTER TABLE heroi MODIFY COLUMN nome CHAR(50);
ALTER TABLE jogador DROP email;

CREATE UNIQUE INDEX idx_jogador_nick ON jogador(nickname);
DROP INDEX idx_heroi_nome ON heroi;