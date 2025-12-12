INSERT INTO jogos (id_jogo, nome) VALUES (1987, "FNAF 2");
INSERT INTO jogos (id_jogo, nome) VALUES (1993, "FNAF 1");

INSERT INTO itens (id_item, nome) VALUES (33, "SUPER Red Sword");
INSERT INTO itens (id_item, nome) VALUES (55, "Spring Cloud");

INSERT INTO jogadores (id, nome, bio, ultima_vez_online, jogando, jogo_atual) VALUES (1, "Rouge", "Life is beautiful", '2025-11-12 10:00:00', FALSE, 0);
INSERT INTO jogadores (id, nome, bio, ultima_vez_online, jogando, jogo_atual) VALUES (2, "Shadow", "Life is beautiful", '2025-11-12 10:00:00', FALSE, 0);
INSERT INTO jogadores (id, nome, bio, ultima_vez_online, jogando, jogo_atual) VALUES (3, "Foxy", "Yar har har", NOW(), TRUE, 1993);
INSERT INTO jogadores (id, nome, bio, ultima_vez_online, jogando, jogo_atual) VALUES (4, "Puppet", "I don't hate you, but you need to stay out of my way.", NOW(), TRUE, 1987);
INSERT INTO jogadores (id, nome, bio, ultima_vez_online, jogando, jogo_atual) VALUES (5, "Mangle", "I know they said I couldn't be put back together, but see how wrong they were?", NOW(), TRUE, 1987);

UPDATE jogadores
SET jogando = TRUE
WHERE id = 1;

DELETE FROM jogadores WHERE id = 4;

INSERT INTO jogadores_conquistas (id, id_conquista, obtido_em) VALUES (1, 1, '2025-11-12 10:00:00');
INSERT INTO jogadores_conquistas (id, id_conquista, obtido_em) VALUES (1, 2, '2025-11-12 10:00:00');

INSERT INTO favoritos (id, id_jogo, id_item) VALUES (1, 1987, 55);
INSERT INTO favoritos (id, id_jogo, id_item) VALUES (2, 1993, 33);

SELECT * FROM jogadores;
SELECT * FROM conquistas;
SELECT * FROM favoritos;

-- Consulta do jogo atual
SELECT 
    j.id AS id_jogador,
    j.nome AS nome_jogador,
    j.bio AS biografia,
    j.ultima_vez_online,
    j.jogando,
    g.nome AS jogo_atual,
    g.id_jogo AS jogo_atual
FROM jogadores AS j
LEFT JOIN jogos AS g
    ON j.jogo_atual = g.id_jogo
ORDER BY j.nome;

-- Consulta das conquistas
SELECT 
    j.nome AS nome_jogador,
    c.nome AS conquista,
    jc.obtido_em
FROM jogadores AS j
JOIN jogadores_conquistas AS jc
    ON j.id = jc.id
JOIN conquistas AS c
    ON jc.id_conquista = c.id_conq
ORDER BY j.nome, jc.obtido_em DESC;

-- Consulta dos favs
SELECT 
    j.nome AS nome_jogador,
    i.nome AS item_favorito,
    g.nome AS jogo_favorito
FROM favoritos AS f
JOIN jogadores AS j
    ON f.id = j.id
JOIN itens AS i
    ON f.id_item = i.id_item
JOIN jogos AS g
    ON f.id_jogo = g.id_jogo
ORDER BY j.nome, g.nome;