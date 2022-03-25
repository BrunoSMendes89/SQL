Select MEE_CdiLancamentoWF,
U_REM.USR_CdsUsuario +' / ' + C_REM.CON_DssNome "Remetente",
U_DES.USR_CdsUsuario +' / ' + C_DES.CON_DssNome "Destinarário",
U_SUB.USR_CdsUsuario+' / ' + C_SUB.CON_DssNome "Substituto",
MEE_CdiMensagem, MEE_DtdMensagem,
MEE_D1bMensagem,
MEE_D1sReferencia,
MPR_OplEmailEnviado,
LWF_CdiFormularioWF,
MPR_DssEMailErro
From Mensagens
Inner Join Usuarios U_REM ON (MEE_CdiUsuario_De = U_REM.USR_CdiUsuario)
Inner Join UsuariosContratados UC_REM ON (U_REM.USR_CdiUsuario = UC_REM.USC_CdiUsuario)
Inner Join Contratados C_REM ON (UC_REM.USC_CdiContratado_Usuario = C_REM.CON_CdiContratado)
Inner Join LancamentosWF ON (MEE_CdiLancamentoWF = LWF_CdiLancamentoWF)
Left Join MensagensPara ON (MEE_CdiMensagem = MPR_CdiMensagem)
Left Join Usuarios U_DES ON (MPR_CdiUsuario_Para = U_DES.USR_CdiUsuario)
Left Join UsuariosContratados UC_DES ON (U_DES.USR_CdiUsuario = UC_DES.USC_CdiUsuario)
Left Join Contratados C_DES ON (UC_DES.USC_CdiContratado_Usuario = C_DES.CON_CdiContratado)
Left Join Usuarios U_SUB ON (MPR_CdiUsuario_Substituto = U_SUB.USR_CdiUsuario)
Left Join UsuariosContratados UC_SUB ON (U_SUB.USR_CdiUsuario = UC_SUB.USC_CdiUsuario)
Left Join Contratados C_SUB ON (UC_SUB.USC_CdiContratado_Usuario = C_SUB.CON_CdiContratado)
Where MEE_CdiLancamentoWF in (104758,104736, 104739, 104741, 104744)
Order By 1,MEE_CdiMensagem