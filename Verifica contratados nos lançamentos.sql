SELECT LWF_CdiLancamentoWF
FROM
LancamentosWF
INNER JOIN LancamentosWFCampos ON LWF_CdiLancamentoWF = LWC_CdiLancamentoWF
WHERE LWF_CdiFormularioWF = 10017
AND LWC_CdiFormularioWFCampo = 10415
AND LWF_CdiEtapaWorkflow NOT IN (0,960,1600)
AND LWF_OplFinalizado = 0
AND LWC_NuiConteudo_Inteiro = ID CONTRATADO