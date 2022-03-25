select
CST_CdiContratado, CON_DssNome, CST_DtdSituacaoInicio, CST_DtdSituacaoFim, CST_CdiSituacao, SIT_D1sSituacao
FROM ConSituacoes
INNER JOIN Contratados ON (CST_CdiContratado = CON_CdiContratado)
INNER JOIN Situacoes   ON (CST_CdiSituacao = SIT_CdiSituacao)
WHERE CONVERT(VARCHAR(10), getdate(), 111) >= CST_DtdSituacaoInicio
and CONVERT(VARCHAR(10), getdate(), 111) <= CST_DtdSituacaoFim or CST_DtdSituacaoFim is null
and CST_CdiSituacao not in (0,2,3,99)
             AND    CST_DtdSituacaoInicio =
              (select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
                where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
                 AND x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))