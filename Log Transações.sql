SELECT LTR_CdiTransacao,AXN_DtdAbertura,AXN_DtdProgramada,AXN_OplExecutadoPeloAgendador,AZN_D1sTipoResultadoProcesso,
OBJ_D1sObjeto,LOS_CdsUsuario,LOS_CdiLog,LTR_CdiLogTransacao
FROM LogsTransacoesPrsAgs
INNER JOIN LogsTransacoes on (AXN_CdiLogTransacao=LTR_CdiLogTransacao)
INNER JOIN Logs on (LOS_CdiLog=LTR_CdiLog)
INNER JOIN Usuarios on (USR_CdiUsuario = LTR_CdiUsuario)
INNER JOIN Transacoes on (TRN_CdiTransacao=LTR_CdiTransacao)
INNER JOIN TiposTransacoes on (TTR_CdiTipoTransacao=TRN_CdiTipoTransacao)
INNER JOIN Pastas on (TRN_CdiPasta=ATA_CdiPasta)
INNER JOIN Regioes on (APD_CdiRegiao=ATA_CdiRegiao)
INNER JOIN Objetos on (APD_CdiObjeto=OBJ_CdiObjeto)
INNER JOIN TiposResultadosProcessos on (AXN_CdiTipoResultadoProcesso=AZN_CdiTipoResultadoProcesso)
WHERE LTR_CdiLogTransacao = 137168784
ORDER BY AXN_DtdAbertura,AXN_DtdProgramada