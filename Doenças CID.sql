SELECT CON_CdiContratado, CON_DssNome, CST_CdiSituacao, SIT_D1sSituacao, CST_DtdSituacaoInicio, CST_DtdSituacaoFim, CID_D1sDoencaCID
FROM Contratados
INNER JOIN ConSituacoes ON (CON_CdiSituacao = CST_CdiSituacao)
INNER JOIN DoencasCID ON (CST_CdiDoencaCID_1 = CID_CdiDoencaCID)
INNER JOIN Situacoes ON (CST_CdiSituacao = SIT_CdiSituacao)
WHERE CST_CdiSituacao in (6,7,16,17,27,36)
And    CST_DtdSituacaoInicio =
      (select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
       where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
       and x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))
order by CST_DtdSituacaoInicio