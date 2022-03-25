SELECT DISTINCT tab1.CON_CdiContratado as 'ID base 1', tab2.CON_CdiContratado as'ID base 2', tab1.CON_DssNome as 'Nome', tab1.CON_CdiFolha, tab1.CON_CdiCentroCusto as 'ID Centro Custo Base 1', CCU1.CCU_D1sCentroCusto as 'Centro Custo Base 1', tab2.CON_CdiFolha, tab2.CON_CdiCentroCusto as 'ID Centro Custo Base 2', CCU2.CCU_D1sCentroCusto as 'Centro Custo BASE 2'
FROM [ApdSinal_Prod].[dbo].[Contratados] tab1
    INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[Contratados] tab2 ON tab1.CON_NusCICNumero = tab2.CON_NusCICNumero COLLATE SQL_Latin1_General_CP1_CI_AS
	INNER JOIN [ApdSinal_Prod].[dbo].[CentrosCustos] CCU1 ON tab1.CON_CdiCentroCusto = CCU1.CCU_CdiCentroCusto
	INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] CCU2 ON tab2.CON_CdiCentroCusto = CCU2.CCU_CdiCentroCusto 
	WHERE tab1.CON_CdiSituacao not in (0,2,3,99)
	AND tab1.CON_CdiCentroCusto <> tab2.CON_CdiCentroCusto
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT CON_CdiContratado, CON_DssNome, CAR_D1sCargo, CON_DtdRescisao, CON_CdiSituacao, CON_DtdInicioSituacao, SitCon.SIT_D1sSituacao as 'Obj 1106', CST_CdiSituacao, Sit.SIT_D1sSituacao as 'Obj 1133'
FROM Contratados
INNER JOIN Cargos ON (CON_CdiCargo = CAR_CdiCargo)
INNER JOIN ConSituacoes ON (CON_CdiContratado = CST_CdiContratado)
INNER JOIN Situacoes SitCon ON (CON_CdiSituacao = SitCon.SIT_CdiSituacao)
INNER JOIN Situacoes Sit ON (CST_CdiSituacao = Sit.SIT_CdiSituacao)
WHERE CON_CdiContratado in (4650, 4741)
And    CST_DtdSituacaoInicio =
	(select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
	 where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
	 and x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))	