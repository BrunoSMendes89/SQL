SELECT DISTINCT Contratados.CON_CdiContratado,
                Contratados.CON_DssNome,
                Contratados.CON_NusCICNumero as CPF,
                Cargos.Car_D1sCargo,
                Situacoes.SIT_D1sSituacao,
                Usuarios.USR_CdiUsuario,
                Usuarios.USR_CdsUsuario,
                USR_CdiPerfil_Padrao as 'ID',
                Perfis_2.PRF_D1sPerfil as 'PERFIL',
                CrachasExtras.CEX_CosCrachaBase As Crachá
FROM UsuariosxPerfis UsuariosxPerfis
LEFT JOIN UsuariosContratados UsuariosContratados ON ( (UsuariosxPerfis.USP_CdiUsuario = UsuariosContratados.USC_CdiUsuario))
LEFT JOIN Contratados Contratados ON ((UsuariosContratados.USC_CdiContratado_Usuario = Contratados.CON_CdiContratado))
INNER JOIN Cargos Cargos          ON ((Contratados.CON_CdiCargo = Cargos.CAR_CdiCargo))
INNER join Consituacoes Consituacoes                 ON (Contratados.Con_CdiContratado = Consituacoes.CST_CdiContratado)
INNER join Situacoes Situacoes                       ON (Consituacoes.CST_CdiSituacao = Situacoes.SIT_CdiSituacao)
LEFT JOIN Perfis Perfis ON ((UsuariosxPerfis.USP_CdiPerfil = Perfis.PRF_CdiPerfil))
LEFT JOIN Usuarios Usuarios ON ((UsuariosxPerfis.USP_CdiUsuario = Usuarios.USR_CdiUsuario))
LEFT JOIN Perfis Perfis_2 ON (( Usuarios.USR_CdiPerfil_Padrao = Perfis_2.PRF_CdiPerfil))
LEFT JOIN GruposUsuarios GruposUsuarios ON (( GruposUsuarios.GUS_CdiGrupoUsuario = Usuarios.USR_CdiGrupoUsuario  ))
LEFT JOIN ContratadosExtras ContratadosExtras ON ((Contratados.CON_CdiContratado = ContratadosExtras.COE_CdiContratado))
LEFT JOIN CrachasExtras CrachasExtras ON ((ContratadosExtras.COE_CdiCrachaExtra =  CrachasExtras.CEX_CdiCrachaExtra))
WHERE ( GruposUsuarios.GUS_OplDesativado = 0 )
AND (situacoes.sit_cdisituacao not in (2,3,99))
AND    CST_DtdSituacaoInicio =
(select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
AND x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))
UNION

SELECT DISTINCT CON_CdiContratado,
                CON_DssNome,
                CON_NusCICNumero as 'CPF',
                Car_D1sCargo,
                SIT_D1sSituacao,
                USR_CdiUsuario,
                USR_CdsUsuario,
                PRF_CdiPerfil as 'ID',
                PRF_D1sPerfil as 'PERFIL',
                CrachasExtras.CEX_CosCrachaBase As Crachá
FROM Usuarios
LEFT JOIN UsuariosContratados   ON USR_CdiUsuario = USC_CdiUsuario
LEFT JOIN Contratados           ON CON_CdiContratado = USC_CdiContratado_Usuario
INNER JOIN Cargos               ON CON_CdiCargo = CAR_CdiCargo
INNER join Consituacoes         ON Con_CdiContratado = CST_CdiContratado
INNER join Situacoes            ON CST_CdiSituacao = SIT_CdiSituacao
LEFT JOIN GruposUsuarios        ON GUS_CdiGrupoUsuario = USR_CdiGrupoUsuario
LEFT JOIN GruposUsuariosxPerfis ON GUP_CdiGrupoUsuario = GUS_CdiGrupoUsuario
LEFT JOIN Perfis                ON PRF_CdiPerfil = GUP_CdiPerfil
LEFT JOIN ContratadosExtras ContratadosExtras ON ((Contratados.CON_CdiContratado = ContratadosExtras.COE_CdiContratado))
LEFT JOIN CrachasExtras CrachasExtras ON ((ContratadosExtras.COE_CdiCrachaExtra =  CrachasExtras.CEX_CdiCrachaExtra))
WHERE ( GruposUsuarios.GUS_OplDesativado = 0 )
AND (situacoes.sit_cdisituacao not in (2,3,99))
AND    CST_DtdSituacaoInicio =
(select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
AND x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))