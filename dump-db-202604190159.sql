--
-- PostgreSQL database dump
--

\restrict rVNZ344H7svmfn05uKMxrgDrV9Xorg0eleqhOURlmFtIb9GIdaDNfsTKz5dQ7Uf

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

-- Started on 2026-04-19 10:34:23 MSK

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
-- TOC entry 215 (class 1259 OID 17036)
-- Name: activity_time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_time (
    id integer NOT NULL,
    "time" integer NOT NULL
);


ALTER TABLE public.activity_time OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17039)
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
-- TOC entry 217 (class 1259 OID 17040)
-- Name: balls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balls (
    id integer NOT NULL,
    balls integer NOT NULL
);


ALTER TABLE public.balls OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17043)
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
-- TOC entry 219 (class 1259 OID 17044)
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id integer NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.class OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17047)
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
-- TOC entry 221 (class 1259 OID 17048)
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
-- TOC entry 222 (class 1259 OID 17053)
-- Name: course_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_class (
    id integer NOT NULL,
    class_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.course_class OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17056)
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
-- TOC entry 224 (class 1259 OID 17057)
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
-- TOC entry 225 (class 1259 OID 17058)
-- Name: dedline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dedline (
    id integer NOT NULL,
    dedline integer NOT NULL
);


ALTER TABLE public.dedline OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17061)
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
-- TOC entry 227 (class 1259 OID 17062)
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
-- TOC entry 228 (class 1259 OID 17067)
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
-- TOC entry 229 (class 1259 OID 17068)
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
-- TOC entry 230 (class 1259 OID 17077)
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
-- TOC entry 231 (class 1259 OID 17078)
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
-- TOC entry 232 (class 1259 OID 17083)
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
-- TOC entry 233 (class 1259 OID 17089)
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
-- TOC entry 234 (class 1259 OID 17090)
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
-- TOC entry 235 (class 1259 OID 17094)
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
-- TOC entry 236 (class 1259 OID 17095)
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
-- TOC entry 237 (class 1259 OID 17099)
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
-- TOC entry 238 (class 1259 OID 17100)
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
-- TOC entry 3503 (class 0 OID 17036)
-- Dependencies: 215
-- Data for Name: activity_time; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.activity_time OVERRIDING SYSTEM VALUE VALUES (1, 1);


--
-- TOC entry 3505 (class 0 OID 17040)
-- Dependencies: 217
-- Data for Name: balls; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (1, 1);
INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (2, 2);
INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (3, 3);


--
-- TOC entry 3507 (class 0 OID 17044)
-- Dependencies: 219
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (1, 7);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (2, 8);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (3, 9);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (4, 10);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (5, 11);


--
-- TOC entry 3509 (class 0 OID 17048)
-- Dependencies: 221
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (2, 'Геометрия', '/', '/');
INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (3, 'Информатика', '/', '/');
INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (1, 'Алгебра', '/', '/');


--
-- TOC entry 3510 (class 0 OID 17053)
-- Dependencies: 222
-- Data for Name: course_class; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3513 (class 0 OID 17058)
-- Dependencies: 225
-- Data for Name: dedline; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3515 (class 0 OID 17062)
-- Dependencies: 227
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Сложение', 'Сложение — это одна из основных арифметических операций, при которой два или более числа объединяются в одно. Результат сложения называется суммой.

Например: 3 + 5 = 8

Сложение используется в повседневной жизни: при подсчёте денег, времени, расстояния и других величин.

Свойства сложения:

Переместительное: a + b = b + a Сочетательное: (a + b) + c = a + (b + c)', 1, 1, 1);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Деление', 'Деление — это операция, обратная умножению. Она показывает, на сколько равных частей можно разделить число.

Например: 12 ÷ 3 = 4

Это значит, что 12 разделили на 3 равные части, и каждая часть равна 4.

Если число не делится нацело, получается дробь или остаток. Например: 10 ÷ 3 = 3 (остаток 1)

', 1, 3, 3);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Вычитание', 'Вычитание — это операция, при которой одно число уменьшается на другое. Результат называется разностью.

Например: 10 − 4 = 6

