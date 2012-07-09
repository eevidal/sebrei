--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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

SELECT pg_catalog.setval('cartridge_cartridge_id_seq', 99, true);


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

SELECT pg_catalog.setval('conectivity_conectivity_id_seq', 12, true);


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

SELECT pg_catalog.setval('direct_direct_id_seq', 4, true);


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

SELECT pg_catalog.setval('language_language_id_seq', 14, true);


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

SELECT pg_catalog.setval('paper_paper_id_seq', 10, true);


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
    printer_velocity double precision[],
    printer_velocity_color double precision[],
    printer_quality integer[],
    printer_tagp integer[] NOT NULL,
    printer_price double precision NOT NULL,
    printer_warranty integer,
    printer_capacity_standart integer NOT NULL,
    printer_capacity_total integer NOT NULL,
    printer_capacity_output integer NOT NULL,
    printer_a3 boolean DEFAULT false NOT NULL
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

SELECT pg_catalog.setval('printer_printer_id_seq', 58, true);


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

SELECT pg_catalog.setval('quality_quality_id_seq', 16, true);


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

SELECT pg_catalog.setval('sheet_sheet_id_seq', 34, true);


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
-- Name: tagp; Type: TABLE; Schema: public; Owner: sebrei; Tablespace: 
--

CREATE TABLE tagp (
    tagp_id integer NOT NULL,
    tagp_name character varying NOT NULL,
    tagp_range double precision[] NOT NULL
);


ALTER TABLE public.tagp OWNER TO sebrei;

--
-- Name: tagp_tagp_id_seq; Type: SEQUENCE; Schema: public; Owner: sebrei
--

CREATE SEQUENCE tagp_tagp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagp_tagp_id_seq OWNER TO sebrei;

--
-- Name: tagp_tagp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sebrei
--

ALTER SEQUENCE tagp_tagp_id_seq OWNED BY tagp.tagp_id;


--
-- Name: tagp_tagp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sebrei
--

SELECT pg_catalog.setval('tagp_tagp_id_seq', 4, true);


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

SELECT pg_catalog.setval('users_user_id_seq', 4, true);


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
-- Name: tagp_id; Type: DEFAULT; Schema: public; Owner: sebrei
--

