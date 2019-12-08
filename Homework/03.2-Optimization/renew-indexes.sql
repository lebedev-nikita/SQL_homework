-- DROP INDEX IF EXISTS user_age_index;
-- CREATE INDEX user_age_index ON online_order (user_age);

DROP INDEX IF EXISTS hash_index;
CREATE INDEX hash_index ON online_order USING HASH (user_city);

DROP INDEX IF EXISTS tree_index;
CREATE INDEX tree_index ON online_order (user_city);


CREATE INDEX id_tree_index ON online_order (order_id);
-- DROP INDEX IF EXISTS somename;
-- CREATE INDEX somename ON ds_review USING GIN (to_tsvector('russian', advantages));