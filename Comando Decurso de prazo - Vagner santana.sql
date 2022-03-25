SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED


SELECT DISTINCT
 PFT_CdiLancamentoWF,
  LWF_CdiEtapaWorkFlow,
  PFT_DtdLimite,
  LWF_OplDecursoDePrazo,
  BEF_CdiTipoAcaoDecPrazoWF_1, BEF_CdiTipoAcaoDecPrazoWF_2,
  BEF_QtiDiasDecurso1, BEF_QtiHorasDecurso1, BEF_QtiMinutosDecurso1,
  BEF_QtiDiasDecurso2, BEF_QtiHorasDecurso2, BEF_QtiMinutosDecurso2,
  Coalesce(NullIf(BRH_CdiOpcao_EnviaEMail, 0), FWF_OplEnviaEMail) As FWF_OplEnviaEMail,
  Coalesce(NullIf(TransacoesWFSobreps_1.TWF_CdiTransacao, 0), TransacoesWF_1.TWF_CdiTransacao) as TWF_CdiTransacao_1,
  Coalesce(NullIf(TransacoesWFSobreps_2.TWF_CdiTransacao, 0), TransacoesWF_2.TWF_CdiTransacao) as TWF_CdiTransacao_2,
  FWF_CdiFormularioWF
FROM
  PendenciasWFTransacoes
