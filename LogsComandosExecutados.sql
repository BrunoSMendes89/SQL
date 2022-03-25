/*BANCO SQL*/
select ltr_cdilogtransacao,
       ltr_dtddatahoratransacaoinicio,
       ltr_cditransacao,
       ltr_cdiusuario,
       usr_cdsusuario,
       LTM_DssReferencia,
       LTM_DssOcorrencia,
       convert(varchar(8000), convert(varbinary(8000), LTM_DsbOcorrencia))
FROM LogsTransacoesMensagens,logstransacoes,usuarios
WHERE ltr_cdilogtransacao = LTM_CdiLogTransacao
and ltr_cdiusuario = usr_cdiusuario
and convert(varchar(8000), convert(varbinary(8000), LTM_DsbOcorrencia)) like '%VAG_CdiStatusVaga%'
and ltr_dtddatahoratransacaoinicio >= 'mm/dd/yyyy'
AND ltr_cditransacao = 39326
order by 1



/*BANCO SQL - COMANDOS FIXOS*/
select SQL_CdiComandoSQLGrupo,
       SQL_CdiComandoSQL,
       SQL_DsbComandoSQL
FROM ComandosSQLs
WHERE convert(varchar(8000), convert(varbinary(8000), SQL_DsbComandoSQL)) like '%ConBatidasReaisClassifsIts%'



/*BANCO ORACLE*/
select ltr_cdilogtransacao,
       ltr_dtddatahoratransacaoinicio,
       ltr_cditransacao,
       ltr_cdiusuario,
       usr_cdsusuario,
       LTM_DssReferencia,
       LTM_DssOcorrencia
FROM LogsTransacoesMensagens,logstransacoes,usuarios
WHERE ltr_cdilogtransacao = LTM_CdiLogTransacao
and ltr_cdiusuario = usr_cdiusuario
and dbms_lob.instr(LTM_DsbOcorrencia, utl_raw.CAST_TO_RAW('a'), 1, 1) > 0
and ltr_dtddatahoratransacaoinicio between To_Date('29/01/2015 16:05', 'dd/mm/rrrr hh24:mi:ss') and  To_Date('29/01/2015 16:27', 'dd/mm/rrrr hh24:mi:ss')
order by 1