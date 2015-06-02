--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: au_orders; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE au_orders (
    title_id character(3),
    author1 character(3),
    author2 character(3),
    author3 character(3)
);


ALTER TABLE public.au_orders OWNER TO gordon;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE authors (
    au_id character(3) NOT NULL,
    au_fname character varying(15) NOT NULL,
    au_lname character varying(15) NOT NULL,
    phone character varying(12),
    address character varying(20),
    city character varying(15),
    state character(2),
    zip character(5)
);


ALTER TABLE public.authors OWNER TO gordon;

--
-- Name: dups; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE dups (
    id integer,
    title_name character varying(40),
    type character varying(10),
    price numeric(5,2)
);


ALTER TABLE public.dups OWNER TO gordon;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE employees (
    emp_id character(3) NOT NULL,
    emp_name character varying(20) NOT NULL,
    boss_id character(3)
);


ALTER TABLE public.employees OWNER TO gordon;

--
-- Name: empsales; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE empsales (
    emp_id character(3) NOT NULL,
    sales integer NOT NULL
);


ALTER TABLE public.empsales OWNER TO gordon;

--
-- Name: hier; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE hier (
    emp_id character(3) NOT NULL,
    emp_title character varying(20) NOT NULL,
    boss_id character(3)
);


ALTER TABLE public.hier OWNER TO gordon;

--
-- Name: publishers; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE publishers (
    pub_id character(3) NOT NULL,
    pub_name character varying(20) NOT NULL,
    city character varying(15) NOT NULL,
    state character(2),
    country character varying(15) NOT NULL
);


ALTER TABLE public.publishers OWNER TO gordon;

--
-- Name: roadtrip; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE roadtrip (
    seq integer NOT NULL,
    city character varying(17) NOT NULL,
    miles double precision NOT NULL
);


ALTER TABLE public.roadtrip OWNER TO gordon;

--
-- Name: royalties; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE royalties (
    title_id character(3) NOT NULL,
    advance numeric(9,2),
    royalty_rate numeric(5,2)
);


ALTER TABLE public.royalties OWNER TO gordon;

--
-- Name: telephones; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE telephones (
    au_id character(3) NOT NULL,
    tel_type character(1) NOT NULL,
    tel_no character(12) NOT NULL
);


ALTER TABLE public.telephones OWNER TO gordon;

--
-- Name: temps; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE temps (
    id integer NOT NULL,
    hi_temp integer NOT NULL
);


ALTER TABLE public.temps OWNER TO gordon;

