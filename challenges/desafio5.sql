SELECT 
u.name AS cancao,
COUNT(m.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS u
JOIN SpotifyClone.historico AS m
ON u.cancao_id = m.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC LIMIT 2;