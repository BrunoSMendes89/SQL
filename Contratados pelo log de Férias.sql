 select distinct con_cdicontratado , con_dssnome
 from contratados, ContratadosRC
 WHERE  con_cdicontratado = CRC_CdiContratado
 and Exists( Select aa.CON_CdiContratado from Contratados aa, Folhas fo1, Locais lo1, Empresas em1, GruposEmpresas gem1
              where ( (1 = 1) /* Filtro de Acesso aa.CON_CdiFolha */
              and  ( aa.CON_CdiSituacao <> 99
              and ( aa.CON_CdiSituacao <> 2
              or aa.CON_DtdRescisao >= ( select AVQ_DtdLimiteInativos from DefSisConfiguracoesGerais where AVQ_CdiSistema=1 ) )  ) )
              and fo1.FOL_CdiFolha = aa.CON_CdiFolha
              and lo1.LOC_CdiLocal = fo1.FOL_CdiLocal
              and em1.EMP_CdiEmpresa = lo1.LOC_CdiEmpresa
              and gem1.GEM_CdiGrupoEmpresa = em1.EMP_CdiGrupoEmpresa
              and (1 = 1) /* Filtro de Acesso gem1.GEM_CdiPais */
              AND gem1.GEM_CdiPais = /* begin_bind GEM_CdiPais */ 1 /* end_bind */
              and aa.CON_CdiContratado = Contratados.CON_CdiContratado )
              and CRC_CdiLogTransacao = 32548523
              AND CRC_CdiStatusCalculo in (1, 2)
 ORDER BY con_dssnome