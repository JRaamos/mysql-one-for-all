SELECT 
u.name_usuario AS pessoa_usuaria,
 CASE 
 WHEN YEAR(MAX(m.data_reproducao)) > 2020
 THEN 'Ativa'
 ELSE 'Inativa'
 END
 AS status_pessoa_usuaria
FROM SpotifyClone.usuario AS u
JOIN SpotifyClone.historico AS m
ON u.usuario_id = m.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;