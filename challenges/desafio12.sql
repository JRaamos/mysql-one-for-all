SELECT 
at.nome AS artista,
CASE 
WHEN COUNT(f.cancao_id) >= 5
THEN 'A'
WHEN COUNT(f.cancao_id) = 3
THEN 'B'
WHEN COUNT(f.cancao_id) = 4
THEN 'B'
WHEN COUNT(f.cancao_id) = 1 
THEN 'C'
WHEN COUNT(f.cancao_id) = 2
THEN 'C'
ELSE '-'
END
AS ranking
FROM SpotifyClone.album AS a
JOIN SpotifyClone.artistas AS at
ON a.artista_id = at.artista_id
JOIN SpotifyClone.cancoes AS c
ON a.album_id = c.album_id
LEFT JOIN SpotifyClone.cancoes_favoritas AS f
ON c.cancao_id = f.cancao_id
GROUP BY artista
ORDER BY CASE WHEN ranking REGEXP '^[a-zA-Z]' THEN 0 ELSE 1 END ASC,CASE WHEN artista REGEXP '^[e]' THEN 0 
WHEN artista REGEXP '^[n]' THEN 1
WHEN artista REGEXP '^[q]' THEN 1 END ASC;