SELECT IPX_CdiVigenciaLegal, IPX_DtdVigencia, IPX_DtdVigenciaFim
FROM VigenciasLegais

SELECT * from campos where acp_dsscampo like 'IPX_CdiVigenciaLegal'

UPDATE VigenciasLegais
SET IPX_DtdVigenciaFim = '20201231'
WHERE IPX_CdiVigenciaLegal in (2,7)
INNER JOIN Contratados ON (CON_CdiContratado = UCC_CdiContratado)