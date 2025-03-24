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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    size_in_km integer,
    danger_level integer DEFAULT 0,
    name character varying(40),
    discovery_date date NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    age_in_million_years integer,
    discovery_date date NOT NULL,
    dist_to_earth_in_m_lty numeric(20,3),
    scientific_name text
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
    name character varying(40),
    planet_id integer,
    discovery_date date NOT NULL,
    has_atmosphere boolean
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
    name character varying(40),
    star_id integer,
    has_atmosphere boolean,
    discovery_date date NOT NULL,
    habitable boolean
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
    name character varying(40),
    diameter_in_million_km numeric(10,2),
    galaxy_id integer,
    discovery_date date NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 525, 0, 'Vesta', '1807-03-29');
INSERT INTO public.asteroid VALUES (2, 512, 0, 'Pallas', '1802-03-28');
INSERT INTO public.asteroid VALUES (3, 434, 0, 'Hygiea', '1849-04-12');
INSERT INTO public.asteroid VALUES (4, 0, 3, 'Apophis', '2004-06-19');
INSERT INTO public.asteroid VALUES (5, 0, 2, 'Bennu', '1999-09-11');
INSERT INTO public.asteroid VALUES (6, 1, 1, 'Didymos', '1996-04-11');
INSERT INTO public.asteroid VALUES (7, 1, 1, 'Ryugu', '1999-05-10');
INSERT INTO public.asteroid VALUES (8, 17, 0, 'Eros', '1898-08-13');
INSERT INTO public.asteroid VALUES (9, 18, 0, 'Gaspra', '1916-07-30');
INSERT INTO public.asteroid VALUES (10, 31, 0, 'Ida', '1884-09-29');
INSERT INTO public.asteroid VALUES (11, 53, 0, 'Mathilde', '1885-11-12');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 15151, '1610-01-01', 0.000, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'LMC', 10134, '1586-01-01', 0.386, 'Large Magellanic Cloud');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 10010, '1612-01-01', 2.500, 'Messier 31');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 12010, '1615-01-01', 2.500, 'Cigar Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 12010, '1615-01-01', 20.900, 'Messier 101');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 12010, '1615-01-01', 29.900, 'Messier 104');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, '0001-01-01', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, '1877-08-18', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, '1877-08-18', false);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, '1610-01-07', true);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, '1610-01-07', true);
INSERT INTO public.moon VALUES (6, 'Io', 5, '1610-01-07', false);
INSERT INTO public.moon VALUES (7, 'Europa', 5, '1610-01-07', true);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, '1892-09-09', false);
INSERT INTO public.moon VALUES (9, 'Titan', 6, '1655-03-25', true);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, '1672-12-23', false);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, '1671-10-25', false);
INSERT INTO public.moon VALUES (12, 'Dione', 6, '1684-03-21', false);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, '1789-08-28', true);
INSERT INTO public.moon VALUES (14, 'Titania', 7, '1787-01-11', false);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, '1787-01-11', false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, '1851-10-24', false);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, '1851-10-24', false);
INSERT INTO public.moon VALUES (18, 'Triton', 8, '1846-10-10', true);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, '1949-05-01', false);
INSERT INTO public.moon VALUES (20, 'Charon', 9, '1978-06-22', false);
INSERT INTO public.moon VALUES (21, 'Hydra', 9, '2005-05-15', false);
INSERT INTO public.moon VALUES (22, 'Nix', 9, '2005-05-15', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, '0001-01-01', true);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, false, '0001-01-01', false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, true, '0001-01-01', false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, '0001-01-01', false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, true, '0001-01-01', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, '0001-01-01', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, '1781-03-13', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, '1846-09-23', false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, '1930-02-18', false);
INSERT INTO public.planet VALUES (10, 'Eris', 1, false, '2005-01-05', false);
INSERT INTO public.planet VALUES (11, 'Sedna', 1, false, '2003-11-14', false);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 6, true, '2016-08-24', true);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri c', 6, true, '2020-06-01', false);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1 b', 7, true, '2016-05-02', false);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1 c', 7, true, '2016-05-02', false);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1 d', 7, true, '2016-05-02', false);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1 e', 7, true, '2016-05-02', true);
INSERT INTO public.planet VALUES (18, 'TRAPPIST-1 f', 7, true, '2016-05-02', true);
INSERT INTO public.planet VALUES (19, 'TRAPPIST-1 g', 7, true, '2016-05-02', true);
INSERT INTO public.planet VALUES (20, 'TRAPPIST-1 h', 7, true, '2017-02-22', false);
INSERT INTO public.planet VALUES (21, 'Kepler-90 b', 8, true, '2013-10-01', false);
INSERT INTO public.planet VALUES (22, 'Kepler-90 c', 8, true, '2013-10-01', false);
INSERT INTO public.planet VALUES (23, 'Kepler-90 d', 8, true, '2013-10-01', false);
INSERT INTO public.planet VALUES (24, 'Kepler-90 e', 8, true, '2013-10-01', false);
INSERT INTO public.planet VALUES (25, 'Kepler-90 f', 8, true, '2013-10-01', false);
INSERT INTO public.planet VALUES (26, 'Kepler-90 g', 8, true, '2013-10-01', false);
INSERT INTO public.planet VALUES (27, 'Kepler-90 h', 8, true, '2013-10-01', false);
INSERT INTO public.planet VALUES (28, 'Kepler-90 i', 8, true, '2017-12-14', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.39, 1, '0001-01-01');
INSERT INTO public.star VALUES (2, 'Polaris', 45.00, 1, '0001-01-01');
INSERT INTO public.star VALUES (3, 'Sirius', 1.50, 1, '0001-01-01');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1.50, 1, '1686-01-01');
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 1.26, 1, '1686-01-01');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 0.24, 1, '1915-01-01');
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', 0.12, 1, '1999-01-01');
INSERT INTO public.star VALUES (8, 'Kepler-90', 1.20, 1, '2014-01-01');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 11, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: asteroid unique_namasteroid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_namasteroid UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


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

