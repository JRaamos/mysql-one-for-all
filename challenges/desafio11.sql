SELECT 
a.titulo AS album,
COUNT(f.cancao_id) AS favoritadas  
FROM SpotifyClone.album AS a
JOIN SpotifyClone.cancoes AS c
ON a.album_id = c.album_id
JOIN SpotifyClone.cancoes_favoritas AS f
ON c.cancao_id = f.cancao_id
GROUP BY album
ORDER BY favoritadas DESC, album ASC LIMIT 3;