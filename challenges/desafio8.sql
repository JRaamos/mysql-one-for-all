SELECT 
a.nome AS artista,
m.titulo AS album
FROM SpotifyClone.artistas AS a
JOIN SpotifyClone.album AS m
ON a.artista_id = m.artista_id
WHERE nome = 'Elis Regina';