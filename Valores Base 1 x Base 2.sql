SELECT 'BASE1' AS 'BASE', EMP_DssEmpresa, EMP_NusCNPJPrefixo +'/'+ LOC_NusCNPJSufixo AS 'CNPJ', TCI_CdiContratado, ConPrd.CON_DssNome, CAR_D1sCargo AS 'Cargo', TCI_CdiTipoInterfaceContabil, TCI_CdiGrupoContabil,
CCR_D1sCentroCustoRelativo,TCI_CdiVerba, VER_D1sVerba,TCI_VlnLancamentoMoeda, TLC_D1STIPOLANCAMENTOCONTABIL,LEFT(TCI_DssContaMontada,12) as 'CONTA A', SUBSTRING(TCI_DssContaMontada,14,6) AS 'CONTA B',  TCI_CdiMes, TCI_DtiAno
FROM TransacoesContabeisItens
INNER JOIN Contratados ConPrd ON (TCI_CdiContratado = ConPrd.CON_CdiContratado)
INNER JOIN Cargos ON (ConPrd.CON_CdiCargo = CAR_CdiCargo)
INNER JOIN Empresas ON (TCI_CdiEmpresa = EMP_CdiEmpresa)
INNER JOIN Locais ON (TCI_CdiLocal = LOC_CdiLocal)
INNER JOIN CentrosCustos ON (TCI_CdiCentroCusto = CCU_CdiCentroCusto)
INNER JOIN CentrosCustosRelativos ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
INNER JOIN Verbas ON (TCI_CdiVerba = VER_CdiVerba)
INNER JOIN TiposLancamentosContabeis ON (TCI_CdiTipoLancamentoContabil = TLC_CdiTipoLancamentoContabil)
WHERE TCI_CdiMes = 12
AND TCI_DtiAno = 2021
AND LEFT(TCI_DssContaMontada,1) = 3

UNION ALL

SELECT 'BASE2' AS 'BASE',
EmpBFP.EMP_DssEmpresa COLLATE SQL_Latin1_General_CP1_CI_AS,
EmpBFP.EMP_NusCNPJPrefixo COLLATE SQL_Latin1_General_CP1_CI_AS +'/'+ LocBFP.LOC_NusCNPJSufixo COLLATE SQL_Latin1_General_CP1_CI_AS AS 'CNPJ',
CONVERT(varchar(50),BFP.TCI_CdiContratado) COLLATE SQL_Latin1_General_CP1_CI_AS,
ConBFP.CON_DssNome COLLATE SQL_Latin1_General_CP1_CI_AS,
CarBFP.CAR_D1sCargo COLLATE SQL_Latin1_General_CP1_CI_AS AS 'Cargo' ,
CONVERT(varchar(50),BFP.TCI_CdiTipoInterfaceContabil) COLLATE SQL_Latin1_General_CP1_CI_AS,
CONVERT(varchar(50),BFP.TCI_CdiGrupoContabil) COLLATE SQL_Latin1_General_CP1_CI_AS,
CCRBFP.CCR_D1sCentroCustoRelativo COLLATE SQL_Latin1_General_CP1_CI_AS,
CONVERT(varchar(50),BFP.TCI_CdiVerba) COLLATE SQL_Latin1_General_CP1_CI_AS,
VerBFP.VER_D1sVerba COLLATE SQL_Latin1_General_CP1_CI_AS,
CONVERT(varchar(50),BFP.TCI_VlnLancamentoMoeda) COLLATE SQL_Latin1_General_CP1_CI_AS,
TipLanBFP.TLC_D1STIPOLANCAMENTOCONTABIL COLLATE SQL_Latin1_General_CP1_CI_AS,
LEFT(BFP.TCI_DssContaMontada,12) COLLATE SQL_Latin1_General_CP1_CI_AS as 'CONTA A',
SUBSTRING(BFP.TCI_DssContaMontada,14,6) COLLATE SQL_Latin1_General_CP1_CI_AS AS 'CONTA B',
CONVERT(varchar(50),BFP.TCI_CdiMes) COLLATE SQL_Latin1_General_CP1_CI_AS,
CONVERT(varchar(50),BFP.TCI_DtiAno)  COLLATE SQL_Latin1_General_CP1_CI_AS
FROM ApdSinal_BFP_Sinal..TransacoesContabeisItens BFP
INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[Contratados] ConBFP ON (BFP.TCI_CdiContratado = CON_CdiContratado)
INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[Cargos] CarBFP ON (ConBFP.CON_CdiCargo = CAR_CdiCargo)
INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[Empresas] EmpBFP ON (BFP.TCI_CdiEmpresa = EMP_CdiEmpresa)
INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[Locais] LocBFP ON (BFP.TCI_CdiLocal = LOC_CdiLocal)
INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] CCBFP ON (BFP.TCI_CdiCentroCusto = CCU_CdiCentroCusto)
INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] CCRBFP ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[Verbas] VerBFP ON (BFP.TCI_CdiVerba = VER_CdiVerba)
INNER JOIN [ApdSinal_BFP_Sinal].[dbo].[TiposLancamentosContabeis] TipLanBFP ON (BFP.TCI_CdiTipoLancamentoContabil = TLC_CdiTipoLancamentoContabil)
WHERE BFP.TCI_CdiMes = 12
AND BFP.TCI_DtiAno = 2021
AND LEFT(BFP.TCI_DssContaMontada,1) = 3