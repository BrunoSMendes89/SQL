SELECT USC_CdiUsuario, USC_CdiContratado_Usuario, CON_DssNome
FROM UsuariosContratados
INNER JOIN Contratados ON (USC_CdiContratado_Usuario = CON_CdiContratado)
INNER JOIN ContratadosExtras ON (CON_CdiContratado = COE_CdiContratado)
INNER JOIN CrachasExtras ON (COE_CdiCrachaExtra = CEX_CdiCrachaExtra)
INNER JOIN Usuarios ON (USC_CdiUsuario = USR_CdiUsuario)
WHERE COE_CdiCrachaExtra in (1003951,4010985,1003981,1004232,4010493,4394152,4010317,1003962)