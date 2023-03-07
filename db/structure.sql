--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: aditya
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO aditya;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: aditya
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    date_of_birth date,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.authors OWNER TO aditya;

--
-- Name: authors_books; Type: TABLE; Schema: public; Owner: aditya
--

CREATE TABLE public.authors_books (
    author_id bigint NOT NULL,
    book_id bigint NOT NULL
);


ALTER TABLE public.authors_books OWNER TO aditya;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: aditya
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO aditya;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aditya
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: aditya
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    name character varying,
    price numeric(6,2),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    author_id bigint NOT NULL
);


ALTER TABLE public.books OWNER TO aditya;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: aditya
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO aditya;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aditya
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: aditya
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    title character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO aditya;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: aditya
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO aditya;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aditya
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: aditya
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO aditya;

--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: aditya
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-03-07 08:28:08.966454	2023-03-07 08:28:08.966454
schema_sha1	ba19630d691d3d9c0246b5cbab85731baf227848	2023-03-07 08:28:08.976975	2023-03-07 08:28:08.976975
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: aditya
--

COPY public.authors (id, first_name, last_name, date_of_birth, email, created_at, updated_at) FROM stdin;
1	aditya1	kansara5	2001-11-01	aditya0.k@simformsolutions.com	2023-03-07 08:28:35.747958	2023-03-07 08:28:35.747958
2	aditya2	kansara6	2001-11-01	aditya1.k@simformsolutions.com	2023-03-07 08:28:35.750634	2023-03-07 08:28:35.750634
3	aditya3	kansara7	2001-11-01	aditya2.k@simformsolutions.com	2023-03-07 08:28:35.75272	2023-03-07 08:28:35.75272
4	aditya4	kansara8	2001-11-01	aditya3.k@simformsolutions.com	2023-03-07 08:28:35.754756	2023-03-07 08:28:35.754756
5	aditya5	kansara9	2001-11-01	aditya4.k@simformsolutions.com	2023-03-07 08:28:35.756821	2023-03-07 08:28:35.756821
6	aditya6	kansara10	2001-11-01	aditya5.k@simformsolutions.com	2023-03-07 08:28:35.758833	2023-03-07 08:28:35.758833
7	aditya7	kansara11	2001-11-01	aditya6.k@simformsolutions.com	2023-03-07 08:28:35.760868	2023-03-07 08:28:35.760868
8	aditya8	kansara12	2001-11-01	aditya7.k@simformsolutions.com	2023-03-07 08:28:35.762899	2023-03-07 08:28:35.762899
9	aditya9	kansara13	2001-11-01	aditya8.k@simformsolutions.com	2023-03-07 08:28:35.771096	2023-03-07 08:28:35.771096
10	aditya10	kansara14	2001-11-01	aditya9.k@simformsolutions.com	2023-03-07 08:28:35.77358	2023-03-07 08:28:35.77358
11	aditya11	kansara15	2001-11-01	aditya10.k@simformsolutions.com	2023-03-07 08:28:35.776204	2023-03-07 08:28:35.776204
12	aditya12	kansara16	2001-11-01	aditya11.k@simformsolutions.com	2023-03-07 08:28:35.779303	2023-03-07 08:28:35.779303
13	aditya13	kansara17	2001-11-01	aditya12.k@simformsolutions.com	2023-03-07 08:28:35.781373	2023-03-07 08:28:35.781373
14	aditya14	kansara18	2001-11-01	aditya13.k@simformsolutions.com	2023-03-07 08:28:35.783597	2023-03-07 08:28:35.783597
15	aditya15	kansara19	2001-11-01	aditya14.k@simformsolutions.com	2023-03-07 08:28:35.785847	2023-03-07 08:28:35.785847
\.


--
-- Data for Name: authors_books; Type: TABLE DATA; Schema: public; Owner: aditya
--

COPY public.authors_books (author_id, book_id) FROM stdin;
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: aditya
--

COPY public.books (id, name, price, created_at, updated_at, author_id) FROM stdin;
1	aditya	123.30	2023-03-07 08:28:35.799287	2023-03-07 08:28:35.799287	1
2	aditya	123.31	2023-03-07 08:28:35.802022	2023-03-07 08:28:35.802022	2
3	aditya	123.32	2023-03-07 08:28:35.804235	2023-03-07 08:28:35.804235	3
4	aditya	123.33	2023-03-07 08:28:35.806249	2023-03-07 08:28:35.806249	4
5	aditya	123.34	2023-03-07 08:28:35.808553	2023-03-07 08:28:35.808553	5
6	aditya5	120.30	2023-03-07 08:29:58.026979	2023-03-07 08:29:58.026979	1
7	aditya6	121.31	2023-03-07 08:29:58.032001	2023-03-07 08:29:58.032001	2
8	aditya7	122.32	2023-03-07 08:29:58.03633	2023-03-07 08:29:58.03633	3
9	aditya8	123.33	2023-03-07 08:29:58.040523	2023-03-07 08:29:58.040523	4
10	aditya9	124.34	2023-03-07 08:29:58.044843	2023-03-07 08:29:58.044843	5
11	aditya10	125.35	2023-03-07 08:29:58.049221	2023-03-07 08:29:58.049221	6
12	aditya11	126.36	2023-03-07 08:29:58.053439	2023-03-07 08:29:58.053439	7
13	aditya12	127.37	2023-03-07 08:29:58.0576	2023-03-07 08:29:58.0576	8
14	aditya13	128.38	2023-03-07 08:29:58.061857	2023-03-07 08:29:58.061857	9
15	aditya14	129.39	2023-03-07 08:29:58.071796	2023-03-07 08:29:58.071796	10
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: aditya
--

COPY public.products (id, title, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: aditya
--

COPY public.schema_migrations (version) FROM stdin;
20230302042314
20230306103231
20230306120110
20230306120241
20230306120747
20230306121526
20230307035447
20230307042703
20230307043755
20230307074956
20230307083318
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aditya
--

SELECT pg_catalog.setval('public.authors_id_seq', 15, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aditya
--

SELECT pg_catalog.setval('public.books_id_seq', 15, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aditya
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_authors_books_on_author_id_and_book_id; Type: INDEX; Schema: public; Owner: aditya
--

CREATE INDEX index_authors_books_on_author_id_and_book_id ON public.authors_books USING btree (author_id, book_id);


--
-- Name: index_books_on_author_id; Type: INDEX; Schema: public; Owner: aditya
--

CREATE INDEX index_books_on_author_id ON public.books USING btree (author_id);


--
-- Name: books fk_rails_53d51ce16a; Type: FK CONSTRAINT; Schema: public; Owner: aditya
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_rails_53d51ce16a FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- PostgreSQL database dump complete
--

