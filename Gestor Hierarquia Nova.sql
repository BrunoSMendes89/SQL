SELECT Contratados.CON_CdiContratado,COE_CdiCrachaExtra, Contratados.CON_DssNome, Gestor.CON_CdiContratado, Gestor.CON_DssNome
FROM Contratados
INNER JOIN Contratados Gestor ON (Contratados.CON_NuiContratado_Superior = Gestor.CON_CdiContratado)
INNER JOIN ContratadosExtras ON (Contratados.CON_CdiContratado = COE_CdiContratado)
where Contratados.CON_NuiContratado_Superior = 986477
AND Contratados.CON_DtdRescisao is null
and Contratados.CON_CdiSituacao = 1