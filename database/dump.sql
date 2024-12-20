--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id bigint NOT NULL,
    author_fullname character varying(255),
    biography character varying(255),
    date_of_birth date,
    name character varying(255),
    surname character varying(255)
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.author_id_seq OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id bigint NOT NULL,
    genre character varying(255),
    isbn character varying(255),
    title character varying(255),
    year integer NOT NULL,
    book_store_id bigint
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_authors (
    book_id bigint NOT NULL,
    authors_id bigint NOT NULL
);


ALTER TABLE public.book_authors OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_id_seq OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: book_store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_store (
    id bigint NOT NULL,
    address character varying(255),
    city character varying(255),
    name character varying(255)
);


ALTER TABLE public.book_store OWNER TO postgres;

--
-- Name: book_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_store_id_seq OWNER TO postgres;

--
-- Name: book_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_store_id_seq OWNED BY public.book_store.id;


--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    id bigint NOT NULL,
    description character varying(255),
    score integer,
    "timestamp" timestamp(6) without time zone,
    book_id bigint
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_id_seq OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- Name: author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: book_store id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_store ALTER COLUMN id SET DEFAULT nextval('public.book_store_id_seq'::regclass);


--
-- Name: review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (id, author_fullname, biography, date_of_birth, name, surname) FROM stdin;
1	\N	John Doe is a talented writer with a passion for storytelling.	1970-01-20	John	Doe
2	\N	Jane Smith is an accomplished author known for her best-selling novels.	1972-01-20	Jane	Smith
3	\N	Robert Johnson's writing style captivates readers with its unique blend of humor and drama.	1974-01-20	Robert	Johnson
4	\N	Maria Garcia is a renowned author whose novels have been translated into multiple languages.	1976-01-20	Maria	Garcia
5	\N	Michael Brown is an emerging writer with a fresh perspective on contemporary issues.	1978-01-20	Michael	Brown
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, genre, isbn, title, year, book_store_id) FROM stdin;
2	Fiction	978-0142437344	The Great Gatsby	1925	1
3	Fiction	978-0061120084	To Kill a Mockingbird	1960	2
4	Science Fiction	978-0451524935	1984	1949	3
5	Fiction	978-0316769488	The Catcher in the Rye	1951	4
6	Romance	978-1980497193	Pride and Prejudice	1813	5
\.


--
-- Data for Name: book_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_authors (book_id, authors_id) FROM stdin;
2	1
\.


--
-- Data for Name: book_store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_store (id, address, city, name) FROM stdin;
1	123 Main St	New York	Book Haven
2	456 Oak Ave	Los Angeles	City Books
3	789 Elm Blvd	Chicago	Readers' Paradise
4	101 Pine Lane	San Francisco	Novel Nook
5	202 Maple Dr	Seattle	Literary Lounge
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review (id, description, score, "timestamp", book_id) FROM stdin;
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_seq', 5, true);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 6, true);


--
-- Name: book_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_store_id_seq', 5, true);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_id_seq', 1, false);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: book_store book_store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_store
    ADD CONSTRAINT book_store_pkey PRIMARY KEY (id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: book_authors fk551i3sllw1wj7ex6nir16blsm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk551i3sllw1wj7ex6nir16blsm FOREIGN KEY (authors_id) REFERENCES public.author(id);


--
-- Name: review fk70yrt09r4r54tcgkrwbeqenbs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT fk70yrt09r4r54tcgkrwbeqenbs FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- Name: book fk93giw6493l79g47q3nr7asvo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk93giw6493l79g47q3nr7asvo1 FOREIGN KEY (book_store_id) REFERENCES public.book_store(id);


--
-- Name: book_authors fks4xm7q8i3uxvaiswj1c35nnxw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fks4xm7q8i3uxvaiswj1c35nnxw FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- PostgreSQL database dump complete
--

