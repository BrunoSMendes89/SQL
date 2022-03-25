select
CrachasExtras.CEX_CosCrachaBase as 'CRACHA',
CON_DssNomeCompleto                                             as 'FUNC_NOME',
cast(replace(replace(CON_NusCICNumero,'.',''),'-','') as varchar(15)) as 'FUNC_CPF',
CON_DtdAdmissao as 'DATA_ADMISSAO',
CON_DtdNascimentoData as 'DATA_NASCIMENTO',
SIT_D1sSituacao,
Consituacoes.CST_DtdSituacaoInicio AS 'FIM_FERIAS',
Consituacoes.CST_DtdSituacaoFim AS 'INICIO_FERIAS',
COF_DssConteudoFlexivel_04 as 'RAMAL',
CON_DssApelido as 'LOGIN_AD'

from contratados
inner join contratadosextras                                                        on CON_CdiContratado = COE_CdiContratado
inner join CrachasExtras                                                                on COE_CdiCrachaExtra = CEX_CdiCrachaExtra
inner join ContratadosFlexiveis                                                        on CON_CdiContratado = COF_CdiContratado
inner join Folhas                                         on CON_CdiFolha = FOL_CdiFolha
inner join Locais                                         on FOL_CdiLocal = LOC_CdiLocal
inner join Cargos Cargos1                                 on Cargos1.CAR_CdiCargo = CON_CdiCargo
inner join Empresas                                       on EMP_CdiEmpresa = LOC_CdiEmpresa
and EMP_OplDesativada = 0 -- and  EMP_CdiEmpresa != 99
inner join CentrosCustos                                  on CCU_CdiCentroCusto = CON_CdiCentroCusto
inner join TiposCentrosCustos                                                        on (CCU_CdiTipoCentroCusto = TCU_CdiTipoCentroCusto)
inner join Consituacoes Consituacoes              on (Contratados.Con_CdiContratado = Consituacoes.CST_CdiContratado)
inner join Situacoes                                      on (Consituacoes.CST_CdiSituacao = Situacoes.SIT_CdiSituacao)

Where Consituacoes.CST_CdiSituacao in(9)
AND (Consituacoes.CST_DtdSituacaoInicio between '20200301' and '20200313'
     or Consituacoes.CST_DtdSituacaoFim between '20200301' and '20200313')
and CON_CdiCargo NOT IN (513, 1044)
and CON_CdiFolha    > 0
and (CON_DtdRescisao is null or CON_DtdRescisao >= dateadd(month,-6,getdate()))
