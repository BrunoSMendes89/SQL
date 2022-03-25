SELECT  PWF_CdiPerfil,PRF_D1sPerfil, PWF_CdiTransacaoWF, FWF_CdiFormularioWF, FWF_D1sFormularioWF
FROM PerfisxTransacoesWF
INNER JOIN Perfis ON (PWF_CdiPerfil = PRF_CdiPerfil)
INNER JOIN TransacoesWF ON (PWF_CdiTransacaoWF = TWF_CdiTransacaoWF)
INNER JOIN FormulariosWF ON (TWF_CdiFormularioWF = FWF_CdiFormularioWF)
WHERE PWF_CdiTransacaoWF IN (116955,116961)
ORDER BY FWF_CdiFormularioWF