--
-- Name: time_series; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE time_series (
    seq integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.time_series OWNER TO gordon;

--
-- Name: title_authors; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE title_authors (
    title_id character(3) NOT NULL,
    au_id character(3) NOT NULL,
    au_order smallint NOT NULL,
    royalty_share numeric(5,2) NOT NULL
);


ALTER TABLE public.title_authors OWNER TO gordon;

--
-- Name: titles; Type: TABLE; Schema: public; Owner: gordon; Tablespace: 
--

CREATE TABLE titles (
    title_id character(3) NOT NULL,
    title_name character varying(40) NOT NULL,
    type character varying(10),
    pub_id character(3) NOT NULL,
    pages integer,
    price numeric(5,2),
    sales integer,
    pubdate date,
    contract smallint NOT NULL
);


ALTER TABLE public.titles OWNER TO gordon;

--
-- Data for Name: au_orders; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY au_orders (title_id, author1, author2, author3) FROM stdin;
T01	A01	\N	\N
T02	A01	\N	\N
T03	A05	\N	\N
T04	A03	A04	\N
T05	A04	\N	\N
T06	A02	\N	\N
T07	A02	A04	\N
T08	A06	\N	\N
T09	A06	\N	\N
T10	A02	\N	\N
T11	A06	A03	A04
T12	A02	\N	\N
T13	A01	\N	\N
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY authors (au_id, au_fname, au_lname, phone, address, city, state, zip) FROM stdin;
A01	Sarah	Buchman	718-496-7223	75 West 205 St	Bronx	NY	10468
A02	Wendy	Heydemark	303-986-7020	2922 Baseline Rd	Boulder	CO	80303
A03	Hallie	Hull	415-549-4278	3800 Waldo Ave, #14F	San Francisco	CA	94123
A04	Klee	Hull	415-549-4278	3800 Waldo Ave, #14F	San Francisco	CA	94123
A05	Christian	Kells	212-771-4680	114 Horatio St	New York	NY	10014
A06		Kellsey	650-836-7128	390 Serra Mall	Palo Alto	CA	94305
A07	Paddy	O'Furniture	941-925-0752	1442 Main St	Sarasota	FL	34236
\.


--
-- Data for Name: dups; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY dups (id, title_name, type, price) FROM stdin;
1	Book Title 5	children	15.00
2	Book Title 3	biography	7.00
3	Book Title 1	history	10.00
4	Book Title 2	children	20.00
5	Book Title 4	history	15.00
6	Book Title 1	history	10.00
7	Book Title 3	biography	7.00
8	Book Title 1	history	10.00
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY employees (emp_id, emp_name, boss_id) FROM stdin;
E01	Lord Copper	\N
E02	Jocelyn Hitchcock	E01
E03	Mr. Salter	E01
E04	William Boot	E03
E05	Mr. Corker	E03
\.


--
-- Data for Name: empsales; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY empsales (emp_id, sales) FROM stdin;
E01	600
E02	800
E03	500
E04	500
E05	700
E06	500
E07	300
E08	400
E09	900
E10	700
\.


--
-- Data for Name: hier; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY hier (emp_id, emp_title, boss_id) FROM stdin;
E01	CEO	\N
E02	VP1	E01
E03	VP2	E01
E04	DIR1	E02
E05	DIR2	E02
E06	DIR3	E03
E07	WS1	E04
E08	WS2	E04
E09	WS3	E04
E10	WS4	E06
E11	WS5	E06
\.


--
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY publishers (pub_id, pub_name, city, state, country) FROM stdin;
P01	Abatis Publishers	New York	NY	USA
P02	Core Dump Books	San Francisco	CA	USA
P03	Schadenfreude Press	Hamburg	\N	Germany
P04	Tenterhooks Press	Berkeley	CA	USA
\.


--
-- Data for Name: roadtrip; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY roadtrip (seq, city, miles) FROM stdin;
1	Seattle, WA	0
2	Portland, OR	174
3	San Francisco, CA	808
4	Monterey, CA	926
5	Los Angeles, CA	1251
6	San Diego, CA	1372
\.


--
-- Data for Name: royalties; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY royalties (title_id, advance, royalty_rate) FROM stdin;
T01	10000.00	0.05
T02	1000.00	0.06
T03	15000.00	0.07
T04	20000.00	0.08
T05	100000.00	0.09
T06	20000.00	0.08
T07	1000000.00	0.11
T08	0.00	0.04
T09	0.00	0.05
T10	\N	\N
T11	100000.00	0.07
T12	50000.00	0.09
T13	20000.00	0.06
\.


--
-- Data for Name: telephones; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY telephones (au_id, tel_type, tel_no) FROM stdin;
A01	H	111-111-1111
A01	W	222-222-2222
A02	W	333-333-3333
A04	H	444-444-4444
A04	W	555-555-5555
A05	H	666-666-6666
\.


--
-- Data for Name: temps; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY temps (id, hi_temp) FROM stdin;
1	49
2	46
3	48
4	50
5	50
6	50
7	51
8	52
9	53
10	50
11	50
12	47
13	50
14	51
15	52
\.


--
-- Data for Name: time_series; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY time_series (seq, price) FROM stdin;
1	10
2	10.5
3	11
4	11
5	10.5
6	11.5
7	12
8	13
9	15
10	13.5
11	13
12	12.5
13	12
14	12.5
15	11
\.


--
-- Data for Name: title_authors; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY title_authors (title_id, au_id, au_order, royalty_share) FROM stdin;
T01	A01	1	1.00
T02	A01	1	1.00
T03	A05	1	1.00
T04	A03	1	0.60
T04	A04	2	0.40
T05	A04	1	1.00
T06	A02	1	1.00
T07	A02	1	0.50
T07	A04	2	0.50
T08	A06	1	1.00
T09	A06	1	1.00
T10	A02	1	1.00
T11	A03	2	0.30
T11	A04	3	0.30
T11	A06	1	0.40
T12	A02	1	1.00
T13	A01	1	1.00
\.


--
-- Data for Name: titles; Type: TABLE DATA; Schema: public; Owner: gordon
--

COPY titles (title_id, title_name, type, pub_id, pages, price, sales, pubdate, contract) FROM stdin;
T01	1977!	history	P01	107	21.99	566	2000-08-01	1
T02	200 Years of German Humor	history	P03	14	19.95	9566	1998-04-01	1
T03	Ask Your System Administrator	computer	P02	1226	39.95	25667	2000-09-01	1
T04	But I Did It Unconsciously	psychology	P04	510	12.99	13001	1999-05-31	1
T05	Exchange of Platitudes	psychology	P04	201	6.95	201440	2001-01-01	1
T06	How About Never?	biography	P01	473	19.95	11320	2000-07-31	1
T07	I Blame My Mother	biography	P03	333	23.95	1500200	1999-10-01	1
T08	Just Wait Until After School	children	P04	86	10.00	4095	2001-06-01	1
T09	Kiss My Boo-Boo	children	P04	22	13.95	5000	2002-05-31	1
T10	Not Without My Faberge Egg	biography	P01	\N	\N	\N	\N	0
T11	Perhaps It's a Glandular Problem	psychology	P04	826	7.99	94123	2000-11-30	1
T12	Spontaneous, Not Annoying	biography	P01	507	12.99	100001	2000-08-31	1
T13	What Are The Civilian Applications?	history	P03	802	29.99	10467	1999-05-31	1
\.


--
-- Name: authors_au_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_au_id_pkey PRIMARY KEY (au_id);


--
-- Name: employees_emp_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_emp_id_pkey PRIMARY KEY (emp_id);


--
-- Name: empsales_emp_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY empsales
    ADD CONSTRAINT empsales_emp_id_pkey PRIMARY KEY (emp_id);


--
-- Name: hier_emp_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY hier
    ADD CONSTRAINT hier_emp_id_pkey PRIMARY KEY (emp_id);


--
-- Name: publishers_pub_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY publishers
    ADD CONSTRAINT publishers_pub_id_pkey PRIMARY KEY (pub_id);


--
-- Name: roadtrip_seq_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY roadtrip
    ADD CONSTRAINT roadtrip_seq_pkey PRIMARY KEY (seq);


--
-- Name: royalties_title_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY royalties
    ADD CONSTRAINT royalties_title_id_pkey PRIMARY KEY (title_id);


--
-- Name: telephones_au_id_tel_type_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY telephones
    ADD CONSTRAINT telephones_au_id_tel_type_pkey PRIMARY KEY (au_id, tel_type);


--
-- Name: temps_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY temps
    ADD CONSTRAINT temps_id_pkey PRIMARY KEY (id);


--
-- Name: time_series_seq_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY time_series
    ADD CONSTRAINT time_series_seq_pkey PRIMARY KEY (seq);


--
-- Name: title_authors_title_id_au_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY title_authors
    ADD CONSTRAINT title_authors_title_id_au_id_pkey PRIMARY KEY (title_id, au_id);


--
-- Name: titles_title_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gordon; Tablespace: 
--

ALTER TABLE ONLY titles
    ADD CONSTRAINT titles_title_id_pkey PRIMARY KEY (title_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: gordon
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM gordon;
GRANT ALL ON SCHEMA public TO gordon;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

