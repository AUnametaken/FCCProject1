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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying,
    human_instrument_reached boolean DEFAULT false NOT NULL,
    description text
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    diameter_kiloparsec numeric(5,1),
    cluster_id integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    tidal_locked boolean,
    planet_id integer NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    human_habitable boolean,
    tidal_locked boolean,
    star_id integer NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    age_million_years integer,
    orbiting_human_population_millions integer,
    galaxy_id integer NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Local Group', true, 'The Milky Way resides here, so this is our home cluster. We still cannot quite unanimously figure out the difference between a group and a cluster.');
INSERT INTO public.cluster VALUES (2, 'Virgo Cluster', false, 'This cluster is the closest to the Local Group, and has a way cooler name. The superlative M87 is the center of this cluster. M86 is tired of hearing about it, but M88 maintains a healthy and justified fear of it considering recent events.');
INSERT INTO public.cluster VALUES (3, 'REDACTED', true, 'This is the farthest observed cluster from the Local Group. It has failed to realize that it can''t outrun the consequences of its past, and despite its efforts, the seed of a mistake made long ago yet germinates.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'REDACTED', NULL, 3, 'Dwarf rhomboidal galaxy');
INSERT INTO public.galaxy VALUES (2, 'Soggy Galaxy', 98.4, 2, NULL);
INSERT INTO public.galaxy VALUES (3, 'Lobster Galaxy', 23.3, 2, 'It is said that the Miranda Nebula constitutes its egg clutch, and the Nova Sardinia satellite galaxy is trapped in its right claw used for brawling.');
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 56.0, 1, 'A spiral galaxy containing the majority of humanity. Every 300-500 years, its arm count fluctuates between 12 and 13.');
INSERT INTO public.galaxy VALUES (5, 'Meepo Galaxy', 2.9, 1, 'A tiny fruitbowl galaxy with a black hole center the size of a wet jawbreaker.');
INSERT INTO public.galaxy VALUES (6, 'My Galaxy', 9999.9, 1, 'None of your business.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ekt', NULL, 2, 'The First.');
INSERT INTO public.moon VALUES (2, 'Apt', NULL, 2, 'The Last.');
INSERT INTO public.moon VALUES (3, 'Kibork', true, 3, 'All evidence points to this moon being a gigantic head of lettuce.');
INSERT INTO public.moon VALUES (4, 'Luna', true, 4, 'First reached 2000 years BC by an ancient Sumerian hero. Never touched down upon again, despite late 1900s propaganda.');
INSERT INTO public.moon VALUES (5, 'The Gift', false, 4, 'A noncorporeal gravitron concentration attuned to the vibrations emanated from The Ambassador.');
INSERT INTO public.moon VALUES (6, 'Triton', true, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Thalassa', true, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Charon', true, 5, 'ADMINISTRATOR''S NOTE: YOU KNOW WHAT I''M GOING TO SAY.');
INSERT INTO public.moon VALUES (9, 'The Looking Glass', true, 7, 'A crystalline fractal structure, found to be made of proteins instead of mineral.');
INSERT INTO public.moon VALUES (10, 'The Other Thing', false, 9, 'A rather embarrassing moment for everyone involved in the Vacation Initiative.');
INSERT INTO public.moon VALUES (11, 'Bz', false, 11, NULL);
INSERT INTO public.moon VALUES (12, 'Bzz', false, 11, NULL);
INSERT INTO public.moon VALUES (13, 'Bzzz', false, 11, NULL);
INSERT INTO public.moon VALUES (14, 'Bzzzz', false, 11, NULL);
INSERT INTO public.moon VALUES (15, 'Bzzzzz', false, 11, NULL);
INSERT INTO public.moon VALUES (16, 'Bzzzzzz', false, 11, NULL);
INSERT INTO public.moon VALUES (17, 'Bzzzzzzz', false, 11, NULL);
INSERT INTO public.moon VALUES (18, 'Bzzzzzzzz', false, 11, NULL);
INSERT INTO public.moon VALUES (19, 'Bzzzzzzzzz', false, 11, NULL);
INSERT INTO public.moon VALUES (20, 'Yalikejazz', true, 11, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tenebro', false, true, 1, 'The Vacuous.');
INSERT INTO public.planet VALUES (2, 'Nodus', false, false, 1, 'The Mercurial.');
INSERT INTO public.planet VALUES (3, 'Jonk', false, false, 2, 'Sea level rises and falls 32 vertical miles across 128 hour periods due to close proximity of its moon.');
INSERT INTO public.planet VALUES (4, 'Earth', true, false, 3, 'Home, once.');
INSERT INTO public.planet VALUES (5, 'Neptune', false, false, 3, 'It''s not water.');
INSERT INTO public.planet VALUES (6, 'Pluto', false, false, 3, 'ADMINISTRATOR''S NOTE: PLEASE REMOVE PLUTO FROM PLANET LIST');
INSERT INTO public.planet VALUES (7, 'The Ambassador', true, true, 3, 'Bearer of The Gift. The arbiter of the Indelible Mistake. No detected plate tectonics. Alt-earth beaches and jungles define its terrestrial surface.');
INSERT INTO public.planet VALUES (8, 'Planet Fitness', true, false, 4, '');
INSERT INTO public.planet VALUES (9, 'Ego', true, true, 4, NULL);
INSERT INTO public.planet VALUES (10, 'The Penn & Teller Megahotel And Resort', true, false, 4, 'The only pseudoplanet created as part of the Vacation Initiative without any attempt to mimic an Earth-like environment.');
INSERT INTO public.planet VALUES (11, 'The Hive', true, NULL, 6, 'Telescopic observation (acceptable under the CITW agreement) reveals a mostly untouched, primevally vegetal surface.');
INSERT INTO public.planet VALUES (12, 'Pillow Planet', NULL, true, 6, 'Telescopic observation (acceptable under the CITW agreement) reveals lots of pink cloudlike matter shifting low over a hidden surface.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Nejib', 19000, 230, 1, 'Microglobular star of unknown part count.');
INSERT INTO public.star VALUES (2, 'Wigwoo', 12300, 0, 2, 'The most yellow star ever observed.');
INSERT INTO public.star VALUES (3, 'Sol', 7000, 5532, 4, 'We had to find a better name than ''The Sun'', since that''s more of a generic term for local star, but we also say ''solar winds'' and stuff for other systems too, so, whatever.');
INSERT INTO public.star VALUES (4, 'New Sol', 3200, 78000, 4, 'An artificial binary star created to be the heliocentrepiece of the three Containment Planets.');
INSERT INTO public.star VALUES (5, 'Yinyap', 5688, NULL, 5, 'Beyond description.');
INSERT INTO public.star VALUES (6, 'Briana', NULL, 1, 6, NULL);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

