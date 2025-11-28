USE jogo;
-- ID = 21

SELECT id_usuario, nome_usuario
FROM usuarios
WHERE status = 1
ORDER BY nome_usuario ASC;

SELECT * FROM JOGADORES_PARTIDAS;

SELECT id_partida, COUNT(*) AS total_jogadores
FROM jogadores_partidas
GROUP BY id_partida
ORDER BY id_partida;

SELECT id_partida, nome_mapa, inicio_em, fim_em
FROM partidas
WHERE status = 0
ORDER BY inicio_em DESC;

SELECT * FROM itens;

SELECT id_item, nome_item, tipo_item
FROM itens
WHERE raridade = 'lendario'
ORDER BY nome_item;

SELECT q.id_queda_item, q.id_partida, q.id_item, i.nome_item, caiu_em
FROM quedas_itens q
LEFT JOIN itens i ON i.id_item = q.id_item
WHERE id_usuario_coletor IS NULL
ORDER BY caiu_em;

SELECT 
	p.id_partida,
	p.nome_mapa,
	p.status,
    COUNT(j.id_usuario) AS total_jogadores
FROM partidas AS p
LEFT JOIN jogadores_partidas AS j
	ON j.id_partida = p.id_partida
GROUP BY 
	p.id_partida,
	p.nome_mapa,
	p.status
ORDER BY
	p.id_partida;
    
SELECT 
	u.id_usuario,
    u.nome_usuario,
    u.status,
    COUNT(j.id_partida) AS partidas_jogadas
FROM usuarios AS u
LEFT JOIN jogadores_partidas AS j
ON j.id_usuario = u.id_usuario
GROUP BY 
	u.id_usuario,
	u.nome_usuario,
	u.status
ORDER BY
	partidas_jogadas DESC,
    u.nome_usuario ASC;

UPDATE usuarios
SET status = b'0'
WHERE id_usuario = 5;

SELECT * FROM USUARIOS WHERE id_usuario = 5;

UPDATE usuarios
SET status = b'0'
WHERE id_usuario = 14;

SELECT * FROM denuncias;

UPDATE denuncias
SET status = b'0'
WHERE id_denuncia = 5;

DELETE FROM denuncias
WHERE status = 0;

DELETE FROM jogadores_partidas
WHERE id_jogador_partida = 13;

TRUNCATE usuarios;

DROP DATABASE jogo;