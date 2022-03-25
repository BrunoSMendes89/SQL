select
         CON_CdiContratado                                               as 'FUNC_ID_MATRICULA',
        CON_DssNomeCompleto                                             as 'FUNC_NOME',
        ---cast(replace(replace(CON_NusCICNumero,'.',''),'-','') as varchar(15)) as 'FUNC_CPF',
        CON_CdiHierarquia, HIE_CosEstrutura, HIE_D1sHierarquia,

        (Select Top 1 Contratados_2.CON_CdiHierarquia
         From Contratados Contratados_1
         Inner Join Hierarquias Hierarquias   ON (Contratados_1.CON_CdiHierarquia = Hierarquias.HIE_CdiHierarquia)
         Inner Join Hierarquias Hierarquias_2 ON ((Hierarquias.HIE_CosEstrutura) Like (Hierarquias_2.HIE_CosEstrutura) + '%')
         Inner Join Contratados Contratados_2 ON (Contratados_2.CON_CdiHierarquia = Hierarquias_2.HIE_CdiHierarquia And (Contratados_2.CON_CdiSituacao NOT IN (0, 2, 3, 99)))
         Where (Len(Hierarquias.HIE_CosEstrutura) > Len(Hierarquias_2.HIE_CosEstrutura))
         And Contratados_1.CON_CdiSituacao NOT IN (0, 99)
         And Hierarquias.HIE_CdiHierarquia > 0
         And Hierarquias_2.HIE_CdiHierarquia > 0
         And ( Select Max(len(HIE.HIE_CosEstrutura))
                 From Hierarquias HIE
                 Inner Join Contratados Contratados_3 ON (Contratados_3.CON_CdiHierarquia = HIE.HIE_CdiHIerarquia)
                 Inner Join ConSituacoes              ON (Contratados_3.CON_CdiContratado = CST_CdiContratado)
                 Where (Hierarquias.HIE_CosEstrutura) like (HIE.HIE_CosEstrutura) + '%'
                   And (
                          ( Getdate() Between CST_DtdSituacaoInicio And CST_DtdSituacaoFim )
                         OR
                           ( Getdate() >= CST_DtdSituacaoInicio And CST_DtdSituacaoFim IS NULL)
                       )
                   And CST_CdiSituacao = 1
                   And Len(Hierarquias.HIE_CosEstrutura) > Len(HIE.HIE_CosEstrutura)
                   And (Contratados_3.CON_CdiSituacao = 1) ) = Len(Hierarquias_2.HIE_CosEstrutura
               )
         AND Contratados_1.Con_CdiContratado = Contratados.Con_CdiContratado) AS 'FUNC_ID_HIERARQUIA_GESTOR',

        (Select Top 1 Hierarquias_2.HIE_CosEstrutura
         From Contratados Contratados_1
         Inner Join Hierarquias Hierarquias   ON (Contratados_1.CON_CdiHierarquia = Hierarquias.HIE_CdiHierarquia)
         Inner Join Hierarquias Hierarquias_2 ON ((Hierarquias.HIE_CosEstrutura) Like (Hierarquias_2.HIE_CosEstrutura) + '%')
         Inner Join Contratados Contratados_2 ON (Contratados_2.CON_CdiHierarquia = Hierarquias_2.HIE_CdiHierarquia And (Contratados_2.CON_CdiSituacao NOT IN (0, 2, 3, 99)))
         Where (Len(Hierarquias.HIE_CosEstrutura) > Len(Hierarquias_2.HIE_CosEstrutura))
         And Contratados_1.CON_CdiSituacao NOT IN (0, 99)
         And Hierarquias.HIE_CdiHierarquia > 0
         And Hierarquias_2.HIE_CdiHierarquia > 0
         And ( Select Max(len(HIE.HIE_CosEstrutura))
                 From Hierarquias HIE
                 Inner Join Contratados Contratados_3 ON (Contratados_3.CON_CdiHierarquia = HIE.HIE_CdiHIerarquia)
                 Inner Join ConSituacoes              ON (Contratados_3.CON_CdiContratado = CST_CdiContratado)
                 Where (Hierarquias.HIE_CosEstrutura) like (HIE.HIE_CosEstrutura) + '%'
                   And (
                          ( Getdate() Between CST_DtdSituacaoInicio And CST_DtdSituacaoFim )
                         OR
                           ( Getdate() >= CST_DtdSituacaoInicio And CST_DtdSituacaoFim IS NULL)
                       )
                   And CST_CdiSituacao = 1
                   And Len(Hierarquias.HIE_CosEstrutura) > Len(HIE.HIE_CosEstrutura)
                   And (Contratados_3.CON_CdiSituacao = 1) ) = Len(Hierarquias_2.HIE_CosEstrutura
               )
         AND Contratados_1.Con_CdiContratado = Contratados.Con_CdiContratado) AS 'FUNC_HIERARQUIA_GESTOR',


           (Select Top 1 Contratados_2.CON_CdiContratado
         From Contratados Contratados_1
         Inner Join Hierarquias Hierarquias   ON (Contratados_1.CON_CdiHierarquia = Hierarquias.HIE_CdiHierarquia)
         Inner Join Hierarquias Hierarquias_2 ON ((Hierarquias.HIE_CosEstrutura) Like (Hierarquias_2.HIE_CosEstrutura) + '%')
         Inner Join Contratados Contratados_2 ON (Contratados_2.CON_CdiHierarquia = Hierarquias_2.HIE_CdiHierarquia And (Contratados_2.CON_CdiSituacao NOT IN (0, 2, 3, 99)))
         Where (Len(Hierarquias.HIE_CosEstrutura) > Len(Hierarquias_2.HIE_CosEstrutura))
         And Contratados_1.CON_CdiSituacao NOT IN (0, 99)
         And Hierarquias.HIE_CdiHierarquia > 0
         And Hierarquias_2.HIE_CdiHierarquia > 0
         And ( Select Max(len(HIE.HIE_CosEstrutura))
                 From Hierarquias HIE
                 Inner Join Contratados Contratados_3 ON (Contratados_3.CON_CdiHierarquia = HIE.HIE_CdiHIerarquia)
                 Inner Join ConSituacoes              ON (Contratados_3.CON_CdiContratado = CST_CdiContratado)
                 Where (Hierarquias.HIE_CosEstrutura) like (HIE.HIE_CosEstrutura) + '%'
                   And (
                          ( Getdate() Between CST_DtdSituacaoInicio And CST_DtdSituacaoFim )
                         OR
                           ( Getdate() >= CST_DtdSituacaoInicio And CST_DtdSituacaoFim IS NULL)
                       )
                   And CST_CdiSituacao = 1
                   And Len(Hierarquias.HIE_CosEstrutura) > Len(HIE.HIE_CosEstrutura)
                   And (Contratados_3.CON_CdiSituacao = 1) ) = Len(Hierarquias_2.HIE_CosEstrutura
               )
         AND Contratados_1.Con_CdiContratado = Contratados.Con_CdiContratado) AS 'FUNC_MATRICULA_GESTOR_IMEDIATO',

         (Select Top 1 Contratados_2.CON_DssNomeCompleto
         From Contratados Contratados_1
         Inner Join Hierarquias Hierarquias   ON (Contratados_1.CON_CdiHierarquia = Hierarquias.HIE_CdiHierarquia)
         Inner Join Hierarquias Hierarquias_2 ON ((Hierarquias.HIE_CosEstrutura) Like (Hierarquias_2.HIE_CosEstrutura) + '%')
         Inner Join Contratados Contratados_2 ON (Contratados_2.CON_CdiHierarquia = Hierarquias_2.HIE_CdiHierarquia And (Contratados_2.CON_CdiSituacao NOT IN (0, 2, 3, 99)))
         Where (Len(Hierarquias.HIE_CosEstrutura) > Len(Hierarquias_2.HIE_CosEstrutura))
         And Contratados_1.CON_CdiSituacao NOT IN (0, 99)
         And Hierarquias.HIE_CdiHierarquia > 0
         And Hierarquias_2.HIE_CdiHierarquia > 0
         And ( Select Max(len(HIE.HIE_CosEstrutura))
                 From Hierarquias HIE
                 Inner Join Contratados Contratados_3 ON (Contratados_3.CON_CdiHierarquia = HIE.HIE_CdiHIerarquia)
                 Inner Join ConSituacoes              ON (Contratados_3.CON_CdiContratado = CST_CdiContratado)
                 Where (Hierarquias.HIE_CosEstrutura) like (HIE.HIE_CosEstrutura) + '%'
                   And (
                          ( Getdate() Between CST_DtdSituacaoInicio And CST_DtdSituacaoFim )
                         OR
                           ( Getdate() >= CST_DtdSituacaoInicio And CST_DtdSituacaoFim IS NULL)
                       )
                   And CST_CdiSituacao = 1
                   And Len(Hierarquias.HIE_CosEstrutura) > Len(HIE.HIE_CosEstrutura)
                   And (Contratados_3.CON_CdiSituacao = 1) ) = Len(Hierarquias_2.HIE_CosEstrutura
               )
         AND Contratados_1.Con_CdiContratado = Contratados.Con_CdiContratado) AS 'FUNC_GESTOR_IMEDIATO'



   from contratados
   inner join contratadosextras on CON_CdiContratado = COE_CdiContratado
   inner join hierarquias                                    on CON_CdiHierarquia = HIE_CdiHierarquia
   inner join Folhas                                         on CON_CdiFolha = FOL_CdiFolha
   inner join Locais                                         on FOL_CdiLocal = LOC_CdiLocal
   inner join Cargos Cargos1                                 on Cargos1.CAR_CdiCargo = CON_CdiCargo
   inner join Empresas                                       on EMP_CdiEmpresa = LOC_CdiEmpresa
                  and EMP_OplDesativada = 0 -- and  EMP_CdiEmpresa != 99
   inner join CentrosCustos                                  on CCU_CdiCentroCusto = CON_CdiCentroCusto
   inner join Consituacoes Consituacoes              on (Contratados.Con_CdiContratado = Consituacoes.CST_CdiContratado)
   inner join Situacoes                                      on (Consituacoes.CST_CdiSituacao = Situacoes.SIT_CdiSituacao)

        Where Consituacoes.CST_CdiSituacao not in(0,2,3,99)
          ---and CON_CdiContratado in (1040308, 1032889,37505,1034591)
          and CON_CdiFolha    > 0
          and (CON_DtdRescisao is null or CON_DtdRescisao >= dateadd(month,-6,getdate()))

  And    CST_DtdSituacaoInicio =
(select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
  where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
    and x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))