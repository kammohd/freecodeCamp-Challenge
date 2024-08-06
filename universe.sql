--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(10),
    galaxy_size numeric(12,0),
    galaxy_description text,
    callsign character varying(3) NOT NULL
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
-- Name: joint_universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.joint_universe (
    joint_universe_id integer NOT NULL,
    name character varying(10),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.joint_universe OWNER TO freecodecamp;

--
-- Name: joint_universe_jointid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.joint_universe_jointid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joint_universe_jointid_seq OWNER TO freecodecamp;

--
-- Name: joint_universe_jointid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.joint_universe_jointid_seq OWNED BY public.joint_universe.joint_universe_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(10),
    moon_id integer NOT NULL,
    moon_circumference integer,
    planet_id integer,
    callsign character varying(3) NOT NULL
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
    name character varying(10),
    planet_id integer NOT NULL,
    planet_circumference integer,
    has_life boolean,
    star_id integer,
    callsign character varying(3) NOT NULL
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
    name character varying(10),
    star_id integer NOT NULL,
    dead_star boolean,
    galaxy_id integer,
    callsign character varying(3) NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: joint_universe joint_universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_universe ALTER COLUMN joint_universe_id SET DEFAULT nextval('public.joint_universe_jointid_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'spinning pinwheel', 'MW');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 'spiral galaxy', 'AN');
INSERT INTO public.galaxy VALUES (3, 'Eliptical', 110000, 'ellipsoidal shape', 'EL');
INSERT INTO public.galaxy VALUES (4, 'Comet', 3200000, 'spiral galaxy', 'CO');
INSERT INTO public.galaxy VALUES (5, 'Cigar', 37000, 'starbust galaxy', 'CI');
INSERT INTO public.galaxy VALUES (6, 'Alpha', 220000, 'spiral galaxy', 'AP');


--
-- Data for Name: joint_universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.joint_universe VALUES (1, 'T1', 1, 2, 1, 3);
INSERT INTO public.joint_universe VALUES (2, 'T2', 1, 4, 1, 3);
INSERT INTO public.joint_universe VALUES (3, 'T3', 1, 5, 1, 3);
INSERT INTO public.joint_universe VALUES (4, 'T4', 1, 6, 1, 3);
INSERT INTO public.joint_universe VALUES (5, 'T5', 1, 2, 1, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon', 1, 10000, 1, 'TM');
INSERT INTO public.moon VALUES ('ganymede', 2, 5268, 3, 'GE');
INSERT INTO public.moon VALUES ('Callisto', 3, 5268, 3, 'CL');
INSERT INTO public.moon VALUES ('Europa', 4, 5268, 4, 'EU');
INSERT INTO public.moon VALUES ('Rhea', 5, 5268, 6, 'RH');
INSERT INTO public.moon VALUES ('lapetus', 6, 5268, 7, 'LP');
INSERT INTO public.moon VALUES ('Titan', 7, 5268, 9, 'TN');
INSERT INTO public.moon VALUES ('Triton', 8, 5268, 5, 'TR');
INSERT INTO public.moon VALUES ('lo', 9, 52682, 2, 'LO');
INSERT INTO public.moon VALUES ('Titania', 10, 5268, 9, 'TI');
INSERT INTO public.moon VALUES ('Charon', 11, 5268, 3, 'CH');
INSERT INTO public.moon VALUES ('Miranda', 12, 5268, 6, 'MR');
INSERT INTO public.moon VALUES ('ENceladus', 13, 5268, 2, 'EL');
INSERT INTO public.moon VALUES ('Dactyl', 14, 5268, 3, 'DC');
INSERT INTO public.moon VALUES ('Atlas', 15, 5268, 3, 'AT');
INSERT INTO public.moon VALUES ('Hyperion', 16, 5268, 3, 'HP');
INSERT INTO public.moon VALUES ('Mimas', 17, 5268, 3, 'MM');
INSERT INTO public.moon VALUES ('Pan', 18, 5268, 3, 'PN');
INSERT INTO public.moon VALUES ('Nereid', 19, 5268, 3, 'NR');
INSERT INTO public.moon VALUES ('Phobos', 20, 5268, 3, 'PH');
INSERT INTO public.moon VALUES ('Janus', 21, 5268, 4, 'JA');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 40000, true, 1, 'EA');
INSERT INTO public.planet VALUES ('Mercury', 2, 123414521, false, 1, 'MR');
INSERT INTO public.planet VALUES ('Venus', 3, 123414521, false, 1, 'VE');
INSERT INTO public.planet VALUES ('Jupiter', 4, 123414521, false, 1, 'JU');
INSERT INTO public.planet VALUES ('Uranus', 5, 123414521, false, 1, 'UR');
INSERT INTO public.planet VALUES ('Neptune', 6, 123414521, false, 1, 'NP');
INSERT INTO public.planet VALUES ('Mars', 7, 123414521, false, 1, 'MS');
INSERT INTO public.planet VALUES ('Pluto', 8, 123414521, false, 1, 'PL');
INSERT INTO public.planet VALUES ('Saturn', 9, 123414521, false, 1, 'SA');
INSERT INTO public.planet VALUES ('Charon', 10, 123414521, false, 1, 'CR');
INSERT INTO public.planet VALUES ('Aster', 11, 123414521, false, 1, 'AS');
INSERT INTO public.planet VALUES ('Alpha', 12, 123414521, false, 2, 'AP');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sun', 1, false, 1, 'SU');
INSERT INTO public.star VALUES ('sirius', 2, false, 2, 'SI');
INSERT INTO public.star VALUES ('canopus', 3, true, 3, 'CA');
INSERT INTO public.star VALUES ('Arcturus', 4, false, 1, 'AR');
INSERT INTO public.star VALUES ('vega', 5, false, 5, 'VE');
INSERT INTO public.star VALUES ('Rigel', 6, false, 5, 'RI');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: joint_universe_jointid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.joint_universe_jointid_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: joint_universe joint_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_universe
    ADD CONSTRAINT joint_universe_pkey PRIMARY KEY (joint_universe_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: joint_universe uni_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_universe
    ADD CONSTRAINT uni_name UNIQUE (name);


--
-- Name: galaxy unique_callsign; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_callsign UNIQUE (callsign);


--
-- Name: moon unique_moon_callsign; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_callsign UNIQUE (callsign);


--
-- Name: planet unique_planet_callsign; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_callsign UNIQUE (callsign);


--
-- Name: star unique_star_callsign; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_callsign UNIQUE (callsign);


--
-- Name: joint_universe joint_universe_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_universe
    ADD CONSTRAINT joint_universe_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: joint_universe joint_universe_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_universe
    ADD CONSTRAINT joint_universe_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: joint_universe joint_universe_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_universe
    ADD CONSTRAINT joint_universe_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: joint_universe joint_universe_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joint_universe
    ADD CONSTRAINT joint_universe_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

