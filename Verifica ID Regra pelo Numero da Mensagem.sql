SELECT TCX_CdiTransacao, TCX_CdiCalculoLPC FROM TransacoesCalcsLPCCFlexs
WHERE TCX_CdiCalculoLPC in (SELECT ACL_CdiCalculoLPC FROM CalculosLPC
INNER JOIN CalculosLPCItens on ( AIC_CdiCalculoLPC = ACL_CdiCalculoLPC)
WHERE AIC_NuiCampoLPCF2 =   951) AND TCX_CdiTransacao in (15952, 15953)

