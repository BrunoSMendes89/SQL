Select TWF_CdiTransacaoWF,TWF_D1sLiteral_Transacao, USC_CdiUsuario, CON_DssNome,
FWF_CdiFormularioWF, Coalesce(BRH_D1sFormularioWF, FWF_D1sFormularioWF) AS FWF_D1sFormularioWF, FWG_D1sFormularioWFGrupo, TWF_CdiEtapaWorkflow_De, a.EWF_D1sEtapaWorkflow as "Etapa Workflow origem", Coalesce(Nullif(CHJ_CdiEtapaWorkflow_Para, 0), TWF_CdiEtapaWorkflow_Para) as TWF_CdiEtapaWorkflow_Para, b.EWF_D1sEtapaWorkflow as "Etapa Workflow destino"
from TransacoesWf
 Left Join UsuariosxTransacoeswf on ( TWF_CdiTransacaoWF = UXS_CdiTransacaoWF)
 Left join formularioswf on ( FWF_CdiFormularioWF = TWF_CdiFormularioWF )
 Left join formularioswfgrupos on ( FWG_CdiFormularioWFGrupo = FWF_CdiFormularioWFGrupo )
 Left join EtapasWorkFlows a on ( a.EWF_CdiEtapaWorkflow = TWF_CdiEtapaWorkflow_De )
 Left join TransacoesWFSobreps on ( CHJ_CdiTransacaoWF = TWF_CdiTransacaoWF )
 Left join EtapasWorkFlows b on ( b.EWF_CdiEtapaWorkflow = Coalesce(Nullif(CHJ_CdiEtapaWorkflow_Para, 0), TWF_CdiEtapaWorkflow_Para) )
 Left join (Select BRH_CdiFormularioWF, BRH_D1sFormularioWF From FormulariosWFSobreps Where BRH_D1sFormularioWF <> '') FormulariosWFSobreps on ( BRH_CdiFormularioWF = FWF_CdiFormularioWF )
 Left Join UsuariosContratados on (UXS_CdiUsuario = USC_CdiUsuario)
 Left Join Contratados ON (USC_CdiContratado_Usuario = CON_CdiContratado)  
 WHERE TWF_CdiFormularioWF BETWEEN 10017 AND 10030
 AND TWF_D1sLiteral_Transacao LIKE '%APROVADO%'
 ORDER BY FWF_CdiFormularioWF