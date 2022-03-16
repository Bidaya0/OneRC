-- Revert onercpg:onerc-0.0.1 from pg

BEGIN;

DROP INDEX user_id_hash_index;
DROP TABLE users;
DROP TABLE codesnippets;

COMMIT;
