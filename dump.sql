--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE restaurant;




--
-- Drop roles
--

DROP ROLE root;


--
-- Roles
--

CREATE ROLE root;
ALTER ROLE root WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:r8n0aw64dJxKuYU/lJCtJQ==$RHEndNOxHP2t7pSoUjDtwUgMyXvWdfSQ1lj3+FxvUkg=:LYzOz+Wcl8Ce/xH2ms6UXxOZkfTrYmvYKsWoggDF1t4=';

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump complete
--

--
-- Database "restaurant" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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

--
-- Name: restaurant; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE restaurant WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE restaurant OWNER TO root;

\connect restaurant

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
-- Name: article; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.article (
    idarticle integer NOT NULL,
    idcategorie integer,
    nom character varying(100) NOT NULL,
    description character varying(500),
    prix double precision,
    visibilite boolean,
    "position" integer NOT NULL
);


ALTER TABLE public.article OWNER TO root;

--
-- Name: article_idarticle_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.article_idarticle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_idarticle_seq OWNER TO root;

--
-- Name: article_idarticle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.article_idarticle_seq OWNED BY public.article.idarticle;


--
-- Name: categorie; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.categorie (
    idcategorie integer NOT NULL,
    nom character varying(100) NOT NULL,
    visibilite boolean,
    "position" integer NOT NULL
);


ALTER TABLE public.categorie OWNER TO root;

--
-- Name: categorie_idcategorie_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.categorie_idcategorie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorie_idcategorie_seq OWNER TO root;

--
-- Name: categorie_idcategorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.categorie_idcategorie_seq OWNED BY public.categorie.idcategorie;


--
-- Name: commande; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.commande (
    idcommande integer NOT NULL,
    numtable integer NOT NULL,
    status integer NOT NULL,
    commentaire character varying(500)
);


ALTER TABLE public.commande OWNER TO root;

--
-- Name: commande_idcommande_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.commande_idcommande_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_idcommande_seq OWNER TO root;

--
-- Name: commande_idcommande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.commande_idcommande_seq OWNED BY public.commande.idcommande;


--
-- Name: detailscommande; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.detailscommande (
    iddetailscommande integer NOT NULL,
    idcommande integer,
    idarticle integer NOT NULL,
    idquantite integer NOT NULL
);


ALTER TABLE public.detailscommande OWNER TO root;

--
-- Name: detailscommande_iddetailscommande_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.detailscommande_iddetailscommande_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detailscommande_iddetailscommande_seq OWNER TO root;

--
-- Name: detailscommande_iddetailscommande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.detailscommande_iddetailscommande_seq OWNED BY public.detailscommande.iddetailscommande;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tables (
    idtable integer NOT NULL,
    nom character varying(10) NOT NULL,
    url character varying(50)
);


ALTER TABLE public.tables OWNER TO root;

--
-- Name: tables_idtable_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tables_idtable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_idtable_seq OWNER TO root;

--
-- Name: tables_idtable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tables_idtable_seq OWNED BY public.tables.idtable;


--
-- Name: article idarticle; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.article ALTER COLUMN idarticle SET DEFAULT nextval('public.article_idarticle_seq'::regclass);


--
-- Name: categorie idcategorie; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categorie ALTER COLUMN idcategorie SET DEFAULT nextval('public.categorie_idcategorie_seq'::regclass);


--
-- Name: commande idcommande; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.commande ALTER COLUMN idcommande SET DEFAULT nextval('public.commande_idcommande_seq'::regclass);


--
-- Name: detailscommande iddetailscommande; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.detailscommande ALTER COLUMN iddetailscommande SET DEFAULT nextval('public.detailscommande_iddetailscommande_seq'::regclass);


