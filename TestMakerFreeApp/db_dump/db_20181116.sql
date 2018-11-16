--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS "TestMakerFreeAppApi";
--
-- Name: TestMakerFreeAppApi; Type: DATABASE; Schema: -; Owner: EkorAdmin
--

CREATE DATABASE "TestMakerFreeAppApi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'German_Switzerland.1252' LC_CTYPE = 'German_Switzerland.1252';


ALTER DATABASE "TestMakerFreeAppApi" OWNER TO "EkorAdmin";

\connect "TestMakerFreeAppApi"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: quizzes_stamp(); Type: FUNCTION; Schema: public; Owner: EkorAdmin
--

CREATE FUNCTION public.quizzes_stamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- update LastModifiedDate
  if new."LastModifiedDate" = old."LastModifiedDate" then
    new."LastModifiedDate" := now();
  end if;
  --NEW.LastModifiedDate := current_timestamp;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.quizzes_stamp() OWNER TO "EkorAdmin";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Answers; Type: TABLE; Schema: public; Owner: EkorAdmin
--

CREATE TABLE public."Answers" (
    "Id" integer NOT NULL,
    "QuestionId" integer NOT NULL,
    "Text" text NOT NULL,
    "Value" integer NOT NULL,
    "Notes" text,
    "Type" integer NOT NULL,
    "Flags" integer NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "LastModifiedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."Answers" OWNER TO "EkorAdmin";

--
-- Name: Answers_Id_seq; Type: SEQUENCE; Schema: public; Owner: EkorAdmin
--

CREATE SEQUENCE public."Answers_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Answers_Id_seq" OWNER TO "EkorAdmin";

--
-- Name: Answers_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EkorAdmin
--

ALTER SEQUENCE public."Answers_Id_seq" OWNED BY public."Answers"."Id";


--
-- Name: Questions; Type: TABLE; Schema: public; Owner: EkorAdmin
--

CREATE TABLE public."Questions" (
    "Id" integer NOT NULL,
    "QuizId" integer NOT NULL,
    "Text" text NOT NULL,
    "Notes" text,
    "Type" integer NOT NULL,
    "Flags" integer NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "LastModifiedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."Questions" OWNER TO "EkorAdmin";

--
-- Name: Questions_Id_seq; Type: SEQUENCE; Schema: public; Owner: EkorAdmin
--

CREATE SEQUENCE public."Questions_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Questions_Id_seq" OWNER TO "EkorAdmin";

--
-- Name: Questions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EkorAdmin
--

ALTER SEQUENCE public."Questions_Id_seq" OWNED BY public."Questions"."Id";


--
-- Name: Quizzes; Type: TABLE; Schema: public; Owner: EkorAdmin
--

CREATE TABLE public."Quizzes" (
    "Id" integer NOT NULL,
    "Title" text NOT NULL,
    "Description" text,
    "Text" text,
    "Notes" text,
    "Type" integer NOT NULL,
    "Flags" integer NOT NULL,
    "UserId" text NOT NULL,
    "ViewCount" integer NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "LastModifiedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."Quizzes" OWNER TO "EkorAdmin";

--
-- Name: Quizzes_Id_seq; Type: SEQUENCE; Schema: public; Owner: EkorAdmin
--

CREATE SEQUENCE public."Quizzes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Quizzes_Id_seq" OWNER TO "EkorAdmin";

--
-- Name: Quizzes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EkorAdmin
--

ALTER SEQUENCE public."Quizzes_Id_seq" OWNED BY public."Quizzes"."Id";


--
-- Name: Results; Type: TABLE; Schema: public; Owner: EkorAdmin
--

CREATE TABLE public."Results" (
    "Id" integer NOT NULL,
    "QuizId" integer NOT NULL,
    "Text" text NOT NULL,
    "MinValue" integer,
    "MaxValue" integer,
    "Notes" text,
    "Type" integer NOT NULL,
    "Flags" integer NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "LastModifiedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."Results" OWNER TO "EkorAdmin";

--
-- Name: Results_Id_seq; Type: SEQUENCE; Schema: public; Owner: EkorAdmin
--

CREATE SEQUENCE public."Results_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Results_Id_seq" OWNER TO "EkorAdmin";

--
-- Name: Results_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EkorAdmin
--

ALTER SEQUENCE public."Results_Id_seq" OWNED BY public."Results"."Id";


--
-- Name: Users; Type: TABLE; Schema: public; Owner: EkorAdmin
--

CREATE TABLE public."Users" (
    "Id" text NOT NULL,
    "UserName" character varying(128) NOT NULL,
    "Email" text NOT NULL,
    "DisplayName" text,
    "Notes" text,
    "Type" integer NOT NULL,
    "Flags" integer NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "LastModifiedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO "EkorAdmin";

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: EkorAdmin
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO "EkorAdmin";

--
-- Name: Answers Id; Type: DEFAULT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Answers" ALTER COLUMN "Id" SET DEFAULT nextval('public."Answers_Id_seq"'::regclass);


--
-- Name: Questions Id; Type: DEFAULT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Questions" ALTER COLUMN "Id" SET DEFAULT nextval('public."Questions_Id_seq"'::regclass);


--
-- Name: Quizzes Id; Type: DEFAULT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Quizzes" ALTER COLUMN "Id" SET DEFAULT nextval('public."Quizzes_Id_seq"'::regclass);


--
-- Name: Results Id; Type: DEFAULT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Results" ALTER COLUMN "Id" SET DEFAULT nextval('public."Results_Id_seq"'::regclass);


--
-- Data for Name: Answers; Type: TABLE DATA; Schema: public; Owner: EkorAdmin
--

COPY public."Answers" ("Id", "QuestionId", "Text", "Value", "Notes", "Type", "Flags", "CreatedDate", "LastModifiedDate") FROM stdin;
1	1	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
2	1	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
3	1	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
4	2	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
5	2	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
6	2	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
7	3	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
8	3	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
9	3	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
10	4	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
11	4	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
12	4	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
13	5	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
14	5	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
15	5	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
16	6	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
17	6	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
18	6	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
19	7	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
20	7	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
21	7	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
22	8	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
23	8	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
24	8	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
25	9	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
26	9	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
27	9	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
28	10	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
29	10	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
30	10	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
31	11	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
32	11	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
33	11	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
34	12	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
35	12	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
36	12	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
37	13	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
38	13	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
39	13	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
40	14	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
41	14	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
42	14	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
43	15	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
44	15	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
45	15	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
46	16	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
47	16	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
48	16	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
49	17	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
50	17	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
51	17	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
52	18	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
53	18	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
54	18	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
55	19	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
56	19	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
57	19	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
58	20	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
59	20	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
60	20	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
61	21	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
62	21	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
63	21	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
64	22	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
65	22	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
66	22	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
67	23	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
68	23	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
69	23	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
70	24	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
71	24	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
72	24	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
73	25	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
74	25	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
75	25	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
76	26	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
77	26	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
78	26	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
79	27	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
80	27	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
81	27	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
82	28	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
83	28	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
84	28	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
85	29	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
86	29	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
87	29	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
88	30	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
89	30	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
90	30	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
91	31	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
92	31	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
93	31	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
94	32	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
95	32	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
96	32	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
97	33	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
98	33	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
99	33	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
100	34	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
101	34	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
102	34	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
103	35	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
104	35	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
105	35	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
106	36	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
107	36	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
108	36	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
109	37	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
110	37	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
111	37	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
112	38	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
113	38	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
114	38	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
115	39	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
116	39	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
117	39	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
118	40	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
119	40	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
120	40	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
121	41	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
122	41	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
123	41	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
124	42	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
125	42	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
126	42	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
127	43	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
128	43	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
129	43	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
130	44	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
131	44	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
132	44	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
133	45	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
134	45	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
135	45	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
136	46	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
137	46	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
138	46	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
139	47	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
140	47	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
141	47	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
142	48	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
143	48	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
144	48	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
145	49	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
146	49	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
147	49	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
148	50	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
149	50	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
150	50	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
151	51	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
152	51	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
153	51	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
154	52	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
155	52	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
156	52	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
157	53	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
158	53	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
159	53	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
160	54	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
161	54	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
162	54	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
163	55	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
164	55	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
165	55	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
166	56	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
167	56	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
168	56	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
169	57	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
170	57	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
171	57	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
172	58	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
173	58	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
174	58	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
175	59	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
176	59	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
177	59	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
178	60	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
179	60	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
180	60	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
181	61	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
182	61	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
183	61	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
184	62	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
185	62	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
186	62	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
187	63	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
188	63	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
189	63	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
190	64	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
191	64	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
192	64	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
193	65	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
194	65	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
195	65	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
196	66	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
197	66	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
198	66	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
199	67	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
200	67	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
201	67	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
202	68	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
203	68	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
204	68	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
205	69	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
206	69	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
207	69	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
208	70	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
209	70	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
210	70	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
211	71	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
212	71	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
213	71	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
214	72	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
215	72	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
216	72	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
217	73	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
218	73	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
219	73	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
220	74	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
221	74	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
222	74	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
223	75	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
224	75	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
225	75	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
226	76	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
227	76	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
228	76	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
229	77	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
230	77	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
231	77	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
232	78	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
233	78	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
234	78	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
235	79	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
236	79	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
237	79	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
238	80	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
239	80	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
240	80	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
241	81	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
242	81	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
243	81	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
244	82	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
245	82	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
246	82	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
247	83	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
248	83	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
249	83	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
250	84	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
251	84	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
252	84	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
253	85	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
254	85	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
255	85	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
256	86	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
257	86	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
258	86	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
259	87	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
260	87	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
261	87	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
262	88	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
263	88	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
264	88	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
265	89	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
266	89	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
267	89	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
268	90	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
269	90	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
270	90	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
271	91	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
272	91	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
273	91	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
274	92	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
275	92	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
276	92	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
277	93	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
278	93	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
279	93	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
280	94	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
281	94	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
282	94	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
283	95	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
284	95	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
285	95	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
286	96	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
287	96	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
288	96	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
289	97	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
290	97	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
291	97	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
292	98	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
293	98	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
294	98	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
295	99	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
296	99	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
297	99	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
298	100	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
299	100	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
300	100	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
301	101	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
302	101	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
303	101	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
304	102	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
305	102	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
306	102	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
307	103	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
308	103	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
309	103	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
310	104	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
311	104	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
312	104	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
313	105	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
314	105	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
315	105	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
316	106	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
317	106	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
318	106	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
319	107	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
320	107	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
321	107	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
322	108	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
323	108	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
324	108	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
325	109	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
326	109	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
327	109	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
328	110	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
329	110	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
330	110	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
331	111	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
332	111	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
333	111	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
334	112	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
335	112	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
336	112	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
337	113	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
338	113	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
339	113	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
340	114	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
341	114	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
342	114	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
343	115	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
344	115	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
345	115	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
346	116	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
347	116	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
348	116	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
349	117	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
350	117	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
351	117	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
352	118	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
353	118	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
354	118	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
355	119	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
356	119	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
357	119	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
358	120	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
359	120	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
360	120	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
361	121	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
362	121	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
363	121	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
364	122	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
365	122	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
366	122	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
367	123	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
368	123	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
369	123	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
370	124	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
371	124	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
372	124	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
373	125	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
374	125	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
375	125	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
376	126	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
377	126	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
378	126	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
379	127	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
380	127	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
381	127	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
382	128	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
383	128	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
384	128	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
385	129	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
386	129	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
387	129	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
388	130	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
389	130	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
390	130	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
391	131	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
392	131	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
393	131	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
394	132	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
395	132	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
396	132	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
397	133	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
398	133	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
399	133	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
400	134	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
401	134	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
402	134	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
403	135	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
404	135	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
405	135	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
406	136	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
407	136	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
408	136	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
409	137	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
410	137	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
411	137	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
412	138	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
413	138	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
414	138	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
415	139	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
416	139	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
417	139	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
418	140	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
419	140	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
420	140	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
421	141	This is a sample answer created by the DbSeeder class for testing purposes. 	0	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
422	141	This is a sample answer created by the DbSeeder class for testing purposes. 	1	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
423	141	This is a sample answer created by the DbSeeder class for testing purposes. 	2	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
\.


--
-- Data for Name: Questions; Type: TABLE DATA; Schema: public; Owner: EkorAdmin
--

COPY public."Questions" ("Id", "QuizId", "Text", "Notes", "Type", "Flags", "CreatedDate", "LastModifiedDate") FROM stdin;
1	1	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
2	1	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
3	1	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
4	2	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
5	2	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
6	2	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
7	3	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
8	3	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
9	3	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
10	4	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
11	4	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
12	4	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
13	5	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
14	5	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
15	5	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
16	6	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
17	6	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
18	6	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
19	7	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
20	7	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
21	7	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
22	8	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
23	8	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
24	8	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
25	9	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
26	9	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
27	9	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
28	10	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
29	10	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
30	10	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
31	11	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
32	11	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
33	11	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
34	12	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
35	12	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
36	12	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
37	13	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
38	13	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
39	13	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
40	14	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
41	14	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
42	14	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
43	15	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
44	15	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
45	15	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
46	16	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
47	16	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
48	16	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
49	17	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
50	17	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
51	17	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
52	18	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
53	18	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
54	18	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
55	19	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
56	19	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
57	19	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
58	20	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
59	20	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
60	20	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
61	21	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
62	21	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
63	21	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
64	22	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
65	22	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
66	22	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
67	23	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
68	23	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
69	23	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
70	24	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
71	24	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
72	24	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
73	25	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
74	25	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
75	25	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
76	26	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
77	26	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
78	26	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
79	27	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
80	27	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
81	27	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
82	28	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
83	28	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
84	28	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
85	29	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
86	29	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
87	29	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
88	30	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
89	30	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
90	30	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
91	31	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
92	31	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
93	31	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
94	32	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
95	32	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
96	32	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
97	33	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
98	33	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
99	33	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
100	34	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
101	34	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
102	34	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
103	35	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
104	35	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
105	35	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
106	36	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
107	36	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
108	36	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
109	37	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
110	37	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
111	37	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
112	38	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
113	38	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
114	38	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
115	39	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
116	39	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
117	39	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
118	40	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
119	40	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
120	40	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
121	41	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
122	41	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
123	41	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
124	42	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
125	42	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
126	42	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
127	43	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
128	43	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
129	43	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
130	44	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
131	44	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
132	44	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
133	45	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
134	45	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
135	45	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
136	46	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
137	46	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
138	46	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
139	47	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
140	47	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
141	47	This is a sample question created by the DbSeeder class for testing purposes. All the child answers are auto-generated as well.	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
\.


--
-- Data for Name: Quizzes; Type: TABLE DATA; Schema: public; Owner: EkorAdmin
--

COPY public."Quizzes" ("Id", "Title", "Description", "Text", "Notes", "Type", "Flags", "UserId", "ViewCount", "CreatedDate", "LastModifiedDate") FROM stdin;
2	Quiz 2 Title	This is a sample description for quiz 2.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	45	2017-06-22 12:30:00	2017-06-22 12:30:00
3	Quiz 3 Title	This is a sample description for quiz 3.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	44	2017-06-22 12:30:00	2017-06-22 12:30:00
4	Quiz 4 Title	This is a sample description for quiz 4.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	43	2017-06-22 12:30:00	2017-06-22 12:30:00
5	Quiz 5 Title	This is a sample description for quiz 5.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	42	2017-06-22 12:30:00	2017-06-22 12:30:00
6	Quiz 6 Title	This is a sample description for quiz 6.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	41	2017-06-22 12:30:00	2017-06-22 12:30:00
7	Quiz 7 Title	This is a sample description for quiz 7.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	40	2017-06-22 12:30:00	2017-06-22 12:30:00
8	Quiz 8 Title	This is a sample description for quiz 8.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	39	2017-06-22 12:30:00	2017-06-22 12:30:00
9	Quiz 9 Title	This is a sample description for quiz 9.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	38	2017-06-22 12:30:00	2017-06-22 12:30:00
10	Quiz 10 Title	This is a sample description for quiz 10.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	37	2017-06-22 12:30:00	2017-06-22 12:30:00
11	Quiz 11 Title	This is a sample description for quiz 11.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	36	2017-06-22 12:30:00	2017-06-22 12:30:00
12	Quiz 12 Title	This is a sample description for quiz 12.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	35	2017-06-22 12:30:00	2017-06-22 12:30:00
13	Quiz 13 Title	This is a sample description for quiz 13.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	34	2017-06-22 12:30:00	2017-06-22 12:30:00
14	Quiz 14 Title	This is a sample description for quiz 14.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	33	2017-06-22 12:30:00	2017-06-22 12:30:00
15	Quiz 15 Title	This is a sample description for quiz 15.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	32	2017-06-22 12:30:00	2017-06-22 12:30:00
16	Quiz 16 Title	This is a sample description for quiz 16.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	31	2017-06-22 12:30:00	2017-06-22 12:30:00
17	Quiz 17 Title	This is a sample description for quiz 17.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	30	2017-06-22 12:30:00	2017-06-22 12:30:00
18	Quiz 18 Title	This is a sample description for quiz 18.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	29	2017-06-22 12:30:00	2017-06-22 12:30:00
19	Quiz 19 Title	This is a sample description for quiz 19.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	28	2017-06-22 12:30:00	2017-06-22 12:30:00
20	Quiz 20 Title	This is a sample description for quiz 20.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	27	2017-06-22 12:30:00	2017-06-22 12:30:00
21	Quiz 21 Title	This is a sample description for quiz 21.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	26	2017-06-22 12:30:00	2017-06-22 12:30:00
22	Quiz 22 Title	This is a sample description for quiz 22.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	25	2017-06-22 12:30:00	2017-06-22 12:30:00
23	Quiz 23 Title	This is a sample description for quiz 23.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	24	2017-06-22 12:30:00	2017-06-22 12:30:00
24	Quiz 24 Title	This is a sample description for quiz 24.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	23	2017-06-22 12:30:00	2017-06-22 12:30:00
25	Quiz 25 Title	This is a sample description for quiz 25.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	22	2017-06-22 12:30:00	2017-06-22 12:30:00
26	Quiz 26 Title	This is a sample description for quiz 26.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	21	2017-06-22 12:30:00	2017-06-22 12:30:00
27	Quiz 27 Title	This is a sample description for quiz 27.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	20	2017-06-22 12:30:00	2017-06-22 12:30:00
28	Quiz 28 Title	This is a sample description for quiz 28.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	19	2017-06-22 12:30:00	2017-06-22 12:30:00
29	Quiz 29 Title	This is a sample description for quiz 29.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	18	2017-06-22 12:30:00	2017-06-22 12:30:00
30	Quiz 30 Title	This is a sample description for quiz 30.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	17	2017-06-22 12:30:00	2017-06-22 12:30:00
32	Quiz 32 Title	This is a sample description for quiz 32.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	15	2017-06-22 12:30:00	2017-06-22 12:30:00
34	Quiz 34 Title	This is a sample description for quiz 34.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	13	2017-06-22 12:30:00	2017-06-22 12:30:00
35	Quiz 35 Title	This is a sample description for quiz 35.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	12	2017-06-22 12:30:00	2017-06-22 12:30:00
36	Quiz 36 Title	This is a sample description for quiz 36.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	11	2017-06-22 12:30:00	2017-06-22 12:30:00
37	Quiz 37 Title	This is a sample description for quiz 37.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	10	2017-06-22 12:30:00	2017-06-22 12:30:00
38	Quiz 38 Title	This is a sample description for quiz 38.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	9	2017-06-22 12:30:00	2017-06-22 12:30:00
39	Quiz 39 Title	This is a sample description for quiz 39.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	8	2017-06-22 12:30:00	2017-06-22 12:30:00
40	Quiz 40 Title	This is a sample description for quiz 40.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	7	2017-06-22 12:30:00	2017-06-22 12:30:00
41	Quiz 41 Title	This is a sample description for quiz 41.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	6	2017-06-22 12:30:00	2017-06-22 12:30:00
42	Quiz 42 Title	This is a sample description for quiz 42.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	5	2017-06-22 12:30:00	2017-06-22 12:30:00
43	Quiz 43 Title	This is a sample description for quiz 43.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	4	2017-06-22 12:30:00	2017-06-22 12:30:00
44	Quiz 44 Title	This is a sample description for quiz 44.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	3	2017-06-22 12:30:00	2017-06-22 12:30:00
45	Quiz 45 Title	This is a sample description for quiz 45.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	2	2017-06-22 12:30:00	2017-06-22 12:30:00
46	Quiz 46 Title	This is a sample description for quiz 46.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	1	2017-06-22 12:30:00	2017-06-22 12:30:00
47	Quiz 47 Title	This is a sample description for quiz 47.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	0	2017-06-22 12:30:00	2017-06-22 12:30:00
48	Are you more Light or Dark side of the Force?	Star Wars personality test	Choose wisely you must, young padawan: this test will prove if your will is strong enough to adhere to the principles of the light side of the Force or if you're fated to embrace the dark side. No  you want to become a true JEDI, you can't possibly miss this!	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	2343	2017-08-08 12:30:00	2018-11-15 17:18:56.849088
49	GenX, GenY or Genz?	Find out what decade most represents you	Do you feel confortable in your generation? What year should you have been born in?Here's a bunch of questions that will help you to find out!	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	4180	2017-08-08 12:30:00	2018-11-15 17:18:56.849088
50	Which Shingeki No Kyojin character are you?	Attack On Titan personality test	Do you relentlessly seek revenge like Eren? Are you willing to put your like on the stake to protect your friends like Mikasa? Would you trust your fighting skills like Levi or rely on your strategies and tactics like Arwin? Unveil your true self with this Attack On Titan personality test!	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	5203	2017-08-08 12:30:00	2018-11-15 17:18:56.849088
31	Quiz 31 Titel	This is a sample description for quiz 31.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	16	2017-06-22 12:30:00	2018-11-16 09:43:46.716877
33	Quiz 33 neuer Titel	This is a sample description for quiz 33.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	14	2017-06-22 12:30:00	2018-11-16 09:46:19.864818
1	Frage 1: Mac oder PC?	This is a sample description for quiz 1.	This is a sample quiz created by the DbSeeder class for testing purposes. All the questions, answers & results are auto-generated as well.	\N	0	0	30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	46	2017-06-22 12:30:00	2018-11-16 08:45:00
\.


--
-- Data for Name: Results; Type: TABLE DATA; Schema: public; Owner: EkorAdmin
--

COPY public."Results" ("Id", "QuizId", "Text", "MinValue", "MaxValue", "Notes", "Type", "Flags", "CreatedDate", "LastModifiedDate") FROM stdin;
1	1	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
2	1	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
3	1	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
4	2	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
5	2	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
6	2	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
7	3	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
8	3	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
9	3	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
10	4	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
11	4	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
12	4	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
13	5	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
14	5	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
15	5	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
16	6	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
17	6	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
18	6	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
19	7	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
20	7	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
21	7	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
22	8	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
23	8	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
24	8	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
25	9	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
26	9	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
27	9	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
28	10	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
29	10	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
30	10	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
31	11	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
32	11	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
33	11	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
34	12	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
35	12	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
36	12	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
37	13	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
38	13	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
39	13	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
40	14	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
41	14	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
42	14	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
43	15	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
44	15	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
45	15	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
46	16	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
47	16	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
48	16	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
49	17	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
50	17	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
51	17	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
52	18	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
53	18	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
54	18	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
55	19	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
56	19	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
57	19	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
58	20	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
59	20	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
60	20	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
61	21	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
62	21	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
63	21	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
64	22	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
65	22	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
66	22	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
67	23	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
68	23	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
69	23	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
70	24	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
71	24	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
72	24	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
73	25	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
74	25	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
75	25	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
76	26	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
77	26	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
78	26	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
79	27	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
80	27	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
81	27	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
82	28	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
83	28	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
84	28	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
85	29	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
86	29	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
87	29	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
88	30	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
89	30	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
90	30	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
91	31	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
92	31	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
93	31	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
94	32	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
95	32	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
96	32	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
97	33	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
98	33	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
99	33	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
100	34	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
101	34	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
102	34	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
103	35	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
104	35	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
105	35	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
106	36	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
107	36	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
108	36	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
109	37	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
110	37	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
111	37	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
112	38	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
113	38	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
114	38	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
115	39	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
116	39	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
117	39	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
118	40	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
119	40	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
120	40	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
121	41	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
122	41	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
123	41	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
124	42	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
125	42	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
126	42	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
127	43	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
128	43	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
129	43	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
130	44	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
131	44	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
132	44	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
133	45	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
134	45	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
135	45	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
136	46	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
137	46	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
138	46	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
139	47	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
140	47	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
141	47	This is a sample result created by the DbSeeder class for testing purposes. 	0	6	\N	0	0	2017-06-22 12:30:00	2017-06-22 12:30:00
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: EkorAdmin
--

COPY public."Users" ("Id", "UserName", "Email", "DisplayName", "Notes", "Type", "Flags", "CreatedDate", "LastModifiedDate") FROM stdin;
30f83922-0c4f-4f0b-9b7a-2b9fcf2515f1	Admin	admin@testmakerfree.com	\N	\N	0	0	2016-03-01 12:30:00	2018-11-15 17:18:56.744552
6be383e8-e696-4bad-9f3d-3ef387dbf200	Ryan	ryan@testmakerfree.com	\N	\N	0	0	2016-03-01 12:30:00	2018-11-15 17:18:56.744552
7962ba3f-12d0-4acc-b2f1-c163e89bf379	Solice	solice@testmakerfree.com	\N	\N	0	0	2016-03-01 12:30:00	2018-11-15 17:18:56.744552
47721534-f642-4e3b-86b1-8e2cce2c69c4	Vodan	vodan@testmakerfree.com	\N	\N	0	0	2016-03-01 12:30:00	2018-11-15 17:18:56.744552
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: EkorAdmin
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20181115145808_InitialMigration	2.1.4-rtm-31024
\.


--
-- Name: Answers_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: EkorAdmin
--

SELECT pg_catalog.setval('public."Answers_Id_seq"', 423, true);


--
-- Name: Questions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: EkorAdmin
--

SELECT pg_catalog.setval('public."Questions_Id_seq"', 141, true);


--
-- Name: Quizzes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: EkorAdmin
--

SELECT pg_catalog.setval('public."Quizzes_Id_seq"', 50, true);


--
-- Name: Results_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: EkorAdmin
--

SELECT pg_catalog.setval('public."Results_Id_seq"', 141, true);


--
-- Name: Answers PK_Answers; Type: CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Answers"
    ADD CONSTRAINT "PK_Answers" PRIMARY KEY ("Id");


--
-- Name: Questions PK_Questions; Type: CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "PK_Questions" PRIMARY KEY ("Id");


--
-- Name: Quizzes PK_Quizzes; Type: CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Quizzes"
    ADD CONSTRAINT "PK_Quizzes" PRIMARY KEY ("Id");


--
-- Name: Results PK_Results; Type: CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Results"
    ADD CONSTRAINT "PK_Results" PRIMARY KEY ("Id");


--
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: IX_Answers_QuestionId; Type: INDEX; Schema: public; Owner: EkorAdmin
--

CREATE INDEX "IX_Answers_QuestionId" ON public."Answers" USING btree ("QuestionId");


--
-- Name: IX_Questions_QuizId; Type: INDEX; Schema: public; Owner: EkorAdmin
--

CREATE INDEX "IX_Questions_QuizId" ON public."Questions" USING btree ("QuizId");


--
-- Name: IX_Quizzes_UserId; Type: INDEX; Schema: public; Owner: EkorAdmin
--

CREATE INDEX "IX_Quizzes_UserId" ON public."Quizzes" USING btree ("UserId");


--
-- Name: IX_Results_QuizId; Type: INDEX; Schema: public; Owner: EkorAdmin
--

CREATE INDEX "IX_Results_QuizId" ON public."Results" USING btree ("QuizId");


--
-- Name: Quizzes quizzes_stamp; Type: TRIGGER; Schema: public; Owner: EkorAdmin
--

CREATE TRIGGER quizzes_stamp BEFORE INSERT OR UPDATE ON public."Quizzes" FOR EACH ROW EXECUTE PROCEDURE public.quizzes_stamp();


--
-- Name: Answers FK_Answers_Questions_QuestionId; Type: FK CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Answers"
    ADD CONSTRAINT "FK_Answers_Questions_QuestionId" FOREIGN KEY ("QuestionId") REFERENCES public."Questions"("Id") ON DELETE CASCADE;


--
-- Name: Questions FK_Questions_Quizzes_QuizId; Type: FK CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "FK_Questions_Quizzes_QuizId" FOREIGN KEY ("QuizId") REFERENCES public."Quizzes"("Id") ON DELETE CASCADE;


--
-- Name: Quizzes FK_Quizzes_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Quizzes"
    ADD CONSTRAINT "FK_Quizzes_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- Name: Results FK_Results_Quizzes_QuizId; Type: FK CONSTRAINT; Schema: public; Owner: EkorAdmin
--

ALTER TABLE ONLY public."Results"
    ADD CONSTRAINT "FK_Results_Quizzes_QuizId" FOREIGN KEY ("QuizId") REFERENCES public."Quizzes"("Id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

