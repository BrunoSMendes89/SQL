SELECT DISTINCT
FWF_CdiFormularioWF as 'Id Form WF',
FWF_D1sFormularioWF as 'Desc Form WF',
FWC_CdiCampo as 'id Campo',
ACP_DssCampo as 'Desc Campo',
DOM_QtiTamanhoCampo as 'Tamanho do campo',
TCA_D1sTipoCampo as 'Tipo do Campo',
ATB_DssTabela as 'Tabela'
FROM FormulariosWF
INNER JOIN FormulariosWFCampos ON (FWF_CdiFormularioWF = FWC_CdiFormularioWF)
INNER JOIN Campos ON (FWC_CdiCampo = ACP_CdiCampo)
INNER JOIN Dominios ON (ACP_CdiDominio = DOM_CdiDominio)
INNER JOIN TiposCampos ON (DOM_CdiTipoCampo = TCA_CdiTipoCampo)
INNER JOIN Tabelas ON (ACP_CdiTabela = ATB_CdiTabela)
WHERE FWF_CdiFormularioWF in (10052, 10083)