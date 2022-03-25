SELECT CON_CdiContratado, CON_DssNome, CAR_D1sCargo, CCU_D1sCentroCusto, SIT_D1sSituacao,CON_DtdInicioSituacao,CON_CosEMailPessoal, CON_CosEMail
FROM Contratados
INNER JOIN Cargos ON (CON_CdiCargo = CAR_CdiCargo)
INNER JOIN CentrosCustos ON (CON_CdiCentroCusto = CCU_CdiCentroCusto)
INNER JOIN Situacoes ON (CON_CdiSituacao =  SIT_CdiSituacao)
WHERE CCU_D1sCentroCusto like '%Hyundai%' OR  CCU_D1sCentroCusto like '%Nissan%')
AND CON_CdiCargo IN (21,119,140)
AND CON_CdiSituacao NOT IN (0,2,3,99)
order by 4

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT CON_CdiContratado, CON_DssNome, CAR_D1sCargo, CCU_D1sCentroCusto, SIT_D1sSituacao,CON_DtdInicioSituacao,CON_CosEMailPessoal, CON_CosEMail
FROM Contratados
INNER JOIN Cargos ON (CON_CdiCargo = CAR_CdiCargo)
INNER JOIN CentrosCustos ON (CON_CdiCentroCusto = CCU_CdiCentroCusto)
INNER JOIN Situacoes ON (CON_CdiSituacao =  SIT_CdiSituacao)
WHERE CCU_D1sCentroCusto like '%Hyundai%' --OR  CCU_D1sCentroCusto like '%Nissan%')
AND CON_CdiCargo IN (/*ConsultorTecnico*/11,646,/*Programador,Apontador*/12,109,606,/*Caixa*/193,210,/*Preparador*/106,137,343,393,/*Estoquista*/78,304,305,306,348,/*Garantista*/195,194,)
AND CON_CdiSituacao NOT IN (0,2,3,99)
order by 4

AND CON_CdiCargo IN (/*Gerente Assist. Tecnica*/80,/*Ger. Vendas*/140, /*Ger. Peças*/82,/*Ger. Pos Vendas*/623, /*Balconista Pecas*/52,82,130,171,421,611,793,839,840,/*ConsultorTecnico*/11,646,/*Programador,Apontador*/12,109,606,/*Caixa*/193,210,/*Vendedor*/119,/*Assistente de Vendas*/21,27,/*Venda Direta*/396,/*Preparador*/106,137,343,393,/*Estoquista*/78,304,305,306,348,/*Garantista*/195,194/*Oficina*/89,341,740)

------------------------------------------------------------------------

/*Consulta para trazer todos que não são ADM*/
SELECT CON_CdiContratado, CON_DssNome, CON_NusCICNumero, CON_DtdAdmissao, CAR_CdiCargo, CAR_D1sCargo, CON_CosEMailPessoal, CON_CosEMail, CON_CdiSituacao, SIT_D1sSituacao, CCU_D1sCentroCusto
FROM Contratados
INNER JOIN CentrosCustos ON (CON_CdiCentroCusto = CCU_CdiCentroCusto)
INNER JOIN Cargos ON (CON_CdiCargo = CAR_CdiCargo)
INNER JOIN Situacoes ON (CON_CdiSituacao = SIT_CdiSituacao)
INNER JOIN Folhas ON (CON_CdiFolha = FOL_CdiFolha)
INNER JOIN Locais ON (FOL_CdiLocal = LOC_CdiLocal)
WHERE LOC_CdiEmpresa NOT IN (1,15,40,90,91) /* Empresas 90 e 91 são Pensionisas e Gestores, respectivamente. */
AND CON_CdiSituacao not in (0,2,3,4,51,99) /* Sem demitidos, afastados por aposentadoria ou por doença */
AND CON_CdiCargo NOT IN (/*PORTARIA*/135,394,413,814,/*SERVIÇOS GERAIS*/26,395,/*LAVAGEM*/136,/*CRM*/627,693,/*PATIO*/358,754,/*Motorista*/94,/*Piloto*/101,/*telefonista*/118,/*pintura*/240,/*aprendiz*/636)
AND (CCU_D1sCentroCusto like '%JEEP%' OR CCU_D1sCentroCusto like '%SINAL%' OR CCU_D1sCentroCusto like '%RENAULT%' OR CCU_D1sCentroCusto like '%FIAT%')
order by CCU_D1sCentroCusto,CON_CdiSituacao