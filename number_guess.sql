--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    name character varying(22) NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (56, 'user_1676968304149', 11);
INSERT INTO public.games VALUES (57, 'user_1676968304149', 11);
INSERT INTO public.games VALUES (58, 'user_1676968304148', 11);
INSERT INTO public.games VALUES (59, 'user_1676968304148', 11);
INSERT INTO public.games VALUES (60, 'user_1676968304149', 13);
INSERT INTO public.games VALUES (61, 'user_1676968304149', 11);
INSERT INTO public.games VALUES (62, 'user_1676968304149', 11);
INSERT INTO public.games VALUES (63, 'user_1676968418997', 673);
INSERT INTO public.games VALUES (64, 'user_1676968418997', 990);
INSERT INTO public.games VALUES (65, 'user_1676968418996', 740);
INSERT INTO public.games VALUES (66, 'user_1676968418996', 452);
INSERT INTO public.games VALUES (67, 'user_1676968418997', 91);
INSERT INTO public.games VALUES (68, 'user_1676968418997', 977);
INSERT INTO public.games VALUES (69, 'user_1676968418997', 677);
INSERT INTO public.games VALUES (70, 'user_1676968437044', 258);
INSERT INTO public.games VALUES (71, 'user_1676968437044', 870);
INSERT INTO public.games VALUES (72, 'user_1676968437043', 981);
INSERT INTO public.games VALUES (73, 'user_1676968437043', 726);
INSERT INTO public.games VALUES (74, 'user_1676968437044', 942);
INSERT INTO public.games VALUES (75, 'user_1676968437044', 462);
INSERT INTO public.games VALUES (76, 'user_1676968437044', 891);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 76, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--