ALTER TABLE ONLY tagp ALTER COLUMN tagp_id SET DEFAULT nextval('tagp_tagp_id_seq'::regclass);


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
5	HP122-(CH561HL)	120	1
7	HP122-(CH562HL)	100	1
8	HP122XL(CH563HL)	480	1
9	HP122XL-(CH564HL)	330	1
10	HP60XL-(CC641WL)	600	1
11	HP60-(CC640WL)	200	1
12	HP564-(CB320WL)	300	1
14	HP564-(CB319WL)	300	1
13	HP564-(CB318WL)	300	1
15	HP564-(CB316WL)	250	1
16	HP675-(CN690AL)	600	1
17	HP675-(CN691AL)	250	1
18	HP126A(CE310A)	1200	1
19	HP126A(CE311A)	1000	1
20	HP126A(CE312A)	1000	1
21	HP126A(CE313A)	1000	1
22	HP901-(CC656AL)	360	1
23	HP901-(CC653AL)	200	1
24	HP901XL-(CC654AL)	700	1
25	HP98-(C9364WL)	420	1
26	HP95-(C8766WL)	330	1
27	HP94-(C8765WL)	500	1
28	HP97-(C9363WL)	560	1
29	HP99-(C9369WL)	100	1
30	HP128A-(CE320A)	2000	1
31	HP128A-(CE321A)	1300	1
32	HP128A-(CE322A)	1300	1
33	HP128A-(CE323A)	1300	1
34	HP920-(CD971AE)	420	1
35	HP920XL-(CD975AE)	1200	1
36	HP920XL-(CD972AE)	700	1
37	HP920XL-(CD973AE)	700	1
38	HP920XL-(CD974AE)	700	1
39	HP507A-(CE400A)	5500	1
40	HP507A-(CE401A)	6000	1
41	HP507A-(CE402A)	6000	1
42	HP507A-(CE403A)	6000	1
43	HP507X-(CE400X)	11000	1
44	HP305A-(CE410A)	2200	1
45	HP305A-(CE411A)	2600	1
46	HP305A-(CE412A)	2600	1
47	HP305A-(CE413A)	2600	1
48	HP305X-(CE410X)	4000	1
49	HP05A-(CE505A)	2300	1
50	HP05X-(CE505X)	6500	1
51	HP05X-(CE505XD)	13000	1
52	HP55A-(CE255A)	6000	1
53	HP55X-(CE255X)	12500	1
56	HP940-(C4903AL)	900	1
57	HP940-(C4904AL)	900	1
58	HP940-(C4905AL)	900	1
54	HP940-(C4902AL)	1000	1
59	HP940-(C4906AE)	2200	1
60	HP940-(C4907AE)	1400	1
61	HP940-(C4908AE)	1400	1
62	HP940-(C4909AE)	1400	1
55	HP950-(CN049AE)	1000	1
63	HP950XL-(CN045AE)	2300	1
64	HP951XL-(CN046AE)	1500	1
65	HP951XL-(CN047AE)	1500	1
66	HP951XL-(CN048AE)	1500	1
67	HP85A-(CE285A)	1600	1
68	HP78A-(CE278A)	2100	1
69	HP647A-(CE260A)	8500	1
70	HP646X-(CE264X)	17000	1
71	HP646A-(CF031A)	12500	1
72	HP646A-(CF032A)	12500	1
73	HP646A-(CF033A)	12500	1
74	HP650A-(CE270A)	13500	1
75	HP650A-(CE271A)	15000	1
76	HP650A-(CE272A)	15000	1
77	HP650A-(CE273A)	15000	1
78	HP16A-(Q7516A)	12000	1
79	HP90A-(CE390A)	10000	1
80	HP90X-(CE390X)	24000	1
81	HP70A-(Q7570A)	15000	1
82	HP43X-(C8543X)	30000	1
83	HP301-(CH561EE)	190	1
84	HP301XL-(CH563EE)	480	1
85	HP301-(CH562EE)	165	1
86	HP301XL-(CH564EE)	330	1
87	TN310BK	2500	4
88	TN310C	1500	4
89	TN310M	1500	4
90	TN310Y	1500	4
91	TN315BK	6000	4
92	TN315C	3500	4
93	TN315M	3500	4
94	TN315Y	3500	4
95	TN-410	1000	4
96	TN-420	1200	4
97	TN-450	2600	4
98	TN-2210	1200	4
99	TN-2220	2600	4
\.


--
-- Data for Name: conectivity; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY conectivity (conectivity_id, conectivity_name) FROM stdin;
3	ethernet
1	usb
4	serial
2	wifi
10	paralelo
11	JDI
12	EIO
\.


--
-- Data for Name: direct; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY direct (direct_id, direct_name) FROM stdin;
1	memory_card
2	usb
3	bluetooth
4	pictbridge
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
9	PML
10	PCL5c
11	Postscript3
12	BasadaEnHost
13	PCL5e
14	BR-Script3
\.


--
-- Data for Name: paper; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY paper (paper_id, paper_name) FROM stdin;
1	fotográfico
2	sobres
3	transparencias
4	etiquetas
5	normal
8	Xerox_4200_20_lb
9	Láser_Hammermill_24_lb
10	Satinado_65_lb
\.


