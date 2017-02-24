DROP TEMPORARY TABLE IF EXISTS tmp_query;
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_query AS SELECT
                                                         d.id    AS kid
                                                       , f.name
                                                       , d.value AS val
                                                    FROM tables t
                                                       , fields f
                                                       , data d
                                                   WHERE f.table_id = t.id
                                                     AND d.field_id = f.id
                                                     AND t.name     = 'cities'
                                                ORDER BY d.id, f.id;
SELECT GROUP_CONCAT(
  DISTINCT
  CONCAT('MAX(IF(name = ''', name, ''', val, NULL)) AS ''', name, '''')
)
INTO @query
FROM tmp_query;
SET @query = CONCAT('SELECT ', @query, ' FROM tmp_query GROUP BY kid;');
PREPARE stmt FROM @query;
EXECUTE stmt;