INNER JOIN LancamentosWF  ON (LWF_CdiLancamentoWF = PFT_CdiLancamentoWF )
INNER JOIN FormulariosWF  ON (FWF_CdiFormularioWF = LWF_CdiFormularioWF )
LEFT JOIN FormulariosWFSobreps  ON (BRH_CdiFormularioWF = FWF_CdiFormularioWF )
INNER JOIN FormulariosWFEtapas  ON (BEF_CdiFormularioWF = LWF_CdiFormularioWF AND BEF_CdiEtapaWorkflow = LWF_CdiEtapaWorkFlow )
LEFT JOIN FormulariosWFEtapasSobreps  ON (CHL_CdiFormularioWFEtapa = BEF_CdiFormularioWFEtapa )
  LEFT JOIN TransacoesWF TransacoesWFSobreps_1 ON (CHL_CdiTransacaoWF_1 = TransacoesWFSobreps_1.TWF_CdiTransacaoWF)
  LEFT JOIN (Select TRN_DssClasse, TRN_CdiPasta, TRN_CdiTransacao from Transacoes where TRN_CdiTransacao > 0) TransacoesSobreps_1 ON (TransacoesWFSobreps_1.TWF_CdiTransacao = TransacoesSobreps_1.TRN_CdiTransacao)
  LEFT JOIN Pastas PastasSobreps_1 ON (TransacoesSobreps_1.TRN_CdiPasta = PastasSobreps_1.ATA_CdiPasta)
  LEFT JOIN Regioes RegioesSobreps_1 ON (PastasSobreps_1.ATA_CdiRegiao = RegioesSobreps_1.APD_CdiRegiao)
  LEFT JOIN (select AQD_CdiPasta, AQD_CdiClasse from PastasxClasses 
               inner join Classes on (AQD_CdiClasse = APV_CdiClasse) 
             where APV_CdiTipoClasse not in(1,2)) PastasxClassesSobreps_1 ON (PastasSobreps_1.ATA_CdiPasta = PastasxClassesSobreps_1.AQD_CdiPasta) 
  LEFT JOIN Classes ClassesSobreps_1 ON (PastasxClassesSobreps_1.AQD_CdiClasse = ClassesSobreps_1.APV_CdiClasse)
  LEFT JOIN TransacoesWF TransacoesWFSobreps_2 ON (CHL_CdiTransacaoWF_2 = TransacoesWFSobreps_2.TWF_CdiTransacaoWF)
  LEFT JOIN (Select TRN_DssClasse, TRN_CdiPasta, TRN_CdiTransacao from Transacoes where TRN_CdiTransacao > 0) TransacoesSobreps_2 ON (TransacoesWFSobreps_2.TWF_CdiTransacao = TransacoesSobreps_2.TRN_CdiTransacao)
  LEFT JOIN Pastas PastasSobreps_2 ON (TransacoesSobreps_2.TRN_CdiPasta = PastasSobreps_2.ATA_CdiPasta)
  LEFT JOIN Regioes RegioesSobreps_2 ON (PastasSobreps_2.ATA_CdiRegiao = RegioesSobreps_2.APD_CdiRegiao)
  LEFT JOIN (select AQD_CdiPasta, AQD_CdiClasse from PastasxClasses 
               inner join Classes on (AQD_CdiClasse = APV_CdiClasse) 
             where APV_CdiTipoClasse not in(1,2)) PastasxClassesSobreps_2 ON (PastasSobreps_2.ATA_CdiPasta = PastasxClassesSobreps_2.AQD_CdiPasta) 
  LEFT JOIN Classes ClassesSobreps_2 ON (PastasxClassesSobreps_2.AQD_CdiClasse = ClassesSobreps_2.APV_CdiClasse)
  INNER JOIN TransacoesWF TransacoesWF_1 ON (BEF_CdiTransacaoWF_1 = TransacoesWF_1.TWF_CdiTransacaoWF)
  Left Join TiposTransacoesWF TiposTransacoesWF_1 ON (TransacoesWF_1.TWF_CdiTipoTransacaoWF = TiposTransacoesWF_1.CNF_CdiTipoTransacaoWF) 
  INNER JOIN Transacoes Transacoes_1 ON (TransacoesWF_1.TWF_CdiTransacao = Transacoes_1.TRN_CdiTransacao)
  INNER JOIN Pastas Pastas_1 ON (Transacoes_1.TRN_CdiPasta = Pastas_1.ATA_CdiPasta)
  INNER JOIN Regioes Regioes_1 ON (Pastas_1.ATA_CdiRegiao = Regioes_1.APD_CdiRegiao)
  LEFT JOIN (select AQD_CdiPasta, AQD_CdiClasse from PastasxClasses 
               inner join Classes on (AQD_CdiClasse = APV_CdiClasse) 
             where APV_CdiTipoClasse not in(1,2)) PastasxClasses_1 ON (Pastas_1.ATA_CdiPasta = PastasxClasses_1.AQD_CdiPasta) 
  LEFT JOIN Classes Classes_1 ON (PastasxClasses_1.AQD_CdiClasse = Classes_1.APV_CdiClasse)
  INNER JOIN TransacoesWF TransacoesWF_2 ON (BEF_CdiTransacaoWF_2 = TransacoesWF_2.TWF_CdiTransacaoWF)
  Left Join TiposTransacoesWF TiposTransacoesWF_2 ON (TransacoesWF_2.TWF_CdiTipoTransacaoWF = TiposTransacoesWF_2.CNF_CdiTipoTransacaoWF) 
  INNER JOIN Transacoes Transacoes_2 ON (TransacoesWF_2.TWF_CdiTransacao = Transacoes_2.TRN_CdiTransacao)
  INNER JOIN Pastas Pastas_2 ON (Transacoes_2.TRN_CdiPasta = Pastas_2.ATA_CdiPasta)
  INNER JOIN Regioes Regioes_2 ON (Pastas_2.ATA_CdiRegiao = Regioes_2.APD_CdiRegiao)
  LEFT JOIN (select AQD_CdiPasta, AQD_CdiClasse from PastasxClasses 
               inner join Classes on (AQD_CdiClasse = APV_CdiClasse) 
             where APV_CdiTipoClasse not in(1,2)) PastasxClasses_2 ON (Pastas_2.ATA_CdiPasta = PastasxClasses_2.AQD_CdiPasta) 
  LEFT JOIN Classes Classes_2 ON (PastasxClasses_2.AQD_CdiClasse = Classes_2.APV_CdiClasse)
  LEFT JOIN ModelosMensagens MAprov1 on (BEF_CdiModeloMensagem_Aprov_1 = MAprov1.MMS_CdiModeloMensagem)
  LEFT JOIN ModelosMensagens MSup1 on (BEF_CdiModeloMensagem_Sup_1 = MSup1.MMS_CdiModeloMensagem)
  LEFT JOIN ModelosMensagens MAprov2_Sobrep on (CHL_CdiModeloMensagem_Aprov_1 = MAprov2_Sobrep.MMS_CdiModeloMensagem) 
  LEFT JOIN ModelosMensagens MSup2_Sobrep on (CHL_CdiModeloMensagem_Sup_1 = MSup2_Sobrep.MMS_CdiModeloMensagem) 
  LEFT JOIN ModelosMensagens MAprov3_Sobrep on (CHL_CdiModeloMensagem_Aprov_1 = MAprov3_Sobrep.MMS_CdiModeloMensagem) 
  LEFT JOIN ModelosMensagens MSup3_Sobrep on (CHL_CdiModeloMensagem_Sup_1 = MSup3_Sobrep.MMS_CdiModeloMensagem) 
  LEFT JOIN ModelosMensagens MAprov2 on (BEF_CdiModeloMensagem_Aprov_2 = MAprov2.MMS_CdiModeloMensagem)
  LEFT JOIN ModelosMensagens MSup2 on (BEF_CdiModeloMensagem_Sup_2 = MSup2.MMS_CdiModeloMensagem)
  LEFT JOIN ModelosMensagens MAprov4_Sobrep on (CHL_CdiModeloMensagem_Aprov_2 = MAprov4_Sobrep.MMS_CdiModeloMensagem) 
  LEFT JOIN ModelosMensagens MSup4_Sobrep on (CHL_CdiModeloMensagem_Sup_2 = MSup4_Sobrep.MMS_CdiModeloMensagem) 
  LEFT JOIN GruposEmpresas on (LWF_CdiGrupoEmpresa = GEM_CdiGrupoEmpresa) 
  LEFT JOIN Paises on (GEM_CdiPais = PIE_CdiPais) 

 

 

 

