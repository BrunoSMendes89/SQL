select BCG_DtdDataHoraLogIntegracao, BCO_NuiConteudo_Inteiro, convert(varchar(8000), convert(varbinary(8000), BCN_DsbErro))
from LogsIntegracoes
inner join LogsIntegracoesServidores on (BCN_CdiLogIntegracao = BCG_CdiLogIntegracao and BCN_OplRealizado = 0)
left join LogsIntegracoesCampos on (BCN_CdiLogIntegracao = BCO_CdiLogIntegracao and BCO_DssCampo = 'TRANSACTIONID')
where convert(varchar(8000), convert(varbinary(8000), BCN_DsbErro)) like '%ConnectionOpen%'
order by BCG_CdiLogIntegracao desc