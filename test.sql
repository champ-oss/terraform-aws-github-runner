SET SESSION group_concat_max_len = 1000000;

SET @sql = NULL;
SET @dbname = DATABASE();

SELECT
    GROUP_CONCAT(
            CONCAT (
                    'SELECT ''',table_name,''' as TableName, COUNT(*) as RowCount FROM ',
                    table_name, ' '
                )
                SEPARATOR 'UNION '
        ) AS Qry
FROM
    information_schema.`TABLES` AS t
WHERE
        t.TABLE_SCHEMA = @dbname AND
        t.TABLE_TYPE = "BASE TABLE"
ORDER BY
    t.TABLE_NAME ASC

    INTO @sql
;

PREPARE stmt FROM @sql;

EXECUTE stmt;