Вычитание используется, когда нужно узнать, сколько осталось, или найти разницу между числами.', 1, 4, 4);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Проценты', 'Процент — это одна сотая часть числа. 1% = 1/100 = 0.01

Проценты используются для выражения долей:

50% = половина 25% = четверть

Например: 20% от 100 = 20

Проценты широко применяются в экономике, скидках, банках и статистике.', 1, 5, 5);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Умножение', 'Умножение — это операция, которая заменяет повторяющееся сложение.

Например: 4 × 3 = 12 (то есть 4 + 4 + 4)

Результат называется произведением.

Умножение используется в вычислениях площадей, скорости, стоимости и других задачах.', 1, 2, 2);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Квадрат', 'Квадрат — это правильный четырёхугольник, у которого все стороны равны и все углы равны 90°.

Он является частным случаем прямоугольника и ромба одновременно.

Основные свойства: Все стороны равны Все углы прямые (90°) Противоположные стороны параллельны Диагонали равны и пересекаются под прямым углом. Формулы: Периметр: P=4a Площадь: S=a 2

где a — длина стороны.', 2, 1, 6);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Треугольник', 'Треугольник — это геометрическая фигура, состоящая из трёх сторон и трёх углов.

Главное свойство: Сумма углов любого треугольника равна 180°.

Виды треугольников:

Равносторонний — все стороны равны Равнобедренный — две стороны равны Разносторонний — все стороны разные 8. Прямоугольник

Прямоугольник — это четырёхугольник, у которого все углы равны 90°.

Свойства:

Противоположные стороны равны Стороны параллельны

Формула площади: Площадь = длина × ширина', 2, 2, 7);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Прямоугольник', 'Прямоугольник — это четырёхугольник, у которого все углы равны 90°.

Свойства:

Противоположные стороны равны Стороны параллельны

Формула площади: Площадь = длина × ширина', 2, 3, 8);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Круг', 'Круг — это множество точек на плоскости, находящихся на одинаковом расстоянии от центра.

Основные элементы:

Радиус — расстояние от центра до границы Диаметр — расстояние через центр (равен двум радиусам)

Круг используется в геометрии, физике и инженерии.', 2, 4, 9);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Трапеция', 'Трапеция — это четырёхугольник, у которого только одна пара сторон параллельна.

Параллельные стороны называются основаниями.

Трапеции используются в геометрии и задачах на площадь.', 2, 5, 10);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('8-я сис. счисления', 'Это система счисления с основанием 8.

Используются цифры: 0, 1, 2, 3, 4, 5, 6, 7

После 7 идёт 10 (в восьмеричной системе).

Применяется в программировании и компьютерных вычислениях.', 3, 1, 11);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('10-я сис. счисления', 'Это стандартная система счисления, которой пользуются люди.

Основание — 10. Используются цифры от 0 до 9.

Все привычные числа записаны именно в этой системе.', 3, 2, 12);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('2-я сис. счисления', 'Двоичная система счисления имеет основание 2.

Используются только две цифры: 0 и 1

Например: 101₂ = 5₁₀

Используется в компьютерах, так как электроника работает с двумя состояниями (вкл/выкл).', 3, 3, 13);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('16-я сис. счисления', 'Шестнадцатеричная система имеет основание 16.

Используются: 0–9 и A–F (где A = 10, B = 11 … F = 15)

Например: A₁₆ = 10₁₀

