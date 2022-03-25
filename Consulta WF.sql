select VAG_CdiVaga as "ID Vaga",
       LWF_CdiLancamentoWF as "Id Protocolo",
       LWF_DssReferencia as "Referência",
       LWF_CdiEtapaWorkflow as "Id Etapa WF",
       EWF_D1sEtapaWorkflow as "Etapa WF",
       PFT_DtdLimite as "Data Limite",
       CCU_CdiCentroCusto as "ID Centro Custo",
       CCU_CosEstrutura as "CR",
       CAR_CdiCargo as "ID Cargo",
       CAR_D1sCargo as "Cargo",
       (SELECT A.LWC_DssConteudo_String FROM LancamentosWFCampos A Where A.LWC_CdiLancamentoWFCampo = 10671 and LWC_CdiLancamentoWF = A.LWC_CdiLancamentoWF) as "Cargo Sugerido",
       ""  as "Vaga PCD?"
from
  LancamentosWF
    inner join FormulariosWF on (LWF_CdiFormularioWF = FWF_CdiFormularioWF)
    Left  join (Select BRH_CdiFormularioWF, BRH_D1sFormularioWF, BRH_OplAtivaProcessFlow From FormulariosWFSobreps Where BRH_D1sFormularioWF <> '') FormulariosWFSobreps on (FWF_CdiFormularioWF = BRH_CdiFormularioWF)
    inner join EtapasWorkFlows ON (LWF_CdiEtapaWorkflow = EWF_CdiEtapaWorkflow)
    left  join PendenciasWF on (LWF_CdiLancamentoWF = PFF_CdiLancamentoWF)
    left  join PendenciasWFTransacoes on (PFF_CdiLancamentoWF = PFT_CdiLancamentoWF)
    left  join PendenciasWFTransacoesUsus on (LWF_CdiLancamentoWF = PFU_CdiLancamentoWF)
    left  join TransacoesWF On (PFU_CdiTransacaoWF_Proxima = TWF_CdiTransacaoWF)
    left  join UsuariosNomesView On (PFU_CdiUsuario = CWQ_CdiUsuario)
    Inner join LancamentosWfCampos on LWC_CdiLancamentoWf = LWF_CdiLancamentoWF
    inner join VagasGrades on (VGD_CdiVagaGrade = LWC_NuiConteudo_Inteiro and LWC_CdiCampo = 21149)
    Inner join Vagas on VGD_CdiVaga = VAG_CdiVaga
    Inner join CentrosCustos on VAG_CdiCentroCusto = CCU_CdiCentroCusto
    Inner join Cargos on VAG_CdiCargo = CAR_CdiCargo

WHERE LWF_NuiLancamentoWF_Pai = 0
and LWF_CdiFormularioWF = 10059
AND ((FWF_CdiFormularioWF_Pai = 0) OR (FWF_CdiFormularioWF_Pai <> 0 and FWF_OplLancamentoRelacionado <> 0))
AND LWF_OplFinalizado = 0
and LWF_CdiEtapaWorkFlow <> FWF_CdiEtapaWorkflow_Final_Rej
and LWF_CdiEtapaWorkFlow <> FWF_CdiEtapaWorkflow_Canc
and LWF_OplNaoVisualizar = 0
and VAG_CdiVaga <> 0
and ((TWF_CdiTipoTransacaoWF <> 3) or  (TWF_CdiTipoTransacaoWF is null))
and (CWQ_CdiUsuario is null
     or CWQ_CdiUsuario = (Select MAX (a.PFU_CdiUsuario)
                          From PendenciasWFTransacoesUsus a
                          Inner Join TransacoesWF On(a.PFU_CdiTransacaoWF_Proxima = TWF_CdiTransacaoWF)
                          Where a.PFU_CdiLancamentoWF = LWF_CdiLancamentoWF and
                         ((TWF_CdiTipoTransacaoWF <> 3) or  (TWF_CdiTipoTransacaoWF is null))))
GROUP BY Coalesce(BRH_D1SFORMULARIOWF, FWF_D1SFORMULARIOWF), LWF_DssReferencia, EWF_D1sEtapaWorkflow, FWF_CdiFormularioWF, LWF_CdiEtapaWorkflow,
LWF_CdiLancamentoWF, PFT_DtdLimite, LWF_OplDecursoDePrazo, CWQ_CdsUsuario, CWQ_DssNomeCompleto, VAG_CdiVaga, CCU_CdiCentroCusto, CCU_CosEstrutura, CAR_CdiCargo, CAR_D1sCargo