--
-- Name: tables idtable; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tables ALTER COLUMN idtable SET DEFAULT nextval('public.tables_idtable_seq'::regclass);


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.article (idarticle, idcategorie, nom, description, prix, visibilite, "position") FROM stdin;
2	1	ONION RINGS	Oignons frits, sauce BBQ	11	t	2
3	1	NACHOS DU PUB	Tortillas chips recouvertes de sauce au Cheddar fondu, coriandre, guacamole, sauce salsa	12	t	3
4	1	WINTER POUTINE	Frites, sauce Cheddar - moutarde à l'ancienne, oignons frits, herbes fraîches	12	t	4
5	1	CRISPY CHICKEN	Poulet Croustillant, sauce BBQ	11	t	5
6	1	BEIGNETS DE CALAMARS A LA ROMAINE	Sauce tartare	11	t	6
7	1	PLANCHE CHARCUTERIES FROMAGES	Assortiment de charcuteries et fromages	11	t	7
8	1	ASSORTIMENT DE FINGER FOOD	Cheddar sticks, calamars à la romaine, onion rings, frites, tortillas chips, guacamole	11	t	8
9	1	INDIAN PLATTER	Cheese naan, crispy chicken, onion rings, veggie balls, sauce yaourt grec-curry, caviar d'aubergine, frites aromatisées aux épices indiennes	11	t	9
10	1	CHEESY PLATTER	Cheddar sticks, croustillants de Camembert, spicy Cheddar potatoes, Chèvres panés au romarin, frites sauce Cheddar, sauce BBQ	11	t	10
11	1	PULLED PORK ROLL	Tortillas, pulled pork, Cheddar, sauce Cheddar	11	t	11
12	2	QUEEN VICTORIA	Lardons, œuf poché, croûtons, pommes grenaille, mesclun, vinaigrette balsamique	12	t	1
13	2	WINTER DETOX	Boulgour, Feta AOP, veggie balls, betterave, edamame, mangue avocat, pousses d'épinard, menthe fraîche, coriandre, vinaigrette citron-miel	11	t	2
14	2	CÆSAR CRISPY CHICKEN	Poulet croustillant, Grana Padano AOP, croûtons, romaine, sauce Cæsar	11	t	3
15	2	DUCK FACE SALAD	Magret de canard fumé, poire, Bleu d'Auvergne, pommes grenaille, noix, endives, mesclun, vinaigrette balsamique	12	t	4
16	2	CAMEMBERT CHAUD	Croustillants de Camembert chaud, poitrine fumée, pommes grenaille, noix, mesclun, vinaigrette balsamique	18	t	5
18	3	FISH & CHIPS (issu de la pêche responsable)	Filet de cabillaud frit, sauce tartare, frites	11	t	2
19	3	CURRY D'AGNEAU	Sauté d'agneau, sauce curry, riz basmati	11	t	3
20	3	WELSH ROYAL	Cheddar fondu à la bière, jambon blanc, pain, moutarde, œuf au plat, frites	12	t	4
21	3	PLANCHE CAMEMBERT LOVERS	Demi Camembert rôti, demi croque Camembert, petite salade de Camembert chaud, frites	12	t	5
22	3	PARMENTIER PULLED PORK	Pulled pork, purée de pommes de terre	11	t	6
23	3	DOS DE CABILLAUD	Légumes d'hiver, sauce coco citronnelle, riz basmati	12	t	7
24	3	ENTRECÔTE	Pièce de bœuf de 250g environ, goûteuse et persillée	12	t	8
25	3	TARTARE DE BOEUF	Viande hachée de bœuf de 180g environ	11	t	9
26	3	STEAK À CHEVAL AU BUREAU	Steak haché de bœuf, œuf au plat, galette de pommes de terre, sauce béarnaise	11	t	10
27	3	STEAK SURPRISE	Pièce de bœuf marinée de 200g environ	12	t	11
28	3	TRAVERS DE PORC MARINES	Pièce de 340g environ, sauce BBQ	18	t	12
29	3	DEMI MAGRET DE CANARD	Pièce de 180g environ, poêlée de champignons, purée de pommes de terre	12	t	13
30	3	BROCHETTE DE POULET MARINE	Pièce de 250g environ, marinade curry - gingembre - coriandre - citron vert	12	t	14
31	4	FLAM' GRATINÉE	Lardons, oignons, Emmental, crème fraîche	11	t	1
32	4	FLAM' ROYALE	Jambon blanc, champignons de paris, œuf au plat, Cheddar, moutarde à l'ancienne, compotée d'oignons, crème fraîche	11	t	2
33	4	FLAM' CHEVRE MIEL	Chèvre, miel, pousses d'épinard, noix, oignons rouges, piment d'Espelette AOP, roquette, Emmental, crème fraîche	11	t	3
34	4	FLAM' CHAMPI	Champignons, pousses d'épinard, lardons, Emmental, compotée d'oignons, crème moutarde à l'ancienne	11	t	4
35	4	CROQUE CAMEMBERT	Camembert, bacon crispy, crème Ricotta-moutarde, compotée d'oignons, pain de campagne gratiné au fromage	11	t	5
36	4	LE VERITABLE CROQUE ROULE	Jambon blanc, Emmental, béchamel	11	t	6
37	4	CROQUE VEGGIE	Artichaut, tomates confites, caviar d'aubergine, crémeux Ricotta, échalotes confites, pesto, roquette, pain de campagne gratiné au fromage	11	t	7
38	5	ORIGINAL AU BUREAU BURGER	Steak haché de bœuf, poitrine fumée, Cheddar, oignons rouges, salade, sauce burger, bun's	11	t	1
39	5	ROYAL POTATOES	Steak haché de bœuf, œuf au plat, galettes de pommes de terre, Cheddar, oignons rouges, salade, sauce burger	12	t	2
40	5	BLACK PEPPER	Steak haché de bœuf, Cheddar, poitrine fumée, compotée d'oignons rouges, sauce au poivre, oignons rouges, salade, bun's noir au poivre	11	t	3
41	5	BURGER VEGGIE	Galette de pommes de terre, poêlée de champignons, onion rings, œuf au plat, oignons frits, compotée d'oignons rouges, sauce burger, bun's	12	t	4
42	5	EMPIRE STATE BURGER	Double steak haché de bœuf, galette de pommes de terre, double Cheddar, poitrine fumée, œuf au plat, oignons rouges, salade, sauce burger, bun's	12	t	5
43	5	BURGER COMTE	Steak haché de bœuf, Comté AOP, poitrine fumée, galette de pommes de terre, compotée d'oignons rouges, salade, sauce moutarde Savora®, bun's	11	t	6
44	6	BANANA NOCCIOLATA BUN'S	Bun's feuilleté, banane, Nocciolata®, noisettes caramélisées	11	t	1
45	6	BROOKIE DU BOSS	Moitié cookie - Moitié brownie, crème glacée vanille	11	t	2
46	6	MOELLEUX CHOCOLAT	Crème glacée vanille, crème fouettée	11	t	3
47	6	TIRAMISU CHOCO NOISETTE	Tout est dans le titre	11	t	4
49	6	GIANT PROFITEROLE DU PUB	Bun's brioché, crème glacée vanille, crème fouettée, sauce au chocolat	11	t	6
50	6	TRIFLE MANGUE	Crème pâtissière, biscuit cuillère, morceaux ananas et mangue, purée de passion	11	t	7
51	6	LEMON CURD CHEESECAKE	Crème au citron, cheesecake, spéculoos, meringue italienne	11	t	8
52	6	CRÊPE AU BUREAU	Nocciolata®, copeaux de chocolat, crème glacée vanille, sauce au chocolat, amandes effilées, crème fouettée	11	t	9
53	6	CREAMY CRUNCHY	Crèmes glacées vanille, nougat, caramel, sauce au chocolat, noisettes caramélisées, crème fouettée	11	t	10
1	1	CHEDDAR STICKS	Sticks de Cheddar panés, sauce BBQ	6	t	1
54	6	COCO CHUNK	Crèmes glacées noix de coco, chocolat noir, vanille, sauce au chocolat, Crunch®, crème fouettée	11	t	11
55	6	ET PAF !	Crèmes glacées chocolat noir, chocolat au lait, chocolat blanc, Chocapic®, sauce au chocolat, crème fouettée	11	t	12
56	6	MANGO SHOW	Sorbet plein fruit mangue et cassis, crème glacée vanille, crumble peanut, crème fouettée	11	t	13
57	6	DETOX & VOUS	Sorbets plein fruit citron vert, fruit de la passion, framboise, coulis de fruits rouges, meringue, crème fouettée	11	t	14
58	6	BASIC FIT	Crèmes glacées pistache, chocolat au lait, sauce au chocolat, Mikado®, crème fouettée	11	t	15
59	7	BUD (5°)	Arômes de miel et une touche de citron, ponctué de notes de malt et de houblon	5	t	1
60	7	HOEGAARDEN BLANCHE (4,9°)	Rafraîchissante et légère grâce à son mélange d'écorce d'orange, de coriandre et d'épices	5	t	2
61	7	LEFFE BLONDE (6,6°)	Bière aux saveurs subtiles et aux nuances douces de vanille et clous de girofle	5	t	3
62	7	LEFFE RUBY (5°)	Bière rafraîchissante aux arômes de fruits rouges et de bois de rose	5	t	4
63	7	TRIPEL KARMELIET (8,4°)	Bière belge aux arômes fruités d'agrumes et notes vanillées	5	t	5
64	7	GINETTE LAGER (4,5°)	Bière blonde bio rafraîchissante, aux arômes d'agrumes et de fruits	5	t	6
65	7	CORONA (4,5°)	Rafraîchissante aux arôme de citron	5	t	7
66	7	CUBANISTO (5,9°)	Aromatisée au rhum et aux agrumes	5	t	8
67	7	LEFFE 0.0 (0,0°)	Notes complexes d'épices et de vanille	5	t	9
68	8	LYNCHBURG LEMONADE	Whiskey Jack Daniel's Old n°7, liqueur triple sec, jus de citron vert, limonade	9	t	1
69	8	CLASSIC SPRITZ	Aperol, Martini Prosecco, Perrier, orange",7,True,2\r\n112,31,"SEX ON THE BEACH","Vodka Eristoff, liqueur de melon, nectar d’ananas, boisson cranberry	9	t	2
70	8	DARK & STORMY	Rhum Bacardi Spiced, jus de citron vert, sirop de gingembre et vanille, ginger beer français et bio La French	9	t	3
71	8	PINA COLADA	Rhum Bacardi Carte Oro, purée de coco, nectar d'ananas	9	t	4
72	8	PORNSTAR MARTINI	Vodka Eristoff, liqueur et purée de fruits de la passion, sirop de vanille, Martini Prosecco	9	t	5
73	8	CARIBEAN MARGARITA	Tequile El Jimador, liqueur triple sec, jus de citron vert, purée de passion, nectar de mangue	9	t	6
74	8	CAÏPIRINHA	Cachaça, citron vert, sucre	9	t	7
75	8	ORIGINAL MOJITO	Rhum Bacardi Carta Oro, citron vert, sucre de canne, menthe fraîche, Perrier	9	t	8
76	8	MOJITO SNOW	Rhum Bacardi Carta Oro, Chartreuse verte, sirop de gingembre, citron vert, menthe fraîche, Perrier	9	t	9
77	8	FRUITY MOJITO	Rhum Bacardi Carta Oro, citron vert, sucre de canne, menthe fraîche, Perrier, purée de framboise, ou de passion, ou de fraise	9	t	10
78	9	COCA-COLA, COCA-COLA SANS SUCRES, COCA-COLA CHERRY (33cl)		5	t	1
79	9	FUZE TEA THE PECHE, THE VERT MANGUE (25cl)		5	t	2
80	9	SPRITE (33cl)		5	t	3
81	9	SCHWEPPES INDIAN TONIC (25cl)		5	t	4
82	9	SCHWEPPES AGRUMES, LEMON (25cl)		5	t	5
83	9	ORANGINA (25cl)		5	t	6
84	9	OASIS TROPICAL (25cl)		5	t	7
85	9	PERRIER (33cl)		5	t	8
86	9	RED BULL ENERGY DRINK (25cl)		5	t	9
87	9	RED BULL SUGER FREE (25cl)		5	t	10
88	9	PUR JUS DE FRUITS PAGO (20cl)		5	t	11
48	6	APPLE CRUMBLE	Crumble pomme, Carambar®, crème glacée vanille	9	t	5
17	3	CAMEMBERT RÔTI	Camembert entier rôti, charcuteries, pommes grenaille, salade	14	t	1
\.


