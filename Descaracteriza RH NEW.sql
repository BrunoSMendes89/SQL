DROP INDEX [DEP_I03] ON [dbo].[ConDependentes]
GO
Update ConDependentes set
DEP_DssNome = 'Dependente ' + Cast( DEP_CdiConDependente as varchar(10) ),
DEP_DssNomeMidle = '',
DEP_DssNomeFirst = 'Depend ' + Cast( DEP_CdiConDependente as varchar(8) ),
DEP_DssNomePai = 'Pai',
DEP_DssNomeMae = 'Mae',
DEP_DssNomeCompleto = 'Completo',
DEP_CosNumeroRg = '',
DEP_CosOrgaoRg = '',
DEP_CdiEstado_OrgaoRg = 0,
DEP_DtdEmissaoRg = null,
DEP_DtdValidadeRg = null
CREATE NONCLUSTERED INDEX [DEP_I03] ON [dbo].[ConDependentes]
(
	[DEP_CdiTipoDependenteeSocial] ASC,
	[DEP_DssNomeCompleto] ASC,
	[DEP_DtdNascimentoData] ASC,
	[DEP_CdiContratado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

Update Contratados set
CON_DssNome = 'Contratado ' + Cast( CON_CdiContratado as varchar(10) ),
CON_DssNomeMidle = '',
CON_DssNomeFirst = 'Con ' + Cast( CON_CdiContratado as varchar(8) ),
CON_DssNomePai = 'Pai',
CON_DssNomeMae = 'Mae',
CON_DssApelido = 'Con ' + Cast( CON_CdiContratado as varchar(10) ),
CON_DssNomeCompleto = 'Contratado ' + Cast( CON_CdiContratado as varchar(10) ),
CON_CosEmailPessoal = '',
CON_CosEMail = '',
CON_CosPagamentoConta = '9999',
CON_CosNumeroRg = '9999',
CON_CosOrgaoRg = '0',
CON_DtdEmissaoRg = null,
CON_DtdValidadeRg = null,
CON_CdiAgenciaBanco_Credito = '9999',
CON_CosContaFGTS = '99999',
CON_CosReservista = '9999999',
CON_DssNomeLastFather = 'aaaaaaaaaaaa',
CON_DssNomeLastMother = 'bbbbbbbbbbbbbb',
CON_NusNumeroCarProf = '99999',
CON_NusNumeroTitEleitor = '9999',
CON_VlnRemuneracao = '9999',
CON_VlnSalario = '9999',
CON_VrnRemuneracao = '99999',
CON_VrnSalario = '99999'

update ConGradesCargosSalarios
Set CGC_VlnSalario = '9999'


Update VagasGradesCargosSalarios
set VGS_VlnSalario = '9999'

/****** Object:  Table [dbo].[contratados_200309_DELETAR]    Script Date: 15/12/2015 10:55:40 ******/
DROP TABLE [dbo].[contratados_200309_DELETAR]
GO


