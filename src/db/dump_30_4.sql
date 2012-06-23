--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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

--
-- Name: velocity; Type: TYPE; Schema: public; Owner: sebrei
--

CREATE TYPE velocity AS (
	vel integer,
	color boolean
);


ALTER TYPE public.velocity OWNER TO sebrei;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartridge; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE cartridge (
    cartridge_id integer NOT NULL,
    cartridge_name character varying NOT NULL,
    cartridge_duration integer NOT NULL,
    vendor_id integer NOT NULL
);


ALTER TABLE public.cartridge OWNER TO sebrei;

--
-- Name: cartridge_cartridge_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE cartridge_cartridge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cartridge_cartridge_id_seq OWNER TO sebrei;

--
-- Name: cartridge_cartridge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE cartridge_cartridge_id_seq OWNED BY cartridge.cartridge_id;


--
-- Name: cartridge_cartridge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('cartridge_cartridge_id_seq', 9, true);


--
-- Name: cartridge_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE cartridge_vendor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cartridge_vendor_id_seq OWNER TO sebrei;

--
-- Name: cartridge_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE cartridge_vendor_id_seq OWNED BY cartridge.vendor_id;


--
-- Name: cartridge_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('cartridge_vendor_id_seq', 1, false);


--
-- Name: conectivity; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE conectivity (
    conectivity_id integer NOT NULL,
    conectivity_name character varying NOT NULL
);


ALTER TABLE public.conectivity OWNER TO sebrei;

--
-- Name: conectivity_conectivity_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE conectivity_conectivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conectivity_conectivity_id_seq OWNER TO sebrei;

--
-- Name: conectivity_conectivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE conectivity_conectivity_id_seq OWNED BY conectivity.conectivity_id;


--
-- Name: conectivity_conectivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('conectivity_conectivity_id_seq', 9, true);


--
-- Name: direct; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE direct (
    direct_id integer NOT NULL,
    direct_name character varying NOT NULL
);


ALTER TABLE public.direct OWNER TO sebrei;

--
-- Name: direct_direct_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE direct_direct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.direct_direct_id_seq OWNER TO sebrei;

--
-- Name: direct_direct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE direct_direct_id_seq OWNED BY direct.direct_id;


--
-- Name: direct_direct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('direct_direct_id_seq', 2, true);


--
-- Name: function; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE function (
    function_id integer NOT NULL,
    function_name character varying NOT NULL
);


ALTER TABLE public.function OWNER TO sebrei;

--
-- Name: function_function_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE function_function_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.function_function_id_seq OWNER TO sebrei;

--
-- Name: function_function_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE function_function_id_seq OWNED BY function.function_id;


--
-- Name: function_function_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('function_function_id_seq', 5, true);


--
-- Name: language; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE language (
    language_id integer NOT NULL,
    language_name character varying NOT NULL
);


ALTER TABLE public.language OWNER TO sebrei;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_language_id_seq OWNER TO sebrei;

--
-- Name: language_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE language_language_id_seq OWNED BY language.language_id;


--
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('language_language_id_seq', 8, true);


--
-- Name: paper; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE paper (
    paper_id integer NOT NULL,
    paper_name character varying NOT NULL
);


ALTER TABLE public.paper OWNER TO sebrei;

--
-- Name: paper_paper_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE paper_paper_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paper_paper_id_seq OWNER TO sebrei;

--
-- Name: paper_paper_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE paper_paper_id_seq OWNED BY paper.paper_id;


--
-- Name: paper_paper_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('paper_paper_id_seq', 3, true);


