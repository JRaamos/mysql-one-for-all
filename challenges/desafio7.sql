SELECT 
a.nome AS artista,
m.titulo AS album,
COUNT(s.usuario_id) AS pessoas_seguidoras
FROM SpotifyClone.artistas AS a
JOIN SpotifyClone.album AS m
ON a.artista_id = m.artista_id
LEFT JOIN SpotifyClone.seguindo_artista AS s
ON m.artista_id = s.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;