--
-- Data for Name: printer; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY printer (printer_id, printer_model, vendor_id, tecnology_id, type_id, printer_conectivities, printer_direct_con, printer_cartridges, printer_functions, printer_papers, printer_sheet, printer_so, printer_color, printer_duplex, printer_mmdc, printer_vol, printer_tag, printer_link, printer_description, printer_quality_color, printer_valid, printer_languages, printer_memory, printer_lcd, printer_protocols, printer_security_protocols, printer_velocity, printer_velocity_color, printer_quality, printer_tagp, printer_price, printer_warranty, printer_capacity_standart, printer_capacity_total, printer_capacity_output, printer_a3) FROM stdin;
25	LaserJet_Pro_CP1025nw	1	1	2	{3,1,2}	\N	{18,19,20,21}	{1}	{1,2,3,4,5}	{1,3,4,19,20,23,25}	{2,1,3}	t	f	1500	{200,850}	{3,3}	\N	\N	{14}	t	{1}	64	f	{1,4,5}	\N	{16}	{4}	{14}	{3,3}	1600	12	150	150	50	f
28	LaserJet_Enterprise_500_color_M551dn	1	1	1	{3,1}	\N	{39,40,41,42,43}	{1}	{1,2,3,4,5}	{1,3,4,19,20,21,23,24,25,26}	{2,1,3}	t	t	75000	{1500,5000}	{4,4}	\N	\N	{7}	t	{3,10,11}	1024	t	\N	\N	{32}	{32}	{7}	{4,4}	4500	12	500	600	250	f
30	LaserJet_P2055dn	1	1	1	{3,1}	\N	{49,50,51}	{1}	{2,3,4,5}	{1,2,4,19,20,23,25}	{2,1,3}	f	t	50000	{750,3000}	{3,3}	\N	\N	{0}	t	{3,10,11}	128	t	\N	\N	{33}	\N	{7}	{3,3}	2000	12	250	300	150	f
32	LaserJet_Pro_400_color_M475dw_MFP	1	1	2	{3,1,2}	{2}	{44,45,46,47,48}	{1,2,3,4}	{1,2,3,4,5}	{1,3,4,19,20,23,25}	{2,1,3}	t	t	40000	{1000,2500}	{2,3}	\N	\N	{14}	t	{3,10,11}	192	t	\N	\N	{20}	{20}	{14}	{4,4}	6500	12	250	300	150	f
16	Deskjet2050	1	2	2	{1}	\N	{83,84,85,86}	{1,2,4}	{1,2,3,4,5}	{1,3,4,19,20}	{2}	t	f	1000	{250,500}	{1,1}	http://www8.hp.com/ar/es/products/printers/product-detail.html?oid=4122757	Multifunción color a chorro de tinta.	{14}	t	{4}	\N	f	\N	\N	{5.5,20}	{4,16}	{13}	{1,1}	400	12	60	60	25	f
17	Deskjet3050	1	2	2	{1,2}	\N	{5,7,8,9}	{1,2,4}	{1,2,3,4,5}	{1,3,4,19,20}	{2,3}	t	f	1000	{250,500}	{1,1}	\N	\N	{15}	t	{4}	\N	f	\N	\N	{5.5,20}	{4,16}	{14}	{1,1}	470	12	60	60	25	f
19	Photosmart_Plus-B210a	1	2	2	{1,2}	{1}	{12,14,13,15}	{1,2,4}	{1,2,3,4,5}	{1,3,4,20,21}	{2,3}	t	f	1250	{275,500}	{2,2}	\N	\N	{15}	t	{4}	64	t	\N	\N	{8.40000000000000036,32}	{7.5,30}	{14}	{2,2}	650	12	125	125	50	f
20	Officejet4400-K410a	1	2	2	{1}	\N	{16,17}	{1,2,4}	{1,2,3,4,5}	{1,4,24}	{2}	t	f	3000	{350,600}	{1,1}	\N	\N	{15}	t	{4}	16	f	\N	\N	{29}	{23}	{14}	{1,1}	400	12	80	80	15	f
21	LaserJet_Pro_100_color_M175a_MFP	1	1	2	{1}	\N	{18,19,20,21}	{1,2,4}	{1,2,3,4,5}	{1,3,4,19,20,23,25}	{2,1,3}	f	f	20000	{250,950}	{3,3}	\N	\N	{0}	t	{3,10,11}	128	f	\N	\N	{16}	{4}	{14}	{3,3}	2300	12	150	150	50	f
22	Officejet4500Desktop-G510a	1	2	2	{1}	\N	{22,23,24}	{1,2,3,4}	{1,2,3,5}	{1,3,4,19,24,29}	{2,1,3}	t	f	3000	{350,600}	{1,1}	\N	\N	{15}	t	{4,5}	64	t	\N	\N	{6,28}	{4,22}	{14}	{1,1}	480	12	100	100	20	f
23	Officejet100MobileL411a	1	2	3	{1}	{2,3,4}	{25,26,27,28,29}	{1}	{1,2,4,5}	{1,3,19,20,24,25,30,31}	{2,1,3}	t	f	500	{100,500}	{3,3}	\N	\N	{15}	t	{4}	64	f	\N	\N	{5,22}	{3.5,18}	{14}	{3,3}	1740	12	50	50	0	f
24	Officejet_4575_K710a	1	2	2	{1}	\N	{16,17}	{1,2,3,4}	{1,2,3,5}	{1,3,19,24,25,29}	{2}	t	f	3000	{350,600}	{2,2}	\N	\N	{15}	t	{4,5}	\N	t	\N	\N	{6,28}	{4,22}	{14}	{2,2}	800	12	100	100	20	f
33	LaserJetEnterpriseP3015d	1	1	1	{3,1}	{2}	{52,53}	{1}	{2,3,4,5}	{1,3,20,25}	{2,1,3}	f	t	100000	{1500,5000}	{3,3}	\N	\N	{0}	t	{3,11}	128	t	\N	\N	{40}	\N	{7}	{3,3}	2800	12	500	600	250	f
39	LaserJetPro_P1606dn	1	1	1	{3,1}	\N	{68}	{1}	{1,2,3,4,5}	{1,3,4,19,20,23}	{2,1,3}	f	t	8000	{250,2000}	{3,3}	\N	\N	{0}	t	{12,13}	32	f	\N	\N	{25}	\N	{7}	{3,3}	2000	12	250	250	150	f
42	LaserJet_P2035	1	1	1	{1,10}	\N	{49}	{1}	{2,3,4,5}	{1,3,4,19,20,23}	{2,1,3}	f	f	25000	{500,2500}	{2,2}	\N	\N	{0}	t	{12,13}	16	f	\N	\N	{30}	\N	{7}	{2,2}	900	12	250	250	150	f
45	LaserJet_P2035n	1	1	1	{3,1}	\N	{49}	{1}	{2,3,4,5}	{1,3,4,19,20,23}	{2,1,3}	f	f	25000	{500,2500}	{3,3}	\N	\N	{0}	t	{12,13}	16	f	\N	\N	{30}	\N	{7}	{3,3}	1800	12	250	250	150	f
26	LaserJet_Pro_CP1525nw	1	1	1	{3,1,2}	\N	{30,31,32,33}	{1}	{1,2,3,4,5}	{1,3,4,19,20,23,25}	{2,1,3}	t	f	30000	{250,1000}	{3,3}	\N	\N	{14}	t	{3,10,11}	128	t	{1,3}	\N	{12}	{6}	{14}	{3,3}	1980	12	150	150	125	f
29	LaserJet_Pro400_color_M475dn_MFP	1	1	2	{3,1}	{2}	{44,45,46,47,48}	{1,2,3,4}	{1,2,3,4,5}	{1,3,4,19,20,23,25}	{2,1,3}	t	t	40000	{1000,2500}	{4,4}	\N	\N	{14}	t	{3,10,11}	192	t	\N	\N	{20}	{20}	{14}	{4,4}	5900	12	250	300	150	f
31	LaserJetPro_CM1415fnw_MFP	1	1	2	{3,1,2}	{2}	{30,31,32,33}	{1,2,3,4}	{1,2,3,4,5}	{1,3,4,20,25}	{2,1,3}	t	f	30000	{300,1500}	{3,3}	\N	\N	{14}	t	{3,10,11}	160	t	\N	\N	{12}	{8}	{14}	{3,3}	2300	12	150	150	125	f
34	OfficejetPro8000EnterpriseA811a	1	2	1	{3,1}	\N	{56,57,58,54,59,60,61,62}	{1}	{1,2,3,4,5}	{1,3,19,20,23,24,25}	{2,1,3}	f	t	15000	{250,1250}	{1,1}	\N	\N	{0}	t	{2,3,11}	256	t	\N	\N	{15}	{14}	{14}	{1,1}	450	12	250	250	150	f
36	LaserJet_Enterprise_500_color_M551n	1	1	1	{3,1}	{2}	{39,40,41,42,43}	{1}	{2,3,4,5}	{1,3,4,19,20,23,24,25,26}	{2,1,3}	f	f	75000	{1500,5000}	{4,4}	\N	\N	{0}	t	{3,10,11}	1024	f	\N	\N	{32}	{32}	{7}	{4,4}	4000	12	500	600	250	f
37	OfficejetPro_8100_ePrinter_N811aN811d	1	2	1	{3,1,2}	\N	{55,63,64,65,66}	{1}	{1,2,3,4,5}	{1,3,19,20,23,24,25,29}	{2,1,3}	t	t	25000	{250,1250}	{2,2}	\N	\N	{15}	t	{4,5}	128	f	\N	\N	{20,35}	{16,35}	{8}	{2,2}	580	12	250	500	150	f
38	LaserJetPro_P1102w	1	1	1	{1,2}	\N	{67}	{1}	{1,2,3,4,5}	{1,3,4,19,20,23}	{2,1,3}	f	f	5000	{250,1500}	{2,2}	\N	\N	{0}	t	{1}	8	f	\N	\N	{18}	\N	{7}	{2,2}	950	12	150	150	100	f
35	LaserJet_Pro_400_Color_PrinterM45dw	1	1	1	{3,1,2}	\N	{44,45,46,47,48}	{1}	{1,2,3,4,5}	{1,3,4,19,20,23,25}	{2,1,3}	f	t	40000	{750,2000}	{2,3}	\N	\N	{0}	t	{3,10,11}	128	t	\N	\N	{20}	{20}	{14}	{3,3}	2800	12	250	300	150	f
44	LaserJetPro_M1212nf_MFP	1	1	2	{3,1}	\N	{67}	{1,2,3,4}	{2,3,4,5}	{1,3,4,19,23,24,29}	{2,1,3}	f	f	8000	{250,2000}	{2,2}	\N	\N	{0}	t	{12}	64	t	\N	\N	{18}	\N	{7}	{2,2}	900	12	150	150	100	f
46	LaserJetPro_M1536dnf	1	1	2	{3,1}	\N	{68}	{1,2,3,4}	{2,3,4,5}	{1,3,4,19,23,25}	{2,1,3}	f	t	8000	{500,2000}	{3,3}	\N	\N	{0}	t	{2,3,11}	128	t	\N	\N	{25}	\N	{7}	{3,3}	1500	12	250	250	100	f
48	HP_Color_LaserJet_Enterprise_CP5525dn	1	1	1	{3,1}	\N	{74,75,76,77}	{1}	{2,3,4,5}	{1,2,3,4,19,23,25,33}	{2,1,3}	t	t	120000	{2500,10000}	{4,4}	\N	\N	{14}	t	{3,10,11}	1024	t	\N	\N	{30}	{30}	{14}	{4,4}	13000	12	100	850	300	t
27	Officejet_7500A_E910a	1	2	2	{3,1,2}	{1}	{34,35,36,37,38}	{1,2,3,4}	{1,2,3,4,5}	{1,2,3,4,20,28,29,31}	{2}	t	f	7000	{200,800}	{3,3}	\N	\N	{15}	t	{4}	128	t	\N	\N	{10,33}	{7,32}	{14}	{3,3}	1870	12	150	150	100	t
40	LaserJetPro_M1132	1	1	2	{1}	\N	{67}	{1,2,4}	{2,3,4,5}	{1,3,4,19,23,24,29}	{2,1,3}	f	f	8000	{250,2000}	{2,2}	\N	\N	{0}	t	{12}	8	f	\N	\N	{18}	\N	{7}	{2,2}	800	12	150	150	100	f
41	OfficejetPro_8600_N911a	1	2	2	{3,1,2}	{1,2}	{55,63,64,65,66}	{1,2,3,4}	{1,2,4}	{1,3,19,20,23,24,25,29}	{2,1,3}	t	f	25000	{250,1250}	{3,3}	\N	\N	{15}	t	{4,5}	128	t	\N	\N	{18,32}	{13,32}	{8}	{3,3}	1500	12	250	250	150	f
18	Photosmart_D110a	1	2	2	{1,2}	\N	{10,11}	{1,2,4}	{1,2,3,4,5}	{1,3,4,19,20}	{2}	f	f	1000	{250,500}	{2,2}	\N	\N	{0}	t	{4}	64	f	\N	\N	{6,29}	{4,23}	{15}	{2,2}	670	12	80	80	15	f
43	OfficejetPro_8600Plus_N911g	1	2	2	{3,1,2}	{1}	{55,63,64,65,66}	{1,2,3,4,5}	{1,2,4,5}	{1,3,19,20,23,24,25,29}	{2,1,3}	t	t	25000	{250,1250}	{3,3}	\N	\N	{15}	t	{4,5}	128	t	\N	\N	{20,35}	{20,35}	{8}	{3,3}	1400	12	250	250	150	f
49	LaserJet_Enterprise500_M525f_MFP	1	1	2	{3,1}	{2}	{52,53}	{1,2,3,4,5}	{2,3,4,5}	{1,3,4,19,20,23,24,25,26}	{2,1,3}	f	t	75000	{2000,5000}	{3,3}	http://www8.hp.com/ar/es/products/printers/product-detail.html?oid=5118281	Capacidad HP ePrint, Apple AirPrint.\r\nDisco rígido 250GB.	{0}	t	{3,10,11}	1024	t	\N	\N	{40}	\N	{7}	{4,4}	8600	12	100	600	250	f
51	LaserJet_5200tn	1	1	1	{1,10,11,12}	\N	{78}	{1}	{2,3,4,5}	{1,2,5,6}	{2,1,3}	f	f	65000	{2500,10000}	{3,4}	http://www8.hp.com/ar/es/products/printers/product-detail.html?oid=1137942	Memoria expandible a 512MB.\r\nOpcional, disco duro EIO de alto rendimiento de 40 GB HP.	{0}	t	{3,11,13}	64	t	\N	\N	{35}	\N	{7}	{4,4}	13800	12	100	850	250	f
47	Color_LaserJet_Enterprise_CM4540f_MFP	1	1	2	{3,1}	{2}	{69,70,71,72,73}	{1,2,3,4,5}	{2,3,4,5}	{1,3,4,19,20,23,24,25,26}	{2,1,3}	t	t	175000	{5000,9000}	{3,4}	http://h10010.www1.hp.com/wwpc/mx/es/sm/WF06b/18972-18972-3328064-3328083-3328083-4073004-4073011.html	Impresión laser monocromática, copia, escaneo a USB, envío digital, fax y administración avanzada de papel opcional. Volumen de páginas mensuales recomendado de 5000 a 9000.	{14}	t	{3,10,11}	1280	f	\N	\N	{40}	{40}	{14}	{4,4}	20700	12	100	1100	500	f
53	LaserJet_Enterprise_M4555f_MFP	1	1	2	{3,1,12}	{2}	{79,80}	{1,2,3,4,5}	{2,3,4,5}	{1,3,4,19,20,23,24,25,26}	{2,1,3}	f	t	250000	{5000,20000}	{3,5}	http://www8.hp.com/ar/es/products/printers/product-detail.html?oid=4072936	Unidad de disco duro HP Secure de alto rendimiento integrada, estándar (codificación AES-128, Secure Erase).\r\nCapacidad HP ePrint.	{{0}}	t	{3,10,11}	1280	t	\N	\N	{52}	\N	{7}	{4,4}	16800	12	100	1100	500	f
15	Deskjet1000	1	1	1	{1}	\N	{5,7,8,9}	{1}	{1,2,3,4,5}	{1,5,6,19}	{2,3}	t	f	1000	{250,500}	{1,1}	http://www8.hp.com/es/es/products/printers/product-detail.html?oid=4134742	La impresora HP Deskjet 1000 esta diseñada para usuarios domésticos que buscan una impresora en color asequible y fácil de usar, para una impresión diaria fiable y una serie de características de ahorro de recursos	{15}	t	{4}	\N	f	\N	\N	{5.5,16}	{4,12}	{14}	{1,1}	250	12	60	60	20	f
55	LaserJet_M9050_MFP	1	1	2	{10,11,12}	\N	{82}	{1,2,3,4,5}	{2,3,4,5}	{1,2,3,19,23,25,26,33}	{2,1,3}	f	t	300000	{15000,50000}	{5,5}	http://www8.hp.com/ar/es/products/printers/product-detail.html?oid=3644764	Memoria expandible a 512MB.\r\nDisco rígido 80GB.\r\nPantalla táctil.	{{0}}	t	{3,11,13}	384	t	\N	\N	{50}	\N	{7}	{4,4}	67000	12	100	3100	3000	t
54	LaserJet_M5035xs_MFP	1	1	2	{1,11,12}	{2}	{81}	{1,2,3,4,5}	{1,2,3,4,5}	{1,2,3,4,28}	{2,3}	f	t	200000	{3000,12500}	{3,5}	http://www8.hp.com/ar/es/products/printers/product-detail.html?oid=2512317	Memoria expandible a 512MB.\r\nDisco rígido 40GB.	{{0}}	t	{2,3,11}	256	t	\N	\N	{35}	\N	{7}	{4,4}	27500	12	100	2100	250	t
57	HL-2130	4	1	1	{1}	\N	{95}	{1}	{2,5}	{1,3,6,4,20,21,34}	{2,1,3}	f	f	12000	{250,2000}	{1,2,3}	http://www.brother.com.ar/es-AR/Impresoras/54/ProductDetail/HL2130	Su reducido tamaño permite su ubicación sobre cualquier escritorio. Fácil de usar y de sencillo mantenimiento gracias a la carga frontal de los consumibles. Su gran capacidad de entrada de papel (hasta 250 hojas) permite afrontar grandes trabajos sin tener que reemplazar constantemente el papel y con la ranura de alimentación multipropósito, podrás imprimir sobre diferentes tipos de papel: sobres, etiquetas y transparencias cómodamente. Con su alta velocidad de 21 ppm y su tiempo de primera página en tan solo 10 segundos, tendrás tus trabajos impresos en muy poco tiempo y con alta definición gracias a la resolución de impresión HQ1200 (2.400x600ppm). Compatible con Windows, Mac y Linux, la impresora HL-2130 cumple con las normas IRAM asegurando eficiencia energética y un diseño ecológico.	{0}	t	{1}	8	f	\N	\N	{21}	\N	{16}	{1,1}	330	12	250	250	50	f
56	HL-4150CDN	4	1	1	{3,1}	{2}	{87,88,89,90,91,92,93,94}	{1}	{2,4,5,8,9,10}	{1,3,5,4,20,21,34}	{2,3}	t	t	40000	{500,3000}	{1,2,3}	http://www.brother.com.ar/es-AR/Impresoras/54/ProductDetail/HL4150CDN/Specifications-es-AR	La HL-4150CDN es una impresora láser a color de alto rendimiento, ideal para pequeñas empresas o grupos de trabajo. Imprime folletos, presentaciones y otros tipos de documentos con rapidez (hasta 25ppm), y en color brillante. Esta impresora cuenta con interfase integrada y función dúplex automático para imprimir documentos de dos caras para ayudarle a ahorrar papel.	{16}	t	{3,14}	128	t	{1,2,3,4,5,7}	\N	{25}	{25}	{16}	{3,3}	1660	12	250	750	50	f
58	HL-2240	4	1	1	{1}	\N	{98,99}	{1}	{2,5}	{1,3,4,20,21,34}	{2,1,3}	f	f	12000	{250,2000}	{1,2,3}	http://www.brother.com.ar/es-AR/Impresoras/54/ProductDetail/HL2240/Overview-es-AR	Impresora láser compacta para el hogares u oficina. La Brother HL-2240 es una impresora láser monocromática que ofrece una rápida impresión de hasta 24 páginas por minuto e impresiones de alta calidad para la producción de documentos profesionales, como ser: cartas, informes, hojas de cálculo y mucho más. Su elegante y compacto diseño complementa todo ambiente. Además, ofrece un manejo de papel a través de una cómoda y ajustable bandeja de 250 hojas de capacidad. Para ayudar a reducir sus costos operativos, tiene disponible los toners de alto rendimiento.	{0}	t	{1}	8	f	\N	\N	{24}	\N	{7}	{1,1}	450	12	250	250	100	f
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
7	{1200,1200}
8	{1200,600}
13	{900,600}
14	{600,600}
15	{4800,1200}
16	{2400,600}
2	{300,300}
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
21	B6
22	B7
23	C5
24	C6
25	B5(JIS)
26	B6(JIS)
27	B7(JIS)
28	B4
29	hagaki
30	L
31	2L
32	A7
33	B4(JIS)
34	Ejecutivo
\.


