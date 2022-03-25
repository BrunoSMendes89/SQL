SELECT USC_CdiUsuario as 'Id Usuario', USC_CdiContratado_Usuario as 'Id Contratado', CON_DssNome as 'Nome', MPR_CdiMensagem, MPR_CdiUsuario_Para, MPR_CdiUsuario_Substituto, MPR_OplEMailEnviado, MPR_DssEMailErro
FROM MensagensPara
INNER JOIN UsuariosContratados ON (MPR_CdiUsuario_Para = USC_CdiUsuario)
INNER JOIN Contratados ON (USC_CdiContratado_Usuario = CON_CdiContratado)
WHERE MPR_CdiMensagem = 4051410 MPR_OplEMailEnviado = 0