--
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.categorie (idcategorie, nom, visibilite, "position") FROM stdin;
1	Les entrées	t	1
2	Salades	t	2
3	Les plats de résistance	t	3
4	Les flammekueches et croques	t	4
5	Les burgers	t	5
6	Les desserts	t	6
7	Les bières	t	7
8	Les cocktails	t	8
9	Les softs	t	9
\.


--
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.commande (idcommande, numtable, status, commentaire) FROM stdin;
42	5	2	
44	9	2	
43	5	2	
45	9	2	
48	8	2	
47	12	2	
46	3	2	
49	8	2	
50	8	2	
51	5	2	
52	5	2	
53	12	2	
56	8	2	
54	5	2	
55	12	2	
57	17	2	
58	12	2	
59	5	2	
60	7	2	
64	10	2	
63	9	2	
62	3	2	
61	16	2	
65	2	2	
66	4	2	
67	14	2	
69	13	2	
71	9	2	
68	7	2	
70	13	2	
73	12	2	
72	7	2	
\.


--
-- Data for Name: detailscommande; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.detailscommande (iddetailscommande, idcommande, idarticle, idquantite) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tables (idtable, nom, url) FROM stdin;
276	table1	https://2me.nu/MTM=
277	table2	https://2me.nu/MTQ=
278	table3	https://2me.nu/MTU=
279	table4	https://2me.nu/MTY=
280	table5	https://2me.nu/MTc=
281	table6	https://2me.nu/MTg=
282	table7	https://2me.nu/MTk=
283	table8	https://2me.nu/MjA=
284	table9	https://2me.nu/MjE=
\.