Часто применяется в программировании, например, в цветах (#FFFFFF).', 3, 4, 14);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES ('Типы данных', 'Типы данных — это категории информации, которые используются в программировании.

Основные типы:

int — целые числа (например: 1, 10, -5) string — текст (например: "Привет") bool — логический тип (true или false)

Тип данных определяет, какие операции можно выполнять с данными.

Например: числа можно складывать, а строки — объединять.', 3, 5, 15);


--
-- TOC entry 3517 (class 0 OID 17068)
-- Dependencies: 229
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (21, 2, 'Найдите сторону квадрата, если площадь равна 81', '9', 3, 1, '""', 6);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (22, 2, 'Найдите третий угол, если два угла 60 и 50', '70', 1, 2, '""', 7);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (23, 2, 'Найдите третий угол, если два угла 45 и 45', '90', 2, 2, '""', 7);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (24, 2, 'Найдите третий угол, если два угла 35 и 75', '70', 3, 2, '""', 7);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (25, 2, 'Найдите площадь: 4 × 5', '20', 1, 3, '""', 8);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (26, 2, 'Найдите площадь: 7 × 9', '63', 2, 3, '""', 8);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (27, 2, 'Найдите площадь прямоугольника со сторонами 12 и 8', '96', 3, 3, '""', 8);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (28, 2, 'Найдите диаметр, если радиус равен 3', '6', 1, 4, '""', 9);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (29, 2, 'Найдите радиус, если диаметр равен 10

', '5', 2, 4, '""', 9);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (30, 2, 'Найдите диаметр, если радиус равен 7', '14', 3, 4, '""', 9);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (31, 2, 'Назовите, какие стороны являются параллельными', 'Параллельные стороны — основания', 1, 5, '""', 10);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (32, 2, 'Найдите среднюю линию, если основания равны 6 и 10

', '8', 2, 5, '""', 10);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (18, 1, 'Найдите 15% от 320', '48', 3, 5, '""', 5);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (37, 3, 'Запишите число 15.  Формат: число(система счисления)', '15(10) = 15', 1, 2, '""', 12);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (47, 3, 'Определите тип значения "Hello"', 'string', 2, 5, '""', 15);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (1, 1, '7 + 5', '12', 1, 1, '""', 1);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (2, 1, ' 23 + 48', '71', 2, 1, '""', 1);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (3, 1, '125 + 378 + 96', '599', 3, 1, '""', 1);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (33, 2, 'Найдите среднюю линию, если основания равны 12 и 18', '15', 3, 5, '""', 10);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (14, 1, '56 − 27

', '29', 2, 4, '""', 4);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (38, 3, 'Переведите 101 из двоичной в десятичную.  Формат: число(система счисления)', '101(2) = 5(10)

', 2, 2, '""', 12);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (7, 1, '6 × 4', '24', 1, 2, '""', 2);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (8, 1, '12 × 8', '96', 2, 2, '""', 2);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (34, 3, 'Запишите число 7 в восьмеричной системе. Формат: число(система счисления)', '7(8) = 7(10)', 1, 1, '""', 11);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (10, 1, '12 ÷ 3', '4', 1, 3, '""', 3);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (11, 1, '45 ÷ 5', '9', 2, 3, '""', 3);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (12, 1, '144 ÷ 12 + 36 ÷ 6', '18', 3, 3, '""', 3);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (13, 1, '9 − 4', '5', 1, 4, '""', 4);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (9, 1, '25 × 16', '400', 3, 2, '""', 2);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (19, 2, 'Найдите периметр квадрата со стороной 5', '20', 1, 1, '""', 6);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (20, 2, 'Найдите площадь квадрата со стороной 7', '49', 2, 1, '""', 6);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (35, 3, 'Переведите 10 из восьмеричной в десятичную.  Формат: число(система счисления)', '10(8)= 8(10)', 2, 1, '""', 11);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (36, 3, 'Переведите 25 из восьмеричной в десятичную.  Формат: число(система счисления)', '25(8) = 2×8 + 5 = 21(10)', 3, 1, '""', 11);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (48, 3, 'Определите тип значения true', 'bool', 3, 5, '""', 15);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (15, 1, '200 − 85 − 34', '81', 3, 4, '""', 4);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (16, 1, 'Найдите 10% от 50', '5', 1, 5, '""', 5);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (17, 1, 'Найдите 25% от 200', '50', 2, 5, '""', 5);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (39, 3, 'Переведите 111 из двоичной в десятичную.  Формат: число(система счисления)', '111(2) = 7(10)', 3, 2, '""', 12);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (40, 3, 'Запишите число 1 в двоичной системе.  Формат: число(система счисления)', '1(10) = 1(2)', 1, 3, '""', 13);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (41, 3, 'Переведите 5 из десятичной в двоичную.  Формат: число(система счисления)', '5(10) = 101(2)', 2, 3, '""', 13);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (42, 3, 'Переведите 13 из десятичной в двоичную.  Формат: число(система счисления)', '13(10) = 1101(2)

', 3, 3, '""', 13);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (43, 3, 'Что означает A.  Формат: число(система счисления)', ' A(16)= 10(10)', 1, 4, '""', 14);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (44, 3, 'Переведите F в десятичную систему.  Формат: число(система счисления)', ' F(16) = 15(10)', 2, 4, '""', 14);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (45, 3, 'Переведите 1A в десятичную систему.  Формат: число(система счисления)', '1A(16) = 26(10)', 3, 4, '""', 14);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (46, 3, 'Определите тип значения 10', 'int', 1, 5, '""', 15);


--
-- TOC entry 3519 (class 0 OID 17078)
-- Dependencies: 231
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" OVERRIDING SYSTEM VALUE VALUES (4, 'Kirill', 'k@mail.ru', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 5);
INSERT INTO public."user" OVERRIDING SYSTEM VALUE VALUES (5, 'fr', 'fr@fr', '0TVmngBW2WZZppacqkDa1FdqEBIeqtdEUh6aCc3KaoM=', 3);
INSERT INTO public."user" OVERRIDING SYSTEM VALUE VALUES (6, 'Vanya', 'v@mail.ru', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 1);
INSERT INTO public."user" OVERRIDING SYSTEM VALUE VALUES (7, 'test', 't@mail.ru', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 3);


--
-- TOC entry 3520 (class 0 OID 17083)
-- Dependencies: 232
-- Data for Name: user_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (4, 1, 10, '2026-04-19 01:56:35.848139', 51, 1);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (4, 1, 10, '2026-04-19 01:56:46.523356', 52, 2);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (4, 1, 10, '2026-04-19 01:57:02.676695', 53, 4);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (4, 1, 10, '2026-04-19 01:57:13.319982', 54, 5);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (5, 1, 20, '2026-04-19 08:22:44.841107', 55, 3);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (6, 1, 10, '2026-04-19 09:03:07.746977', 56, 5);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (6, 1, 10, '2026-04-19 09:06:43.968005', 57, 1);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (6, 3, 54, '2026-04-19 09:21:53.130509', 58, 1);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (7, 1, 12, '2026-04-19 10:15:20.534736', 59, 1);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (7, 1, 10, '2026-04-19 10:22:22.819894', 60, 2);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (7, 1, 10, '2026-04-19 10:23:12.178688', 61, 3);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (7, 1, 10, '2026-04-19 10:23:57.824982', 62, 4);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (7, 1, 10, '2026-04-19 10:25:48.812087', 63, 5);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (7, 3, 10, '2026-04-19 10:27:28.035499', 64, 1);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (7, 3, 10, '2026-04-19 10:29:14.287367', 65, 2);
INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (7, 3, 10, '2026-04-19 10:30:16.794125', 66, 3);


--
-- TOC entry 3522 (class 0 OID 17090)
-- Dependencies: 234
-- Data for Name: user_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (43, 4, 1, 1);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (44, 4, 1, 2);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (45, 4, 1, 4);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (46, 4, 1, 5);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (47, 5, 1, 3);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (48, 6, 1, 5);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (49, 6, 1, 1);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (50, 6, 3, 1);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (51, 7, 1, 1);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (52, 7, 1, 2);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (53, 7, 1, 3);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (54, 7, 1, 4);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (55, 7, 1, 5);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (56, 7, 3, 1);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (57, 7, 3, 2);
INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (58, 7, 3, 3);


--
-- TOC entry 3524 (class 0 OID 17095)
-- Dependencies: 236
-- Data for Name: user_deadline; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-05-18 22:56:00', false, 25);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-05-18 22:56:00', false, 26);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-05-18 22:56:00', false, 27);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-05-18 22:57:00', false, 28);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (5, 1, '2026-05-19 05:22:00', false, 29);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (6, 1, '2026-05-29 06:02:00', false, 30);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (6, 1, '2026-05-19 06:03:00', false, 31);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (6, 3, '2026-05-19 06:21:00', false, 32);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (7, 1, '2026-05-19 07:14:00', false, 33);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (7, 1, '2026-05-19 07:22:00', false, 34);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (7, 1, '2026-05-19 07:23:00', false, 35);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (7, 1, '2026-05-19 07:23:00', false, 36);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (7, 1, '2026-05-19 07:25:00', false, 37);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (7, 3, '2026-05-19 07:27:00', false, 38);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (7, 3, '2026-05-19 07:29:00', false, 39);
INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (7, 3, '2026-05-19 07:30:00', false, 40);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 216
-- Name: activity_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_time_id_seq', 1, true);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 218
-- Name: balls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.balls_id_seq', 3, true);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 220
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 5, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 223
-- Name: course_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_class_id_seq', 1, false);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 224
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 3, true);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 226
-- Name: dedline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dedline_id_seq', 1, false);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 228
-- Name: lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_id_seq', 15, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 230
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 48, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_activity_id_seq', 66, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 235
-- Name: user_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_course_id_seq', 58, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 237
-- Name: user_deadline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_deadline_id_seq', 40, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 238
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 7, true);


