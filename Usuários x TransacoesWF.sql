SELECT UXS_CdiUsuario, USR_CdsUsuario, CON_CdiContratado, CON_DssNome, UXS_CdiTransacaoWF, FWF_CdiFormularioWF, FWF_D1sFormularioWF
FROM UsuariosxTransacoesWF
INNER JOIN Usuarios ON (UXS_CdiUsuario = USR_CdiUsuario)
INNER JOIN UsuariosContratados ON (USR_CdiUsuario = USC_CdiUsuario)
INNER JOIN Contratados ON (USC_CdiContratado_Usuario = CON_CdiContratado)
INNER JOIN TransacoesWF ON (UXS_CdiTransacaoWF = TWF_CdiTransacaoWF)
INNER JOIN FormulariosWF ON (TWF_CdiFormularioWF = FWF_CdiFormularioWF)
WHERE UXS_CdiTransacaoWF IN (100331,100385)
AND CON_CdiSituacao not in (0,2,3,99)