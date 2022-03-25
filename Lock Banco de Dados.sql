SELECT r.session_id,
  se.host_name,
  se.login_name,
  Db_name(r.database_id) AS dbname,
  r.status,
  r.command,
  r.cpu_time,
  r.blocking_session_id AS BlkBy,
  r.open_transaction_count AS NoOfOpenTran,
  r.wait_type,
  CAST(ROUND((r.granted_query_memory / 128.0)  / 1024,2) AS NUMERIC(10,2))AS granted_memory_GB,
  object_name = OBJECT_SCHEMA_NAME(s.objectid,s.dbid) + '.' + OBJECT_NAME(s.objectid, s.dbid),
  program_name = CASE LEFT(se.program_name, 29)
                    WHEN 'SQLAgent - TSQL JobStep (Job '
                        THEN 'SQLAgent Job: ' + (SELECT name FROM msdb..sysjobs sj WHERE substring(se.program_name,32,32)=(substring(sys.fn_varbintohexstr(sj.job_id),3,100))) + ' - ' + SUBSTRING(se.program_name, 67, len(se.program_name)-67)
                    ELSE se.program_name
                    END,
  p.query_plan AS query_plan,
  sql_text       =
SUBSTRING
(
s.text,
r.statement_start_offset/2,
(CASE WHEN r.statement_end_offset = -1
THEN LEN(CONVERT(nvarchar(MAX), s.text)) * 2
ELSE r.statement_end_offset
END - r.statement_start_offset)/2
),
start_time, percent_complete,
CAST(((DATEDIFF(s,start_time,GetDate()))/3600) as varchar) + ' hour(s), '
+ CAST((DATEDIFF(s,start_time,GetDate())%3600)/60 as varchar) + 'min, '
+ CAST((DATEDIFF(s,start_time,GetDate())%60) as varchar) + ' sec' as running_time,
CAST((estimated_completion_time/3600000) as varchar) + ' hour(s), '
+ CAST((estimated_completion_time %3600000)/60000 as varchar) + 'min, '
+ CAST((estimated_completion_time %60000)/1000 as varchar) + ' sec' as est_time_to_go,
dateadd(second,estimated_completion_time/1000, getdate()) as est_completion_time
FROM   sys.dm_exec_requests r WITH (NOLOCK)
  INNER JOIN sys.dm_exec_sessions se WITH (NOLOCK)
ON r.session_id = se.session_id
  OUTER APPLY sys.dm_exec_sql_text(r.sql_handle) s
  OUTER APPLY sys.dm_exec_query_plan(r.plan_handle) p
--WHERE  r.session_id = 216
  where se.is_user_process = 1
 --and  Db_name(r.database_id) = 'RH_PRD'
order by cpu_time desc