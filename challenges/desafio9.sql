SELECT 
COUNT(h.cancao_id) AS musicas_no_historico
FROM SpotifyClone.usuario AS u
JOIN SpotifyClone.historico AS h
ON u.usuario_id = h.usuario_id
WHERE u.name_usuario = 'Barbara Liskov';