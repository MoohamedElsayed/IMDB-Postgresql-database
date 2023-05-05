
BEGIN;


CREATE TABLE IF NOT EXISTS public.actors
(
    actor_id int NOT NULL,
    name varchar COLLATE pg_catalog."default" NOT NULL,
    last_updated varchar ,
    CONSTRAINT actors_pkey PRIMARY KEY (actor_id)
);

CREATE TABLE IF NOT EXISTS public.content_actors
(
    actor_id int NOT NULL,
    content_id int NOT NULL,
    last_updated varchar
);

CREATE TABLE IF NOT EXISTS public.content_directors
(
    director_id int NOT NULL,
    content_id int NOT NULL,
    last_updated varchar
);

CREATE TABLE IF NOT EXISTS public.content_genres
(
    genre_id int NOT NULL,
    content_id int NOT NULL,
    last_updated varchar
);

CREATE TABLE IF NOT EXISTS public.contents
(
    content_id int NOT NULL,
    title varchar COLLATE pg_catalog."default",
    description TEXT COLLATE pg_catalog."default",
    total_seasons int,
    imdb_score decimal,
    release_dates varchar COLLATE pg_catalog."default",
    play_time varchar,
    content_rating int,
    total_episodes int,
    content_type int,
    imdb_link varchar COLLATE pg_catalog."default",
    last_updated varchar,
    imdb_score_votes int,
    rating_details varchar,
    languages varchar COLLATE pg_catalog."default",

    CONSTRAINT contents_pkey PRIMARY KEY (content_id)
);

CREATE TABLE IF NOT EXISTS public.directors
(
    director_id int NOT NULL,
    name varchar COLLATE pg_catalog."default" NOT NULL,
    last_updated varchar,
    CONSTRAINT directors_pkey PRIMARY KEY (director_id)
);

CREATE TABLE IF NOT EXISTS public.episode_list
(
    episode_id int NOT NULL,
    season_num int,
    episode_name varchar COLLATE pg_catalog."default",
    content_id int,
    release_date varchar COLLATE pg_catalog."default",
    episode_rating decimal,
    episode_num int,
    description TEXT COLLATE pg_catalog."default",
    last_updated varchar,
    episode_imdb_link varchar COLLATE pg_catalog."default",
    episode_score_votes int,
    CONSTRAINT episode_list_pkey PRIMARY KEY (episode_id)
);

CREATE TABLE IF NOT EXISTS public.languages
(
    language_id int NOT NULL,
    name varchar COLLATE pg_catalog."default" NOT NULL,
    last_updated varchar,
    CONSTRAINT languages_pkey PRIMARY KEY (language_id)
);

ALTER TABLE IF EXISTS public.content_actors
    ADD CONSTRAINT content_actors_actor_id_fkey FOREIGN KEY (actor_id)
    REFERENCES public.actors (actor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.content_actors
    ADD CONSTRAINT content_actors_content_id_fkey FOREIGN KEY (content_id)
    REFERENCES public.contents (content_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.content_directors
    ADD CONSTRAINT content_directors_content_id_fkey FOREIGN KEY (content_id)
    REFERENCES public.contents (content_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.content_directors
    ADD CONSTRAINT content_directors_director_id_fkey FOREIGN KEY (director_id)
    REFERENCES public.directors (director_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.content_genres
    ADD CONSTRAINT content_genres_content_id_fkey FOREIGN KEY (content_id)
    REFERENCES public.contents (content_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.episode_list
    ADD CONSTRAINT episode_list_content_id_fkey FOREIGN KEY (content_id)
    REFERENCES public.contents (content_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;