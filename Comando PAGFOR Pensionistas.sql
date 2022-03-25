SELECT DISTINCT
                MeiosPagamentos.MPG_CosIdentEmpresaBanco,
                Empresas.EMP_NusCNPJPrefixo,
                Locais.LOC_NusCNPJSufixo,
                Empresas.EMP_DssEmpresa,
                MeiosPagamentos.MPG_NuiRemessaContaCredito,
                MeiosPagamentos.MPG_CdiMeioPagamento,
                CP.CON_DssNome,
                TiposEnderecos.TEN_D1sTipoEndereco,
                TiposEnderecos.TEN_D1sTipoEnderecoRes,
                CP.CON_DssEnderecoBase,
                CP.CON_DssEnderecoNumero,
                CP.CON_DssEnderecoComplto,
                CP.CON_DssBairro,
                CP.CON_DssMunicipio,
                CP.CON_NusCep,
                Estados.EST_CdsSiglaEstado,
                CP.CON_CosPagamentoConta,
                CP.CON_CosPagamentoContaDigito,
                MeiosPagamentos.MPG_CosPagamentoConta_Emp,
                MeiosPagamentos.MPG_CosPagamentoContaDig_Emp,
                MeiosPagamentos.MPG_CdiTipoPagamento,
                Bancos.BAN_NuiOficialBanco,
                Bancos.BAN_DssBanco,
                AgenciasBancos.AGB_NuiOficialAgencia,
                AgenciasBancos.AGB_CosAgenciaDigito,
                Bancos_2.BAN_NuiOficialBanco AS BAN_NuiOficialBanco_2,
                Bancos_2.BAN_DssBanco AS BAN_DssBanco_2,
                AgenciasBancos_2.AGB_NuiOficialAgencia AS AGB_NuiOficialAgencia_2,
                AgenciasBancos_2.AGB_CosAgenciaDigito AS AGB_CosAgenciaDigito_2,
                CP.CON_CdiContratado,
                ContratadosExtras.COE_NusCNPJ,
                ContratadosExtras.COE_DssRazaoSocial,
                Vinculos.VIN_CdiTipoContratado,
                CP.CON_NusCICNumero,
                Empresas_2.EMP_NusCNPJPrefixo AS EMP_NusCNPJPrefixo_2,
                Locais_2.LOC_NusCNPJSufixo AS LOC_NusCNPJSufixo_2,
                MeiosPagamentos.MPG_CdiTipoPagamento,
                MeiosPagamentosProcessos.MPP_CosTipoPagamento,
                MeiosPagamentos.MPG_CosTipoServicoMM,
                ContratadosRC.CRC_VlnVerba

FROM Contratados Contratados
      INNER JOIN ContratadosRC ContratadosRC ON (      (Contratados.CON_CdiContratado = ContratadosRC.CRC_CdiContratado)      )
      inner join ConPensionistas            on (CPS_CdiConPensionista          = CRC_CdiConPensionista)
      inner join Contratados CP             on (CPS_CdiContratado_Pen          = CP.CON_CdiContratado)
      --INNER JOIN UsuariosFolhas UsuariosFolhas ON (      (Contratados.CON_CdiFolha = UsuariosFolhas.UFC_CdiFolha)      )
      INNER JOIN MeiosPagamentos MeiosPagamentos ON (      (CP.CON_CdiMeioPagamento = MeiosPagamentos.MPG_CdiMeioPagamento)      )
      INNER JOIN Folhas Folhas ON (      (MeiosPagamentos.MPG_CdiFolha_Centralizacao = Folhas.FOL_CdiFolha)      )
      INNER JOIN Locais Locais ON (      (Folhas.FOL_CdiLocal = Locais.LOC_CdiLocal)      )
      INNER JOIN Empresas Empresas ON (      (Locais.LOC_CdiEmpresa = Empresas.EMP_CdiEmpresa)      )
      INNER JOIN AgenciasBancos AgenciasBancos ON (      (MeiosPagamentos.MPG_CdiAgenciaBanco_Deb = AgenciasBancos.AGB_CdiAgenciaBanco)      )
      INNER JOIN Bancos Bancos ON (      (AgenciasBancos.AGB_CdiBanco = Bancos.BAN_CdiBanco)      )
      INNER JOIN AgenciasBancos AgenciasBancos_2 ON (      (CP.CON_CdiAgenciaBanco_Credito = AgenciasBancos_2.AGB_CdiAgenciaBanco)      )
      INNER JOIN Bancos Bancos_2 ON (      (AgenciasBancos_2.AGB_CdiBanco = Bancos_2.BAN_CdiBanco)      )
      INNER JOIN TiposEnderecos TiposEnderecos ON (      (CP.CON_CdiTipoEndereco = TiposEnderecos.TEN_CdiTipoEndereco)      )
      INNER JOIN Estados Estados ON (      (CP.CON_CdiEstado_Resid = Estados.EST_CdiEstado)      )
      INNER JOIN ContratadosExtras ContratadosExtras ON (      (CP.CON_CdiContratado = ContratadosExtras.COE_CdiContratado)      )
      INNER JOIN Vinculos Vinculos ON (      (CP.CON_CdiVinculo = Vinculos.VIN_CdiVinculo)      )
      INNER JOIN Folhas Folhas_2 ON (      (CP.CON_CdiFolha = Folhas_2.FOL_CdiFolha)      )
      INNER JOIN Locais Locais_2 ON (      (Folhas_2.FOL_CdiLocal = Locais_2.LOC_CdiLocal)      )
      INNER JOIN Empresas Empresas_2 ON (      (Locais_2.LOC_CdiEmpresa = Empresas_2.EMP_CdiEmpresa)      )
      LEFT  JOIN MeiosPagamentosProcessos MeiosPagamentosProcessos ON ( (MeiosPagamentos.MPG_CdiMeioPagamento = MeiosPagamentosProcessos.MPP_CdiMeioPagamento)
                                                                   AND   (MeiosPagamentosProcessos.MPP_CdiProcessoLPC = 71) )

WHERE ( ContratadosRC.CRC_CdiVerba = 601 )
       AND ( ContratadosRC.CRC_VlnVerba > 0 )
       --AND ( UsuariosFolhas.UFC_OplCorrente = 1 )
       AND ( ContratadosRC.CRC_CdiProcessoLPC = 71 )
       AND ( ContratadosRC.CRC_CdiLogTransacao IN (34834960) )
       --AND ( UsuariosFolhas.UFC_CdiUsuario = UsuarioId )
       AND ( MeiosPagamentos.MPG_CosVersaoLayOutMM = '2' )
       AND ( 0 <= 25 )
/*AUTOEMPLOYEEFILTER=Contratados*/

ORDER BY
         MeiosPagamentos.MPG_CosIdentEmpresaBanco,
         Empresas.EMP_NusCNPJPrefixo,
         Locais.LOC_NusCNPJSufixo,
         Bancos_2.BAN_NuiOficialBanco,
         AgenciasBancos_2.AGB_NuiOficialAgencia,
         CP.CON_CdiContratado