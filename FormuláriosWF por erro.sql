SELECT LWF_CdiLancamentoWF, LWF_CdiFormularioWF, convert(varchar(8000), convert(varbinary(8000), LWF_DsbErroDecurso))
FROM LancamentosWF
WHERE LWF_CdiLancamentoWF IN
(ID DOS LANCAMENTOS)