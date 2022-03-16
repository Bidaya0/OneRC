-- Verify onercpg:onerc-0.0.1 on pg

BEGIN;

SELECT 1/COUNT(*) FROM  information_schema.tables WHERE table_name = 'users'; 
SELECT 1/COUNT(*) FROM  information_schema.tables WHERE table_name = 'codesnippets'; 
SELECT 1/COUNT(*) FROM pg_indexes
WHERE indexname = 'user_id_hash_index';

ROLLBACK;
