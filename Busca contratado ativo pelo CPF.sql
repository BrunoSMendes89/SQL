SELECT CON_CdiContratado, CON_DssNome, CON_NusCICNumero, CON_DtdAdmissao, CON_CdiVinculo, VIN_D1sVinculo
FROM Contratados
INNER JOIN Vinculos ON (CON_CdiVinculo = VIN_CdiVinculo)
WHERE CON_NusCICNumero = '019.775.690-56'
AND CON_CdiSituacao = 1