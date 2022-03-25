SELECT count(*)
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, NULL) indexstats
INNER JOIN sys.indexes ind ON ind.object_id = indexstats.object_id
AND ind.index_id = indexstats.index_id
WHERE
indexstats.avg_fragmentation_in_percent > 20
and page_count > 64
AND ind.Name is not null