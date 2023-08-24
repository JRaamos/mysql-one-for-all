SELECT 
u.name_usuario AS pessoa_usuaria,
COUNT(m.usuario_id) AS musicas_ouvidas,
ROUND(SUM(c.duracao_segundos /60),2) AS total_minutos
FROM SpotifyClone.usuario AS u
JOIN SpotifyClone.historico AS m
ON u.usuario_id = m.usuario_id
JOIN SpotifyClone.cancoes AS c 
ON m.cancao_id = c.cancao_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;