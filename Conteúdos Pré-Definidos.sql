SELECT CJT_D1sListaGenerica, CJU_NuiConteudo_Inteiro
FROM ListasGenericasItens
INNER JOIN ListasGenericas ON (CJU_CdiListaGenerica = CJT_CdiListaGenerica)
WHERE CJU_NuiConteudo_Inteiro = 2