UNion

select VGD_CdiVagaGrade,
       LWF_CdiLancamentoWF,
       LWF_DssReferencia,
       LWF_CdiEtapaWorkflow,
       EWF_D1sEtapaWorkflow,
       PFT_DtdLimite,
       "",
       "",
       "",
       "",
       (SELECT A.LWC_DssConteudo_String FROM LancamentosWFCampos A Where A.LWC_CdiFormularioWFCampo = 10671 and LWF.LWF_CdiLancamentoWf = A.LWC_CdiLancamentoWF),
       Case when (Select B.LWC_OplConteudo_Logico from lancamentoswfcampos B Where B.LWC_CdiFormularioWFCampo = 10674 and LWF.LWF_CdiLancamentoWf = B.LWC_CdiLancamentoWF) = 1 Then 'Sim' Else 'Não' end

from
  LancamentosWF LWF
    inner join FormulariosWF on (LWF.LWF_CdiFormularioWF = FWF_CdiFormularioWF)
    Left  join (Select BRH_CdiFormularioWF, BRH_D1sFormularioWF, BRH_OplAtivaProcessFlow From FormulariosWFSobreps Where BRH_D1sFormularioWF <> '') FormulariosWFSobreps on (FWF_CdiFormularioWF = BRH_CdiFormularioWF)
    inner join EtapasWorkFlows ON (LWF.LWF_CdiEtapaWorkflow = EWF_CdiEtapaWorkflow)
    left  join PendenciasWF on (LWF.LWF_CdiLancamentoWF = PFF_CdiLancamentoWF)
    left  join PendenciasWFTransacoes on (PFF_CdiLancamentoWF = PFT_CdiLancamentoWF)
    left  join PendenciasWFTransacoesUsus on (LWF.LWF_CdiLancamentoWF = PFU_CdiLancamentoWF)
    left  join TransacoesWF On (PFU_CdiTransacaoWF_Proxima = TWF_CdiTransacaoWF)
    left  join UsuariosNomesView On (PFU_CdiUsuario = CWQ_CdiUsuario)
    Inner join LancamentosWfCampos on LWC_CdiLancamentoWf = LWF.LWF_CdiLancamentoWF
    right join VagasGrades on (VGD_CdiVagaGrade = LWC_NuiConteudo_Inteiro and LWC_CdiCampo = 21149)

WHERE LWF.LWF_NuiLancamentoWF_Pai = 0
and VGD_CdiVagaGrade = 61021
AND ((FWF_CdiFormularioWF_Pai = 0) OR (FWF_CdiFormularioWF_Pai <> 0 and FWF_OplLancamentoRelacionado <> 0))
AND LWF.LWF_OplFinalizado = 0

and LWF.LWF_CdiEtapaWorkFlow <> FWF_CdiEtapaWorkflow_Final_Rej
and LWF.LWF_CdiEtapaWorkFlow <> FWF_CdiEtapaWorkflow_Canc
and LWF.LWF_OplNaoVisualizar = 0
and ((TWF_CdiTipoTransacaoWF <> 3) or  (TWF_CdiTipoTransacaoWF is null))
and (CWQ_CdiUsuario is null
     or CWQ_CdiUsuario = (Select MAX (a.PFU_CdiUsuario)
                          From PendenciasWFTransacoesUsus a
                          Inner Join TransacoesWF On(a.PFU_CdiTransacaoWF_Proxima = TWF_CdiTransacaoWF)
                          Where a.PFU_CdiLancamentoWF = LWF_CdiLancamentoWF and
                         ((TWF_CdiTipoTransacaoWF <> 3) or  (TWF_CdiTipoTransacaoWF is null))))

GROUP BY Coalesce(BRH_D1SFORMULARIOWF, FWF_D1SFORMULARIOWF), LWF.LWF_DssReferencia, EWF_D1sEtapaWorkflow, FWF_CdiFormularioWF, LWF.LWF_CdiEtapaWorkflow,
LWF.LWF_CdiLancamentoWF, PFT_DtdLimite, VGD_CdiVagaGrade





ORDER BY 3,2 desc