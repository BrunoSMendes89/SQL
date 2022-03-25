SELECT CON_CdiContratado,CEX_CosCrachaBase,CON_DssNome, CAR_D1sCargo, LOC_D1sLocal + ' - ' + LOC_D1sApelido as 'Local',
CON_DtdAdmissao, CON_DtdRescisao, CON_DtdInicioSituacao, ContSituacoes.SIT_D1sSituacao as 'Sit 1106', CST_DtdSituacaoInicio,SituSituacoes.SIT_D1sSituacao as 'Sit no 1133'
FROM Contratados
INNER JOIN ContratadosExtras ON (CON_CdiContratado = COE_CdiContratado)
INNER JOIN CrachasExtras ON (COE_CdiCrachaExtra = CEX_CdiCrachaExtra)
INNER JOIN Cargos ON (CON_CdiCargo = CAR_CdiCargo)
INNER JOIN Folhas ON (CON_CdiFolha = FOL_CdiFolha)
INNER JOIN Locais ON (FOL_CdiLocal = LOC_CdiLocal)
INNER JOIN Empresas ON (LOC_CdiEmpresa = EMP_CdiEmpresa)
INNER JOIN Situacoes ContSituacoes ON (CON_CdiSituacao = ContSituacoes.SIT_CdiSituacao)
INNER JOIN ConSituacoes ON (CON_CdiContratado = CST_CdiContratado)
INNER JOIN Situacoes SituSituacoes ON (CST_CdiSituacao = SituSituacoes.SIT_CdiSituacao)
Where CON_CdiSituacao = 1
AND CST_CdiSituacao in (2,3)
AND EMP_CdiEmpresa <> 99
AND    CST_DtdSituacaoInicio =
(select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
AND x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))
AND LOC_D1sLocal NOT LIKE 'VS%'