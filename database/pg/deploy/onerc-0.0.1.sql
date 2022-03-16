-- Deploy onercpg:onerc-0.0.1 to pg

BEGIN;

CREATE TABLE users (
	id serial NOT NULL,
	username varchar(100) NOT NULL,
	"password" varchar(100) NULL,
	email varchar(100) NULL,
	phone varchar(100) NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE codesnippets (
	id serial NOT NULL,
	code varchar(65535) NOT NULL,
	user_id int4 NOT NULL,
	CONSTRAINT codesnippets_pkey PRIMARY KEY (id)
);
CREATE INDEX user_id_hash_index ON public.codesnippets USING hash (user_id);

COMMIT;
