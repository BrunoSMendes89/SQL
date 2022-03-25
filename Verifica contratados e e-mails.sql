SELECT USC_CdiUsuario, USR_CdsUsuario, USR_CdiGrupoUsuario, USR_CosEmail, USR_CdiOpcao_BloqEnvioEmailRel, USR_CdiOpcao_DesavEmailWF
FROM UsuariosContratados
INNER JOIN Contratados ON (USC_CdiContratado_Usuario = CON_CdiContratado)
INNER JOIN Usuarios ON (USC_CdiUsuario = USR_CdiUsuario)
WHERE USR_CosEmail like '%@apdata.com.br'
and USR_CdiOpcao_BloqEnvioEmailRel = 0
and USR_CdiGrupoUsuario not in (11)
order by USR_CdiGrupoUsuario