--
-- TOC entry 3316 (class 2606 OID 17102)
-- Name: activity_time activity_time_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_time
    ADD CONSTRAINT activity_time_pk PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 17104)
-- Name: balls balls_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balls
    ADD CONSTRAINT balls_pk PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 17106)
-- Name: class class_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pk PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 17108)
-- Name: course_class course_class_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT course_class_pk PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 17110)
-- Name: course course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pk PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 17112)
-- Name: dedline dedline_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dedline
    ADD CONSTRAINT dedline_pk PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 17114)
-- Name: lesson lesson_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pk PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 17116)
-- Name: test test_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pk PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 17118)
-- Name: user_activity user_activity_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_pk PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 17120)
-- Name: user_course user_course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_course_pk PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 17122)
-- Name: user_deadline user_deadline_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_pk PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 17124)
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 17126)
-- Name: user user_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_unique UNIQUE (email);


--
-- TOC entry 3341 (class 2606 OID 17127)
-- Name: activity_time activity_time_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_time
    ADD CONSTRAINT activity_time_id FOREIGN KEY ("time") REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3347 (class 2606 OID 17132)
-- Name: test balls_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT balls_id FOREIGN KEY (difficulty) REFERENCES public.balls(id) ON DELETE CASCADE;


--
-- TOC entry 3342 (class 2606 OID 17137)
-- Name: course_class class_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT class_id FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 17142)
-- Name: course_class course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3348 (class 2606 OID 17147)
-- Name: test course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3355 (class 2606 OID 17152)
-- Name: user_course course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3344 (class 2606 OID 17157)
-- Name: dedline dedline_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dedline
    ADD CONSTRAINT dedline_id FOREIGN KEY (dedline) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3345 (class 2606 OID 17162)
