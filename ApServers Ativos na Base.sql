SELECT ECV_CdiInstanciaApServer, ECV_NuiApServer, ECV_NuiPorta, ECV_NusBuildApServer, ECV_DtdInicioInstancia, ECV_DtdFimInstancia, ECV_DssNomeMaquina, ECV_OplApServerPrincipal
FROM InstanciasApServer
WHERE ECV_DtdFimInstancia IS NULL
AND ECV_DssNomeMaquina LIKE 'MRS%'
ORDER BY ECV_DssNomeMaquina, ECV_NuiPorta