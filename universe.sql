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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(11) NOT NULL,
    area_sq_deg integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(35) NOT NULL,
    constellation_id integer,
    distance_kpc numeric NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(13) NOT NULL,
    planet_id integer NOT NULL,
    discovery_year integer,
    inner_moon boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(11) NOT NULL,
    star_id integer NOT NULL,
    exoplanet boolean NOT NULL,
    discovery_year integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(10) NOT NULL,
    galaxy_id integer NOT NULL,
    discovery_year integer,
    distance_kpc numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (0, 'Canis Major', 380, 'Canis Major is a constellation in the southern celestial hemisphere. In the second century, it was included in Ptolemys 48 constellations, and is counted among the 88 modern constellations. Its name is Latin for "greater dog" in contrast to Canis Minor, the "lesser dog"; both figures are commonly represented as following the constellation of Orion the hunter through the sky. The Milky Way passes through Canis Major and several open clusters lie within its borders, most notably M41.');
INSERT INTO public.constellation VALUES (1, 'Virgo', 1294, 'Virgo is one of the constellations of the zodiac. Its name is Latin for maiden, and its old astronomical symbol is Virgo symbol. Lying between Leo to the west and Libra to the east, it is the second-largest constellation in the sky (after Hydra) and the largest constellation in the zodiac. The ecliptic intersects the celestial equator within this constellation and Pisces. Underlying these technical two definitions, the sun passes directly overhead of the equator, within this constellation, at the September equinox. Virgo can be easily found through its brightest star, Spica.');
INSERT INTO public.constellation VALUES (2, 'Sagittarius', 867, 'Sagittarius is one of the constellations of the zodiac and is located in the Southern celestial hemisphere. It is one of the 48 constellations listed by the 2nd-century astonomer Ptolemy and remains one of the 88 modern constellations. Its old astronomical symbol is Sagittarius symbol. Its name is Latin for "archer". Sagittarius is commonly represented as a centaur pulling back a bow. It lies between Scorpius and Ophiuchus to the west and Capricornus and Microscopium to the east.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (0, 'Milky Way Galaxy', NULL, 8.106, 'The Milky Way[b] is the galaxy that includes the Solar System, with the name describing the galaxys appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye. The term Milky Way is a translation of the Latin via lactea, from the Greek γαλακτικός κύκλος (galaktikos kýklos), meaning "milky circle".[18][19][20] From Earth, the Milky Way appears as a band because its disk-shaped structure is viewed from within. Galileo Galilei first resolved the band of light into individual stars with his telescope in 1610. Until the early 1920s, most astronomers thought that the Milky Way contained all the stars in the Universe.[21] Following the 1920 Great Debate between the astronomers Harlow Shapley and Heber Curtis,[22] observations by Edwin Hubble showed that the Milky Way is just one of many galaxies.');
INSERT INTO public.galaxy VALUES (1, 'Canis Major Dwarf', 0, 7.66503479866199, 'The Canis Major Overdensity (CMa Overdensity) or Canis Major Dwarf Galaxy (CMa Dwarf) is a disputed dwarf irregular galaxy in the Local Group, located in the same part of the sky as the constellation Canis Major.');
INSERT INTO public.galaxy VALUES (2, 'Virgo Stellar Stream', 1, 0.0091980417583944, 'The Virgo Stellar Stream, also known as Virgo Overdensity, is the proposed name for a stellar stream in the constellation of Virgo which was discovered in 2005.[1][2] The stream is thought to be the remains of a dwarf spheroidal galaxy that is in the process of merging with the Milky Way. It is the largest galaxy visible from the Earth, in terms of the area of the night sky covered.');
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Elliptical Galaxy', 2, 20, 'The Sagittarius Dwarf Spheroidal Galaxy (Sgr dSph), also known as the Sagittarius Dwarf Elliptical Galaxy (Sgr dE or Sag DEG), is an elliptical loop-shaped satellite galaxy of the Milky Way. It contains four globular clusters in its main body,[7] with the brightest of them – NGC 6715 (M54) – being known well before the discovery of the galaxy itself in 1994. Sgr dSph is roughly 10,000 light-years in diameter, and is currently about 70,000 light-years from Earth, travelling in a polar orbit (an orbit passing over the Milky Ways galactic poles) at a distance of about 50,000 light-years from the core of the Milky Way (about one third of the distance of the Large Magellanic Cloud). In its looping, spiraling path, it has passed through the plane of the Milky Way several times in the past.[8] In 2018 the Gaia project of the European Space Agency showed that Sgr dSph had caused perturbations in a set of stars near the Milky Ways core, causing unexpected rippling movements of the stars triggered when it moved past the Milky Way between 300 and 900 million years ago.[9]');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', NULL, 49.97, 'The Large Magellanic Cloud (LMC), or Nubecula Major, is a satellite galaxy of the Milky Way.[6] At a distance of around 50 kiloparsecs (≈160,000 light-years),[2][7][8][9] the LMC is the second- or third-closest galaxy to the Milky Way, after the Sagittarius Dwarf Spheroidal (~16 kpc) and the possible dwarf irregular galaxy known as the Canis Major Overdensity. Based on the D25 isophote at the B-band (445 nm wavelength of light), the Large Magellanic Cloud is approximately 9.86 kiloparsecs (32,200 light-years) across.[1][4] It is roughly a hundredth as massive as the Milky Way[10] and is the fourth-largest galaxy in the Local Group, after the Andromeda Galaxy (M31), the Milky Way and the Triangulum Galaxy (M33).');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', NULL, 62.44, 'The Small Magellanic Cloud (SMC), or Nubecula Minor, is a dwarf galaxy near the Milky Way.[4] Classified as a dwarf irregular galaxy, the SMC has a D25 isophotal diameter of about 5.78 kiloparsecs (18,900 light-years),[1][3] and contains several hundred million stars.[4] It has a total mass of approximately 7 billion solar masses.[5] At a distance of about 200,000 light-years, the SMC is among the nearest intergalactic neighbors of the Milky Way and is one of the most distant objects visible to the naked eye.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (0, 'Moon', 2, NULL, NULL);
INSERT INTO public.moon VALUES (1, 'Phobos', 3, 1877, true);
INSERT INTO public.moon VALUES (2, 'Deimos', 3, 1877, false);
INSERT INTO public.moon VALUES (3, 'Metis', 4, 1979, true);
INSERT INTO public.moon VALUES (4, 'Adrastea', 4, 1979, true);
INSERT INTO public.moon VALUES (5, 'Amalthea', 4, 1892, true);
INSERT INTO public.moon VALUES (6, 'Thebe', 4, 1979, true);
INSERT INTO public.moon VALUES (7, 'Io', 4, 1610, false);
INSERT INTO public.moon VALUES (8, 'Europa', 4, 1610, false);
INSERT INTO public.moon VALUES (9, 'Ganymede', 4, 1610, false);
INSERT INTO public.moon VALUES (10, 'Callisto', 4, 1610, false);
INSERT INTO public.moon VALUES (11, 'Themisto', 4, 1975, false);
INSERT INTO public.moon VALUES (12, 'Leda', 4, 1974, false);
INSERT INTO public.moon VALUES (13, 'Ersa', 4, 2018, false);
INSERT INTO public.moon VALUES (14, 'Himalia', 4, 1904, false);
INSERT INTO public.moon VALUES (15, 'S/2018_J_2', 4, 2018, false);
INSERT INTO public.moon VALUES (16, 'Pandia', 4, 2017, false);
INSERT INTO public.moon VALUES (17, 'Lysithea', 4, 1938, false);
INSERT INTO public.moon VALUES (18, 'Elara', 4, 1905, false);
INSERT INTO public.moon VALUES (19, 'S/2011_J_3', 4, 2011, false);
INSERT INTO public.moon VALUES (20, 'Dia', 4, 2000, false);
INSERT INTO public.moon VALUES (21, 'Carpo', 4, 2003, false);
INSERT INTO public.moon VALUES (22, 'Valetudo', 4, 2016, false);
INSERT INTO public.moon VALUES (23, 'Euporie', 4, 2001, false);
INSERT INTO public.moon VALUES (24, 'S/2003_J_18', 4, 2003, false);
INSERT INTO public.moon VALUES (25, 'Eupheme', 4, 2003, false);
INSERT INTO public.moon VALUES (26, 'S/2010_J_2', 4, 2010, false);
INSERT INTO public.moon VALUES (27, 'S/2016_J_1', 4, 2016, false);
INSERT INTO public.moon VALUES (28, 'Mneme', 4, 2003, false);
INSERT INTO public.moon VALUES (29, 'Euanthe', 4, 2001, false);
INSERT INTO public.moon VALUES (30, 'S/2003_J_16', 4, 2003, false);
INSERT INTO public.moon VALUES (31, 'Harpalyke', 4, 2000, false);
INSERT INTO public.moon VALUES (32, 'Orthosie', 4, 2001, false);
INSERT INTO public.moon VALUES (33, 'Helike', 4, 2003, false);
INSERT INTO public.moon VALUES (34, 'Praxidike', 4, 2000, false);
INSERT INTO public.moon VALUES (35, 'S/2017_J_3', 4, 2017, false);
INSERT INTO public.moon VALUES (36, 'S/2003_J_12', 4, 2003, false);
INSERT INTO public.moon VALUES (37, 'S/2017_J_7', 4, 2017, false);
INSERT INTO public.moon VALUES (38, 'Thelxinoe', 4, 2003, false);
INSERT INTO public.moon VALUES (39, 'Thyone', 4, 2001, false);
INSERT INTO public.moon VALUES (40, 'S/2003_J_2', 4, 2003, false);
INSERT INTO public.moon VALUES (41, 'Ananke', 4, 1951, false);
INSERT INTO public.moon VALUES (42, 'Iocaste', 4, 2000, false);
INSERT INTO public.moon VALUES (43, 'Hermippe', 4, 2001, false);
INSERT INTO public.moon VALUES (44, 'S/2017_J_9', 4, 2017, false);
INSERT INTO public.moon VALUES (45, 'Philophrosyne', 4, 2003, false);
INSERT INTO public.moon VALUES (46, 'Pasithee', 4, 2001, false);
INSERT INTO public.moon VALUES (47, 'S/2017_J_8', 4, 2017, false);
INSERT INTO public.moon VALUES (48, 'S/2003_J_24', 4, 2003, false);
INSERT INTO public.moon VALUES (49, 'Eurydome', 4, 2001, false);
INSERT INTO public.moon VALUES (50, 'S/2011_J_2', 4, 2011, false);
INSERT INTO public.moon VALUES (51, 'S/2003_J_4', 4, 2003, false);
INSERT INTO public.moon VALUES (52, 'Chaldene', 4, 2000, false);
INSERT INTO public.moon VALUES (53, 'S/2017_J_2', 4, 2017, false);
INSERT INTO public.moon VALUES (54, 'Isonoe', 4, 2000, false);
INSERT INTO public.moon VALUES (55, 'Kallichore', 4, 2003, false);
INSERT INTO public.moon VALUES (56, 'Erinome', 4, 2000, false);
INSERT INTO public.moon VALUES (57, 'Kale', 4, 2001, false);
INSERT INTO public.moon VALUES (58, 'Eirene', 4, 2003, false);
INSERT INTO public.moon VALUES (59, 'Aitne', 4, 2001, false);
INSERT INTO public.moon VALUES (60, 'Eukelade', 4, 2003, false);
INSERT INTO public.moon VALUES (61, 'Arche', 4, 2002, false);
INSERT INTO public.moon VALUES (62, 'Taygete', 4, 2000, false);
INSERT INTO public.moon VALUES (63, 'S/2011_J_1', 4, 2011, false);
INSERT INTO public.moon VALUES (64, 'Carme', 4, 1938, false);
INSERT INTO public.moon VALUES (65, 'Herse', 4, 2003, false);
INSERT INTO public.moon VALUES (66, 'S/2003_J_19', 4, 2003, false);
INSERT INTO public.moon VALUES (67, 'S/2010_J_1', 4, 2010, false);
INSERT INTO public.moon VALUES (68, 'S/2003_J_9', 4, 2003, false);
INSERT INTO public.moon VALUES (69, 'S/2017_J_5', 4, 2017, false);
INSERT INTO public.moon VALUES (70, 'S/2017_J_6', 4, 2017, false);
INSERT INTO public.moon VALUES (71, 'Kalyke', 4, 2000, false);
INSERT INTO public.moon VALUES (72, 'Hegemone', 4, 2003, false);
INSERT INTO public.moon VALUES (73, 'Pasiphae', 4, 1908, false);
INSERT INTO public.moon VALUES (74, 'Sponde', 4, 2001, false);
INSERT INTO public.moon VALUES (75, 'S/2003_J_10', 4, 2003, false);
INSERT INTO public.moon VALUES (76, 'Megaclite', 4, 2000, false);
INSERT INTO public.moon VALUES (77, 'Cyllene', 4, 2003, false);
INSERT INTO public.moon VALUES (78, 'Sinope', 4, 1914, false);
INSERT INTO public.moon VALUES (79, 'S/2017_J_1', 4, 2017, false);
INSERT INTO public.moon VALUES (80, 'Aoede', 4, 2003, false);
INSERT INTO public.moon VALUES (81, 'Autonoe', 4, 2001, false);
INSERT INTO public.moon VALUES (82, 'Callirrhoe', 4, 1999, false);
INSERT INTO public.moon VALUES (83, 'S/2003_J_23', 4, 2003, false);
INSERT INTO public.moon VALUES (84, 'Kore', 4, 2003, false);
INSERT INTO public.moon VALUES (85, 'S/2009_S_1', 5, 2009, NULL);
INSERT INTO public.moon VALUES (86, '(moonlets)', 5, 2006, NULL);
INSERT INTO public.moon VALUES (87, 'Pan', 5, 1990, NULL);
INSERT INTO public.moon VALUES (88, 'Daphnis', 5, 2005, NULL);
INSERT INTO public.moon VALUES (89, 'Atlas', 5, 1980, NULL);
INSERT INTO public.moon VALUES (90, 'Prometheus', 5, 1980, NULL);
INSERT INTO public.moon VALUES (91, 'Pandora', 5, 1980, NULL);
INSERT INTO public.moon VALUES (92, 'Epimetheus', 5, 1977, NULL);
INSERT INTO public.moon VALUES (93, 'Janus', 5, 1966, NULL);
INSERT INTO public.moon VALUES (94, 'Aegaeon', 5, 2008, NULL);
INSERT INTO public.moon VALUES (95, 'Mimas', 5, 1789, NULL);
INSERT INTO public.moon VALUES (96, 'Methone', 5, 2004, NULL);
INSERT INTO public.moon VALUES (97, 'Anthe', 5, 2007, NULL);
INSERT INTO public.moon VALUES (98, 'Pallene', 5, 2004, NULL);
INSERT INTO public.moon VALUES (99, 'Enceladus', 5, 1789, NULL);
INSERT INTO public.moon VALUES (100, 'Tethys', 5, 1684, NULL);
INSERT INTO public.moon VALUES (101, 'Telesto', 5, 1980, NULL);
INSERT INTO public.moon VALUES (102, 'Calypso', 5, 1980, NULL);
INSERT INTO public.moon VALUES (103, 'Dione', 5, 1684, NULL);
INSERT INTO public.moon VALUES (104, 'Helene', 5, 1980, NULL);
INSERT INTO public.moon VALUES (105, 'Polydeuces', 5, 2004, NULL);
INSERT INTO public.moon VALUES (106, 'Rhea', 5, 1672, NULL);
INSERT INTO public.moon VALUES (107, 'Titan', 5, 1655, NULL);
INSERT INTO public.moon VALUES (108, 'Hyperion', 5, 1848, NULL);
INSERT INTO public.moon VALUES (109, 'Iapetus', 5, 1671, NULL);
INSERT INTO public.moon VALUES (110, 'S/2019_S_1', 5, 2019, NULL);
INSERT INTO public.moon VALUES (111, 'Kiviuq', 5, 2000, NULL);
INSERT INTO public.moon VALUES (112, 'Ijiraq', 5, 2000, NULL);
INSERT INTO public.moon VALUES (113, 'Phoebe', 5, 1899, NULL);
INSERT INTO public.moon VALUES (114, 'Paaliaq', 5, 2000, NULL);
INSERT INTO public.moon VALUES (115, 'Skathi', 5, 2000, NULL);
INSERT INTO public.moon VALUES (116, 'S/2004_S_37', 5, 2004, NULL);
INSERT INTO public.moon VALUES (117, 'S/2007_S_2', 5, 2007, NULL);
INSERT INTO public.moon VALUES (118, 'Albiorix', 5, 2000, NULL);
INSERT INTO public.moon VALUES (119, 'Bebhionn', 5, 2004, NULL);
INSERT INTO public.moon VALUES (120, 'S/2004_S_29', 5, 2004, NULL);
INSERT INTO public.moon VALUES (121, 'S/2004_S_31', 5, 2004, NULL);
INSERT INTO public.moon VALUES (122, 'Erriapus', 5, 2000, NULL);
INSERT INTO public.moon VALUES (123, 'Skoll', 5, 2006, NULL);
INSERT INTO public.moon VALUES (124, 'Tarqeq', 5, 2007, NULL);
INSERT INTO public.moon VALUES (125, 'Siarnaq', 5, 2000, NULL);
INSERT INTO public.moon VALUES (126, 'Tarvos', 5, 2000, NULL);
INSERT INTO public.moon VALUES (127, 'Hyrrokkin', 5, 2004, NULL);
INSERT INTO public.moon VALUES (128, 'Greip', 5, 2006, NULL);
INSERT INTO public.moon VALUES (129, 'S/2004_S_13', 5, 2004, NULL);
INSERT INTO public.moon VALUES (130, 'Mundilfari', 5, 2000, NULL);
INSERT INTO public.moon VALUES (131, 'S/2006_S_1', 5, 2006, NULL);
INSERT INTO public.moon VALUES (132, 'Gridr', 5, 2004, NULL);
INSERT INTO public.moon VALUES (133, 'Bergelmir', 5, 2004, NULL);
INSERT INTO public.moon VALUES (134, 'Narvi', 5, 2003, NULL);
INSERT INTO public.moon VALUES (135, 'Jarnsaxa', 5, 2006, NULL);
INSERT INTO public.moon VALUES (136, 'S/2004_S_17', 5, 2004, NULL);
INSERT INTO public.moon VALUES (137, 'Suttungr', 5, 2000, NULL);
INSERT INTO public.moon VALUES (138, 'S/2007_S_3', 5, 2007, NULL);
INSERT INTO public.moon VALUES (139, 'S/2004_S_12', 5, 2004, NULL);
INSERT INTO public.moon VALUES (140, 'Eggther', 5, 2004, NULL);
INSERT INTO public.moon VALUES (141, 'Hati', 5, 2004, NULL);
INSERT INTO public.moon VALUES (142, 'Bestla', 5, 2004, NULL);
INSERT INTO public.moon VALUES (143, 'Farbauti', 5, 2004, NULL);
INSERT INTO public.moon VALUES (144, 'Thrymr', 5, 2000, NULL);
INSERT INTO public.moon VALUES (145, 'S/2004_S_7', 5, 2004, NULL);
INSERT INTO public.moon VALUES (146, 'Angrboda', 5, 2004, NULL);
INSERT INTO public.moon VALUES (147, 'Beli', 5, 2004, NULL);
INSERT INTO public.moon VALUES (148, 'Aegir', 5, 2004, NULL);
INSERT INTO public.moon VALUES (149, 'Gerd', 5, 2004, NULL);
INSERT INTO public.moon VALUES (150, 'Gunnlod', 5, 2004, NULL);
INSERT INTO public.moon VALUES (151, 'Skrymir', 5, 2004, NULL);
INSERT INTO public.moon VALUES (152, 'S/2004_S_28', 5, 2004, NULL);
INSERT INTO public.moon VALUES (153, 'Alvaldi', 5, 2004, NULL);
INSERT INTO public.moon VALUES (154, 'Kari', 5, 2006, NULL);
INSERT INTO public.moon VALUES (155, 'Geirrod', 5, 2004, NULL);
INSERT INTO public.moon VALUES (156, 'S/2006_S_3', 5, 2006, NULL);
INSERT INTO public.moon VALUES (157, 'Fenrir', 5, 2004, NULL);
INSERT INTO public.moon VALUES (158, 'Surtur', 5, 2006, NULL);
INSERT INTO public.moon VALUES (159, 'Loge', 5, 2006, NULL);
INSERT INTO public.moon VALUES (160, 'Ymir', 5, 2000, NULL);
INSERT INTO public.moon VALUES (161, 'S/2004_S_21', 5, 2004, NULL);
INSERT INTO public.moon VALUES (162, 'S/2004_S_39', 5, 2004, NULL);
INSERT INTO public.moon VALUES (163, 'S/2004_S_24', 5, 2004, NULL);
INSERT INTO public.moon VALUES (164, 'S/2004_S_36', 5, 2004, NULL);
INSERT INTO public.moon VALUES (165, 'Thiazzi', 5, 2004, NULL);
INSERT INTO public.moon VALUES (166, 'S/2004_S_34', 5, 2004, NULL);
INSERT INTO public.moon VALUES (167, 'Fornjot', 5, 2004, NULL);
INSERT INTO public.moon VALUES (168, 'S/2004_S_26', 5, 2004, NULL);
INSERT INTO public.moon VALUES (169, 'Cordelia', 6, 1986, true);
INSERT INTO public.moon VALUES (170, 'Ophelia', 6, 1986, true);
INSERT INTO public.moon VALUES (171, 'Bianca', 6, 1986, true);
INSERT INTO public.moon VALUES (172, 'Cressida', 6, 1986, true);
INSERT INTO public.moon VALUES (173, 'Desdemona', 6, 1986, true);
INSERT INTO public.moon VALUES (174, 'Juliet', 6, 1986, true);
INSERT INTO public.moon VALUES (175, 'Portia', 6, 1986, true);
INSERT INTO public.moon VALUES (176, 'Rosalind', 6, 1986, true);
INSERT INTO public.moon VALUES (177, 'Cupid', 6, 2003, true);
INSERT INTO public.moon VALUES (178, 'Belinda', 6, 1986, true);
INSERT INTO public.moon VALUES (179, 'Perdita', 6, 1999, true);
INSERT INTO public.moon VALUES (180, 'Puck', 6, 1985, true);
INSERT INTO public.moon VALUES (181, 'Mab', 6, 2003, true);
INSERT INTO public.moon VALUES (182, 'Miranda', 6, 1948, false);
INSERT INTO public.moon VALUES (183, 'Ariel', 6, 1851, false);
INSERT INTO public.moon VALUES (184, 'Umbriel', 6, 1851, false);
INSERT INTO public.moon VALUES (185, 'Titania', 6, 1787, false);
INSERT INTO public.moon VALUES (186, 'Oberon', 6, 1787, false);
INSERT INTO public.moon VALUES (187, 'Francisco', 6, 2003, false);
INSERT INTO public.moon VALUES (188, 'Caliban', 6, 1997, false);
INSERT INTO public.moon VALUES (189, 'Stephano', 6, 1999, false);
INSERT INTO public.moon VALUES (190, 'Trinculo', 6, 2001, false);
INSERT INTO public.moon VALUES (191, 'Sycorax', 6, 1997, false);
INSERT INTO public.moon VALUES (192, '±Margaret', 6, 2003, false);
INSERT INTO public.moon VALUES (193, 'Prospero', 6, 1999, false);
INSERT INTO public.moon VALUES (194, 'Setebos', 6, 1999, false);
INSERT INTO public.moon VALUES (195, 'Ferdinand', 6, 2003, false);
INSERT INTO public.moon VALUES (196, 'Naiad', 7, 1989, NULL);
INSERT INTO public.moon VALUES (197, 'Thalassa', 7, 1989, NULL);
INSERT INTO public.moon VALUES (198, 'Despina', 7, 1989, NULL);
INSERT INTO public.moon VALUES (199, 'Galatea', 7, 1989, NULL);
INSERT INTO public.moon VALUES (200, 'Larissa', 7, 1981, NULL);
INSERT INTO public.moon VALUES (201, 'Hippocamp', 7, 2013, NULL);
INSERT INTO public.moon VALUES (202, 'Proteus', 7, 1989, NULL);
INSERT INTO public.moon VALUES (203, 'Triton', 7, 1846, NULL);
INSERT INTO public.moon VALUES (204, 'Nereid', 7, 1949, NULL);
INSERT INTO public.moon VALUES (205, 'Halimede', 7, 2002, NULL);
INSERT INTO public.moon VALUES (206, 'Sao', 7, 2002, NULL);
INSERT INTO public.moon VALUES (207, 'Laomedeia', 7, 2002, NULL);
INSERT INTO public.moon VALUES (208, 'Psamathe', 7, 2003, NULL);
INSERT INTO public.moon VALUES (209, 'Neso', 7, 2002, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (0, 'Mercury', 0, false, -2000);
INSERT INTO public.planet VALUES (1, 'Venus', 0, false, 1962);
INSERT INTO public.planet VALUES (2, 'Earth', 0, false, NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 0, false, -2000);
INSERT INTO public.planet VALUES (4, 'Jupiter', 0, false, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 0, false, NULL);
INSERT INTO public.planet VALUES (6, 'Uranus', 0, false, 1781);
INSERT INTO public.planet VALUES (7, 'Neptune', 0, false, 1613);
INSERT INTO public.planet VALUES (8, 'Kepler-90b', 1, true, 2013);
INSERT INTO public.planet VALUES (9, 'Kepler-90c', 1, true, 2013);
INSERT INTO public.planet VALUES (10, 'Kepler-90d', 1, true, 2013);
INSERT INTO public.planet VALUES (11, 'Kepler-90e', 1, true, 2013);
INSERT INTO public.planet VALUES (12, 'Kepler-90f', 1, true, 2013);
INSERT INTO public.planet VALUES (13, 'Kepler-90g', 1, true, 2013);
INSERT INTO public.planet VALUES (14, 'Kepler-90h', 1, true, 2013);
INSERT INTO public.planet VALUES (15, 'Kepler-90i', 1, true, 2017);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1b', 2, true, 2016);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1c', 2, true, 2016);
INSERT INTO public.planet VALUES (18, 'TRAPPIST-1d', 2, true, 2016);
INSERT INTO public.planet VALUES (19, 'TRAPPIST-1e', 2, true, 2017);
INSERT INTO public.planet VALUES (20, 'TRAPPIST-1f', 2, true, 2017);
INSERT INTO public.planet VALUES (21, 'TRAPPIST-1g', 2, true, 2017);
INSERT INTO public.planet VALUES (22, 'TRAPPIST-1h', 2, true, 2017);
INSERT INTO public.planet VALUES (23, 'HD 10181b', 3, true, 2010);
INSERT INTO public.planet VALUES (24, 'HD 10181c', 3, true, 2010);
INSERT INTO public.planet VALUES (25, 'HD 10181d', 3, true, 2010);
INSERT INTO public.planet VALUES (26, 'HD 10181e', 3, true, 2010);
INSERT INTO public.planet VALUES (27, 'HD 10181f', 3, true, 2010);
INSERT INTO public.planet VALUES (28, 'HD 10181g', 3, true, 2010);
INSERT INTO public.planet VALUES (29, 'HD 219134b', 4, true, 2015);
INSERT INTO public.planet VALUES (30, 'HD 219134c', 4, true, 2015);
INSERT INTO public.planet VALUES (31, 'HD 219134d', 4, true, 2015);
INSERT INTO public.planet VALUES (32, 'HD 219134e', 4, true, 2015);
INSERT INTO public.planet VALUES (33, 'HD 219134f', 4, true, 2015);
INSERT INTO public.planet VALUES (34, 'HD 219134g', 4, true, 2015);
INSERT INTO public.planet VALUES (35, 'HD 191939b', 5, true, 2020);
INSERT INTO public.planet VALUES (36, 'HD 191939c', 5, true, 2020);
INSERT INTO public.planet VALUES (37, 'HD 191939d', 5, true, 2020);
INSERT INTO public.planet VALUES (38, 'HD 191939e', 5, true, 2022);
INSERT INTO public.planet VALUES (39, 'HD 191939f', 5, true, 2022);
INSERT INTO public.planet VALUES (40, 'HD 191939g', 5, true, 2022);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (0, 'Sun', 0, NULL, NULL);
INSERT INTO public.star VALUES (1, 'Kepler-90', 0, 2010, 0.855417883530679);
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 0, 2000, 0.0124664125965438);
INSERT INTO public.star VALUES (3, 'HD 10180', 0, 2010, 0.0389690369163976);
INSERT INTO public.star VALUES (4, 'HD 219134', 0, 2015, 0.00654164729857009);
INSERT INTO public.star VALUES (5, 'HD 191939', 0, 2020, 0.0534712827554661);


--
-- Name: constellation company_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT company_description_key UNIQUE (description);


--
-- Name: constellation company_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT company_name_key UNIQUE (name);


--
-- Name: constellation company_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT company_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_name_key UNIQUE (name);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: moon moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_name_key UNIQUE (name);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy constellation_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT constellation_id FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star fk_galaxies; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxies FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planets; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planets FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_stars; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_stars FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

