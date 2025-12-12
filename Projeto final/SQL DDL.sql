CREATE DATABASE PerfilJogador;
USE PerfilJogador;

CREATE TABLE jogos(
	id_jogo INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL
);

CREATE TABLE itens(
	id_item INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL
);

CREATE TABLE jogadores(
	id INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    bio VARCHAR(100),
    ultima_vez_online TIMESTAMP,
    jogando BOOLEAN,
    jogo_atual INT REFERENCES jogos(id_jogo)
);

CREATE TABLE conquistas(
	id_conq INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    obtido_jogo INT REFERENCES jogos(id_jogo)
);

CREATE TABLE favoritos(
    id INT REFERENCES jogadores(id),
    id_jogo INT REFERENCES jogos(id_jogo),
    id_item INT REFERENCES itens(id_item)
);

CREATE TABLE jogadores_conquistas(
    id INT REFERENCES jogadores(id),
    id_conquista INT REFERENCES conquistas(id_conquista),
    obtido_em TIMESTAMP NOT NULL
);