--
-- Name: printer; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE printer (
    printer_id integer NOT NULL,
    printer_model character varying NOT NULL,
    vendor_id integer NOT NULL,
    tecnology_id integer NOT NULL,
    type_id integer NOT NULL,
    printer_conectivities integer[] NOT NULL,
    printer_direct_con integer[],
    printer_cartridges integer[],
    printer_functions integer[] NOT NULL,
    printer_papers integer[] NOT NULL,
    printer_sheet integer[] NOT NULL,
    printer_so integer[],
    printer_color boolean NOT NULL,
    printer_duplex boolean NOT NULL,
    printer_mmdc integer NOT NULL,
    printer_vol integer[] NOT NULL,
    printer_tag integer[] NOT NULL,
    printer_link text,
    printer_description text,
    printer_quality_color integer[] NOT NULL,
    printer_valid boolean DEFAULT true NOT NULL,
    printer_languages integer[],
    printer_memory integer,
    printer_lcd boolean,
    printer_protocols integer[],
    printer_security_protocols integer[],
    printer_velocity integer[],
    printer_velocity_color integer[],
    printer_quality integer[]
);


ALTER TABLE public.printer OWNER TO sebrei;

--
-- Name: printer_printer_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE printer_printer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.printer_printer_id_seq OWNER TO sebrei;

--
-- Name: printer_printer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE printer_printer_id_seq OWNED BY printer.printer_id;


--
-- Name: printer_printer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('printer_printer_id_seq', 1, false);


--
-- Name: protocol; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE protocol (
    protocol_id integer NOT NULL,
    protocol_name character varying NOT NULL
);


ALTER TABLE public.protocol OWNER TO sebrei;

--
-- Name: protocol_protocol_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE protocol_protocol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protocol_protocol_id_seq OWNER TO sebrei;

--
-- Name: protocol_protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE protocol_protocol_id_seq OWNED BY protocol.protocol_id;


--
-- Name: protocol_protocol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('protocol_protocol_id_seq', 8, true);


--
-- Name: quality; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE quality (
    quality_id integer NOT NULL,
    quality_name integer[] NOT NULL
);


ALTER TABLE public.quality OWNER TO sebrei;

--
-- Name: quality_quality_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE quality_quality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quality_quality_id_seq OWNER TO sebrei;

--
-- Name: quality_quality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE quality_quality_id_seq OWNED BY quality.quality_id;


--
-- Name: quality_quality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('quality_quality_id_seq', 15, true);


--
-- Name: security_protocol; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE security_protocol (
    security_protocol_id integer NOT NULL,
    security_protocol_name character varying NOT NULL
);


ALTER TABLE public.security_protocol OWNER TO sebrei;

--
-- Name: security_protocol_security_protocol_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE security_protocol_security_protocol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.security_protocol_security_protocol_id_seq OWNER TO sebrei;

--
-- Name: security_protocol_security_protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE security_protocol_security_protocol_id_seq OWNED BY security_protocol.security_protocol_id;


--
-- Name: security_protocol_security_protocol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('security_protocol_security_protocol_id_seq', 4, true);


--
-- Name: sheet; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE sheet (
    sheet_id integer NOT NULL,
    sheet_name character varying NOT NULL
);


ALTER TABLE public.sheet OWNER TO sebrei;

--
-- Name: sheet_sheet_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE sheet_sheet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sheet_sheet_id_seq OWNER TO sebrei;

--
-- Name: sheet_sheet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE sheet_sheet_id_seq OWNED BY sheet.sheet_id;


--
-- Name: sheet_sheet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('sheet_sheet_id_seq', 20, true);


--
-- Name: so; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE so (
    so_id integer NOT NULL,
    so_name character varying NOT NULL
);


ALTER TABLE public.so OWNER TO sebrei;

--
-- Name: so_so_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE so_so_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.so_so_id_seq OWNER TO sebrei;

--
-- Name: so_so_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE so_so_id_seq OWNED BY so.so_id;


--
-- Name: so_so_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('so_so_id_seq', 8, true);


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
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE tag_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_tag_id_seq OWNER TO sebrei;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE tag_tag_id_seq OWNED BY tag.tag_id;


--
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('tag_tag_id_seq', 5, true);


--
-- Name: tecnology; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE tecnology (
    tecnology_id integer NOT NULL,
    tecnology_name character varying NOT NULL
);


ALTER TABLE public.tecnology OWNER TO sebrei;

