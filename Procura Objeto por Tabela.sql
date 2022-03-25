SELECT ACP_CdiObjeto_Primitivo, ATB_DssTabela,*
FROM CAMPOS
INNER JOIN TABELAS ON (ACP_CdiTabela = ATB_CdiTabela)
WHERE ACP_DssCampo like 'CWQ_%'