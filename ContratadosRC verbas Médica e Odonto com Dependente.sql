SELECT ContratadosRC.CRC_CdiContratado,
       CON_Dssnome, CON_NusCICNumero, SIT_D1sSituacao, CON_CdiCargo, CAR_D1sCargo,CON_VlnSalario,
       ContratadosRC.CRC_CdiVerba AS 'Id Verba Médico', VER_D1sVerba as 'Desc Verba Médico',
       ContratadosRC.CRC_VlnVerba AS 'Vln Verba Médico', '' as 'Id Verba Odonto','' as 'Desc Veba Odonto','' as 'Vln Verba Odonto',
       DBN_CdiPlanoBeneficio,
       PLB_D1sPlanoBeneficio,
       DEP_CdiConDependente,
       DEP_DssNome,
       LOC_D1sLocal

FROM Pagamentos Pagamentos

      LEFT JOIN ContratadosRC ContratadosRC ON ((Pagamentos.EGB_CdiPagamento = ContratadosRC.CRC_CdiPagamento))
      INNER JOIN Verbas                     ON (CRC_CdiVerba = VER_CdiVerba)
      INNER JOIN PeriodsPagsModelosIts      ON (EGB_CdiPeriodPagModeloIt = EGA_CdiPeriodPagModeloIt)
      Inner join COntratados                on ( ContratadosRC.CRC_CdiContratado = Con_cdiContratado)
      INNER JOIN Cargos                     ON (CON_CdiCargo = CAR_CdiCargo)
      Inner join Folhas                     on (CON_Cdifolha = FOl_Cdifolha)
      Inner join Locais                     on (LOC_CdiLocal = FOl_CdiLocal)
      inner join ConDependentesBenefs       on (CRC_CdiConDependenteBenef      = DBN_CdiConDependenteBenef)
      inner join PlanosBeneficios           on (DBN_CdiPlanoBeneficio          = PLB_CdiPlanoBeneficio)
      inner join ConDependentes             on (DBN_CdiConDependente           = DEP_CdiConDependente)
      inner join Consituacoes               on (Contratados.Con_CdiContratado = Consituacoes.CST_CdiContratado)
      inner join Situacoes                  on (Consituacoes.CST_CdiSituacao = Situacoes.SIT_CdiSituacao)
WHERE ( ContratadosRC.CRC_CdiVerba in (589))
      AND EGA_CdiMes_Referencia = 5
      AND EGA_DtiAno_Referencia = 2021
      --and Consituacoes.CST_CdiSituacao not in(0,2,3,99)
      And    CST_DtdSituacaoInicio =
      (select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
       where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
       and x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))
ORDER BY 1,7