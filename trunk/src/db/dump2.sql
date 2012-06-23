--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartridge; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE cartridge (
    cartridge_id integer NOT NULL,
    cartridge_name character varying NOT NULL,
    cartridge_duration integer
);


ALTER TABLE public.cartridge OWNER TO sebrei;

--
-- Name: conectivity; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE conectivity (
    conectivity_id integer NOT NULL,
    conectivity_name character varying(45) NOT NULL
);


ALTER TABLE public.conectivity OWNER TO sebrei;

--
-- Name: functions; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE functions (
    functions_id integer NOT NULL,
    functions_name character varying(45) NOT NULL
);


ALTER TABLE public.functions OWNER TO sebrei;

--
-- Name: papers; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE papers (
    papers_id integer NOT NULL,
    papers_name character varying NOT NULL
);


ALTER TABLE public.papers OWNER TO sebrei;

--
-- Name: quality; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE quality (
    quality_id integer NOT NULL,
    quality_name character varying NOT NULL
);


ALTER TABLE public.quality OWNER TO sebrei;

--
-- Name: sheet; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE sheet (
    sheet_id integer NOT NULL,
    sheet_name character varying NOT NULL
);


ALTER TABLE public.sheet OWNER TO sebrei;

--
-- Name: so; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE so (
    so_id integer NOT NULL,
    so_name character varying NOT NULL
);


ALTER TABLE public.so OWNER TO sebrei;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE tag (
    tag_id integer NOT NULL,
    tag_name character varying NOT NULL,
    tag_range integer[] NOT NULL
);


ALTER TABLE public.tag OWNER TO sebrei;

--
-- Name: tecnology; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE tecnology (
    tecnology_id integer NOT NULL,
    tecnology_name character varying NOT NULL
);


ALTER TABLE public.tecnology OWNER TO sebrei;

--
-- Name: type; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE type (
    type_id integer NOT NULL,
    type_name character varying(45) NOT NULL
);


ALTER TABLE public.type OWNER TO sebrei;

--
-- Name: users; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    user_name character varying(15) NOT NULL,
    user_real_name character varying,
    user_pw path NOT NULL
);


ALTER TABLE public.users OWNER TO sebrei;

--
-- Name: velocity; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE velocity (
    velocity_id integer NOT NULL,
    velocity_name character varying NOT NULL
);


ALTER TABLE public.velocity OWNER TO sebrei;

--
-- Name: vendors; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE vendors (
    vendors_id integer NOT NULL,
    vendors_name character varying NOT NULL
);


ALTER TABLE public.vendors OWNER TO sebrei;

--
-- Data for Name: cartridge; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY cartridge (cartridge_id, cartridge_name, cartridge_duration) FROM stdin;



--
-- Data for Name: conectivity; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY conectivity (conectivity_id, conectivity_name) FROM stdin;



--
-- Data for Name: functions; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY functions (functions_id, functions_name) FROM stdin;
\.


--
-- Data for Name: papers; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY papers (papers_id, papers_name) FROM stdin;
\.


--
-- Data for Name: quality; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY quality (quality_id, quality_name) FROM stdin;
\.


--
-- Data for Name: sheet; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY sheet (sheet_id, sheet_name) FROM stdin;
\.


--
-- Data for Name: so; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY so (so_id, so_name) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY tag (tag_id, tag_name, tag_range) FROM stdin;
\.


--
-- Data for Name: tecnology; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY tecnology (tecnology_id, tecnology_name) FROM stdin;
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY type (type_id, type_name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY users (user_id, user_name, user_real_name, user_pw) FROM stdin;
\.


--
-- Data for Name: velocity; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY velocity (velocity_id, velocity_name) FROM stdin;
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY vendors (vendors_id, vendors_name) FROM stdin;
\.


--
-- Name: cartridge_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY cartridge
    ADD CONSTRAINT cartridge_pkey PRIMARY KEY (cartridge_id);


--
-- Name: conectivity_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY conectivity
    ADD CONSTRAINT conectivity_pkey PRIMARY KEY (conectivity_id);


--
-- Name: functions_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY functions
    ADD CONSTRAINT functions_pkey PRIMARY KEY (functions_id);


--
-- Name: papers_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (papers_id);


--
-- Name: quality_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY quality
    ADD CONSTRAINT quality_pkey PRIMARY KEY (quality_id);


--
-- Name: sheet_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY sheet
    ADD CONSTRAINT sheet_pkey PRIMARY KEY (sheet_id);


--
-- Name: so_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY so
    ADD CONSTRAINT so_pkey PRIMARY KEY (so_id);


--
-- Name: tag_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


--
-- Name: tecnology_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY tecnology
    ADD CONSTRAINT tecnology_pkey PRIMARY KEY (tecnology_id);


--
-- Name: type_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY type
    ADD CONSTRAINT type_pkey PRIMARY KEY (type_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: velocity_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY velocity
    ADD CONSTRAINT velocity_pkey PRIMARY KEY (velocity_id);


--
-- Name: vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (vendors_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

