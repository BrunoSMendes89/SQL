SELECT  CBE_CdiContratado, CON_DssNome, CON_NusNumeroPis, CBE_CdiDispositivoAcesso,DIS_CosEnderecoIP,CBE_DtdBatidaData, CBE_HrdBatidaHoraMinuto, CBE_NuiSequencialRegistroREP
FROM ConBatidasReais
INNER JOIN DispositivosAcessos on (CBE_CdiDispositivoAcesso = DIS_CdiDispositivoAcesso)
INNER JOIN Contratados ON (CBE_CdiContratado = CON_CdiContratado)
WHERE CBE_CdiDispositivoAcesso = 81
AND CBE_DtdBatidaData > '20210504'
ORDER BY CBE_DtdBatidaData DESC