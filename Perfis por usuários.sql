SELECT USP_CdiUsuario, USR_CdsUsuario, USC_CdiContratado_Usuario, CON_DssNome, USP_CdiPerfil AS 'Perfis no Usuário', PRF_D1sPerfil, GUP_CdiPerfil as 'Perfis no Grupo'
FROM UsuariosxPerfis
LEFT JOIN Usuarios                    ON (USP_CdiUsuario = USR_CdiUsuario)
LEFT JOIN GruposUsuariosxPerfis       ON (USR_CdiGrupoUsuario = GUP_CdiGrupoUsuario)
INNER JOIN UsuariosContratados         ON (USP_CdiUsuario = USC_CdiUsuario)
INNER JOIN Contratados                 ON (USC_CdiContratado_Usuario = CON_CdiContratado)
INNER JOIN Perfis                      ON (USP_CdiPerfil = PRF_CdiPerfil)
WHERE USR_CdiUsuario in (4083,29698)