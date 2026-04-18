--
-- PostgreSQL database dump
--

\restrict zVvd5hTSpX6xqB19REZUVwMBIBV9OglHOcHZOwRzlLLm9FMmaU7NWPAqhb2BZeb

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-19 01:59:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 16816)
-- Name: activity_time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_time (
    id integer NOT NULL,
    "time" integer NOT NULL
);


ALTER TABLE public.activity_time OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16821)
-- Name: activity_time_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.activity_time ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.activity_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16822)
-- Name: balls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balls (
    id integer NOT NULL,
    balls integer NOT NULL
);


ALTER TABLE public.balls OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16827)
-- Name: balls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.balls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.balls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16828)
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id integer NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.class OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16833)
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.class ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16834)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id integer NOT NULL,
    name character varying NOT NULL,
    path character varying NOT NULL,
    img character varying
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16842)
-- Name: course_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_class (
    id integer NOT NULL,
    class_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.course_class OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16848)
-- Name: course_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.course_class ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.course_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16849)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.course ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16850)
-- Name: dedline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dedline (
    id integer NOT NULL,
    dedline integer NOT NULL
);


ALTER TABLE public.dedline OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16855)
-- Name: dedline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.dedline ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dedline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 17015)
-- Name: lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson (
    title character varying NOT NULL,
    text text NOT NULL,
    course_id integer NOT NULL,
    class_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.lesson OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17037)
-- Name: lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.lesson ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16856)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id integer NOT NULL,
    course_id integer NOT NULL,
    questions text NOT NULL,
    answer character varying NOT NULL,
    difficulty integer DEFAULT 1 NOT NULL,
    class_id integer DEFAULT 1 NOT NULL,
    subject character varying DEFAULT '""'::character varying NOT NULL,
    lesson_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16871)
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.test ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 16872)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    class_id integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16881)
-- Name: user_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_activity (
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    seconds integer DEFAULT 0 NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    class_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.user_activity OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16891)
-- Name: user_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_activity ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16892)
-- Name: user_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_course (
    id integer NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    class_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.user_course OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16900)
-- Name: user_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_course ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 16901)
-- Name: user_deadline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_deadline (
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    deadline_date timestamp without time zone NOT NULL,
    completed boolean DEFAULT false NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.user_deadline OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16910)
-- Name: user_deadline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_deadline ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_deadline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 16911)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5112 (class 0 OID 16816)
-- Dependencies: 219
-- Data for Name: activity_time; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.activity_time OVERRIDING SYSTEM VALUE VALUES (1, 1);


--
-- TOC entry 5114 (class 0 OID 16822)
-- Dependencies: 221
-- Data for Name: balls; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (1, 1);
INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (2, 2);
INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (3, 3);


--
-- TOC entry 5116 (class 0 OID 16828)
-- Dependencies: 223
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (1, 7);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (2, 8);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (3, 9);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (4, 10);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (5, 11);


--
-- TOC entry 5118 (class 0 OID 16834)
-- Dependencies: 225
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (2, 'Геометрия', '/', '/');
INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (3, 'Информатика', '/', '/');
INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (1, 'Алгебра', '/', '/');


--
-- TOC entry 5119 (class 0 OID 16842)
-- Dependencies: 226
-- Data for Name: course_class; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5122 (class 0 OID 16850)
-- Dependencies: 229
-- Data for Name: dedline; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5134 (class 0 OID 17015)
-- Dependencies: 241
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Сложение', 'Lorem', 1, 1, 1);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Деление', 'Lorem', 1, 3, 3);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Вычитание', 'Lorem', 1, 4, 4);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Проценты', 'Lorem', 1, 5, 5);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Умножение', 'Lorem', 1, 2, 2);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Квадрат', 'Lorem', 2, 1, 6);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Треугольник', 'Lorem', 2, 2, 7);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Прямоугольник', 'Lorem', 2, 3, 8);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Крун', 'Lorem', 2, 4, 9);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Трапеция', 'Lorem', 2, 5, 10);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('8-я сис. счисления', 'Lorem', 3, 1, 11);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('10-я сис. счисления', 'Lorem', 3, 2, 12);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('2-я сис. счисления', 'Lorem', 3, 3, 13);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('16-я сис. счисления', 'Lorem', 3, 4, 14);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Типы данных', 'Lorem', 3, 5, 15);


--
-- TOC entry 5124 (class 0 OID 16856)
-- Dependencies: 231
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (1, 1, '2+2', '4', 1, 1, '""', 1);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (2, 1, '3+3', '6', 2, 1, '""', 1);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (3, 1, '6+6', '12', 3, 1, '""', 1);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (13, 1, '1-1', '0', 1, 4, '""', 4);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (14, 1, '2-2', '0', 2, 4, '""', 4);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (15, 1, '3-3', '0', 3, 4, '""', 4);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (7, 1, '2*2', '4', 1, 2, '""', 2);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (8, 1, '3*3', '9', 2, 2, '""', 2);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (9, 1, '1*1', '1', 3, 2, '""', 2);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (10, 1, '1/1', '1', 1, 3, '""', 3);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (11, 1, '2/2', '1', 2, 3, '""', 3);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (12, 1, '3/3', '1', 3, 3, '""', 3);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (16, 1, '1%', '0,01', 1, 5, '""', 5);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (17, 1, '10%', '0,1', 2, 5, '""', 5);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (18, 1, '100%', '1', 3, 5, '""', 5);


--
-- TOC entry 5126 (class 0 OID 16872)
-- Dependencies: 233
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" OVERRIDING SYSTEM VALUE VALUES (4, 'Kirill', 'k@mail.ru', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 5);


