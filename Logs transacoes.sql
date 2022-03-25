SELECT HLT_CdiHisLogTransacao, HLT_CdiHisLog, HLT_CdiTransacao, HLT_DtdDataHoraTransacaoInicio, HLT_DtdDataHoraTransacaoFim
FROM HisLogsTransacoes
where HLT_DtdDataHoraTransacaoInicio >= '06/01/2014'
order by HLT_DtdDataHoraTransacaoInicio desc

select count(LTR_CdiLogTransacao)
FROM LogsTransacoes
where LTR_DtdDataHoraTransacaoInicio between '06/01/2014' and '07/01/2014'