-- Name: lesson lesson_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3346 (class 2606 OID 17167)
-- Name: lesson lesson_course_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_course_fk FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3349 (class 2606 OID 17172)
-- Name: test test_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3350 (class 2606 OID 17177)
-- Name: test test_lesson_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_lesson_fk FOREIGN KEY (lesson_id) REFERENCES public.lesson(id) ON DELETE CASCADE;


--
-- TOC entry 3352 (class 2606 OID 17182)
-- Name: user_activity user_activity_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3353 (class 2606 OID 17187)
-- Name: user_activity user_activity_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3354 (class 2606 OID 17192)
-- Name: user_activity user_activity_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 3351 (class 2606 OID 17197)
-- Name: user user_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE SET NULL;


--
-- TOC entry 3356 (class 2606 OID 17202)
-- Name: user_course user_course_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_course_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3358 (class 2606 OID 17207)
-- Name: user_deadline user_deadline_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3359 (class 2606 OID 17212)
-- Name: user_deadline user_deadline_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 3357 (class 2606 OID 17217)
-- Name: user_course user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


-- Completed on 2026-04-19 10:34:23 MSK

--
-- PostgreSQL database dump complete
--

\unrestrict rVNZ344H7svmfn05uKMxrgDrV9Xorg0eleqhOURlmFtIb9GIdaDNfsTKz5dQ7Uf

