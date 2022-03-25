SELECT USC_CdiUsuario as 'Id Usuario', USC_CdiContratado_Usuario as 'Id Contratado', CON_DssNome as 'Nome'
FROM UsuariosContratados
INNER JOIN Usuarios ON (USC_CdiUsuario = USR_CdiUsuario)
INNER JOIN Contratados ON (USC_CdiContratado_Usuario = CON_CdiContratado)
WHERE USR_CdsUsuario = 'GESTOR576'
OR USR_CdsUsuario = '4006855'