/*DESFAZER TRANSFERÊNCIAS*/

SELECT CON_CdiContratado, CON_DssNome, CON_OpleSocialPendenteRescisao, CON_OpleSocialPendenteInclusao
FROM Contratados
WHERE CON_CdiContratado = 26094

UPDATE Contratados
SET CON_OpleSocialPendenteInclusao = 0
WHERE CON_CdiContratado = 26094

UPDATE ContratadosExtras
SET COE_CdiTipoInscricao_EmprOrig = 0,
COE_NusInscricaoEmpregOrigem = NULL,
COE_NusMatriculaEmpresaOrig = NULL,
COE_DtdTransferenciaEmpregador = NULL,
COE_CdiTipoInscricao_Sucessora = 0,
COE_NusInscricaoSucessora = 0
WHERE COE_CdiContratado = 26094

UPDATE Contratados
SET CON_CdiFolha = 201
WHERE CON_CdiContratado = 26094


UPDATE Vagas
SET VAG_CdiFolha = 201
WHERE VAG_CdiVaga = 4561
AND VAG_CdiContratado = 26094

============================================================================================================

1) Focar o contratado
2) Ir no Objeto 1137 - Transferências nos Contratados e excluir a transferência em questão
3) Ir no Objeto 1963 - Grades e excluir a grade da Transferência
4) Ir no Objeto 4924 - Grade na Vaga e excluir a Grade da Vaga
