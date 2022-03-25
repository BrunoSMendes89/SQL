SELECT  CBD_CdiContratado, CON_DssNome, CON_NusNumeroPis, CBD_NuiDispositivoAcesso,DIS_CosEnderecoIP,CBD_DtdBatidaData, CBD_HrdBatidaHoraMinuto,
CBD_NuiSequencialRegistroREP, CBD_OplProcessado, CBD_DssMensagemRejeicao
FROM ConBatidasReaisRejeitadas
INNER JOIN DispositivosAcessos on (CBD_NuiDispositivoAcesso = DIS_CdiDispositivoAcesso)
INNER JOIN Contratados ON (CBD_CdiContratado = CON_CdiContratado)
WHERE CBD_DtdBatidaData > '20210719'
ORDER BY CBD_DtdBatidaData DESC