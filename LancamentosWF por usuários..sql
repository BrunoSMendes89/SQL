SELECT PFU_CdiLancamentoWF, LWF_CdiFormularioWF, LWF_CdiEtapaWorkflow, FWF_D1sFormularioWF, PFU_CdiTransacaoWF_Proxima,
PFU_CdiUsuario, USR_CdsUsuario
FROM PendenciasWFTransacoesUsus
INNER JOIN LancamentosWF ON (PFU_CdiLancamentoWF = LWF_CdiLancamentoWF)
INNER JOIN FormulariosWF ON (LWF_CdiFormularioWF = FWF_CdiFormularioWF)
INNER JOIN Usuarios ON (PFU_CdiUsuario = USR_CdiUsuario)
WHERE PFU_CdiUsuario IN (29946)
AND LWF_CdiFormularioWF = 10029