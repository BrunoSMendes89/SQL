SELECT CON_CdiContratado, CON_DssNome, ConSexos.SEX_D1sSexo, SIT_D1sSituacao, LOC_D1sLocal, CAR_D1sCargo, LGP_D1sLigacaoPessoa, DEP_CdiConDependente,DEP_DssNome,
DepSexos.SEX_D1sSexo as 'Dep Sexo', FLOOR(DATEDIFF(DAY, DEP_DtdNascimentoData, GetDate()) / 365.25) as Idade
FROM Contratados
INNER JOIN Folhas ON (CON_CdiFolha = FOL_CdiFolha)
INNER JOIN Locais ON (FOL_CdiLocal = LOC_CdiLocal)
INNER JOIN Cargos ON (CON_CdiCargo = CAR_CdiCargo)
INNER JOIN ConDependentes ON (CON_CdiContratado = DEP_CdiContratado)
INNER JOIN LigacoesPessoas ON (DEP_CdiLigacaoPessoa = LGP_CdiLigacaoPessoa)
INNER JOIN Sexos ConSexos ON (CON_CdiSexo = ConSexos.SEX_CdiSexo)
INNER JOIN Sexos DepSexos ON (DEP_CdiSexo = DepSexos.SEX_CdiSexo)
INNER join Consituacoes Consituacoes ON (Contratados.Con_CdiContratado = Consituacoes.CST_CdiContratado)
INNER join Situacoes Situacoes ON (Consituacoes.CST_CdiSituacao = Situacoes.SIT_CdiSituacao)
WHERE CST_CdiSituacao not in (0,2,3,51,99)
--AND LOC_CdiLocal =
AND LGP_CdiLigacaoPessoa in (1,2,8)
 And    CST_DtdSituacaoInicio =
(select MAX(x.CST_DtdSituacaoInicio) from ConSituacoes x
  where ConSituacoes.CST_CdiContratado = x.CST_CdiContratado
    and x.CST_DtdSituacaoInicio <= Cast(Getdate() as date))
    ORDER BY 1