WHERE

 

 

 

  FWF_OplDesativado = 0 AND LWF_OplConsiderar_Disponivel = 1 AND LWF_OplNaoVisualizar = 0 AND 
((Exists(select 1 from EspecificacoesDecsPrazos where IGS_CdiIdentificacaoApServer = NULL /*pApServer*/
         and (FWF_CdiFormularioWF = IGS_CdiFormularioWF or BEF_CdiFormularioWFEtapa = IGS_CdiFormularioWFEtapa or PFT_CdiLancamentoWF = IGS_CdiLancamentoWF))
) or (
  not Exists(select 1 from EspecificacoesDecsPrazos where IGS_CdiIdentificacaoApServer = NULL /*pApServer*/)
  and not Exists(select 1 from EspecificacoesDecsPrazos where FWF_CdiFormularioWF = IGS_CdiFormularioWF
                 or BEF_CdiFormularioWFEtapa = IGS_CdiFormularioWFEtapa or PFT_CdiLancamentoWF = IGS_CdiLancamentoWF)
)) and
 (LWF_OplSuspenderDecursoPrazo = 0 or LWF_OplSuspenderDecursoPrazo is null) and 
( 
         ( 
            LWF_OplDecursoDePrazo = 0 
            AND ( 
                    ( 
                       ((BEF_CdiTipoAcaoDecPrazoWF_1 = 3 And Coalesce(CHL_CdiTipoAcaoDecPrazoWF_1, 0) = 0) or CHL_CdiTipoAcaoDecPrazoWF_1 = 3) 
                       AND ((FWF_OplEnviaEMail = 1 And Coalesce(BRH_CdiOpcao_EnviaEmail, 0) = 0) or BRH_CdiOpcao_EnviaEmail = 1) 
                    ) 
                    OR 
                    ((BEF_CdiTipoAcaoDecPrazoWF_1 not in (0, 3) And Coalesce(CHL_CdiTipoAcaoDecPrazoWF_1, 0) = 0) or CHL_CdiTipoAcaoDecPrazoWF_1 not in (0, 3) ) 
                ) 
         ) 
         OR 
         ( 
            LWF_OplDecursoDePrazo = 1 
            AND ( 
                    ( 
                       ((BEF_CdiTipoAcaoDecPrazoWF_2 = 3 And Coalesce(CHL_CdiTipoAcaoDecPrazoWF_2, 0) = 0) or CHL_CdiTipoAcaoDecPrazoWF_2 = 3) 
                       AND ((FWF_OplEnviaEMail = 1 And Coalesce(BRH_CdiOpcao_EnviaEmail, 0) = 0) or BRH_CdiOpcao_EnviaEmail = 1) 
                    ) 
                    OR 
                    ((BEF_CdiTipoAcaoDecPrazoWF_2 not in (0, 3) And Coalesce(CHL_CdiTipoAcaoDecPrazoWF_2, 0) = 0) or CHL_CdiTipoAcaoDecPrazoWF_2 not in (0, 3) ) 
                ) 
         ) 
       ) And 
  PFT_DtdLimite < GETDATE() /*pData*/ and 
 not exists(SELECT 1             FROM LancamentosWFDecursos             WHERE LancamentosWFDecursos.EOQ_CdiLancamentoWF = PFT_CdiLancamentoWF AND                   (EOQ_CdiIdentificacaoApServer <> NULL /*pApServer*/ OR EOQ_NuiTarefa <> NULL /*pTaskID*/)            ) 
 

 

 
--select * from TiposAcoesDecPrazoWF (BQB_CdiTipoAcaoDecPrazoWF)
