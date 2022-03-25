SELECT ContratadosRC.CRC_CdiContratado,
       CON_Dssnome, CON_NusCICNumero, SIT_D1sSituacao, CON_CdiCargo, CAR_D1sCargo,
       CON_VlnSalario, EGA_CdiMes_Referencia, EGA_DtiAno_Referencia,
       CRC_CdiConPeriodoDescansoIt, CPI_DtdSaidaFerias_P,
       ContratadosRC.CRC_CdiVerba, VER_D1sVerba,
       ContratadosRC.CRC_VlnVerba, NTV_D1sNaturezaVerba,
       LOC_D1sLocal

FROM Pagamentos Pagamentos

      LEFT JOIN ContratadosRC ContratadosRC ON ((Pagamentos.EGB_CdiPagamento = ContratadosRC.CRC_CdiPagamento))
      INNER JOIN ConPeriodosDescansosIts    ON (CRC_CdiConPeriodoDescansoIt = CPI_CdiConPeriodoDescansoIt)
      INNER JOIN Verbas                     ON (CRC_CdiVerba = VER_CdiVerba)
      INNER JOIN NaturezasVerbas            ON (VER_CdiNaturezaVerba = NTV_CdiNaturezaVerba)
      INNER JOIN PeriodsPagsModelosIts      ON (EGB_CdiPeriodPagModeloIt = EGA_CdiPeriodPagModeloIt)
      Inner join COntratados                on ( ContratadosRC.CRC_CdiContratado = Con_cdiContratado)
      INNER JOIN Cargos                     ON (CON_CdiCargo = CAR_CdiCargo)
      Inner join Folhas                     on (CON_Cdifolha = FOl_Cdifolha)
      Inner join Locais                     on (LOC_CdiLocal = FOl_CdiLocal)
      Inner Join Sindicatos		    on (CON_CdiSindicato = SIN_CdiSindicato)
      inner join Consituacoes               on (Contratados.Con_CdiContratado = Consituacoes.CST_CdiContratado)
      inner join Situacoes                  on (Consituacoes.CST_CdiSituacao = Situacoes.SIT_CdiSituacao)
WHERE ( ContratadosRC.CRC_CdiVerba in (5623,5624))
      AND EGA_CdiMes_Referencia = 1
      AND EGA_DtiAno_Referencia = 2022
      --and CRC_VlnVerba > 0
      --AND VER_CdiNaturezaVerba IN (1,2)
      --and Consituacoes.CST_CdiSituacao not in(0,2,3,99)
      And    CST_DtdSituacaoInicio =
      (select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
       where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
       and x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))
ORDER BY CRC_CdiContratado,CRC_CdiVerba