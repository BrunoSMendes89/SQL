SELECT
*
FROM
(
	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	1 AS MES,
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln01) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM  [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	2 AS MES,
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln02) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	3 AS MES,
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln03) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	4 AS MES,
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln04) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	5 AS MES,
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln05) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	6 AS MES,
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln06) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	7 AS MES,
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln07) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	8 AS MES,
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln08) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	9 AS MES,
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln09) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	10 AS MES,
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln10) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	11 AS MES,
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln11) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)

	UNION ALL

	SELECT CON_NuiArmario AS "Matricula PROD", CON_CdiContratado AS "Matricula BFP", CON_DssNomeCompleto,CON_NusCICNumero,CAR_D1sCargo,EMP_CDIEMPRESA,EMP_DSSEMPRESA,LOC_CDILOCAL,LOC_D1SLOCAL,CCU_CdiCentroCusto,CCU_CosEstrutura,CCU_D1sCentroCusto,CCR_COSESTRUTURA,CCR_D1SCENTROCUSTORELATIVO,
	12 AS MES,
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 001 AND CFF_CdiContratado = CON_CdiContratado) AS 'Salário',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 141 AND CFF_CdiContratado = CON_CdiContratado) AS '141-Comisões Gerencia',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 162 AND CFF_CdiContratado = CON_CdiContratado) AS '162-Comisões Acessorios',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 166 AND CFF_CdiContratado = CON_CdiContratado) AS '166-Comisões Despachante',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 164 AND CFF_CdiContratado = CON_CdiContratado) AS '164-PREMIO',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 009 AND CFF_CdiContratado = CON_CdiContratado) AS 'Comissões',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 028 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 60%',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 031 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 80%',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 032 AND CFF_CdiContratado = CON_CdiContratado) AS 'Horas Extras com 100%',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 035 AND CFF_CdiContratado = CON_CdiContratado) AS 'MEDIA DE HORAS EXTRAS NO D S R',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 093 AND CFF_CdiContratado = CON_CdiContratado) AS 'Arredondamento do Mensal',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 097 AND CFF_CdiContratado = CON_CdiContratado) AS 'Integração DSR (Comissões)',

	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 502 AND CFF_CdiContratado = CON_CdiContratado) AS 'Atrasos',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 532 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Quinzenal',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 578 AND CFF_CdiContratado = CON_CdiContratado) AS 'Adiantamento Oficial',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 540 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Comiss. Acess',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 701 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Adiant',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 702 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Mensal',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 511 AND CFF_CdiContratado = CON_CdiContratado) AS 'INSS NORMAL',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 521 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Normal',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 527 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Adiant',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 522 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 542 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Sindical',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 543 AND CFF_CdiContratado = CON_CdiContratado) AS 'Contribuição Assistencial',

	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 706 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido Férias',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 703 AND CFF_CdiContratado = CON_CdiContratado) AS 'Desconto/Arred. Férias',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 523 AND CFF_CdiContratado = CON_CdiContratado) AS 'Imposto de Renda Férias/Recibo',

        (SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 707 AND CFF_CdiContratado = CON_CdiContratado) AS 'Líquido de Rescisão',

	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1019 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Vencimentos',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1020 AND CFF_CdiContratado = CON_CdiContratado) AS 'Total de Descontos',
	(SELECT SUM(CFF_Vln12) FROM  [ApdSinal_BFP_Sinal].[dbo].[ConFichaFinanceira] WHERE CFF_DtiAno = 2021 AND CFF_CdiVerba = 1021 AND CFF_CdiContratado = CON_CdiContratado) AS 'Valor Líquido'
	FROM   [ApdSinal_BFP_Sinal].[dbo].[Contratados]
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[ConPosicoesFinaisMes] ON (CON_CdiContratado = CFW_CdiContratado and CFW_DtiAno_Base = 2021 and CFW_CdiMes_Base = 1)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[FOLHAS] ON (CFW_CDIFOLHA = FOL_CDIFOLHA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[LOCAIS] ON (FOL_CDILOCAL = LOC_CDILOCAL)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[EMPRESAS] ON (LOC_CDIEMPRESA = EMP_CDIEMPRESA)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[Cargos] ON (CFW_CdiCargo = CAR_CdiCargo)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustos] ON (CFW_CdiCentroCusto = CCU_CdiCentroCusto)
        INNER JOIN  [ApdSinal_BFP_Sinal].[dbo].[CentrosCustosRelativos] ON (CCU_CdiCentroCustoRelativo = CCR_CdiCentroCustoRelativo)
	WHERE CON_CdiSituacao NOT IN (0,99)
) DADOS
/*AutoEmployeeFilter=0*/
WHERE DADOS.MES = 9
ORDER BY CCU_CosEstrutura,CCR_CosEstrutura,3,2