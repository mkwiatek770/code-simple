--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: exercise_exercise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise_exercise (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    image_name character varying(100) NOT NULL,
    short_description text NOT NULL,
    description text NOT NULL,
    level integer NOT NULL,
    experience_points integer NOT NULL,
    likes smallint NOT NULL,
    dislikes smallint NOT NULL,
    CONSTRAINT exercise_exercise_experience_points_check CHECK ((experience_points >= 0))
);


ALTER TABLE public.exercise_exercise OWNER TO postgres;

--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_exercise_id_seq OWNER TO postgres;

--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_exercise_id_seq OWNED BY public.exercise_exercise.id;


--
-- Name: exercise_exercise_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise_exercise_tags (
    id integer NOT NULL,
    exercise_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.exercise_exercise_tags OWNER TO postgres;

--
-- Name: exercise_exercise_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_exercise_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_exercise_tags_id_seq OWNER TO postgres;

--
-- Name: exercise_exercise_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_exercise_tags_id_seq OWNED BY public.exercise_exercise_tags.id;


--
-- Name: exercise_exercisetest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise_exercisetest (
    id integer NOT NULL,
    test_number integer NOT NULL,
    user_input character varying(255) NOT NULL,
    expected_output character varying(255) NOT NULL,
    exercise_id integer NOT NULL
);


ALTER TABLE public.exercise_exercisetest OWNER TO postgres;

--
-- Name: exercise_exercisetest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_exercisetest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_exercisetest_id_seq OWNER TO postgres;

--
-- Name: exercise_exercisetest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_exercisetest_id_seq OWNED BY public.exercise_exercisetest.id;


--
-- Name: exercise_exercisetestuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise_exercisetestuser (
    id integer NOT NULL,
    output character varying(255),
    passed boolean,
    exercise_test_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.exercise_exercisetestuser OWNER TO postgres;

--
-- Name: exercise_exercisetestuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_exercisetestuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_exercisetestuser_id_seq OWNER TO postgres;

--
-- Name: exercise_exercisetestuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_exercisetestuser_id_seq OWNED BY public.exercise_exercisetestuser.id;


--
-- Name: exercise_exerciseuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise_exerciseuser (
    id integer NOT NULL,
    code text NOT NULL,
    code_style_indent integer NOT NULL,
    code_style_color integer NOT NULL,
    last_modification timestamp with time zone NOT NULL,
    solved boolean NOT NULL,
    submitted boolean NOT NULL,
    "like" boolean,
    traceback character varying(4000),
    exercise_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.exercise_exerciseuser OWNER TO postgres;

--
-- Name: exercise_exerciseuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_exerciseuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_exerciseuser_id_seq OWNER TO postgres;

--
-- Name: exercise_exerciseuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_exerciseuser_id_seq OWNED BY public.exercise_exerciseuser.id;


--
-- Name: exercise_exerciseusercomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise_exerciseusercomment (
    id integer NOT NULL,
    message text NOT NULL,
    date timestamp with time zone NOT NULL,
    exercise_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.exercise_exerciseusercomment OWNER TO postgres;

--
-- Name: exercise_exerciseusercomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_exerciseusercomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_exerciseusercomment_id_seq OWNER TO postgres;

--
-- Name: exercise_exerciseusercomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_exerciseusercomment_id_seq OWNED BY public.exercise_exerciseusercomment.id;


--
-- Name: exercise_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise_tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.exercise_tag OWNER TO postgres;

--
-- Name: exercise_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_tag_id_seq OWNER TO postgres;

--
-- Name: exercise_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_tag_id_seq OWNED BY public.exercise_tag.id;


--
-- Name: users_badge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_badge (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    reward_points integer NOT NULL,
    icon character varying(100) NOT NULL,
    CONSTRAINT users_badge_reward_points_check CHECK ((reward_points >= 0))
);


ALTER TABLE public.users_badge OWNER TO postgres;

--
-- Name: users_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_badge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_badge_id_seq OWNER TO postgres;

--
-- Name: users_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_badge_id_seq OWNED BY public.users_badge.id;


--
-- Name: users_profileuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_profileuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    experience_pts bigint NOT NULL,
    level integer NOT NULL,
    avatar character varying(100) NOT NULL,
    favourite_language_id integer
);


ALTER TABLE public.users_profileuser OWNER TO postgres;

--
-- Name: users_profileuser_badges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_profileuser_badges (
    id integer NOT NULL,
    profileuser_id integer NOT NULL,
    badge_id integer NOT NULL
);


ALTER TABLE public.users_profileuser_badges OWNER TO postgres;

--
-- Name: users_profileuser_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_profileuser_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profileuser_badges_id_seq OWNER TO postgres;

--
-- Name: users_profileuser_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_profileuser_badges_id_seq OWNED BY public.users_profileuser_badges.id;


--
-- Name: users_profileuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_profileuser_groups (
    id integer NOT NULL,
    profileuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_profileuser_groups OWNER TO postgres;

--
-- Name: users_profileuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_profileuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profileuser_groups_id_seq OWNER TO postgres;

--
-- Name: users_profileuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_profileuser_groups_id_seq OWNED BY public.users_profileuser_groups.id;


--
-- Name: users_profileuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_profileuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profileuser_id_seq OWNER TO postgres;

--
-- Name: users_profileuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_profileuser_id_seq OWNED BY public.users_profileuser.id;


--
-- Name: users_profileuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_profileuser_user_permissions (
    id integer NOT NULL,
    profileuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_profileuser_user_permissions OWNER TO postgres;

--
-- Name: users_profileuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_profileuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profileuser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_profileuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_profileuser_user_permissions_id_seq OWNED BY public.users_profileuser_user_permissions.id;


--
-- Name: users_programminglanguage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_programminglanguage (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    icon character varying(100) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.users_programminglanguage OWNER TO postgres;

--
-- Name: users_programminglanguage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_programminglanguage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_programminglanguage_id_seq OWNER TO postgres;

--
-- Name: users_programminglanguage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_programminglanguage_id_seq OWNED BY public.users_programminglanguage.id;


--
-- Name: users_usermessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_usermessage (
    id integer NOT NULL,
    subject character varying(200) NOT NULL,
    message text NOT NULL,
    date_sent timestamp with time zone NOT NULL,
    read boolean NOT NULL,
    receiver_id integer NOT NULL,
    sender_id integer NOT NULL
);


ALTER TABLE public.users_usermessage OWNER TO postgres;

--
-- Name: users_usermessage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_usermessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_usermessage_id_seq OWNER TO postgres;

--
-- Name: users_usermessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_usermessage_id_seq OWNED BY public.users_usermessage.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: exercise_exercise id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise ALTER COLUMN id SET DEFAULT nextval('public.exercise_exercise_id_seq'::regclass);


--
-- Name: exercise_exercise_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise_tags ALTER COLUMN id SET DEFAULT nextval('public.exercise_exercise_tags_id_seq'::regclass);


--
-- Name: exercise_exercisetest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercisetest ALTER COLUMN id SET DEFAULT nextval('public.exercise_exercisetest_id_seq'::regclass);


--
-- Name: exercise_exercisetestuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercisetestuser ALTER COLUMN id SET DEFAULT nextval('public.exercise_exercisetestuser_id_seq'::regclass);


--
-- Name: exercise_exerciseuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exerciseuser ALTER COLUMN id SET DEFAULT nextval('public.exercise_exerciseuser_id_seq'::regclass);


--
-- Name: exercise_exerciseusercomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exerciseusercomment ALTER COLUMN id SET DEFAULT nextval('public.exercise_exerciseusercomment_id_seq'::regclass);


--
-- Name: exercise_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_tag ALTER COLUMN id SET DEFAULT nextval('public.exercise_tag_id_seq'::regclass);


--
-- Name: users_badge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_badge ALTER COLUMN id SET DEFAULT nextval('public.users_badge_id_seq'::regclass);


--
-- Name: users_profileuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser ALTER COLUMN id SET DEFAULT nextval('public.users_profileuser_id_seq'::regclass);


--
-- Name: users_profileuser_badges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_badges ALTER COLUMN id SET DEFAULT nextval('public.users_profileuser_badges_id_seq'::regclass);


--
-- Name: users_profileuser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_groups ALTER COLUMN id SET DEFAULT nextval('public.users_profileuser_groups_id_seq'::regclass);


--
-- Name: users_profileuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_profileuser_user_permissions_id_seq'::regclass);


--
-- Name: users_programminglanguage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_programminglanguage ALTER COLUMN id SET DEFAULT nextval('public.users_programminglanguage_id_seq'::regclass);


--
-- Name: users_usermessage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_usermessage ALTER COLUMN id SET DEFAULT nextval('public.users_usermessage_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add exercise	6	add_exercise
22	Can change exercise	6	change_exercise
23	Can delete exercise	6	delete_exercise
24	Can view exercise	6	view_exercise
25	Can add exercise test	7	add_exercisetest
26	Can change exercise test	7	change_exercisetest
27	Can delete exercise test	7	delete_exercisetest
28	Can view exercise test	7	view_exercisetest
29	Can add tag	8	add_tag
30	Can change tag	8	change_tag
31	Can delete tag	8	delete_tag
32	Can view tag	8	view_tag
33	Can add profile user	9	add_profileuser
34	Can change profile user	9	change_profileuser
35	Can delete profile user	9	delete_profileuser
36	Can view profile user	9	view_profileuser
37	Can add badge	10	add_badge
38	Can change badge	10	change_badge
39	Can delete badge	10	delete_badge
40	Can view badge	10	view_badge
41	Can add programming language	11	add_programminglanguage
42	Can change programming language	11	change_programminglanguage
43	Can delete programming language	11	delete_programminglanguage
44	Can view programming language	11	view_programminglanguage
45	Can add user message	12	add_usermessage
46	Can change user message	12	change_usermessage
47	Can delete user message	12	delete_usermessage
48	Can view user message	12	view_usermessage
49	Can add exercise test user	13	add_exercisetestuser
50	Can change exercise test user	13	change_exercisetestuser
51	Can delete exercise test user	13	delete_exercisetestuser
52	Can view exercise test user	13	view_exercisetestuser
53	Can add exercise user comment	14	add_exerciseusercomment
54	Can change exercise user comment	14	change_exerciseusercomment
55	Can delete exercise user comment	14	delete_exerciseusercomment
56	Can view exercise user comment	14	view_exerciseusercomment
57	Can add exercise user	15	add_exerciseuser
58	Can change exercise user	15	change_exerciseuser
59	Can delete exercise user	15	delete_exerciseuser
60	Can view exercise user	15	view_exerciseuser
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-03-27 12:41:11.794019+01	1	Multiply Numbers	1	[{"added": {}}]	6	1
2	2019-03-27 12:42:11.501449+01	2	Divide Numbers	1	[{"added": {}}]	6	1
3	2019-03-27 12:42:55.709024+01	3	Add Numbers	1	[{"added": {}}]	6	1
4	2019-03-27 12:43:38.271434+01	4	Subtract Numbers	1	[{"added": {}}]	6	1
5	2019-03-27 12:44:11.223456+01	1	Subtract Numbers 1, 0 --> 1	1	[{"added": {}}]	7	1
6	2019-03-27 12:44:23.646969+01	2	Subtract Numbers 10, 5 --> 5	1	[{"added": {}}]	7	1
7	2019-03-27 12:44:37.22683+01	3	Subtract Numbers -10, 10 --> -20	1	[{"added": {}}]	7	1
8	2019-03-27 12:44:52.064176+01	4	Subtract Numbers 0.2, 0.1 --> 0.1	1	[{"added": {}}]	7	1
9	2019-03-27 12:45:15.836281+01	5	Add Numbers 1, 0 --> 1	1	[{"added": {}}]	7	1
10	2019-03-27 12:45:24.419231+01	6	Add Numbers 2, 5 --> 7	1	[{"added": {}}]	7	1
11	2019-03-27 12:45:37.660638+01	7	Add Numbers -10, 10 --> 0	1	[{"added": {}}]	7	1
12	2019-03-27 12:46:00.676046+01	8	Add Numbers 0.2, 0.1 --> 0.3	1	[{"added": {}}]	7	1
13	2019-03-27 12:46:31.760812+01	9	Divide Numbers 10, 1 --> 10	1	[{"added": {}}]	7	1
14	2019-03-27 12:46:50.464797+01	10	Divide Numbers 9, -3 --> -3	1	[{"added": {}}]	7	1
15	2019-03-27 12:46:59.631913+01	11	Divide Numbers -10, 10 --> -1	1	[{"added": {}}]	7	1
16	2019-03-27 12:47:10.459031+01	12	Divide Numbers 0.2, 0.1 --> 2	1	[{"added": {}}]	7	1
17	2019-03-27 12:47:46.284071+01	13	Multiply Numbers 10, 1 --> 10	1	[{"added": {}}]	7	1
18	2019-03-27 12:47:55.001293+01	14	Multiply Numbers 9, -3 --> -27	1	[{"added": {}}]	7	1
19	2019-03-27 12:48:07.31588+01	15	Multiply Numbers -10, 10 --> -100	1	[{"added": {}}]	7	1
20	2019-03-27 12:48:18.694671+01	16	Multiply Numbers 0.2, 0.1 --> 0.02	1	[{"added": {}}]	7	1
21	2019-03-27 12:49:11.663669+01	1	First Achieve	1	[{"added": {}}]	10	1
22	2019-03-27 12:50:50.459203+01	2	Gettin' Started	1	[{"added": {}}]	10	1
23	2019-03-27 12:51:11.55015+01	3	Good Streak	1	[{"added": {}}]	10	1
24	2019-03-27 12:51:59.638865+01	4	Socialize	1	[{"added": {}}]	10	1
25	2019-03-27 12:52:27.27899+01	5	Socialize More	1	[{"added": {}}]	10	1
26	2019-03-27 12:54:19.047391+01	1	Python	1	[{"added": {}}]	11	1
27	2019-03-27 12:54:40.442577+01	2	C++	1	[{"added": {}}]	11	1
28	2019-03-27 12:54:54.277382+01	3	JavaScript	1	[{"added": {}}]	11	1
29	2019-03-27 12:55:07.442012+01	4	Ruby	1	[{"added": {}}]	11	1
30	2019-03-27 12:55:25.635504+01	5	PHP	1	[{"added": {}}]	11	1
31	2019-03-27 12:59:53.547701+01	5	PHP	2	[]	11	1
32	2019-03-27 13:00:38.608245+01	5	Socialize More	2	[{"changed": {"fields": ["icon"]}}]	10	1
33	2019-03-27 13:00:57.825253+01	4	Socialize	2	[{"changed": {"fields": ["icon"]}}]	10	1
34	2019-03-27 13:01:17.116943+01	3	Good Streak	2	[{"changed": {"fields": ["icon"]}}]	10	1
35	2019-03-27 13:01:31.07931+01	2	Gettin' Started	2	[{"changed": {"fields": ["icon"]}}]	10	1
36	2019-03-27 13:01:37.595257+01	1	First Achieve	2	[{"changed": {"fields": ["icon"]}}]	10	1
37	2019-03-27 13:05:28.429212+01	1	admin	2	[{"changed": {"fields": ["avatar"]}}]	9	1
38	2019-03-27 13:05:55.497452+01	1	admin	2	[]	9	1
39	2019-03-27 14:22:30.152029+01	2	some_username	3		9	1
40	2019-03-27 18:49:32.150117+01	1	admin	2	[{"changed": {"fields": ["badges"]}}]	9	1
41	2019-03-27 19:06:48.929732+01	1	admin	2	[{"changed": {"fields": ["badges"]}}]	9	1
42	2019-03-27 19:38:02.858364+01	1	admin	2	[{"changed": {"fields": ["badges"]}}]	9	1
43	2019-03-27 19:39:59.881956+01	1	admin	2	[{"changed": {"fields": ["badges"]}}]	9	1
44	2019-03-28 11:47:37.993772+01	3	user12	3		9	1
45	2019-03-28 11:49:20.88443+01	4	user12	3		9	1
46	2019-03-28 17:26:05.208275+01	2	Add Numbers - user12	3		15	1
47	2019-03-28 17:26:05.212145+01	1	Add Numbers - user12	3		15	1
48	2019-03-28 17:26:19.467088+01	6	ExerciseTestUser object (6)	3		13	1
49	2019-03-28 17:26:19.471795+01	5	ExerciseTestUser object (5)	3		13	1
50	2019-03-28 17:26:19.47493+01	4	ExerciseTestUser object (4)	3		13	1
51	2019-03-28 17:26:19.477638+01	3	ExerciseTestUser object (3)	3		13	1
52	2019-03-28 17:26:19.480453+01	2	ExerciseTestUser object (2)	3		13	1
53	2019-03-28 17:26:19.483461+01	1	ExerciseTestUser object (1)	3		13	1
54	2019-03-28 17:28:14.640131+01	9	ExerciseTestUser object (9)	3		13	1
55	2019-03-28 17:28:14.643869+01	8	ExerciseTestUser object (8)	3		13	1
56	2019-03-28 17:28:14.646631+01	7	ExerciseTestUser object (7)	3		13	1
57	2019-03-28 17:28:24.476175+01	3	Add Numbers - admin	3		15	1
58	2019-03-28 17:32:04.13937+01	12	ExerciseTestUser object (12)	3		13	1
59	2019-03-28 17:32:04.142503+01	11	ExerciseTestUser object (11)	3		13	1
60	2019-03-28 17:32:04.145449+01	10	ExerciseTestUser object (10)	3		13	1
61	2019-03-28 17:32:46.240366+01	4	Divide Numbers - admin	3		15	1
62	2019-03-30 09:02:08.788068+01	8	user15	2	[{"changed": {"fields": ["favourite_language", "avatar"]}}]	9	1
63	2019-03-30 09:02:22.765059+01	7	user14	2	[{"changed": {"fields": ["avatar"]}}]	9	1
64	2019-03-30 09:02:38.394475+01	6	user13	2	[{"changed": {"fields": ["avatar"]}}]	9	1
65	2019-03-30 10:12:29.966752+01	9	user16	2	[{"changed": {"fields": ["avatar"]}}]	9	1
66	2019-03-30 10:12:39.820388+01	10	user17	2	[{"changed": {"fields": ["avatar"]}}]	9	1
67	2019-03-30 10:25:10.645745+01	11	user19	2	[{"changed": {"fields": ["avatar"]}}]	9	1
68	2019-03-30 10:31:02.088757+01	12	user20	2	[{"changed": {"fields": ["avatar"]}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	exercise	exercise
7	exercise	exercisetest
8	exercise	tag
9	users	profileuser
10	users	badge
11	users	programminglanguage
12	users	usermessage
13	exercise	exercisetestuser
14	exercise	exerciseusercomment
15	exercise	exerciseuser
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-03-27 12:35:22.723133+01
2	contenttypes	0002_remove_content_type_name	2019-03-27 12:35:22.735927+01
3	auth	0001_initial	2019-03-27 12:35:22.808034+01
4	auth	0002_alter_permission_name_max_length	2019-03-27 12:35:22.818093+01
5	auth	0003_alter_user_email_max_length	2019-03-27 12:35:22.826305+01
6	auth	0004_alter_user_username_opts	2019-03-27 12:35:22.834499+01
7	auth	0005_alter_user_last_login_null	2019-03-27 12:35:22.843325+01
8	auth	0006_require_contenttypes_0002	2019-03-27 12:35:22.846786+01
9	auth	0007_alter_validators_add_error_messages	2019-03-27 12:35:22.856292+01
10	auth	0008_alter_user_username_max_length	2019-03-27 12:35:22.864477+01
11	auth	0009_alter_user_last_name_max_length	2019-03-27 12:35:22.873528+01
12	users	0001_initial	2019-03-27 12:35:23.110777+01
13	admin	0001_initial	2019-03-27 12:35:23.153946+01
14	admin	0002_logentry_remove_auto_add	2019-03-27 12:35:23.169129+01
15	admin	0003_logentry_add_action_flag_choices	2019-03-27 12:35:23.18253+01
16	exercise	0001_initial	2019-03-27 12:35:23.312878+01
17	sessions	0001_initial	2019-03-27 12:35:23.351321+01
18	users	0002_usermessage	2019-03-27 13:11:31.915634+01
19	exercise	0002_exercisetestuser	2019-03-27 13:19:10.850912+01
20	exercise	0003_exerciseusercomment	2019-03-27 13:23:16.040513+01
21	exercise	0004_exerciseuser	2019-03-27 15:02:41.786564+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
zadfxmqbn8mk6y4eys9epxiys6394s9z	NTc3MDc3NmY4ZTU0MWJlYmRkNWJjZGUwNDJjMTA4OTE3NGU5ZWZhMzp7fQ==	2019-04-13 12:56:09.469074+02
17idhfmllwziapuenetfh82m5hnp35sg	NTc3MDc3NmY4ZTU0MWJlYmRkNWJjZGUwNDJjMTA4OTE3NGU5ZWZhMzp7fQ==	2019-04-13 12:56:59.083965+02
drx3o754vgjt5y16y5drpmcg50kzrsvm	NTc3MDc3NmY4ZTU0MWJlYmRkNWJjZGUwNDJjMTA4OTE3NGU5ZWZhMzp7fQ==	2019-04-13 12:59:23.258555+02
av4p2v9rsreeyjripsl2qc8cchofb10y	NTc3MDc3NmY4ZTU0MWJlYmRkNWJjZGUwNDJjMTA4OTE3NGU5ZWZhMzp7fQ==	2019-04-13 13:05:28.91922+02
vsl8vgw15m5wsrvy78qbylj10lc74s8n	NTc3MDc3NmY4ZTU0MWJlYmRkNWJjZGUwNDJjMTA4OTE3NGU5ZWZhMzp7fQ==	2019-04-13 13:07:55.549343+02
ial4mrm6ae0js9m8ce9vzx92nvj6t1zo	MjlhMmMxNmMwNmZhMTFmODc4NGIxMzIwZjc4N2MzODhiMGVkODM0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYWI3ODBlNzQ3NTY2NmY2NTExYTUxOTZlNTEzOTY4ZTUxMTIxM2JjIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-04-11 12:45:14.662133+02
yrp6xzcdcnh4ny3ed57jqu7nt0ewk0bu	NWUyZTdjMDQwNmU2MGMwNDViOWFjMDhiYmZkYjk4M2NlOGMxOGY3Mjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlODk5YjUzNzFjYzBhY2E2YWU5MjEwNWUyYjRhZGNhNjIxYTI5ZjJiIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJyYW5kb21fZXhlcmNpc2VfaWQiOjJ9	2019-04-13 13:14:34.60967+02
h0olx8h9goldqq643eqnivlg3psl1xhu	ZWIwOTg4MzEzZjNiMWQ1OTA2MjRmYzAzODNhMDM3YzU5N2VhNzhhMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYWI3ODBlNzQ3NTY2NmY2NTExYTUxOTZlNTEzOTY4ZTUxMTIxM2JjIn0=	2019-04-12 10:21:14.68294+02
v6lqsp4ry68u9vk307zrgjdgazk5njjl	NjNhMTg3MDA1ZTJkNDhjNTY0NGE1NzI2OTZhZGJmMjA0MzRmZjUzNTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlODk5YjUzNzFjYzBhY2E2YWU5MjEwNWUyYjRhZGNhNjIxYTI5ZjJiIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2019-04-12 20:18:22.083295+02
\.


--
-- Data for Name: exercise_exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise_exercise (id, title, slug, image_name, short_description, description, level, experience_points, likes, dislikes) FROM stdin;
2	Divide Numbers	divide-numbers	michal770/divide:2	Given two numbers, return result of dividing these numbers.	<p>Given two numbers, return result of dividing these numbers.</p>\r\n\r\n<div>\r\n<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id ullamcorper enim, a semper dui. Donec dignissim, mi sit amet scelerisque convallis, enim justo pellentesque lacus, sit amet pharetra massa ante sed mauris. Donec sed lorem rhoncus, faucibus ligula et, semper elit. Nullam vestibulum lobo</p>\r\n\r\n<p>rtis nibh nec vulputate. Vivamus bibendum iaculis urna, non pretium ipsum pretium a. Vivamus dictum ornare mollis. Aenean volutpat imperdiet est, a faucibus justo viverra nec. Cras vitae gravida mi, a bibendum turpis. Etiam vitae ligula cursus, sodales magna a, accumsan libero. Donec quis fermentum leo. Vivamus pulvinar et diam vel faucibus. Suspendisse cursus massa est, et placerat quam lobortis eget.</p>\r\n\r\n<p><strong>Example Code:</strong></p>\r\n\r\n<pre>\r\n<code class="language-python">def function(arg1):\r\n    return arg1</code></pre>\r\n</div>\r\n</div>	2	450	0	0
3	Add Numbers	add-numbers	michal770/add:2	Given two numbers, return sum of these numbers.	<p>Given two numbers, return sum of these numbers.</p>\r\n\r\n<div>\r\n<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id ullamcorper enim, a semper dui. Donec dignissim, mi sit amet scelerisque convallis, enim justo pellentesque lacus, sit amet pharetra massa ante sed mauris. Donec sed lorem rhoncus, faucibus ligula et, semper elit. Nullam vestibulum lobo</p>\r\n\r\n<p>rtis nibh nec vulputate. Vivamus bibendum iaculis urna, non pretium ipsum pretium a. Vivamus dictum ornare mollis. Aenean volutpat imperdiet est, a faucibus justo viverra nec. Cras vitae gravida mi, a bibendum turpis. Etiam vitae ligula cursus, sodales magna a, accumsan libero. Donec quis fermentum leo. Vivamus pulvinar et diam vel faucibus. Suspendisse cursus massa est, et placerat quam lobortis eget.</p>\r\n\r\n<p><strong>Example Code:</strong></p>\r\n\r\n<pre>\r\n<code class="language-python">def function(arg1):\r\n    return arg1</code></pre>\r\n</div>\r\n</div>	1	100	0	0
4	Subtract Numbers	subtract-numbers	michal770/subtract:2	Given two numbers, return result of subtracting these numbers.	<p>Given two numbers, return result of subtracting these numbers.</p>\r\n\r\n<div>\r\n<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id ullamcorper enim, a semper dui. Donec dignissim, mi sit amet scelerisque convallis, enim justo pellentesque lacus, sit amet pharetra massa ante sed mauris. Donec sed lorem rhoncus, faucibus ligula et, semper elit. Nullam vestibulum lobo</p>\r\n\r\n<p>rtis nibh nec vulputate. Vivamus bibendum iaculis urna, non pretium ipsum pretium a. Vivamus dictum ornare mollis. Aenean volutpat imperdiet est, a faucibus justo viverra nec. Cras vitae gravida mi, a bibendum turpis. Etiam vitae ligula cursus, sodales magna a, accumsan libero. Donec quis fermentum leo. Vivamus pulvinar et diam vel faucibus. Suspendisse cursus massa est, et placerat quam lobortis eget.</p>\r\n\r\n<p><strong>Example Code:</strong></p>\r\n\r\n<pre>\r\n<code class="language-python">def function(arg1):\r\n    return arg1</code></pre>\r\n</div>\r\n</div>	1	150	0	0
1	Multiply Numbers	multiply-numbers	michal770/multiply:3	Given two numbers, return result of mulpiplying these numbers.	<p>Given two numbers, return result of mulpiplying these numbers.</p>\r\n\r\n<div>\r\n<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id ullamcorper enim, a semper dui. Donec dignissim, mi sit amet scelerisque convallis, enim justo pellentesque lacus, sit amet pharetra massa ante sed mauris. Donec sed lorem rhoncus, faucibus ligula et, semper elit. Nullam vestibulum lobo</p>\r\n\r\n<p>rtis nibh nec vulputate. Vivamus bibendum iaculis urna, non pretium ipsum pretium a. Vivamus dictum ornare mollis. Aenean volutpat imperdiet est, a faucibus justo viverra nec. Cras vitae gravida mi, a bibendum turpis. Etiam vitae ligula cursus, sodales magna a, accumsan libero. Donec quis fermentum leo. Vivamus pulvinar et diam vel faucibus. Suspendisse cursus massa est, et placerat quam lobortis eget.</p>\r\n\r\n<p><strong>Example Code:</strong></p>\r\n\r\n<pre>\r\n<code class="language-python">def function(arg1):\r\n    return arg1</code></pre>\r\n</div>\r\n</div>	2	193	2	0
\.


--
-- Data for Name: exercise_exercise_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise_exercise_tags (id, exercise_id, tag_id) FROM stdin;
1	1	8
2	1	1
3	1	3
4	1	5
5	2	1
6	2	3
7	2	5
8	3	8
9	4	8
10	4	3
\.


--
-- Data for Name: exercise_exercisetest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise_exercisetest (id, test_number, user_input, expected_output, exercise_id) FROM stdin;
1	1	1, 0	1	4
2	2	10, 5	5	4
3	3	-10, 10	-20	4
4	4	0.2, 0.1	0.1	4
5	1	1, 0	1	3
6	2	2, 5	7	3
7	3	-10, 10	0	3
8	4	0.2, 0.1	0.3	3
9	1	10, 1	10	2
10	2	9, -3	-3	2
11	3	-10, 10	-1	2
12	4	0.2, 0.1	2	2
13	1	10, 1	10	1
14	2	9, -3	-27	1
15	3	-10, 10	-100	1
16	4	0.2, 0.1	0.02	1
\.


--
-- Data for Name: exercise_exercisetestuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise_exercisetestuser (id, output, passed, exercise_test_id, user_id) FROM stdin;
13	10	\N	13	1
14	-27	\N	14	1
15	-100	\N	15	1
16	0.02	\N	16	1
37	10.0	t	9	5
38	-3.0	t	10	5
39	-1.0	t	11	5
40	2.0	t	12	5
77	10.0	t	9	12
78	-3.0	t	10	12
79	-1.0	t	11	12
80	2.0	t	12	12
21	1	\N	5	5
22	7	\N	6	5
23	0	\N	7	5
24	0.3	\N	8	5
33	1	t	5	1
34	7	t	6	1
35	0	t	7	1
36	0.3	t	8	1
17	10	\N	13	5
18	-27	\N	14	5
19	-100	\N	15	5
20	0.02	\N	16	5
25	1	\N	1	1
26	5	\N	2	1
27	-20	\N	3	1
28	0.1	\N	4	1
29	10.0	t	9	1
30	-3.0	t	10	1
31	-1.0	t	11	1
32	2.0	t	12	1
41	10.0	t	9	6
42	-3.0	t	10	6
43	-1.0	t	11	6
44	2.0	t	12	6
45	1	t	1	7
46	5	t	2	7
47	-20	t	3	7
48	0.1	t	4	7
49	10.0	t	9	7
50	-3.0	t	10	7
51	-1.0	t	11	7
52	2.0	t	12	7
53	10.0	t	9	8
54	-3.0	t	10	8
55	-1.0	t	11	8
56	2.0	t	12	8
57	1	t	5	9
58	7	t	6	9
59	0	t	7	9
60	0.3	t	8	9
61	10.0	t	9	9
62	-3.0	t	10	9
63	-1.0	t	11	9
64	2.0	t	12	9
65	\N	\N	5	10
66	\N	\N	6	10
67	\N	\N	7	10
68	\N	\N	8	10
69	10.0	t	9	10
70	-3.0	t	10	10
71	-1.0	t	11	10
72	2.0	t	12	10
73	10.0	t	9	11
74	-3.0	t	10	11
75	-1.0	t	11	11
76	2.0	t	12	11
\.


--
-- Data for Name: exercise_exerciseuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise_exerciseuser (id, code, code_style_indent, code_style_color, last_modification, solved, submitted, "like", traceback, exercise_id, user_id) FROM stdin;
16	def add(a, b):\n    return a + b	2	2	2019-03-30 10:14:16.165159+01	t	t	\N	\N	3	9
17	def divide(a, b):\n    return a / b	2	2	2019-03-30 10:15:49.052009+01	t	t	\N	\N	2	9
18	ExecResult(exit_code=0, output=b'def add(a, b):\\r\\n    pass\\r\\n')	2	2	2019-03-30 10:18:51.34807+01	f	f	\N	\N	3	10
11	def divide(a, b):\n    return a / b	2	2	2019-03-29 11:35:59.868597+01	t	f	\N	\N	2	5
19	def divide(a, b):\n    return a / b	2	2	2019-03-30 10:19:05.702905+01	t	t	\N	\N	2	10
20	def divide(a, b):\n    return a / b	2	2	2019-03-30 10:25:52.164786+01	t	t	\N	\N	2	11
21	def divide(a, b):\n    return a / b	2	2	2019-03-30 10:31:35.747499+01	t	t	\N	\N	2	12
7	def add(a, b):\n    return a + b	2	2	2019-03-29 10:08:07.660923+01	t	f	\N	\N	3	5
6	def multiply(a, b):\n    return a * b	2	2	2019-03-29 11:14:39.438038+01	t	t	t	\N	1	5
8	def subtract(a, b):\n    return a - b	2	2	2019-03-29 11:17:40.215996+01	t	t	\N	\N	4	1
5	def multiply(a, b):\n    return a * b	2	2	2019-03-29 11:18:06.479525+01	t	t	t	\N	1	1
10	def add(a, b):\n    return a + b	2	2	2019-03-29 11:27:45.330104+01	t	t	\N	\N	3	1
9	def divide(a, b):\n    return a / b	2	2	2019-03-29 12:25:21.617719+01	t	t	\N	\N	2	1
12	def divide(a, b):\n    return a / b	2	2	2019-03-30 09:23:33.981551+01	t	t	\N	\N	2	6
13	def subtract(a, b):\n    return a - b	2	2	2019-03-30 09:24:15.613299+01	t	t	\N	\N	4	7
14	def divide(a, b):\n    return a / b	2	2	2019-03-30 09:24:59.215418+01	t	t	\N	\N	2	7
15	def divide(a, b):\n    return a / b	2	2	2019-03-30 10:03:58.961042+01	t	t	\N	\N	2	8
\.


--
-- Data for Name: exercise_exerciseusercomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise_exerciseusercomment (id, message, date, exercise_id, user_id) FROM stdin;
1	fajne zadanie polecam gorąco	2019-03-29 09:14:06.985817+01	1	1
2	siema	2019-03-29 09:15:52.812817+01	1	1
3	spoko zadanie\n	2019-03-29 11:14:49.73356+01	1	5
\.


--
-- Data for Name: exercise_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise_tag (id, name, slug) FROM stdin;
1	Computing	computing
2	Algorithm	algorithm
3	Mathematics	mathematics
4	Sorting	sorting
5	Numbers	numbers
6	Logic	logic
7	Strings	strings
8	Fundamentals	fundamentals
9	Arrays	arrays
10	Games	games
11	Control Flow	control-flow
\.


--
-- Data for Name: users_badge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_badge (id, title, description, reward_points, icon) FROM stdin;
5	Socialize More	Write 3 private messages.	300	badges/026-badge-3.png
4	Socialize	Write your first private message.	100	badges/007-heart_euysdMt.png
3	Good Streak	Finish 3 exercises	300	badges/005-medal-1.png
2	Gettin' Started	Finish successfuly 1 exercise	100	badges/030-badge-6_7ejrSiE.png
1	First Achieve	Login to get this badge	10	badges/012-star-1_40ofmz3.png
\.


--
-- Data for Name: users_profileuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profileuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, experience_pts, level, avatar, favourite_language_id) FROM stdin;
1	pbkdf2_sha256$120000$IS4PB9ylEgJj$TPD4xnfcv9U1jGA3ave6hWZzSdttsbOw1N3DoUqkefM=	2019-03-30 10:30:51.01857+01	t	admin			michalcloud1999@gmail.com	t	t	2019-03-27 12:36:26+01	1473	3	avatars/admin.png	1
6	pbkdf2_sha256$120000$LDzB7KR67TdU$bmGpgOkRkZ7QqCFWaa3qfNFB9V6tdy0rOtUdvr2H7zY=	2019-03-30 09:13:37.135216+01	f	user13			user@o2.pl	f	t	2019-03-30 09:01:09+01	660	2	avatars/user13.png	1
12	pbkdf2_sha256$120000$fOr6WHngM4Aa$P14DhQmHNBkfqaMsoxOFXcLUniYDcZUbrOV2PV3YDk0=	2019-03-30 10:31:22.183414+01	f	user20			user20@gmail.com	f	t	2019-03-30 10:30:07+01	560	2	avatars/user20.png	\N
8	pbkdf2_sha256$120000$xIl2dzJfOyeG$oNyORdD2QHYSs3wV3UvX7jfMsSWktw6TydCs0DT53BI=	2019-03-30 09:26:17.242934+01	f	user15			user12@o2.pl	f	t	2019-03-30 09:01:30+01	960	2	avatars/user15.png	1
9	pbkdf2_sha256$120000$dtIBHZjsmacW$K3F29CLvoCgi2q0TPDsvA2w0SZ/jqlwzXdjUsQjJmqQ=	2019-03-30 10:13:28.927515+01	f	user16			user16@o2.pl	f	t	2019-03-30 10:11:08+01	660	2	avatars/user16.png	\N
7	pbkdf2_sha256$120000$gUNicJz8o5N8$Nnoz8D+YGzACRPpyzVmss1r8xWNtoNumYwPH4XRDgaA=	2019-03-30 12:17:10.681506+01	f	user14			user11@o2.pl	f	t	2019-03-30 09:01:20+01	710	2	avatars/user14.png	\N
10	pbkdf2_sha256$120000$8mwWW5PJQcUq$gj5Hyuu7ja+1/aVDpN1HwROcP8PsO/XgwhFMW26wI34=	2019-03-30 10:18:44.281956+01	f	user17			user17@o2.pl	f	t	2019-03-30 10:11:15+01	560	2	avatars/user17.png	\N
5	pbkdf2_sha256$120000$rvrNF1GxCMnc$xLaUJKbfwIMAy9q1k2toLN9dk6xHGzQ6q6JbMhEYGZU=	2019-03-30 12:17:23.742302+01	f	user12			michalkwiatek3@o2.pl	f	t	2019-03-28 11:49:59.825892+01	110	1	avatars/user12.png	1
11	pbkdf2_sha256$120000$OIFOzAzZCI5X$mYmDRu3tmoN6pCrIGrA+nA80utwxoweWk8zaOURCUlk=	2019-03-30 10:25:26.703999+01	f	user19			user19@o2.pl	f	t	2019-03-30 10:24:30+01	560	2	avatars/user19.png	\N
\.


--
-- Data for Name: users_profileuser_badges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profileuser_badges (id, profileuser_id, badge_id) FROM stdin;
5	1	1
6	5	1
7	5	2
8	1	2
9	1	3
10	1	4
11	6	1
12	6	4
13	7	1
14	8	1
15	8	4
16	8	5
17	6	2
18	7	2
19	8	2
20	9	1
21	9	2
22	10	1
23	10	2
24	11	1
25	11	2
26	12	1
27	12	2
\.


--
-- Data for Name: users_profileuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profileuser_groups (id, profileuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_profileuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profileuser_user_permissions (id, profileuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: users_programminglanguage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_programminglanguage (id, name, icon, slug) FROM stdin;
1	Python	languages/python.png	python
2	C++	languages/programmer.png	c
3	JavaScript	languages/javascript.png	javascript
4	Ruby	languages/ruby.png	ruby
5	PHP	languages/php.png	php
\.


--
-- Data for Name: users_usermessage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_usermessage (id, subject, message, date_sent, read, receiver_id, sender_id) FROM stdin;
1	siemanko	<p><strong>siema co tam u ciebie:</strong></p>\r\n\r\n<pre>\r\n<code class="language-python">def hello():\r\n    return hello</code></pre>\r\n\r\n<p>&nbsp;</p>	2019-03-29 19:04:39.095783+01	t	5	1
2	fnaoindoianooi	<p>mdofdaoofnaiofa</p>\r\n\r\n<p>faldmfoadsofnda</p>\r\n\r\n<p>knadofna</p>	2019-03-29 19:18:35.800612+01	t	5	1
3	jakiś temat	<h1>cześć famfaoifnaoifnaof</h1>\r\n\r\n<p><strong>fdafdafa</strong></p>\r\n\r\n<pre>\r\n<code class="language-python">def hello():\r\n   return hello</code></pre>\r\n\r\n<p>&nbsp;</p>	2019-03-30 09:06:16.159515+01	t	8	6
4	dfafadf	<p>dafdafaf</p>	2019-03-30 09:08:56.637613+01	f	6	8
5	dfafafa	<p>fsadfasfasfasfsa</p>	2019-03-30 09:12:58.028391+01	f	6	8
6	fdafdasf	<p>dafdafafasfadfasfad</p>	2019-03-30 09:13:09.347427+01	f	6	8
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 68, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exercise_id_seq', 4, true);


--
-- Name: exercise_exercise_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exercise_tags_id_seq', 10, true);


--
-- Name: exercise_exercisetest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exercisetest_id_seq', 16, true);


--
-- Name: exercise_exercisetestuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exercisetestuser_id_seq', 80, true);


--
-- Name: exercise_exerciseuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exerciseuser_id_seq', 21, true);


--
-- Name: exercise_exerciseusercomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exerciseusercomment_id_seq', 3, true);


--
-- Name: exercise_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_tag_id_seq', 11, true);


--
-- Name: users_badge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_badge_id_seq', 5, true);


--
-- Name: users_profileuser_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_profileuser_badges_id_seq', 27, true);


--
-- Name: users_profileuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_profileuser_groups_id_seq', 1, false);


--
-- Name: users_profileuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_profileuser_id_seq', 12, true);


--
-- Name: users_profileuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_profileuser_user_permissions_id_seq', 1, false);


--
-- Name: users_programminglanguage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_programminglanguage_id_seq', 5, true);


--
-- Name: users_usermessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_usermessage_id_seq', 6, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: exercise_exercise exercise_exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise
    ADD CONSTRAINT exercise_exercise_pkey PRIMARY KEY (id);


--
-- Name: exercise_exercise exercise_exercise_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise
    ADD CONSTRAINT exercise_exercise_slug_key UNIQUE (slug);


--
-- Name: exercise_exercise_tags exercise_exercise_tags_exercise_id_tag_id_4e58ba9a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise_tags
    ADD CONSTRAINT exercise_exercise_tags_exercise_id_tag_id_4e58ba9a_uniq UNIQUE (exercise_id, tag_id);


--
-- Name: exercise_exercise_tags exercise_exercise_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise_tags
    ADD CONSTRAINT exercise_exercise_tags_pkey PRIMARY KEY (id);


--
-- Name: exercise_exercise exercise_exercise_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise
    ADD CONSTRAINT exercise_exercise_title_key UNIQUE (title);


--
-- Name: exercise_exercisetest exercise_exercisetest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercisetest
    ADD CONSTRAINT exercise_exercisetest_pkey PRIMARY KEY (id);


--
-- Name: exercise_exercisetestuser exercise_exercisetestuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercisetestuser
    ADD CONSTRAINT exercise_exercisetestuser_pkey PRIMARY KEY (id);


--
-- Name: exercise_exerciseuser exercise_exerciseuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exerciseuser
    ADD CONSTRAINT exercise_exerciseuser_pkey PRIMARY KEY (id);


--
-- Name: exercise_exerciseusercomment exercise_exerciseusercomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exerciseusercomment
    ADD CONSTRAINT exercise_exerciseusercomment_pkey PRIMARY KEY (id);


--
-- Name: exercise_tag exercise_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_tag
    ADD CONSTRAINT exercise_tag_pkey PRIMARY KEY (id);


--
-- Name: users_badge users_badge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_badge
    ADD CONSTRAINT users_badge_pkey PRIMARY KEY (id);


--
-- Name: users_badge users_badge_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_badge
    ADD CONSTRAINT users_badge_title_key UNIQUE (title);


--
-- Name: users_profileuser_badges users_profileuser_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_badges
    ADD CONSTRAINT users_profileuser_badges_pkey PRIMARY KEY (id);


--
-- Name: users_profileuser_badges users_profileuser_badges_profileuser_id_badge_id_7f0c5d7a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_badges
    ADD CONSTRAINT users_profileuser_badges_profileuser_id_badge_id_7f0c5d7a_uniq UNIQUE (profileuser_id, badge_id);


--
-- Name: users_profileuser users_profileuser_email_cc1b2fd3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser
    ADD CONSTRAINT users_profileuser_email_cc1b2fd3_uniq UNIQUE (email);


--
-- Name: users_profileuser_groups users_profileuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_groups
    ADD CONSTRAINT users_profileuser_groups_pkey PRIMARY KEY (id);


--
-- Name: users_profileuser_groups users_profileuser_groups_profileuser_id_group_id_99eda1da_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_groups
    ADD CONSTRAINT users_profileuser_groups_profileuser_id_group_id_99eda1da_uniq UNIQUE (profileuser_id, group_id);


--
-- Name: users_profileuser users_profileuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser
    ADD CONSTRAINT users_profileuser_pkey PRIMARY KEY (id);


--
-- Name: users_profileuser_user_permissions users_profileuser_user_p_profileuser_id_permissio_46e4dfea_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_user_permissions
    ADD CONSTRAINT users_profileuser_user_p_profileuser_id_permissio_46e4dfea_uniq UNIQUE (profileuser_id, permission_id);


--
-- Name: users_profileuser_user_permissions users_profileuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_user_permissions
    ADD CONSTRAINT users_profileuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_profileuser users_profileuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser
    ADD CONSTRAINT users_profileuser_username_key UNIQUE (username);


--
-- Name: users_programminglanguage users_programminglanguage_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_programminglanguage
    ADD CONSTRAINT users_programminglanguage_name_key UNIQUE (name);


--
-- Name: users_programminglanguage users_programminglanguage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_programminglanguage
    ADD CONSTRAINT users_programminglanguage_pkey PRIMARY KEY (id);


--
-- Name: users_usermessage users_usermessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_usermessage
    ADD CONSTRAINT users_usermessage_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: exercise_exercise_slug_a64ce192_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exercise_slug_a64ce192_like ON public.exercise_exercise USING btree (slug varchar_pattern_ops);


--
-- Name: exercise_exercise_tags_exercise_id_4921bbce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exercise_tags_exercise_id_4921bbce ON public.exercise_exercise_tags USING btree (exercise_id);


--
-- Name: exercise_exercise_tags_tag_id_ea79eb07; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exercise_tags_tag_id_ea79eb07 ON public.exercise_exercise_tags USING btree (tag_id);


--
-- Name: exercise_exercise_title_c24771ae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exercise_title_c24771ae_like ON public.exercise_exercise USING btree (title varchar_pattern_ops);


--
-- Name: exercise_exercisetest_exercise_id_ca276df2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exercisetest_exercise_id_ca276df2 ON public.exercise_exercisetest USING btree (exercise_id);


--
-- Name: exercise_exercisetestuser_exercise_test_id_1fc0617e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exercisetestuser_exercise_test_id_1fc0617e ON public.exercise_exercisetestuser USING btree (exercise_test_id);


--
-- Name: exercise_exercisetestuser_user_id_4a2e5690; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exercisetestuser_user_id_4a2e5690 ON public.exercise_exercisetestuser USING btree (user_id);


--
-- Name: exercise_exerciseuser_exercise_id_4b55d7e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exerciseuser_exercise_id_4b55d7e5 ON public.exercise_exerciseuser USING btree (exercise_id);


--
-- Name: exercise_exerciseuser_user_id_fcfb5844; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exerciseuser_user_id_fcfb5844 ON public.exercise_exerciseuser USING btree (user_id);


--
-- Name: exercise_exerciseusercomment_exercise_id_735a26c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exerciseusercomment_exercise_id_735a26c8 ON public.exercise_exerciseusercomment USING btree (exercise_id);


--
-- Name: exercise_exerciseusercomment_user_id_04115cf1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_exerciseusercomment_user_id_04115cf1 ON public.exercise_exerciseusercomment USING btree (user_id);


--
-- Name: exercise_tag_slug_adcae4ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_tag_slug_adcae4ac ON public.exercise_tag USING btree (slug);


--
-- Name: exercise_tag_slug_adcae4ac_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exercise_tag_slug_adcae4ac_like ON public.exercise_tag USING btree (slug varchar_pattern_ops);


--
-- Name: users_badge_title_d7714908_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_badge_title_d7714908_like ON public.users_badge USING btree (title varchar_pattern_ops);


--
-- Name: users_profileuser_badges_badge_id_23317b31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profileuser_badges_badge_id_23317b31 ON public.users_profileuser_badges USING btree (badge_id);


--
-- Name: users_profileuser_badges_profileuser_id_86a2b688; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profileuser_badges_profileuser_id_86a2b688 ON public.users_profileuser_badges USING btree (profileuser_id);


--
-- Name: users_profileuser_favourite_language_id_2dadbd91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profileuser_favourite_language_id_2dadbd91 ON public.users_profileuser USING btree (favourite_language_id);


--
-- Name: users_profileuser_groups_group_id_20c28724; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profileuser_groups_group_id_20c28724 ON public.users_profileuser_groups USING btree (group_id);


--
-- Name: users_profileuser_groups_profileuser_id_0eb99ca5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profileuser_groups_profileuser_id_0eb99ca5 ON public.users_profileuser_groups USING btree (profileuser_id);


--
-- Name: users_profileuser_user_permissions_permission_id_1b89bc82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profileuser_user_permissions_permission_id_1b89bc82 ON public.users_profileuser_user_permissions USING btree (permission_id);


--
-- Name: users_profileuser_user_permissions_profileuser_id_4bdefdbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profileuser_user_permissions_profileuser_id_4bdefdbb ON public.users_profileuser_user_permissions USING btree (profileuser_id);


--
-- Name: users_profileuser_username_22aa40ac_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profileuser_username_22aa40ac_like ON public.users_profileuser USING btree (username varchar_pattern_ops);


--
-- Name: users_programminglanguage_name_fb6f3946_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_programminglanguage_name_fb6f3946_like ON public.users_programminglanguage USING btree (name varchar_pattern_ops);


--
-- Name: users_programminglanguage_slug_1f025b00; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_programminglanguage_slug_1f025b00 ON public.users_programminglanguage USING btree (slug);


--
-- Name: users_programminglanguage_slug_1f025b00_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_programminglanguage_slug_1f025b00_like ON public.users_programminglanguage USING btree (slug varchar_pattern_ops);


--
-- Name: users_usermessage_receiver_id_a27209ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_usermessage_receiver_id_a27209ca ON public.users_usermessage USING btree (receiver_id);


--
-- Name: users_usermessage_sender_id_c7000bb3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_usermessage_sender_id_c7000bb3 ON public.users_usermessage USING btree (sender_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_profileuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_profileuser_id FOREIGN KEY (user_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exercise_tags exercise_exercise_ta_exercise_id_4921bbce_fk_exercise_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise_tags
    ADD CONSTRAINT exercise_exercise_ta_exercise_id_4921bbce_fk_exercise_ FOREIGN KEY (exercise_id) REFERENCES public.exercise_exercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exercise_tags exercise_exercise_tags_tag_id_ea79eb07_fk_exercise_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercise_tags
    ADD CONSTRAINT exercise_exercise_tags_tag_id_ea79eb07_fk_exercise_tag_id FOREIGN KEY (tag_id) REFERENCES public.exercise_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exercisetest exercise_exercisetes_exercise_id_ca276df2_fk_exercise_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercisetest
    ADD CONSTRAINT exercise_exercisetes_exercise_id_ca276df2_fk_exercise_ FOREIGN KEY (exercise_id) REFERENCES public.exercise_exercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exercisetestuser exercise_exercisetes_exercise_test_id_1fc0617e_fk_exercise_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercisetestuser
    ADD CONSTRAINT exercise_exercisetes_exercise_test_id_1fc0617e_fk_exercise_ FOREIGN KEY (exercise_test_id) REFERENCES public.exercise_exercisetest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exercisetestuser exercise_exercisetes_user_id_4a2e5690_fk_users_pro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exercisetestuser
    ADD CONSTRAINT exercise_exercisetes_user_id_4a2e5690_fk_users_pro FOREIGN KEY (user_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exerciseuser exercise_exerciseuse_exercise_id_4b55d7e5_fk_exercise_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exerciseuser
    ADD CONSTRAINT exercise_exerciseuse_exercise_id_4b55d7e5_fk_exercise_ FOREIGN KEY (exercise_id) REFERENCES public.exercise_exercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exerciseusercomment exercise_exerciseuse_exercise_id_735a26c8_fk_exercise_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exerciseusercomment
    ADD CONSTRAINT exercise_exerciseuse_exercise_id_735a26c8_fk_exercise_ FOREIGN KEY (exercise_id) REFERENCES public.exercise_exercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exerciseusercomment exercise_exerciseuse_user_id_04115cf1_fk_users_pro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exerciseusercomment
    ADD CONSTRAINT exercise_exerciseuse_user_id_04115cf1_fk_users_pro FOREIGN KEY (user_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exercise_exerciseuser exercise_exerciseuser_user_id_fcfb5844_fk_users_profileuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise_exerciseuser
    ADD CONSTRAINT exercise_exerciseuser_user_id_fcfb5844_fk_users_profileuser_id FOREIGN KEY (user_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profileuser_badges users_profileuser_ba_profileuser_id_86a2b688_fk_users_pro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_badges
    ADD CONSTRAINT users_profileuser_ba_profileuser_id_86a2b688_fk_users_pro FOREIGN KEY (profileuser_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profileuser_badges users_profileuser_badges_badge_id_23317b31_fk_users_badge_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_badges
    ADD CONSTRAINT users_profileuser_badges_badge_id_23317b31_fk_users_badge_id FOREIGN KEY (badge_id) REFERENCES public.users_badge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profileuser users_profileuser_favourite_language_i_2dadbd91_fk_users_pro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser
    ADD CONSTRAINT users_profileuser_favourite_language_i_2dadbd91_fk_users_pro FOREIGN KEY (favourite_language_id) REFERENCES public.users_programminglanguage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profileuser_groups users_profileuser_gr_profileuser_id_0eb99ca5_fk_users_pro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_groups
    ADD CONSTRAINT users_profileuser_gr_profileuser_id_0eb99ca5_fk_users_pro FOREIGN KEY (profileuser_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profileuser_groups users_profileuser_groups_group_id_20c28724_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_groups
    ADD CONSTRAINT users_profileuser_groups_group_id_20c28724_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profileuser_user_permissions users_profileuser_us_permission_id_1b89bc82_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_user_permissions
    ADD CONSTRAINT users_profileuser_us_permission_id_1b89bc82_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profileuser_user_permissions users_profileuser_us_profileuser_id_4bdefdbb_fk_users_pro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profileuser_user_permissions
    ADD CONSTRAINT users_profileuser_us_profileuser_id_4bdefdbb_fk_users_pro FOREIGN KEY (profileuser_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_usermessage users_usermessage_receiver_id_a27209ca_fk_users_profileuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_usermessage
    ADD CONSTRAINT users_usermessage_receiver_id_a27209ca_fk_users_profileuser_id FOREIGN KEY (receiver_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_usermessage users_usermessage_sender_id_c7000bb3_fk_users_profileuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_usermessage
    ADD CONSTRAINT users_usermessage_sender_id_c7000bb3_fk_users_profileuser_id FOREIGN KEY (sender_id) REFERENCES public.users_profileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