--
-- Name: tecnology_tecnology_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE tecnology_tecnology_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tecnology_tecnology_id_seq OWNER TO sebrei;

--
-- Name: tecnology_tecnology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE tecnology_tecnology_id_seq OWNED BY tecnology.tecnology_id;


--
-- Name: tecnology_tecnology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('tecnology_tecnology_id_seq', 5, true);


--
-- Name: type; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE type (
    type_id integer NOT NULL,
    type_name character varying NOT NULL
);


ALTER TABLE public.type OWNER TO sebrei;

--
-- Name: type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_type_id_seq OWNER TO sebrei;

--
-- Name: type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE type_type_id_seq OWNED BY type.type_id;


--
-- Name: type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('type_type_id_seq', 3, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO sebrei;

--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('users_user_id_seq', 2, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE users (
    user_id integer DEFAULT nextval('users_user_id_seq'::regclass) NOT NULL,
    user_name character varying(15) NOT NULL,
    user_real_name character varying,
    user_pw text NOT NULL,
    email character varying
)
WITH (autovacuum_enabled=off);


ALTER TABLE public.users OWNER TO sebrei;

--
-- Name: vendor; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE vendor (
    vendor_id integer NOT NULL,
    vendor_name character varying NOT NULL
);


ALTER TABLE public.vendor OWNER TO sebrei;

--
-- Name: vendor_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE vendor_vendor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_vendor_id_seq OWNER TO sebrei;

--
-- Name: vendor_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE vendor_vendor_id_seq OWNED BY vendor.vendor_id;


--
-- Name: vendor_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('vendor_vendor_id_seq', 8, true);


--
-- Name: cartridge_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY cartridge ALTER COLUMN cartridge_id SET DEFAULT nextval('cartridge_cartridge_id_seq'::regclass);


--
-- Name: conectivity_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY conectivity ALTER COLUMN conectivity_id SET DEFAULT nextval('conectivity_conectivity_id_seq'::regclass);


--
-- Name: direct_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY direct ALTER COLUMN direct_id SET DEFAULT nextval('direct_direct_id_seq'::regclass);


--
-- Name: function_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY function ALTER COLUMN function_id SET DEFAULT nextval('function_function_id_seq'::regclass);


--
-- Name: language_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY language ALTER COLUMN language_id SET DEFAULT nextval('language_language_id_seq'::regclass);


--
-- Name: paper_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY paper ALTER COLUMN paper_id SET DEFAULT nextval('paper_paper_id_seq'::regclass);


--
-- Name: printer_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY printer ALTER COLUMN printer_id SET DEFAULT nextval('printer_printer_id_seq'::regclass);


--
-- Name: protocol_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY protocol ALTER COLUMN protocol_id SET DEFAULT nextval('protocol_protocol_id_seq'::regclass);


--
-- Name: quality_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY quality ALTER COLUMN quality_id SET DEFAULT nextval('quality_quality_id_seq'::regclass);


--
-- Name: security_protocol_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY security_protocol ALTER COLUMN security_protocol_id SET DEFAULT nextval('security_protocol_security_protocol_id_seq'::regclass);


--
-- Name: sheet_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY sheet ALTER COLUMN sheet_id SET DEFAULT nextval('sheet_sheet_id_seq'::regclass);


--
-- Name: so_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY so ALTER COLUMN so_id SET DEFAULT nextval('so_so_id_seq'::regclass);


--
-- Name: tag_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY tag ALTER COLUMN tag_id SET DEFAULT nextval('tag_tag_id_seq'::regclass);


--
-- Name: tecnology_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY tecnology ALTER COLUMN tecnology_id SET DEFAULT nextval('tecnology_tecnology_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY type ALTER COLUMN type_id SET DEFAULT nextval('type_type_id_seq'::regclass);


--
-- Name: vendor_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY vendor ALTER COLUMN vendor_id SET DEFAULT nextval('vendor_vendor_id_seq'::regclass);


--
-- Data for Name: cartridge; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY cartridge (cartridge_id, cartridge_name, cartridge_duration, vendor_id) FROM stdin;
1	TN210BK	2200	4
2	TN210Y	1400	4
3	TN210M	1400	4
4	TN210C	1400	4
5	HP122-(CH561HE)	120	1
7	HP122-(CH562HE)	100	1
8	HP122XL(CH563HE)	480	1
9	HP122XL-(CH564HE)	330	1
\.


--
-- Data for Name: conectivity; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY conectivity (conectivity_id, conectivity_name) FROM stdin;
3	ethernet
1	usb
4	serial
2	wifi
\.


--
-- Data for Name: direct; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY direct (direct_id, direct_name) FROM stdin;
1	memory_card
2	usb
\.


--
-- Data for Name: function; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY function (function_id, function_name) FROM stdin;
1	imprimir
2	escanear
3	fax
4	copiar
5	envio digital
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY language (language_id, language_name) FROM stdin;
1	GDI
2	PCL5
3	PCL6
4	PCL3GUI
5	PCL3
6	PCL1
7	PCL4
8	PCL2
\.


--
-- Data for Name: paper; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY paper (paper_id, paper_name) FROM stdin;
1	fotográfico
2	sobres
3	transparencias
\.


--
-- Data for Name: printer; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY printer (printer_id, printer_model, vendor_id, tecnology_id, type_id, printer_conectivities, printer_direct_con, printer_cartridges, printer_functions, printer_papers, printer_sheet, printer_so, printer_color, printer_duplex, printer_mmdc, printer_vol, printer_tag, printer_link, printer_description, printer_quality_color, printer_valid, printer_languages, printer_memory, printer_lcd, printer_protocols, printer_security_protocols, printer_velocity, printer_velocity_color, printer_quality) FROM stdin;
\.


--
-- Data for Name: protocol; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY protocol (protocol_id, protocol_name) FROM stdin;
1	BOOTP
2	ARP
3	RARP
4	DHCP
5	HTTP
6	HTTPS
7	SMTP
8	SSL/TLS
\.


--
-- Data for Name: quality; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY quality (quality_id, quality_name) FROM stdin;
1	{300,600}
2	{300,300}
7	{1200,1200}
8	{1200,600}
13	{900,600}
14	{600,600}
15	{4800,1200}
\.


--
-- Data for Name: security_protocol; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY security_protocol (security_protocol_id, security_protocol_name) FROM stdin;
1	WPA2
3	WEP-128
2	WEP-64
4	WPA-PSK
\.


--
-- Data for Name: sheet; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY sheet (sheet_id, sheet_name) FROM stdin;
1	A4
2	A3
3	A5
5	letter
6	legal
4	B5
19	Sobre DL
20	A6
\.


--
-- Data for Name: so; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY so (so_id, so_name) FROM stdin;
2	windows
1	linux
3	mac
4	Microsoft® Windows® 7
5	Windows Vista®
6	Mac OS X v 10.5
7	Mac OS X v 10.6
8	Windows® XP (SP2)
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY tag (tag_id, tag_name, tag_range) FROM stdin;
4	pyme+	{5000,10000}
1	hogar	{0,500}
2	profesional	{500,1000}
5	corporativo	{10000,2000000}
3	pyme	{1000,5000}
\.


--
-- Data for Name: tecnology; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY tecnology (tecnology_id, tecnology_name) FROM stdin;
1	laser
2	inkjet
3	tinta sólida
4	led
5	impacto
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY type (type_id, type_name) FROM stdin;
1	impresora
2	multifunción
3	impresora móvil
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY users (user_id, user_name, user_real_name, user_pw, email) FROM stdin;
1	erica	erica	0826b5c04738bedcc5ebc17dc643e103	ericavidal@gmail.com
2	regina	regina	9a0f6d5bdb9046789d6a07131a361440	regmuzzu@gmail.com
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY vendor (vendor_id, vendor_name) FROM stdin;
1	HP
2	Canon
3	Epson
4	Brother
5	Lexmark
6	Samsung
7	Konica Minolta
8	Xerox
\.


--
-- Name: cartridge_cartridge_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY cartridge
    ADD CONSTRAINT cartridge_cartridge_name_key UNIQUE (cartridge_name);


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
-- Name: direct_direct_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY direct
    ADD CONSTRAINT direct_direct_name_key UNIQUE (direct_name);


--
-- Name: direct_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY direct
    ADD CONSTRAINT direct_pkey PRIMARY KEY (direct_id);


--
-- Name: function_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY function
    ADD CONSTRAINT function_pkey PRIMARY KEY (function_id);


--
-- Name: language_language_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_language_name_key UNIQUE (language_name);


--
-- Name: language_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- Name: paper_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY paper
    ADD CONSTRAINT paper_pkey PRIMARY KEY (paper_id);


--
-- Name: printer_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY printer
    ADD CONSTRAINT printer_pkey PRIMARY KEY (printer_id);


--
-- Name: printer_printer_model_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY printer
    ADD CONSTRAINT printer_printer_model_key UNIQUE (printer_model);


--
-- Name: protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY protocol
    ADD CONSTRAINT protocol_pkey PRIMARY KEY (protocol_id);


--
-- Name: protocol_protocol_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY protocol
    ADD CONSTRAINT protocol_protocol_name_key UNIQUE (protocol_name);


--
-- Name: quality_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY quality
    ADD CONSTRAINT quality_pkey PRIMARY KEY (quality_id);


--
-- Name: quality_quality_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY quality
    ADD CONSTRAINT quality_quality_name_key UNIQUE (quality_name);


--
-- Name: security_protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY security_protocol
    ADD CONSTRAINT security_protocol_pkey PRIMARY KEY (security_protocol_id);


--
-- Name: security_protocol_security_protocol_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY security_protocol
    ADD CONSTRAINT security_protocol_security_protocol_name_key UNIQUE (security_protocol_name);


--
-- Name: sheet_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY sheet
    ADD CONSTRAINT sheet_pkey PRIMARY KEY (sheet_id);


--
-- Name: sheet_sheet_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY sheet
    ADD CONSTRAINT sheet_sheet_name_key UNIQUE (sheet_name);


--
-- Name: so_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY so
    ADD CONSTRAINT so_pkey PRIMARY KEY (so_id);


--
-- Name: so_so_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY so
    ADD CONSTRAINT so_so_name_key UNIQUE (so_name);


--
-- Name: tag_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


--
-- Name: tag_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_tag_name_key UNIQUE (tag_name);


--
-- Name: tecnology_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY tecnology
    ADD CONSTRAINT tecnology_pkey PRIMARY KEY (tecnology_id);


--
-- Name: tecnology_tecnology_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY tecnology
    ADD CONSTRAINT tecnology_tecnology_name_key UNIQUE (tecnology_name);


--
-- Name: type_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY type
    ADD CONSTRAINT type_pkey PRIMARY KEY (type_id);


--
-- Name: type_type_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY type
    ADD CONSTRAINT type_type_name_key UNIQUE (type_name);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (vendor_id);


--
-- Name: vendor_vendor_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY vendor
    ADD CONSTRAINT vendor_vendor_name_key UNIQUE (vendor_name);


--
-- Name: cartridge_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY cartridge
    ADD CONSTRAINT cartridge_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id) ON UPDATE RESTRICT;


--
-- Name: printer_tecnology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY printer
    ADD CONSTRAINT printer_tecnology_id_fkey FOREIGN KEY (tecnology_id) REFERENCES tecnology(tecnology_id) ON UPDATE RESTRICT;


--
-- Name: printer_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY printer
    ADD CONSTRAINT printer_type_id_fkey FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT;


--
-- Name: printer_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY printer
    ADD CONSTRAINT printer_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id) ON UPDATE RESTRICT;


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