--
-- Name: article_idarticle_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.article_idarticle_seq', 88, true);


--
-- Name: categorie_idcategorie_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.categorie_idcategorie_seq', 9, true);


--
-- Name: commande_idcommande_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.commande_idcommande_seq', 73, true);


--
-- Name: detailscommande_iddetailscommande_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.detailscommande_iddetailscommande_seq', 245, true);


--
-- Name: tables_idtable_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tables_idtable_seq', 284, true);


--
-- Name: article article_nom_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_nom_key UNIQUE (nom);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (idarticle);


--
-- Name: categorie categorie_nom_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_nom_key UNIQUE (nom);


--
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (idcategorie);


--
-- Name: categorie categorie_position_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_position_key UNIQUE ("position");


--
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (idcommande);


--
-- Name: detailscommande detailscommande_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.detailscommande
    ADD CONSTRAINT detailscommande_pkey PRIMARY KEY (iddetailscommande);


--
-- Name: tables tables_nom_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_nom_key UNIQUE (nom);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (idtable);


--
-- Name: tables tables_url_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_url_key UNIQUE (url);


--
-- Name: article article_idcategorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_idcategorie_fkey FOREIGN KEY (idcategorie) REFERENCES public.categorie(idcategorie) ON DELETE CASCADE;


--
-- Name: detailscommande detailscommande_idarticle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.detailscommande
    ADD CONSTRAINT detailscommande_idarticle_fkey FOREIGN KEY (idarticle) REFERENCES public.article(idarticle);


--
-- Name: detailscommande detailscommande_idcommande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.detailscommande
    ADD CONSTRAINT detailscommande_idcommande_fkey FOREIGN KEY (idcommande) REFERENCES public.commande(idcommande) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

