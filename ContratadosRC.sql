SELECT Pagamentos.EGB_CdiPagamento,
       Pagamentos.EGB_D1sPagamento,
       ContratadosRC.CRC_CdiContratado,
       CON_Dssnome,
       ContratadosRC.CRC_CdiLogTransacao,
       Pagamentos.EGB_CdiPeriodPagModeloIt,
       ContratadosRC.CRC_CdiVerba,
       ContratadosRC.CRC_VlnVerba, LOC_D1sLocal, LOC_D1sApelido

FROM Pagamentos Pagamentos

      LEFT JOIN ContratadosRC ContratadosRC ON ((Pagamentos.EGB_CdiPagamento = ContratadosRC.CRC_CdiPagamento))
      INNER JOIN PeriodsPagsModelosIts ON (EGB_CdiPeriodPagModeloIt = EGA_CdiPeriodPagModeloIt)
      Inner join COntratados on ( ContratadosRC.CRC_CdiContratado = Con_cdiContratado)
      Inner join Folhas on (CON_Cdifolha = FOl_Cdifolha)
      Inner join Locais on (LOC_CdiLocal = FOl_CdiLocal)
WHERE ( ContratadosRC.CRC_CdiVerba in (9645,1021))
      AND EGA_CdiMes_Referencia = 4
      AND EGA_DtiAno_Referencia = 2020
      --and EGB_CdiProcessoLPC = 71
