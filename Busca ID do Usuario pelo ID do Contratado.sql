SELECT USC_CdiUsuario as 'Id Usuario', USC_CdiContratado_Usuario as 'Id Contratado', CON_DssNome as 'Nome'
FROM UsuariosContratados
INNER JOIN Contratados ON (USC_CdiContratado_Usuario = CON_CdiContratado)
WHERE USC_CdiContratado_Usuario = id do contratado