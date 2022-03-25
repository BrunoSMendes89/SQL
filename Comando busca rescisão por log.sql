Select DISTINCT CON_CdiContratado, COE_CdiCrachaExtra, CON_DssNome, CON_CdiSituacao, CON_DtdRescisao AS 'Data de Rescisão', AXN_DtdAbertura as 'Data da Transação', LTR_CdiLogTransacao,  CAR_D1sCargo
FROM Contratados
INNER JOIN Cargos ON (CON_CdiCargo = CAR_CdiCargo)
INNER JOIN ContratadosExtras ON (CON_CdiContratado = COE_CdiContratado)
left JOIN ContratadosRC ON (CON_CdiContratado = CRC_CdiContratado)
left JOIN LogsTransacoes ON (CRC_CdiLogTransacao = LTR_CdiLogTransacao)
left JOIN LogsTransacoesPrsAgs ON (AXN_CdiLogTransacao=LTR_CdiLogTransacao)
Where COE_CdiCrachaExtra in (2066509,2048287,2113319,2121091,2131226,2135734,4008872)
AND LTR_CdiLogTransacao in (142109301, 141886852, 142080851)