--
-- Data for Name: so; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY so (so_id, so_name) FROM stdin;
2	windows
1	linux
3	mac
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
-- Data for Name: tagp; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY tagp (tagp_id, tagp_name, tagp_range) FROM stdin;
1	economica	{0,500}
2	moderado	{400,1000}
3	alto	{900,3000}
4	gran_inversion	{2000,150000}
\.


--
-- Data for Name: tecnology; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY tecnology (tecnology_id, tecnology_name) FROM stdin;
1	laser
4	led
5	impacto
3	tinta_solida
2	inyeccion
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY type (type_id, type_name) FROM stdin;
1	impresora
3	impresora_movil
2	multifuncion
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sebrei
--

COPY users (user_id, user_name, user_real_name, user_pw, email) FROM stdin;
1	erica	erica	0826b5c04738bedcc5ebc17dc643e103	ericavidal@gmail.com
4	matias	matias	090c36e3bb39377468363197afb3e91b	mhbejas@gmail.com
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
-- Name: conectivity_conectivity_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY conectivity
    ADD CONSTRAINT conectivity_conectivity_name_key UNIQUE (conectivity_name);


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
-- Name: function_function_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY function
    ADD CONSTRAINT function_function_name_key UNIQUE (function_name);


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
-- Name: paper_paper_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY paper
    ADD CONSTRAINT paper_paper_name_key UNIQUE (paper_name);


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
-- Name: tagp_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY tagp
    ADD CONSTRAINT tagp_pkey PRIMARY KEY (tagp_id);


--
-- Name: tagp_tagp_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY tagp
    ADD CONSTRAINT tagp_tagp_name_key UNIQUE (tagp_name);


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
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: sebrei; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


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

