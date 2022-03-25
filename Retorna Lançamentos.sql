UPDATE LancamentosWF
SET LWF_OplFinalizado = 0
WHERE LWF_CdiLancamentoWF in ( 104742)

insert into pendenciaswftransacoesusus (PFU_CdiLancamentoWF,PFU_CdiTransacaoWF_Proxima,PFU_CdiUsuario) values (103426,1000244, 30105);
insert into pendenciaswftransacoesusus (PFU_CdiLancamentoWF,PFU_CdiTransacaoWF_Proxima,PFU_CdiUsuario) values (105824,1000244, 30105);
insert into pendenciaswftransacoesusus (PFU_CdiLancamentoWF,PFU_CdiTransacaoWF_Proxima,PFU_CdiUsuario) values (104785,1000244, 30105);
insert into pendenciaswftransacoesusus (PFU_CdiLancamentoWF,PFU_CdiTransacaoWF_Proxima,PFU_CdiUsuario) values (105045,1000244, 30105);

insert into pendenciaswftransacoes (PFT_CdiLancamentoWF,PFT_CdiTransacaoWF_Proxima,PFT_DtdLimite) values (103426, 1000244,'20211130');
insert into pendenciaswftransacoes (PFT_CdiLancamentoWF,PFT_CdiTransacaoWF_Proxima,PFT_DtdLimite) values (105824, 1000244,'20211130');
insert into pendenciaswftransacoes (PFT_CdiLancamentoWF,PFT_CdiTransacaoWF_Proxima,PFT_DtdLimite) values (104785, 1000244,'20211130');
insert into pendenciaswftransacoes (PFT_CdiLancamentoWF,PFT_CdiTransacaoWF_Proxima,PFT_DtdLimite) values (105045, 1000244,'20211130');

insert into pendenciaswf (PFF_CdiLancamentoWF,PFF_DssReferencia,PFF_CdiUsuario) values (103426,'',30105);
insert into pendenciaswf (PFF_CdiLancamentoWF,PFF_DssReferencia,PFF_CdiUsuario) values (105824,'',30105);
insert into pendenciaswf (PFF_CdiLancamentoWF,PFF_DssReferencia,PFF_CdiUsuario) values (104785,'',30105);
insert into pendenciaswf (PFF_CdiLancamentoWF,PFF_DssReferencia,PFF_CdiUsuario) values (105045,'',30105);