--
-- TOC entry 5127 (class 0 OID 16881)
-- Dependencies: 234
-- Data for Name: user_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (4, 1, 10, '2026-04-19 01:56:35.848139', 51, 1);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (4, 1, 10, '2026-04-19 01:56:46.523356', 52, 2);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (4, 1, 10, '2026-04-19 01:57:02.676695', 53, 4);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (4, 1, 10, '2026-04-19 01:57:13.319982', 54, 5);


--
-- TOC entry 5129 (class 0 OID 16892)
-- Dependencies: 236
-- Data for Name: user_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (43, 4, 1, 1);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (44, 4, 1, 2);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (45, 4, 1, 4);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (46, 4, 1, 5);


--
-- TOC entry 5131 (class 0 OID 16901)
-- Dependencies: 238
-- Data for Name: user_deadline; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-05-18 22:56:00', false, 25);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-05-18 22:56:00', false, 26);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-05-18 22:56:00', false, 27);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-05-18 22:57:00', false, 28);


--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 220
-- Name: activity_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_time_id_seq', 1, true);


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 222
-- Name: balls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.balls_id_seq', 3, true);


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 224
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 5, true);


--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 227
-- Name: course_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_class_id_seq', 1, false);


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 228
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 3, true);


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 230
-- Name: dedline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dedline_id_seq', 1, false);


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 242
-- Name: lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_id_seq', 15, true);


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 232
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 18, true);


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 235
-- Name: user_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_activity_id_seq', 54, true);


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 237
-- Name: user_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_course_id_seq', 46, true);


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 239
-- Name: user_deadline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_deadline_id_seq', 28, true);


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 240
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- TOC entry 4921 (class 2606 OID 16913)
-- Name: activity_time activity_time_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_time
    ADD CONSTRAINT activity_time_pk PRIMARY KEY (id);


--
-- TOC entry 4923 (class 2606 OID 16915)
-- Name: balls balls_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balls
    ADD CONSTRAINT balls_pk PRIMARY KEY (id);


--
-- TOC entry 4925 (class 2606 OID 16917)
-- Name: class class_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pk PRIMARY KEY (id);


--
-- TOC entry 4929 (class 2606 OID 16919)
-- Name: course_class course_class_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT course_class_pk PRIMARY KEY (id);


--
-- TOC entry 4927 (class 2606 OID 16921)
-- Name: course course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pk PRIMARY KEY (id);


--
-- TOC entry 4931 (class 2606 OID 16923)
-- Name: dedline dedline_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dedline
    ADD CONSTRAINT dedline_pk PRIMARY KEY (id);


--
-- TOC entry 4945 (class 2606 OID 17045)
-- Name: lesson lesson_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pk PRIMARY KEY (id);


--
-- TOC entry 4933 (class 2606 OID 16925)
-- Name: test test_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pk PRIMARY KEY (id);


--
-- TOC entry 4939 (class 2606 OID 16931)
-- Name: user_activity user_activity_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_pk PRIMARY KEY (id);


--
-- TOC entry 4941 (class 2606 OID 16933)
-- Name: user_course user_course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_course_pk PRIMARY KEY (id);


--
-- TOC entry 4943 (class 2606 OID 16935)
-- Name: user_deadline user_deadline_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_pk PRIMARY KEY (id);


--
-- TOC entry 4935 (class 2606 OID 16937)
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- TOC entry 4937 (class 2606 OID 16939)
-- Name: user user_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_unique UNIQUE (email);


--
-- TOC entry 4946 (class 2606 OID 16940)
-- Name: activity_time activity_time_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_time
    ADD CONSTRAINT activity_time_id FOREIGN KEY ("time") REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 4950 (class 2606 OID 16945)
-- Name: test balls_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT balls_id FOREIGN KEY (difficulty) REFERENCES public.balls(id) ON DELETE CASCADE;


--
-- TOC entry 4947 (class 2606 OID 16950)
-- Name: course_class class_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT class_id FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 4948 (class 2606 OID 16955)
-- Name: course_class course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 4951 (class 2606 OID 16960)
-- Name: test course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 4958 (class 2606 OID 16965)
-- Name: user_course course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 4949 (class 2606 OID 16970)
-- Name: dedline dedline_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dedline
    ADD CONSTRAINT dedline_id FOREIGN KEY (dedline) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 4963 (class 2606 OID 17032)
-- Name: lesson lesson_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 4964 (class 2606 OID 17027)
-- Name: lesson lesson_course_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_course_fk FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 4952 (class 2606 OID 16975)
-- Name: test test_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 4953 (class 2606 OID 17049)
-- Name: test test_lesson_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_lesson_fk FOREIGN KEY (lesson_id) REFERENCES public.lesson(id) ON DELETE CASCADE;


--
-- TOC entry 4955 (class 2606 OID 17076)
-- Name: user_activity user_activity_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 4956 (class 2606 OID 16980)
-- Name: user_activity user_activity_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 4957 (class 2606 OID 16985)
-- Name: user_activity user_activity_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4954 (class 2606 OID 16990)
-- Name: user user_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE SET NULL;


--
-- TOC entry 4959 (class 2606 OID 17069)
-- Name: user_course user_course_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_course_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 4961 (class 2606 OID 17000)
-- Name: user_deadline user_deadline_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 4962 (class 2606 OID 17005)
-- Name: user_deadline user_deadline_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 4960 (class 2606 OID 17010)
-- Name: user_course user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


-- Completed on 2026-04-19 01:59:14

--
-- PostgreSQL database dump complete
--

\unrestrict zVvd5hTSpX6xqB19REZUVwMBIBV9OglHOcHZOwRzlLLm9FMmaU7NWPAqhb2BZeb

