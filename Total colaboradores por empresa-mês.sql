SELECT COUNT(CFW_CdiContratado) AS 'Total Colaboradores', CFW_CdiMes_Base,  EMP_CdiEmpresa, EMP_DssEmpresa
FROM ConPosicoesFinaisMes
INNER JOIN Folhas ON (CFW_CdiFolha = FOL_CdiFolha)
INNER JOIN Locais ON (FOL_CdiLocal = LOC_CdiLocal)
INNER JOIN Empresas ON (LOC_CdiEmpresa = EMP_CdiEmpresa)
WHERE CFW_CdiSituacao IN (1,5,9,16,17,23,38,39,46,47,49)
AND EMP_CdiEmpresa NOT IN (0,33,90,91)
AND CFW_DtiAno_Base = 2021
GROUP BY CFW_CdiMes_Base, EMP_CdiEmpresa, EMP_DssEmpresa