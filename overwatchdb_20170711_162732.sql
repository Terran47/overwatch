--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.16
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Fj6L8ZM_applies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_applies" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id integer DEFAULT 0 NOT NULL,
    clan_id integer DEFAULT 0 NOT NULL,
    apply_status text DEFAULT 'Рассматривается'::text NOT NULL,
    apply_answer boolean DEFAULT false NOT NULL
);


ALTER TABLE "Fj6L8ZM_applies" OWNER TO postgres;

--
-- Name: Fj6L8ZM_clan_gamers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_clan_gamers" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    clan_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    role text DEFAULT 'gamer'::text NOT NULL,
    main boolean DEFAULT false NOT NULL
);


ALTER TABLE "Fj6L8ZM_clan_gamers" OWNER TO postgres;

--
-- Name: Fj6L8ZM_clans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_clans" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    clan_avatar text,
    clan_name text,
    clan_rating integer DEFAULT 0 NOT NULL,
    clan_description text,
    clan_seats integer DEFAULT 10 NOT NULL,
    "clan_Employed_seats" integer DEFAULT 0 NOT NULL,
    clan_badge text,
    clan_recruitment boolean DEFAULT true,
    clan_user_id integer DEFAULT 0 NOT NULL,
    clan_slogan text,
    clan_count_apply integer DEFAULT 0 NOT NULL,
    clan_widget text,
    clan_rules text,
    clan_vip_status boolean DEFAULT false NOT NULL
);


ALTER TABLE "Fj6L8ZM_clans" OWNER TO postgres;

--
-- Name: Fj6L8ZM_heroes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_heroes" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    hero_name text,
    hero_poster text,
    hero_ru_name text,
    hero_role text
);


ALTER TABLE "Fj6L8ZM_heroes" OWNER TO postgres;

--
-- Name: Fj6L8ZM_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_migrations" (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE "Fj6L8ZM_migrations" OWNER TO postgres;

--
-- Name: Fj6L8ZM_navigations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_navigations" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    navigation_img text,
    navigation_status boolean DEFAULT false NOT NULL,
    navigation_setting integer,
    navigation_title text,
    navigation_slug text,
    navigation_order integer
);


ALTER TABLE "Fj6L8ZM_navigations" OWNER TO postgres;

--
-- Name: Fj6L8ZM_password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_password_resets" (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE "Fj6L8ZM_password_resets" OWNER TO postgres;

--
-- Name: Fj6L8ZM_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_posts" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    post_title text,
    post_content text,
    post_setting text,
    post_comment boolean DEFAULT false NOT NULL,
    post_image text,
    post_description text
);


ALTER TABLE "Fj6L8ZM_posts" OWNER TO postgres;

--
-- Name: Fj6L8ZM_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Fj6L8ZM_posts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Fj6L8ZM_posts_id_seq" OWNER TO postgres;

--
-- Name: Fj6L8ZM_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Fj6L8ZM_posts_id_seq" OWNED BY "Fj6L8ZM_posts".id;


--
-- Name: Fj6L8ZM_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_products" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    products_name text,
    products_status boolean DEFAULT true NOT NULL,
    products_price integer DEFAULT 0 NOT NULL,
    products_img text
);


ALTER TABLE "Fj6L8ZM_products" OWNER TO postgres;

--
-- Name: Fj6L8ZM_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Fj6L8ZM_products_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Fj6L8ZM_products_id_seq" OWNER TO postgres;

--
-- Name: Fj6L8ZM_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Fj6L8ZM_products_id_seq" OWNED BY "Fj6L8ZM_products".id;


--
-- Name: Fj6L8ZM_rating_heroes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_rating_heroes" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_id integer DEFAULT 0 NOT NULL,
    rating_heroes json,
    your_hero text,
    best_kills text,
    best_damage text
);


ALTER TABLE "Fj6L8ZM_rating_heroes" OWNER TO postgres;

--
-- Name: Fj6L8ZM_referal_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_referal_users" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    ref_user_id integer,
    reg_user_id integer
);


ALTER TABLE "Fj6L8ZM_referal_users" OWNER TO postgres;

--
-- Name: Fj6L8ZM_referal_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Fj6L8ZM_referal_users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Fj6L8ZM_referal_users_id_seq" OWNER TO postgres;

--
-- Name: Fj6L8ZM_referal_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Fj6L8ZM_referal_users_id_seq" OWNED BY "Fj6L8ZM_referal_users".id;


--
-- Name: Fj6L8ZM_tournaments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_tournaments" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    turnir_title text,
    turnir_description text,
    turnir_avatar text,
    turnir_autor text,
    turnir_prize_money integer DEFAULT 0 NOT NULL,
    turnir_status boolean DEFAULT false NOT NULL,
    turnir_count_comands integer DEFAULT 0 NOT NULL,
    turnir_data text
);


ALTER TABLE "Fj6L8ZM_tournaments" OWNER TO postgres;

--
-- Name: Fj6L8ZM_tournaments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Fj6L8ZM_tournaments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Fj6L8ZM_tournaments_id_seq" OWNER TO postgres;

--
-- Name: Fj6L8ZM_tournaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Fj6L8ZM_tournaments_id_seq" OWNED BY "Fj6L8ZM_tournaments".id;


--
-- Name: Fj6L8ZM_user_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_user_payments" (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    pay_code_tranzaction numeric DEFAULT 0 NOT NULL,
    pay_coins integer DEFAULT 0 NOT NULL,
    pay_money money DEFAULT 0 NOT NULL,
    pay_status boolean DEFAULT false NOT NULL,
    pay_user_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE "Fj6L8ZM_user_payments" OWNER TO postgres;

--
-- Name: Fj6L8ZM_user_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Fj6L8ZM_user_payments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Fj6L8ZM_user_payments_id_seq" OWNER TO postgres;

--
-- Name: Fj6L8ZM_user_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Fj6L8ZM_user_payments_id_seq" OWNED BY "Fj6L8ZM_user_payments".id;


--
-- Name: Fj6L8ZM_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fj6L8ZM_users" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_battle_id integer,
    user_battle_tag text,
    user_battle_token text,
    user_battle_avatar text,
    user_battle_rating integer DEFAULT 0 NOT NULL,
    user_clan_status boolean DEFAULT false NOT NULL,
    user_server text DEFAULT 'eu'::text NOT NULL,
    user_activ_clan_id integer DEFAULT 0 NOT NULL,
    user_referal_code text,
    user_email_code integer,
    user_api_token text,
    user_money integer DEFAULT 0 NOT NULL,
    update_info boolean DEFAULT false NOT NULL
);


ALTER TABLE "Fj6L8ZM_users" OWNER TO postgres;

--
-- Name: applies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE applies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE applies_id_seq OWNER TO postgres;

--
-- Name: applies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE applies_id_seq OWNED BY "Fj6L8ZM_applies".id;


--
-- Name: clan_gamers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clan_gamers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clan_gamers_id_seq OWNER TO postgres;

--
-- Name: clan_gamers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clan_gamers_id_seq OWNED BY "Fj6L8ZM_clan_gamers".id;


--
-- Name: clans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clans_id_seq OWNER TO postgres;

--
-- Name: clans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clans_id_seq OWNED BY "Fj6L8ZM_clans".id;


--
-- Name: heroes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE heroes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE heroes_id_seq OWNER TO postgres;

--
-- Name: heroes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE heroes_id_seq OWNED BY "Fj6L8ZM_heroes".id;


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE migrations_id_seq OWNED BY "Fj6L8ZM_migrations".id;


--
-- Name: navigations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE navigations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE navigations_id_seq OWNER TO postgres;

--
-- Name: navigations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE navigations_id_seq OWNED BY "Fj6L8ZM_navigations".id;


--
-- Name: rating_heroes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_heroes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rating_heroes_id_seq OWNER TO postgres;

--
-- Name: rating_heroes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rating_heroes_id_seq OWNED BY "Fj6L8ZM_rating_heroes".id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY "Fj6L8ZM_users".id;


--
-- Name: Fj6L8ZM_applies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_applies" ALTER COLUMN id SET DEFAULT nextval('applies_id_seq'::regclass);


--
-- Name: Fj6L8ZM_clan_gamers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_clan_gamers" ALTER COLUMN id SET DEFAULT nextval('clan_gamers_id_seq'::regclass);


--
-- Name: Fj6L8ZM_clans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_clans" ALTER COLUMN id SET DEFAULT nextval('clans_id_seq'::regclass);


--
-- Name: Fj6L8ZM_heroes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_heroes" ALTER COLUMN id SET DEFAULT nextval('heroes_id_seq'::regclass);


--
-- Name: Fj6L8ZM_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_migrations" ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: Fj6L8ZM_navigations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_navigations" ALTER COLUMN id SET DEFAULT nextval('navigations_id_seq'::regclass);


--
-- Name: Fj6L8ZM_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_posts" ALTER COLUMN id SET DEFAULT nextval('"Fj6L8ZM_posts_id_seq"'::regclass);


--
-- Name: Fj6L8ZM_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_products" ALTER COLUMN id SET DEFAULT nextval('"Fj6L8ZM_products_id_seq"'::regclass);


--
-- Name: Fj6L8ZM_rating_heroes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_rating_heroes" ALTER COLUMN id SET DEFAULT nextval('rating_heroes_id_seq'::regclass);


--
-- Name: Fj6L8ZM_referal_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_referal_users" ALTER COLUMN id SET DEFAULT nextval('"Fj6L8ZM_referal_users_id_seq"'::regclass);


--
-- Name: Fj6L8ZM_tournaments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_tournaments" ALTER COLUMN id SET DEFAULT nextval('"Fj6L8ZM_tournaments_id_seq"'::regclass);


--
-- Name: Fj6L8ZM_user_payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_user_payments" ALTER COLUMN id SET DEFAULT nextval('"Fj6L8ZM_user_payments_id_seq"'::regclass);


--
-- Name: Fj6L8ZM_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_users" ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: Fj6L8ZM_applies; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Fj6L8ZM_clan_gamers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Fj6L8ZM_clans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_clans" (id, created_at, updated_at, clan_avatar, clan_name, clan_rating, clan_description, clan_seats, "clan_Employed_seats", clan_badge, clan_recruitment, clan_user_id, clan_slogan, clan_count_apply, clan_widget, clan_rules, clan_vip_status) VALUES (47, '2017-06-26 11:52:02', '2017-07-08 07:41:58', '/img/ClanLogos/7/const-icon-7.png', 'asdas', 0, 'dasdasdasd', 10, 0, NULL, true, 7, 'dasdas', 0, NULL, NULL, false);
INSERT INTO "Fj6L8ZM_clans" (id, created_at, updated_at, clan_avatar, clan_name, clan_rating, clan_description, clan_seats, "clan_Employed_seats", clan_badge, clan_recruitment, clan_user_id, clan_slogan, clan_count_apply, clan_widget, clan_rules, clan_vip_status) VALUES (45, '2017-06-16 13:56:47', '2017-06-16 13:56:47', '/img/ClanLogos/7/17126268_220413351765544_1862101883137556480_n.jpg', 'ываыв', 0, 'аываыва', 10, 0, NULL, true, 7, 'аываыв', 0, NULL, NULL, false);
INSERT INTO "Fj6L8ZM_clans" (id, created_at, updated_at, clan_avatar, clan_name, clan_rating, clan_description, clan_seats, "clan_Employed_seats", clan_badge, clan_recruitment, clan_user_id, clan_slogan, clan_count_apply, clan_widget, clan_rules, clan_vip_status) VALUES (46, '2017-06-16 13:57:30', '2017-06-16 13:57:30', '/img/ClanLogos/40/ab11dcdf27c3cb2fc1f50b59906704e2.jpg', 'LIBERTY TEAM', 0, '*boop*', 10, 0, NULL, true, 40, 'У нас бурлит адреналин  наш отряд НЕПОБЕДИМ!', 0, NULL, NULL, false);
INSERT INTO "Fj6L8ZM_clans" (id, created_at, updated_at, clan_avatar, clan_name, clan_rating, clan_description, clan_seats, "clan_Employed_seats", clan_badge, clan_recruitment, clan_user_id, clan_slogan, clan_count_apply, clan_widget, clan_rules, clan_vip_status) VALUES (40, '2017-06-05 17:54:50', '2017-06-08 12:54:06', '', 'reyert', 63, 'gergerg', 10, 0, NULL, true, 7, 'gergertger', 0, NULL, NULL, false);
INSERT INTO "Fj6L8ZM_clans" (id, created_at, updated_at, clan_avatar, clan_name, clan_rating, clan_description, clan_seats, "clan_Employed_seats", clan_badge, clan_recruitment, clan_user_id, clan_slogan, clan_count_apply, clan_widget, clan_rules, clan_vip_status) VALUES (48, '2017-07-11 08:28:36', '2017-07-11 08:29:24', '/img/ClanLogos/18/1024.png', 'tttttt', 2036, 'fgh fghfghf', 10, 1, NULL, true, 18, 'tyrtyrty', 0, NULL, NULL, false);
INSERT INTO "Fj6L8ZM_clans" (id, created_at, updated_at, clan_avatar, clan_name, clan_rating, clan_description, clan_seats, "clan_Employed_seats", clan_badge, clan_recruitment, clan_user_id, clan_slogan, clan_count_apply, clan_widget, clan_rules, clan_vip_status) VALUES (7, '2017-06-05 06:16:04', '2017-07-11 08:29:24', '/img/ClanLogos/7/justiceLogo.png', 'Justice', 17300, 'Набор игроков в клан 2000+, пока роли не важны', 30, 12, 'https://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-4.png', true, 7, 'Цель наказания - не мщение, а исправление.', 0, '316523418809794560', 'Главное правило - уважайте друг друга. Оскорбление или переход на личности карается незамедлительно и сурово. Под оскорблением понимаются все высказывания, касающиеся совокупления с родителями оппонента, его происхождения, умственного развития, в грубой или не очень форме - разницы нет', true);


--
-- Data for Name: Fj6L8ZM_heroes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (5, NULL, NULL, 'torbiorn', '/img/heros/Torbjorn-portrait.png', 'Торбьорн', 'support');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (13, NULL, NULL, 'junkrat', '/img/heros/Junkrat_portrait.png', 'Крысавчик', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (14, NULL, NULL, 'zarya', '/img/heros/ZaryaPortrait.png', 'Заря', 'tank');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (15, NULL, NULL, 'soldier:76', '/img/heros/soldier76.png', 'Солдат-76', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (16, NULL, NULL, 'orisa', '/img/heros/Orisa_portrait.png', 'Ориса', 'tank');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (17, NULL, NULL, 'zenyatta', '/img/heros/Zenyatta_portrait.png', 'Дзенъятта', 'support');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (18, NULL, NULL, 'D.Va', '/img/heros/Dva_portrait.png', 'D.Va', 'tank');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (19, NULL, NULL, 'genji', '/img/heros/Genji_portrait.png', 'Гэндзи', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (20, NULL, NULL, 'mcCree', '/img/heros/Mccree_portrait.png', 'Маккри', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (21, NULL, NULL, 'mei', '/img/heros/Mei_portrait.png', 'Мей', 'tank');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (22, NULL, NULL, 'sombra', '/img/heros/Sombra_portrait.png', 'Сомбра', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (23, NULL, NULL, 'ana', '/img/heros/Ana_portrait.png', 'Ана', 'support');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (24, NULL, NULL, 'widowmaker', '/img/heros/widowmaker.png', 'Роковая вдова', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (1, NULL, NULL, 'reaper', '/img/heros/reaper.png', 'Жнец', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (2, NULL, NULL, 'bastion', '/img/heros/Bastion_portrait.png', 'Бастион', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (3, NULL, NULL, 'mercy', '/img/heros/Mercy_portrait.png', 'Ангел', 'support');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (4, NULL, NULL, 'tracer', '/img/heros/tracer.png', 'Трейсер', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (6, NULL, NULL, 'hanzo', '/img/heros/hanzo.png', 'Хандзо', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (7, NULL, NULL, 'reinhardt', '/img/heros/reinhard.png', 'Райнхардт', 'tank');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (8, NULL, NULL, 'lucio', '/img/heros/Lucio_portrait.png', 'Люсио', 'support');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (9, NULL, NULL, 'pharah', '/img/heros/Pharah_portrait.png', 'Фарра', 'dps');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (10, NULL, NULL, 'symmetra', '/img/heros/summetra.png', 'Симметра', 'support');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (11, NULL, NULL, 'winston', '/img/heros/Winston.png', 'Уинстон', 'tank');
INSERT INTO "Fj6L8ZM_heroes" (id, created_at, updated_at, hero_name, hero_poster, hero_ru_name, hero_role) VALUES (12, NULL, NULL, 'roadhog', '/img/heros/Roadhog.png', 'Турбосвин', 'tank');


--
-- Data for Name: Fj6L8ZM_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (3, '2017_05_12_160637_create_navigations_table', 2);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (4, '2017_05_15_071408_create_clans_table', 3);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (5, '2017_05_15_102244_create_clan_gamers_table', 4);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (6, '2017_05_21_094104_create_applies_table', 5);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (7, '2017_05_23_111016_create_rating_heroes_table', 6);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (8, '2017_05_26_065827_create_heroes_table', 7);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (9, '2017_05_29_074304_create_referal_users_table', 8);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (10, '2017_05_29_084507_create_posts_table', 9);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (11, '2017_06_06_131554_create_user_payments_table', 10);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (12, '2017_06_07_120113_create_products_table', 11);
INSERT INTO "Fj6L8ZM_migrations" (id, migration, batch) VALUES (13, '2017_07_08_113550_create_tournaments_table', 12);


--
-- Data for Name: Fj6L8ZM_navigations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (1, NULL, NULL, 'img/icons/icon-1.png', true, 1, 'Турниры', 'tournaments', 1);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (2, NULL, NULL, 'img/icons/icon-1.png', true, 1, 'Новости', 'news', 2);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (4, NULL, NULL, 'img/icons/icon-1.png', true, 1, 'Рейтинги', 'ratings', 3);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (5, NULL, NULL, 'img/icons/icon-1.png', true, 2, 'Кланы', 'clans', 1);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (3, NULL, NULL, 'img/icons/icon-1.png', true, NULL, 'Создать клан', 'addClan', 9);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (6, NULL, NULL, 'img/icons/icon-1.png', true, 2, 'Акции', 'shares', 2);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (8, NULL, NULL, 'img/icons/icon-1.png', true, 2, 'Видео каналы', 'videoMatches', 3);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (7, NULL, NULL, 'img/icons/icon-1.png', false, 2, 'Настройки', 'settings', 5);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (9, NULL, NULL, 'img/icons/icon-1.png', true, 3, 'Баланс', 'balans', 4);
INSERT INTO "Fj6L8ZM_navigations" (id, created_at, updated_at, navigation_img, navigation_status, navigation_setting, navigation_title, navigation_slug, navigation_order) VALUES (10, NULL, NULL, 'img/icons/icon-1.png', true, 2, 'Настройки', 'settings', 4);


--
-- Data for Name: Fj6L8ZM_password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Fj6L8ZM_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_posts" (id, created_at, updated_at, post_title, post_content, post_setting, post_comment, post_image, post_description) VALUES (1, NULL, NULL, 'СКИДКА 800 ₽ НА OVERWATCH: GAME OF THE YEAR EDITION', '<div class="blog-content"><div class="blog-header-image"><img src="//bnetcmsus-a.akamaihd.net/cms/blog_header/qp/QPKDGDJBLD0I1495507584711.jpg" alt="Скидка 800&nbsp;₽ на Overwatch: Game of the Year Edition"></div><div data="blog-body" class="blog-detail"><p>Чтобы стать героем будущего, лучший момент — сейчас. Присоединяйтесь 30 миллионам игроков во всем мире! Тем более что в эти дни действует внушительная скидка на издания&nbsp;<strong>Overwatch®</strong> и <strong>Overwatch®: Game of the Year Edition</strong>.</p>
<p style="text-align: center;"><a class="btn btn-default btn-lg" href="http://blizz.ly/BuyOverwatch" target="_blank" type="button">ПРИОБРЕСТИ</a></p>
<p>Вступайте в ряды агентов и готовьтесь спасать мир! Сегодня вышло новое электронное издание игры: <strong>Overwatch: Game of the Year Edition</strong>. Оно поступило в продажу по специальной цене: 2499 ₽ (для PC). В это издание входят все герои Overwatch, все карты и функции игры, а также целый арсенал внутриигровых подарков в стиле Overwatch для других игр Blizzard.&nbsp;</p>
<div class="centered" style="margin-bottom: 25px; text-align: center;"><iframe allowfullscreen="" frameborder="0" height="394" src="https://www.youtube.com/embed/B7BUbhG2Azo?theme=light&amp;color=white&amp;cc_load_policy=1&amp;HD=1&amp;rel=0&amp;showinfo=0" style="border-bottom:1px solid lightgray;" width="700"></iframe></div>
<p style="text-align: justify; margin-left: 60px; margin-right: 60px"><strong><a href="https://playoverwatch.com/ru-ru/" target="_blank">[Overwatch] </a>Контейнеры с наградами.&nbsp;</strong>10 стандартных контейнеров со случайным набором предметов, чтобы придать героям индивидуальности. В контейнерах вам могут попасться облики, эмоции, победные позы, реплики, граффити и лучшие моменты матчей, а также внутриигровая валюта, которую можно потратить на пополнение коллекции.</p>
<p style="text-align: justify; margin-left: 60px; margin-right: 60px"><strong><a href="https://playoverwatch.com/ru-ru/" target="_blank">[Overwatch] </a>Облики из издания Origins.</strong>&nbsp;Прямиком из славного прошлого организации Overwatch — облики «Рейес из Blackwatch» (Жнец), «Командир Моррисон» (Солдат-76), а также «Заросший Бастион», «Начальник охраны Фарра» и «Пилот Трейсер».</p>
<p style="text-align: justify; margin-left: 60px; margin-right: 60px"><strong><a href="https://eu.battle.net/d3/ru/" target="_blank">[Diablo III] </a>Крылья Ангела. </strong>Ведите праведную войну с демонами на Небесах и в Преисподней, украсив героя крыльями Ангела. Пусть каждая (еще) живая душа в Санктуарии узнает, что вы состоите и в Overwatch.</p>
<p style="text-align: justify; margin-left: 60px; margin-right: 60px"><strong><a href="http://eu.battle.net/sc2/ru/">[StarCraft II]</a> Портреты игрока. </strong>Новые эффектные портреты Трейсер, Жнеца, Фарры, Уинстона, Бастиона и Солдата-76, чтобы покорить весь сектор Копрулу.</p>
<p style="text-align: justify; margin-left: 60px; margin-right: 60px"><strong><a href="http://eu.battle.net/hearthstone/ru/">[Hearthstone] </a>Рубашка для карт Overwatch. </strong>Покажите своему противнику в потасовке, что на вашей стороне агенты Overwatch.</p>
<p style="text-align: justify; margin-left: 60px; margin-right: 60px"><strong><a href="https://worldofwarcraft.com/ru-ru/">[World of Warcraft]</a> Малыш Уинстон (питомец). </strong>Невероятно симпатичный и не по годам интеллектуальный малыш Уинстон составит вам компанию в бою с Пылающим Легионом.</p>
<p style="text-align: justify; margin-left: 60px; margin-right: 60px"><strong><a href="http://eu.battle.net/heroes/ru/">[Heroes of the Storm] </a>Герой Трейсер.</strong>&nbsp;Кавалерия уже здесь! Вместе с Трейсер вы ошеломите противников в Нексусе неожиданными трюками.</p>
<p>И это не все! В честь первой годовщины Overwatch мы как следует прошлись по ценам ракетным молотом. Так что в ближайшие несколько дней на игру действуют скидки от 25 до 50%. Вот цены для PC, а цены на консольные версии вы можете посмотреть в PlayStation®Store и Xbox Store.</p>
<ul style="margin-left: 40px;">
<li><strong>Overwatch</strong> — <s>1999&nbsp;₽</s>&nbsp;999 ₽</li>
<li><strong>Overwatch: Game of the Year Edition&nbsp;</strong>— <s>3299&nbsp;₽</s> 2499 ₽</li>
</ul>
<p>Если вы еще не вступили в битву за будущее — или у вас на есть примете друг, который не откажется сопровождать груз, — готовьтесь к бою! Реализовать эту уникальную тактическую возможность можно будет только до утра 6 июня (до 10:59 МСК).&nbsp;</p>
<p style="text-align: center;"><a class="btn btn-default btn-lg" href="http://blizz.ly/BuyOverwatch" target="_blank" type="button">ПРИОБРЕСТИ</a></p>
<p><span style="font-size:10px;"><em>*Время проведения акции и стоимость игры в разных магазинах могут различаться.</em></span></p>
<div class="keyword-list"></div></div></div>', 'news', false, 'https://bnetcmsus-a.akamaihd.net/cms/blog_header/qp/QPKDGDJBLD0I1495507584711.jpg', 'Чтобы стать героем будущего, лучший момент — сейчас.');


--
-- Name: Fj6L8ZM_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Fj6L8ZM_posts_id_seq"', 1, true);


--
-- Data for Name: Fj6L8ZM_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_products" (id, created_at, updated_at, products_name, products_status, products_price, products_img) VALUES (2, NULL, NULL, 'coints', true, 500, '/img/my-img/500.jpg');
INSERT INTO "Fj6L8ZM_products" (id, created_at, updated_at, products_name, products_status, products_price, products_img) VALUES (1, NULL, NULL, 'coints', true, 1000, '/img/my-img/1000.jpg');
INSERT INTO "Fj6L8ZM_products" (id, created_at, updated_at, products_name, products_status, products_price, products_img) VALUES (3, NULL, NULL, 'coints', true, 2000, '/img/my-img/2000.jpg');
INSERT INTO "Fj6L8ZM_products" (id, created_at, updated_at, products_name, products_status, products_price, products_img) VALUES (4, NULL, NULL, 'coints', true, 3000, '/img/my-img/3000.jpg');


--
-- Name: Fj6L8ZM_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Fj6L8ZM_products_id_seq"', 4, true);


--
-- Data for Name: Fj6L8ZM_rating_heroes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (17, NULL, '2017-06-09 10:17:24', 20, '{"reaper":[{"wins":"00:19","win_rate":"00:20"}],"bastion":[],"tracer":[],"mercy":[],"hanzo":[],"torbiorn":[],"reinhardt":[{"wins":"0","win_rate":"1"}],"pharah":[],"lucio":[{"wins":"1","win_rate":"25%"}],"symmetra":[{"wins":"00:33","win_rate":"00:20"}],"winston":[{"wins":"01:51","win_rate":"100%"}],"roadhog":[],"junkrat":[{"wins":"3","win_rate":"87%"}],"zarya":[{"wins":"00:36","win_rate":"00:36"}],"soldier:76":[{"wins":"1","win_rate":"76%"}],"orisa":[{"wins":"1","win_rate":"100%"}],"zenyatta":[{"wins":"00:04","win_rate":"00:04"}],"genji":[{"wins":"1","win_rate":"38%"}],"mcCree":[],"D.Va":[{"wins":"1","win_rate":"25%"}],"mei":[],"sombra":[{"win_rate":"0"}],"ana":[{"win_rate":"0"}],"widowmaker":[]}', 'dva', '27,05', '15 021');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (18, NULL, '2017-06-09 10:45:40', 21, '{"reaper":[{"wins":"0","win_rate":"2"}],"bastion":[],"tracer":[{"wins":"0","win_rate":"0"}],"mercy":[{"wins":"1","win_rate":"100%"}],"hanzo":[],"torbiorn":[{"wins":"0"}],"reinhardt":[{"wins":"03:49","win_rate":"03:49"}],"pharah":[{"wins":"00:09","win_rate":"00:09"}],"lucio":[{"wins":"0","win_rate":"23%"}],"symmetra":[],"winston":[{"wins":"0","win_rate":"0"}],"roadhog":[],"junkrat":[{"wins":"00:17","win_rate":"00:20"}],"zarya":[{"wins":"00:01","win_rate":"00:01"}],"soldier:76":[{"wins":"0","win_rate":"10%"}],"orisa":[],"zenyatta":[],"genji":[],"mcCree":[{"wins":"0","win_rate":"100%"}],"D.Va":[{"wins":"01:37","win_rate":"01:37"}],"mei":[],"sombra":[],"ana":[],"widowmaker":[]}', 'soldier-76', '16,81', '11 562');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (22, '2017-06-09 19:43:07', '2017-06-09 19:44:31', 24, '{"reaper":[],"bastion":[],"tracer":[],"mercy":[{"wins":"00:43","win_rate":"0"}],"hanzo":[],"torbiorn":[],"reinhardt":[{"wins":"2","win_rate":"51%"}],"pharah":[],"lucio":[{"wins":"00:28","win_rate":"76%"}],"symmetra":[],"winston":[],"roadhog":[{"wins":"10:36","win_rate":"12%"}],"junkrat":[],"zarya":[],"soldier:76":[{"wins":"00:23","win_rate":"1"}],"orisa":[{"wins":"6","win_rate":"51%"}],"zenyatta":[],"genji":[],"mcCree":[],"D.Va":[{"wins":"0","win_rate":"0"}],"mei":[],"sombra":[],"ana":[],"widowmaker":[]}', 'orisa', '19,5', '10 740');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (19, NULL, '2017-06-09 11:46:21', 22, '{"reaper":[],"bastion":[],"tracer":[],"mercy":[{"wins":"5","win_rate":"82%"}],"hanzo":[],"torbiorn":[],"reinhardt":[],"pharah":[],"lucio":[],"symmetra":[],"winston":[],"roadhog":[],"junkrat":[],"zarya":[],"soldier:76":[{"wins":"2","win_rate":"43%"}],"orisa":[],"zenyatta":[{"wins":"1","win_rate":"62%"}],"genji":[],"mcCree":[],"D.Va":[],"mei":[],"sombra":[],"ana":[{"wins":"0","win_rate":"17%"}],"widowmaker":[]}', 'mercy', '10,99', '6 047');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (21, '2017-06-09 19:37:56', '2017-06-10 13:10:05', 23, '{"reaper":[],"bastion":[{"wins":"00:04","win_rate":"00:04"}],"tracer":[],"mercy":[{"wins":"0","win_rate":"15%"}],"hanzo":[{"wins":"2","win_rate":"53%"}],"torbiorn":[],"reinhardt":[{"wins":"0","win_rate":"15%"}],"pharah":[{"wins":"0","win_rate":"0%"}],"lucio":[{"wins":"3","win_rate":"78%"}],"symmetra":[],"winston":[{"wins":"00:03","win_rate":"00:03"}],"roadhog":[{"wins":"0","win_rate":"17%"}],"junkrat":[{"wins":"00:03","win_rate":"00:03"}],"zarya":[],"soldier:76":[{"wins":"1","win_rate":"60%"}],"orisa":[],"zenyatta":[{"wins":"0","win_rate":"11%"}],"genji":[],"mcCree":[],"D.Va":[{"wins":"6","win_rate":"53%"}],"mei":[],"sombra":[],"ana":[{"wins":"0","win_rate":"100%"}],"widowmaker":[{"wins":"270","win_rate":"270"}]}', 'dva', '20,44', '10 866');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (28, '2017-06-13 10:16:01', '2017-06-13 10:16:01', 30, '{"reaper":[],"bastion":[{"wins":"6","win_rate":"81%"}],"tracer":[],"mercy":[{"wins":"1","win_rate":"54%"}],"hanzo":[],"torbiorn":[{"win_rate":"46%"}],"reinhardt":[],"pharah":[{"wins":"1","win_rate":"44%"}],"lucio":[{"wins":"4","win_rate":"64%"}],"symmetra":[],"winston":[],"roadhog":[],"junkrat":[],"zarya":[{"wins":"14","win_rate":"47%"}],"soldier:76":[{"wins":"23","win_rate":"60%"}],"orisa":[],"zenyatta":[{"wins":"01:32","win_rate":"01:32"}],"genji":[{"wins":"0","win_rate":"0"}],"mcCree":[{"wins":"00:05","win_rate":"00:05"}],"D.Va":[{"wins":"7","win_rate":"39%"}],"mei":[],"sombra":[],"ana":[{"wins":"4","win_rate":"56%"}],"widowmaker":[]}', NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (23, '2017-06-09 19:45:42', '2017-06-09 19:54:27', 25, '{"reaper":[{"wins":"1","win_rate":"84%"}],"bastion":[{"wins":"00:15","win_rate":"00:40"}],"tracer":[],"mercy":[],"hanzo":[],"torbiorn":[],"reinhardt":[{"wins":"1","win_rate":"41%"}],"pharah":[{"wins":"1","win_rate":"73%"}],"lucio":[],"symmetra":[{"wins":"00:36","win_rate":"00:36"}],"winston":[{"wins":"0","win_rate":"47%"}],"roadhog":[{"wins":"00:31","win_rate":"00:31"}],"junkrat":[{"wins":"4","win_rate":"50%"}],"zarya":[{"wins":"00:58","win_rate":"00:58"}],"soldier:76":[{"wins":"1","win_rate":"65%"}],"orisa":[],"zenyatta":[],"genji":[{"wins":"12","win_rate":"67%"}],"mcCree":[{"wins":"0","win_rate":"51%"}],"D.Va":[{"wins":"1","win_rate":"100%"}],"mei":[{"win_rate":"0"}],"sombra":[],"ana":[{"wins":"0","win_rate":"100%"}],"widowmaker":[{"win_rate":"0"}]}', 'genji', '30,83', '15 198');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (27, '2017-06-13 08:08:18', '2017-06-15 15:02:52', 29, '{"reaper":[{"wins":"0","win_rate":"22%"}],"bastion":[{"wins":"1","win_rate":"46%"}],"tracer":[{"wins":"3","win_rate":"36%"}],"mercy":[{"wins":"6","win_rate":"52%"}],"hanzo":[{"wins":"0","win_rate":"16%"}],"torbiorn":[{"wins":"3","win_rate":"00:00"}],"reinhardt":[{"wins":"13","win_rate":"37%"}],"pharah":[{"wins":"2","win_rate":"66%"}],"lucio":[{"wins":"17","win_rate":"53%"}],"symmetra":[{"wins":"01:27","win_rate":"00:31"}],"winston":[{"wins":"3","win_rate":"63%"}],"roadhog":[{"wins":"11","win_rate":"53%"}],"junkrat":[{"wins":"0","win_rate":"57%"}],"zarya":[{"wins":"1","win_rate":"43%"}],"soldier:76":[{"wins":"2","win_rate":"65%"}],"orisa":[{"wins":"1","win_rate":"38%"}],"zenyatta":[{"wins":"0","win_rate":"11%"}],"genji":[{"wins":"10","win_rate":"27%"}],"mcCree":[{"win_rate":"0"}],"D.Va":[{"wins":"1","win_rate":"39%"}],"mei":[{"wins":"00:03","win_rate":"00:03"}],"sombra":[{"wins":"00:15","win_rate":"00:15"}],"ana":[{"wins":"1","win_rate":"61%"}],"widowmaker":[{"wins":"2","win_rate":"59%"}]}', 'genji', '19,01', '9 246');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (26, '2017-06-11 03:45:32', '2017-06-11 03:45:32', 28, '{"reaper":[],"bastion":[{"wins":"6","win_rate":"81%"}],"tracer":[],"mercy":[{"wins":"1","win_rate":"54%"}],"hanzo":[],"torbiorn":[{"win_rate":"46%"}],"reinhardt":[],"pharah":[{"wins":"1","win_rate":"44%"}],"lucio":[{"wins":"4","win_rate":"64%"}],"symmetra":[],"winston":[],"roadhog":[],"junkrat":[],"zarya":[{"wins":"14","win_rate":"47%"}],"soldier:76":[{"wins":"23","win_rate":"60%"}],"orisa":[],"zenyatta":[{"wins":"01:32","win_rate":"01:32"}],"genji":[{"wins":"0","win_rate":"0"}],"mcCree":[{"wins":"00:05","win_rate":"00:05"}],"D.Va":[{"wins":"7","win_rate":"39%"}],"mei":[],"sombra":[],"ana":[{"wins":"4","win_rate":"56%"}],"widowmaker":[]}', NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (24, '2017-06-10 16:46:06', '2017-06-13 16:19:18', 26, '{"reaper":[{"wins":"0","win_rate":"23%"}],"bastion":[{"wins":"2","win_rate":"72%"}],"tracer":[{"wins":"3","win_rate":"35%"}],"mercy":[{"wins":"2","win_rate":"56%"}],"hanzo":[],"torbiorn":[{"wins":"3"}],"reinhardt":[{"wins":"4","win_rate":"74%"}],"pharah":[{"wins":"1","win_rate":"39%"}],"lucio":[{"wins":"1","win_rate":"69%"}],"symmetra":[],"winston":[{"wins":"3","win_rate":"70%"}],"roadhog":[{"wins":"00:10","win_rate":"00:10"}],"junkrat":[{"wins":"0","win_rate":"100%"}],"zarya":[{"wins":"0","win_rate":"14%"}],"soldier:76":[{"wins":"4","win_rate":"38%"}],"orisa":[{"wins":"1","win_rate":"100%"}],"zenyatta":[{"wins":"00:44","win_rate":"00:44"}],"genji":[{"wins":"00:33","win_rate":"00:33"}],"mcCree":[{"wins":"0","win_rate":"28%"}],"D.Va":[{"wins":"8","win_rate":"58%"}],"mei":[{"wins":"0","win_rate":"0"}],"sombra":[{"wins":"0","win_rate":"0"}],"ana":[{"wins":"00:17","win_rate":"00:17"}],"widowmaker":[{"win_rate":"0"}]}', 'dva', '21,64', '10 122');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (32, '2017-06-13 19:55:23', '2017-07-03 03:05:49', 34, '{"reaper":[],"bastion":[{"wins":"6","win_rate":"77%"}],"tracer":[{"wins":"0","win_rate":"8%"}],"mercy":[{"wins":"3","win_rate":"54%"}],"hanzo":[],"torbiorn":[{"wins":"0","win_rate":"40%"}],"reinhardt":[{"wins":"00:05","win_rate":"00:05"}],"pharah":[{"wins":"1","win_rate":"36%"}],"lucio":[{"wins":"7","win_rate":"54%"}],"symmetra":[],"winston":[{"wins":"00:14","win_rate":"00:14"}],"roadhog":[],"junkrat":[],"zarya":[{"wins":"17","win_rate":"44%"}],"soldier:76":[{"wins":"25","win_rate":"54%"}],"orisa":[],"zenyatta":[{"wins":"2","win_rate":"76%"}],"genji":[{"wins":"0","win_rate":"100%"}],"mcCree":[{"wins":"00:05","win_rate":"00:05"}],"D.Va":[{"wins":"17","win_rate":"47%"}],"mei":[],"sombra":[],"ana":[{"wins":"4","win_rate":"52%"}],"widowmaker":[]}', 'soldier-76', '22,35', '15');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (33, '2017-06-13 20:09:52', '2017-06-13 20:09:52', 35, '{"reaper":[],"bastion":[{"wins":"6","win_rate":"81%"}],"tracer":[],"mercy":[{"wins":"1","win_rate":"54%"}],"hanzo":[],"torbiorn":[{"win_rate":"46%"}],"reinhardt":[],"pharah":[{"wins":"1","win_rate":"44%"}],"lucio":[{"wins":"4","win_rate":"64%"}],"symmetra":[],"winston":[],"roadhog":[],"junkrat":[],"zarya":[{"wins":"14","win_rate":"47%"}],"soldier:76":[{"wins":"23","win_rate":"60%"}],"orisa":[],"zenyatta":[{"wins":"01:32","win_rate":"01:32"}],"genji":[{"wins":"0","win_rate":"0"}],"mcCree":[{"wins":"00:05","win_rate":"00:05"}],"D.Va":[{"wins":"7","win_rate":"39%"}],"mei":[],"sombra":[],"ana":[{"wins":"4","win_rate":"56%"}],"widowmaker":[]}', NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (31, '2017-06-13 17:17:33', '2017-06-13 17:17:33', 33, '{"reaper":[],"bastion":[{"wins":"6","win_rate":"81%"}],"tracer":[],"mercy":[{"wins":"1","win_rate":"54%"}],"hanzo":[],"torbiorn":[{"win_rate":"46%"}],"reinhardt":[],"pharah":[{"wins":"1","win_rate":"44%"}],"lucio":[{"wins":"4","win_rate":"64%"}],"symmetra":[],"winston":[],"roadhog":[],"junkrat":[],"zarya":[{"wins":"14","win_rate":"47%"}],"soldier:76":[{"wins":"23","win_rate":"60%"}],"orisa":[],"zenyatta":[{"wins":"01:32","win_rate":"01:32"}],"genji":[{"wins":"0","win_rate":"0"}],"mcCree":[{"wins":"00:05","win_rate":"00:05"}],"D.Va":[{"wins":"7","win_rate":"39%"}],"mei":[],"sombra":[],"ana":[{"wins":"4","win_rate":"56%"}],"widowmaker":[]}', NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (30, '2017-06-13 16:10:37', '2017-06-14 08:11:27', 32, '{"reaper":[{"wins":"6","win_rate":"48%"}],"bastion":[{"wins":"4","win_rate":"70%"}],"tracer":[{"wins":"1","win_rate":"23%"}],"mercy":[{"wins":"6","win_rate":"42%"}],"hanzo":[{"wins":"2","win_rate":"42%"}],"torbiorn":[{"wins":"1","win_rate":"63%"}],"reinhardt":[{"wins":"11","win_rate":"51%"}],"pharah":[{"wins":"11","win_rate":"47%"}],"lucio":[{"wins":"7","win_rate":"56%"}],"symmetra":[{"wins":"9","win_rate":"59%"}],"winston":[{"wins":"2","win_rate":"37%"}],"roadhog":[{"wins":"1","win_rate":"43%"}],"junkrat":[{"wins":"7","win_rate":"53%"}],"zarya":[{"wins":"1","win_rate":"46%"}],"soldier:76":[{"wins":"8","win_rate":"56%"}],"orisa":[],"zenyatta":[],"genji":[{"wins":"4","win_rate":"44%"}],"mcCree":[{"wins":"1","win_rate":"49%"}],"D.Va":[{"wins":"3","win_rate":"62%"}],"mei":[{"wins":"1","win_rate":"25%"}],"sombra":[{"wins":"00:40","win_rate":"00:40"}],"ana":[{"wins":"0","win_rate":"2%"}],"widowmaker":[{"wins":"0","win_rate":"57%"}]}', 'pharah', '23,13', '12 134');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (36, '2017-06-15 15:23:47', '2017-06-15 15:27:19', 38, '{"reaper":[],"bastion":[{"wins":"1","win_rate":"32%"}],"tracer":[{"wins":"0","win_rate":"2%"}],"mercy":[{"wins":"0","win_rate":"100%"}],"hanzo":[],"torbiorn":[{"wins":"0","win_rate":"00:00"}],"reinhardt":[{"wins":"2","win_rate":"52%"}],"pharah":[{"wins":"0","win_rate":"41%"}],"lucio":[],"symmetra":[{"wins":"00:08","win_rate":"00:20"}],"winston":[],"roadhog":[{"wins":"7","win_rate":"68%"}],"junkrat":[{"wins":"4","win_rate":"65%"}],"zarya":[{"wins":"0","win_rate":"43%"}],"soldier:76":[{"wins":"2","win_rate":"37%"}],"orisa":[{"wins":"00:39","win_rate":"00:42"}],"zenyatta":[],"genji":[],"mcCree":[{"wins":"2","win_rate":"58%"}],"D.Va":[{"wins":"1","win_rate":"45%"}],"mei":[],"sombra":[],"ana":[{"wins":"0","win_rate":"100%"}],"widowmaker":[]}', 'roadhog', '23,77', '13 731');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (37, '2017-06-16 08:42:27', '2017-06-16 08:42:27', 39, NULL, NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (35, '2017-06-13 20:21:31', '2017-06-13 20:22:44', 37, '{"reaper":[],"bastion":[],"tracer":[{"wins":"1","win_rate":"73%"}],"mercy":[{"wins":"7","win_rate":"64%"}],"hanzo":[],"torbiorn":[{"wins":"1"}],"reinhardt":[{"wins":"5","win_rate":"53%"}],"pharah":[],"lucio":[{"wins":"00:13","win_rate":"00:13"}],"symmetra":[{"wins":"0","win_rate":"100%"}],"winston":[],"roadhog":[{"wins":"1","win_rate":"14%"}],"junkrat":[],"zarya":[{"wins":"1","win_rate":"71%"}],"soldier:76":[{"wins":"0","win_rate":"24%"}],"orisa":[],"zenyatta":[{"wins":"00:29","win_rate":"00:29"}],"genji":[],"mcCree":[{"win_rate":"0"}],"D.Va":[{"wins":"00:42","win_rate":"00:42"}],"mei":[],"sombra":[],"ana":[{"wins":"6","win_rate":"54%"}],"widowmaker":[]}', 'mercy', '16,51', '7 600');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (25, '2017-06-10 20:48:58', '2017-06-10 20:48:58', 27, '{"reaper":[],"bastion":[{"wins":"6","win_rate":"81%"}],"tracer":[],"mercy":[{"wins":"1","win_rate":"54%"}],"hanzo":[],"torbiorn":[{"win_rate":"46%"}],"reinhardt":[],"pharah":[{"wins":"1","win_rate":"44%"}],"lucio":[{"wins":"4","win_rate":"64%"}],"symmetra":[],"winston":[],"roadhog":[],"junkrat":[],"zarya":[{"wins":"14","win_rate":"47%"}],"soldier:76":[{"wins":"23","win_rate":"60%"}],"orisa":[],"zenyatta":[{"wins":"01:32","win_rate":"01:32"}],"genji":[{"wins":"0","win_rate":"0"}],"mcCree":[{"wins":"00:05","win_rate":"00:05"}],"D.Va":[{"wins":"7","win_rate":"39%"}],"mei":[],"sombra":[],"ana":[{"wins":"4","win_rate":"56%"}],"widowmaker":[]}', NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (14, '2017-05-29 10:31:14', '2017-07-11 07:16:39', 7, '{"reaper":[{"wins":"33","win_rate":"47%"}],"bastion":[{"wins":"3","win_rate":"37%"}],"tracer":[{"wins":"1","win_rate":"32%"}],"mercy":[{"wins":"3","win_rate":"42%"}],"hanzo":[],"torbiorn":[{"wins":"1","win_rate":"71%"}],"reinhardt":[{"wins":"2","win_rate":"38%"}],"pharah":[{"wins":"19","win_rate":"55%"}],"lucio":[],"symmetra":[{"wins":"22","win_rate":"60%"}],"winston":[{"wins":"6","win_rate":"70%"}],"roadhog":[{"wins":"1","win_rate":"20%"}],"junkrat":[{"wins":"0","win_rate":"29%"}],"zarya":[{"wins":"0","win_rate":"32%"}],"soldier:76":[{"wins":"3","win_rate":"40%"}],"orisa":[{"wins":"1","win_rate":"85%"}],"zenyatta":[{"wins":"0","win_rate":"36%"}],"genji":[{"wins":"00:09","win_rate":"00:09"}],"mcCree":[],"D.Va":[{"wins":"01:00","win_rate":"01:00"}],"mei":[],"sombra":[{"wins":"0","win_rate":"25%"}],"ana":[],"widowmaker":[]}', 'reaper', '25,63', '17');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (15, '2017-05-29 10:31:31', '2017-07-11 08:33:16', 18, '{"reaper":[{"wins":"1","win_rate":"20%"}],"bastion":[{"wins":"1","win_rate":"25%"}],"tracer":[{"wins":"0","win_rate":"100%"}],"mercy":[{"wins":"5","win_rate":"49%"}],"hanzo":[{"wins":"0","win_rate":"14%"}],"torbiorn":[{"wins":"0","win_rate":"0"}],"reinhardt":[{"wins":"00:36","win_rate":"00:36"}],"pharah":[{"wins":"03:32","win_rate":"02:10"}],"lucio":[{"wins":"11","win_rate":"47%"}],"symmetra":[{"wins":"0","win_rate":"11%"}],"winston":[{"wins":"0","win_rate":"17%"}],"roadhog":[{"wins":"80","win_rate":"55%"}],"junkrat":[],"zarya":[{"wins":"00:45","win_rate":"00:45"}],"soldier:76":[{"wins":"2","win_rate":"35%"}],"orisa":[{"wins":"1","win_rate":"65%"}],"zenyatta":[{"wins":"00:42","win_rate":"01:22"}],"genji":[{"wins":"1","win_rate":"28%"}],"mcCree":[],"D.Va":[{"wins":"5","win_rate":"69%"}],"mei":[],"sombra":[],"ana":[{"wins":"00:10","win_rate":"00:10"}],"widowmaker":[]}', 'roadhog', '21,66', '16');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (38, '2017-06-16 13:43:29', '2017-06-16 13:57:38', 40, '{"reaper":[],"bastion":[{"win_rate":"0"}],"tracer":[],"mercy":[{"wins":"01:09","win_rate":"1"}],"hanzo":[],"torbiorn":[{"win_rate":"0"}],"reinhardt":[{"wins":"0","win_rate":"35%"}],"pharah":[{"wins":"56","win_rate":"59%"}],"lucio":[{"wins":"1","win_rate":"94%"}],"symmetra":[],"winston":[{"wins":"0","win_rate":"55%"}],"roadhog":[],"junkrat":[{"wins":"00:00","win_rate":"00:00"}],"zarya":[{"wins":"0","win_rate":"42%"}],"soldier:76":[{"wins":"4","win_rate":"47%"}],"orisa":[{"wins":"0","win_rate":"0"}],"zenyatta":[],"genji":[],"mcCree":[{"wins":"00:34","win_rate":"00:34"}],"D.Va":[{"wins":"0","win_rate":"47%"}],"mei":[],"sombra":[],"ana":[{"wins":"4","win_rate":"0"}],"widowmaker":[{"wins":"2","win_rate":"35%"}]}', 'pharah', '30,24', '16 205');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (39, '2017-06-16 20:24:49', '2017-06-16 20:30:15', 41, '{"reaper":[{"wins":"00:14","win_rate":"01:04"}],"bastion":[{"wins":"3","win_rate":"61%"}],"tracer":[{"wins":"3","win_rate":"38%"}],"mercy":[{"wins":"5","win_rate":"42%"}],"hanzo":[],"torbiorn":[{"wins":"3"}],"reinhardt":[{"wins":"1","win_rate":"63%"}],"pharah":[{"wins":"5","win_rate":"38%"}],"lucio":[{"wins":"1","win_rate":"49%"}],"symmetra":[{"wins":"4","win_rate":"73%"}],"winston":[{"wins":"2","win_rate":"37%"}],"roadhog":[{"wins":"3","win_rate":"77%"}],"junkrat":[{"wins":"00:13","win_rate":"00:13"}],"zarya":[{"wins":"03:48","win_rate":"01:21"}],"soldier:76":[{"wins":"27","win_rate":"59%"}],"orisa":[{"wins":"0","win_rate":"100%"}],"zenyatta":[{"wins":"11","win_rate":"58%"}],"genji":[{"wins":"6","win_rate":"42%"}],"mcCree":[{"wins":"00:02","win_rate":"00:02"}],"D.Va":[{"wins":"8","win_rate":"57%"}],"mei":[{"wins":"0","win_rate":"45%"}],"sombra":[{"wins":"0","win_rate":"61%"}],"ana":[{"wins":"4","win_rate":"32%"}],"widowmaker":[{"wins":"1","win_rate":"38%"}]}', 'soldier-76', '24,78', '11 659');
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (40, '2017-06-16 20:30:59', '2017-06-16 20:30:59', 42, NULL, NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (41, '2017-06-19 19:04:22', '2017-06-19 19:04:22', 43, NULL, NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (42, '2017-06-23 12:57:51', '2017-06-23 12:57:51', 44, NULL, NULL, NULL, NULL);
INSERT INTO "Fj6L8ZM_rating_heroes" (id, created_at, updated_at, user_id, rating_heroes, your_hero, best_kills, best_damage) VALUES (29, '2017-06-13 12:01:34', '2017-06-30 15:21:31', 31, '{"reaper":[{"wins":"0","win_rate":"0%"}],"bastion":[{"wins":"0","win_rate":"31%"}],"tracer":[{"wins":"00:00","win_rate":"00:00"}],"mercy":[{"wins":"9","win_rate":"34%"}],"hanzo":[{"win_rate":"0"}],"torbiorn":[{"wins":"00:00","win_rate":"8%"}],"reinhardt":[{"wins":"1","win_rate":"20%"}],"pharah":[{"wins":"0","win_rate":"26%"}],"lucio":[{"wins":"20","win_rate":"62%"}],"symmetra":[{"wins":"16","win_rate":"49%"}],"winston":[{"wins":"1","win_rate":"30%"}],"roadhog":[{"wins":"13","win_rate":"50%"}],"junkrat":[{"wins":"2","win_rate":"38%"}],"zarya":[{"win_rate":"0"}],"soldier:76":[{"wins":"0","win_rate":"14%"}],"orisa":[{"wins":"5","win_rate":"68%"}],"zenyatta":[{"wins":"2","win_rate":"34%"}],"genji":[{"wins":"0","win_rate":"74%"}],"mcCree":[{"wins":"00:24","win_rate":"00:24"}],"D.Va":[{"wins":"4","win_rate":"60%"}],"mei":[{"wins":"4","win_rate":"59%"}],"sombra":[{"wins":"0","win_rate":"23%"}],"ana":[{"wins":"0","win_rate":"56%"}],"widowmaker":[{"wins":"0","win_rate":"22%"}]}', 'lucio', '15,12', '7 380');


--
-- Data for Name: Fj6L8ZM_referal_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_referal_users" (id, created_at, updated_at, ref_user_id, reg_user_id) VALUES (2, '2017-05-29 07:56:13', '2017-05-29 07:56:13', 11, 7);
INSERT INTO "Fj6L8ZM_referal_users" (id, created_at, updated_at, ref_user_id, reg_user_id) VALUES (3, '2017-05-29 07:57:19', '2017-05-29 07:57:19', 11, 18);


--
-- Name: Fj6L8ZM_referal_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Fj6L8ZM_referal_users_id_seq"', 3, true);


--
-- Data for Name: Fj6L8ZM_tournaments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_tournaments" (id, created_at, updated_at, turnir_title, turnir_description, turnir_avatar, turnir_autor, turnir_prize_money, turnir_status, turnir_count_comands, turnir_data) VALUES (1, NULL, NULL, 'Hot summer', 'Первый турнир зависящий от наших игроков<br> Принять участие сможет любой жедающий', '/img/ClanLogos/7/justiceLogo.png', 'TERRA', 50000, false, 1, '01-08-2017 18:00');


--
-- Name: Fj6L8ZM_tournaments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Fj6L8ZM_tournaments_id_seq"', 1, true);


--
-- Data for Name: Fj6L8ZM_user_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (1, '2017-06-06 13:42:03', '2017-06-06 13:42:03', 62393591677, 1000, '$500.00', false, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (2, '2017-06-06 13:45:04', '2017-06-06 13:45:04', 34937518214, 1000, '$500.00', false, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (3, '2017-06-06 14:00:30', '2017-06-06 14:00:30', 93073015246, 10, '$5.00', false, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (4, '2017-06-06 14:07:18', '2017-06-06 14:07:18', 31818155157, 10, '$5.00', false, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (8, '2017-06-06 14:17:43', '2017-06-06 14:32:13', 69802842537, 6, '$3.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (18, '2017-06-06 17:58:16', '2017-06-06 18:13:13', 69030650705, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (13, '2017-06-06 17:42:09', '2017-06-06 17:57:13', 71360406569, 4, '$2.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (35, '2017-07-11 08:45:33', '2017-07-11 08:45:33', 97667544749, 10, '$5.00', false, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (14, '2017-06-06 17:43:09', '2017-06-06 17:58:13', 27224192519, 6, '$3.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (9, '2017-06-06 14:20:04', '2017-06-06 14:35:13', 89923208538, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (10, '2017-06-06 14:22:01', '2017-06-06 14:37:13', 83805211923, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (19, '2017-06-06 18:00:32', '2017-06-06 18:15:12', 63791472588, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (20, '2017-06-06 18:02:53', '2017-06-06 18:17:13', 31788592206, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (5, '2017-06-06 14:10:02', '2017-06-06 14:25:13', 91776338799, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (21, '2017-06-06 18:14:04', '2017-06-06 18:29:13', 45951505833, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (11, '2017-06-06 17:36:35', '2017-06-06 17:51:13', 61164592578, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (6, '2017-06-06 14:13:42', '2017-06-06 14:29:13', 66263616457, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (15, '2017-06-06 17:52:54', '2017-06-06 18:07:13', 63952048743, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (7, '2017-06-06 14:15:53', '2017-06-06 14:30:13', 49035832203, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (22, '2017-06-07 07:30:50', '2017-06-07 07:45:15', 90091069663, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (16, '2017-06-06 17:53:26', '2017-06-06 18:09:13', 31447739733, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (12, '2017-06-06 17:41:35', '2017-06-06 17:56:13', 94640232664, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (23, '2017-06-07 08:18:36', '2017-06-07 08:33:14', 45150981636, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (17, '2017-06-06 17:57:20', '2017-06-06 18:12:13', 12364717158, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (24, '2017-06-07 08:21:08', '2017-06-07 08:36:15', 78573758900, 10, '$5.00', true, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (25, '2017-06-08 07:16:51', '2017-06-08 07:16:51', 48906917042, 10, '$5.00', false, 18);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (26, '2017-06-09 09:14:10', '2017-06-09 09:14:10', 65481031354, 14, '$7.00', false, 18);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (27, '2017-06-09 09:14:51', '2017-06-09 09:14:51', 21365194063, 332, '$166.00', false, 18);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (28, '2017-06-09 09:15:00', '2017-06-09 09:15:00', 77746295018, 500, '$250.00', false, 18);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (29, '2017-06-09 09:15:39', '2017-06-09 09:15:39', 63625126663, 500, '$250.00', false, 18);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (30, '2017-06-09 09:15:58', '2017-06-09 09:15:58', 43090134072, 500, '$250.00', false, 18);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (31, '2017-06-09 09:16:08', '2017-06-09 09:16:08', 53661772111, 500, '$250.00', false, 18);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (32, '2017-06-09 10:37:59', '2017-06-09 10:37:59', 18834582840, 500, '$250.00', false, 18);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (33, '2017-06-09 18:43:34', '2017-06-09 18:43:34', 80169365058, 500, '$250.00', false, 7);
INSERT INTO "Fj6L8ZM_user_payments" (id, created_at, updated_at, pay_code_tranzaction, pay_coins, pay_money, pay_status, pay_user_id) VALUES (34, '2017-06-14 12:45:38', '2017-06-14 12:45:38', 20861543590, 500, '$250.00', false, 18);


--
-- Name: Fj6L8ZM_user_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Fj6L8ZM_user_payments_id_seq"', 35, true);


--
-- Data for Name: Fj6L8ZM_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (39, NULL, NULL, NULL, 'bi12icnyCYa3MD3kmCwESyWOeMFXxhtrNSlzEUoVNdmPTGQVb8bVDMvpADrl', '2017-06-16 08:42:27', '2017-06-16 08:42:27', 437647261, 'daemon#22471', 'wckyyqm7vpgkpvvcz42mg7bw', NULL, 0, false, 'eu', 0, '89dSY', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (23, NULL, NULL, NULL, 'TxXtAuWyovs0CtLBIcvPENKpIlObI5mH3NpUijmZQGuUzdkK8DSLjXUlAHgL', '2017-06-09 19:37:56', '2017-06-10 13:10:05', 449983964, 'Kallannel#2538', 'drbm9uvkyc8mgfvrwngb6a5w', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000001155.png', 1752, false, 'eu', 0, 'fisoS', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (37, NULL, NULL, NULL, 'j3kxTIU37jhhhwy5hGbDpuE6PxJ0IpZiQP1SEyyXYjvLmX67qCsAJYovIm3Y', '2017-06-13 20:21:31', '2017-06-13 20:27:28', 134578104, 'EShubin#2407', 'z32gw6bd5t98z9ku8a9smwvz', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x02500000000010B6.png', 2200, true, 'eu', 7, '10KG1', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (31, NULL, NULL, NULL, 'U3AnTGXlHNUgcShj8hz7Y5haoEtdFFZBYBM8elz8iZ1NO9G8LcUFkzNj4sWt', '2017-06-13 12:01:34', '2017-06-30 15:21:31', 440339062, 'Danger#22260', 'w86gyxdcmayh7ezmc62aam4x', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x025000000000030F.png', 2153, true, 'eu', 7, '9MKLH', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (29, NULL, NULL, NULL, '6kREHix9CM2wqooT5sBiFLuuIzw4ur53w14Q4VAAgoGBa6VHRfJSnxOOcRCj', '2017-06-13 08:08:18', '2017-06-15 15:02:52', 415785564, 'FlameLeet#2545', 'f6gpy9rx3t2v6bhxudjf2zsw', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000000316.png', 1840, true, 'eu', 7, 'M7K0Y', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (27, NULL, NULL, NULL, '1jRPvw4qqVEu9J0BNoXO80QBCqRbdJRT5SOILH2vb7EaiXvTZcoUY9opRFY0', '2017-06-10 20:48:58', '2017-06-10 20:48:58', 448583696, 'Chiba#21315', 'hxupx45vt6h8mnvva9gzchfq', NULL, 0, false, 'eu', 0, 'WJTbo', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (25, NULL, NULL, NULL, 'ifZj8FWTeLQ4tdSGEXAYXCXnJtohLmWGSZ1IeC4cjZfY0XGpa45NciDEp877', '2017-06-09 19:45:42', '2017-06-09 19:54:27', 401806989, 'tennx#2801', 'q7hrzutrqyrrjfbn2uj8qnuu', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x025000000000115C.png', 1679, true, 'eu', 7, 'arTR6', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (28, NULL, NULL, NULL, 'C9SR8DdXoj6FWg5gf2XFcktOUpLKPi3LHf214g9z9jiIkepB0tmUOMrNJd1V', '2017-06-11 03:45:32', '2017-06-11 03:45:32', 401321984, 'Piarto#2449', 'zu925sg3n3wvryuy93zwb38x', NULL, 0, false, 'eu', 0, 'aW71B', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (22, NULL, NULL, NULL, NULL, NULL, '2017-06-09 11:46:21', 454438873, 'Lemura#21355', 'qvvh3sdfsdfsfsdffsdf6v7fgmd', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000000ABB.png', 1929, false, 'eu', 0, NULL, NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (44, NULL, NULL, NULL, 'MGK5qQ79ioRMet3GsjCvwjRsXR52UH2sQLdoNcxb4HHlVaeBIqpWT5aTcpe5', '2017-06-23 12:57:51', '2017-06-23 12:57:51', 417484351, 'Noki#2308', 'fct4ktewghpq9erqpr6jp2sh', NULL, 0, false, 'eu', 0, 'vNfHL', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (41, NULL, NULL, NULL, 'YOpyJBFzS8D3hW3oPyTdus3osZpNd8Eg2MmBhLh1Ov2UycVcOAzhmJohDJVb', '2017-06-16 20:24:49', '2017-06-16 20:30:29', 132717330, 'DevilStyle#2974', 'qghwz4ab4k6azkbkbpfurbbf', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000000577.png', 2164, true, 'eu', 7, '9q1Zt', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (30, NULL, NULL, NULL, 'ifN0CTM8qgTe35EhF9zSohEKrTqzb6uWYmY8pzBPtKyd23AhvYwWw2hkFC2X', '2017-06-13 10:16:01', '2017-06-13 10:27:50', 440411438, 'FactynskiY#2839', '7w2u4n8rcnpjag3mgd349tuy', NULL, 0, true, 'eu', 7, 'JauDw', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (20, NULL, NULL, NULL, 'B6GTIaEqAdthFYFsdfsdfwsdfwerfwfvdgrhy9x4M9T0dkOcOabT', NULL, '2017-06-09 10:17:24', 23423423, 'Excelsior#2181', 'qvvh3qtwerwerb2ugrm6v7fgmd', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000000742.png', 2818, false, 'eu', 0, 'sdfdw2', NULL, 'sdsdfsdfsdfsdfdfwsefwe', 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (21, NULL, NULL, NULL, NULL, NULL, '2017-06-09 10:45:40', 34534534, 'Homikator#2894', 'qvvh3qtwersdfsdfsdfsdf6v7fgmd', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x025000000000109A.png', 1678, false, 'eu', 0, NULL, NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (40, NULL, NULL, NULL, 'eak2J3TsE7yu7UCySHMkH6bBWwPbGdvR8ZQ2zbDsjDcQ0UGqDzx5WnfFJ1PE', '2017-06-16 13:43:29', '2017-06-16 13:57:38', 414130205, 'AlexRkm#2542', 't4dntk4bhsp7m2ap4wyyq2ty', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x025000000000115F.png', 2543, false, 'eu', 0, '9cA0j', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (26, NULL, NULL, NULL, 'xuSBKbB5RgdZFZbwYX871ROkzQQwvVkfErRGkxupAgMTxYc3LZcyosR8GEAQ', '2017-06-10 16:46:06', '2017-06-13 16:19:18', 136227974, 'Scandi#2930', '7hzwu32ak3wed63fxrz2aam8', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000001195.png', 2426, true, 'eu', 7, 'XYM0i', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (24, NULL, NULL, NULL, '9chGWzkRhfKqVXbUTtS9M6mtMXRx5225maPB6zLjyFxDR3I4uHKNLULIy25U', '2017-06-09 19:43:07', '2017-06-09 19:44:31', 453865378, 'INKL17#2804', '2h96wmfea7vayj235djymf5d', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x02500000000008F3.png', 1947, false, 'eu', 0, 'w9AMm', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (38, NULL, NULL, NULL, 'JC4ZMwwH4SqXbvOm7qRBEJ2klH46hmWdYAlcTEk9W2dFMfOS7ZXfpMk5zBxv', '2017-06-15 15:23:47', '2017-06-15 15:27:19', 439853249, 'duck1337#21468', 'mzegfek4qhxkrbawpjmuhyxf', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000000C40.png', 2415, true, 'eu', 7, 'dcmMP', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (42, NULL, NULL, NULL, 'HCnkVrUjLgbgHeupyciazplwYKAfg62fd6paV918xloC5TBKbxHy7k8PG75C', '2017-06-16 20:30:59', '2017-06-16 20:30:59', 410159953, 'Gentleman#21569', 'zy6kfm9d34cfrc5n9wapkwgp', NULL, 0, false, 'eu', 0, 'xlMXK', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (32, NULL, NULL, NULL, 'pWTrNzt2qw0l3tTZS0f1igjxeIRhSvQcDbcFmWy27qrYSGCdbUtaYdGXxkMI', '2017-06-13 16:10:37', '2017-06-15 15:38:04', 446089027, 'CrashNort#2615', 'avvruqxnn8ja8bmjn3eh53uj', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000001154.png', 2662, true, 'eu', 7, 'gJwdz', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (43, NULL, NULL, NULL, 'IQhSJXUdHlGHxw1EjZRiYifFxbsQiJd1GzRE0tBln5o53oCI105vZwRny3AT', '2017-06-19 19:04:22', '2017-06-19 21:02:32', 430890946, 'Фаршмашина#21992', 'xngsfz9nx2f25ysvadfepuh9', NULL, 0, true, 'eu', 7, 'KYtA1', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (34, NULL, NULL, NULL, 'dDnLpgjiSatUtnAk9WDH7bdhAgsuxAD8bSNz16pOIoUP2G4djOwy7cvGSjKP', '2017-06-13 19:55:23', '2017-07-03 03:05:49', 438753951, 'DireRaven#212922', 'bf35h48ue788a37abd6vfmx7', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x025000000000115A.png', 2159, true, 'eu', 7, 'dYfg2', NULL, NULL, 0, false);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (18, NULL, 'devshanematte@gmail.com', NULL, '02Sw1R9SimQVYz9lMEEXJLKkusMKl10Hqo3BMvCGoLicmpxoktyHrL2Pxwqx', '2017-05-29 10:31:31', '2017-07-11 08:33:16', 451585870, 'shanematte#2624', '6gwe59jr87fbe3eb6e2jvmhf', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000001155.png', 1966, true, 'eu', 48, 'O04CV', 5437, 'rty56tFBVFG453gh7hjggj', 4500, true);
INSERT INTO "Fj6L8ZM_users" (id, name, email, password, remember_token, created_at, updated_at, user_battle_id, user_battle_tag, user_battle_token, user_battle_avatar, user_battle_rating, user_clan_status, user_server, user_activ_clan_id, user_referal_code, user_email_code, user_api_token, user_money, update_info) VALUES (7, NULL, 'terran47@mail.ru', NULL, '3ufbvBQ7ulycFHBjkl2JRlnt6VITe35r0fC8nJuhSjxSG2F6cnMLNoByc434', '2017-05-29 10:31:14', '2017-07-11 07:16:39', 450281373, 'TERRA#22123', 'zycc47uttsjgr22a5hg5wdpp', 'https://blzgdapipro-a.akamaihd.net/game/unlocks/0x0250000000001157.png', 2337, true, 'eu', 7, 'PJYwv', 9604, 'rty56tFBVFG453gsd45gfh7hjggj', 50500, true);


--
-- Name: applies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('applies_id_seq', 94, true);


--
-- Name: clan_gamers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clan_gamers_id_seq', 6, true);


--
-- Name: clans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clans_id_seq', 48, true);


--
-- Name: heroes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('heroes_id_seq', 24, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('migrations_id_seq', 13, true);


--
-- Name: navigations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('navigations_id_seq', 3, true);


--
-- Name: rating_heroes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_heroes_id_seq', 42, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 44, true);


--
-- Name: Fj6L8ZM_posts Fj6L8ZM_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_posts"
    ADD CONSTRAINT "Fj6L8ZM_posts_pkey" PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_products Fj6L8ZM_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_products"
    ADD CONSTRAINT "Fj6L8ZM_products_pkey" PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_referal_users Fj6L8ZM_referal_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_referal_users"
    ADD CONSTRAINT "Fj6L8ZM_referal_users_pkey" PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_tournaments Fj6L8ZM_tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_tournaments"
    ADD CONSTRAINT "Fj6L8ZM_tournaments_pkey" PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_user_payments Fj6L8ZM_user_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_user_payments"
    ADD CONSTRAINT "Fj6L8ZM_user_payments_pkey" PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_applies applies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_applies"
    ADD CONSTRAINT applies_pkey PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_clan_gamers clan_gamers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_clan_gamers"
    ADD CONSTRAINT clan_gamers_pkey PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_clans clans_clan_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_clans"
    ADD CONSTRAINT clans_clan_name_key UNIQUE (clan_name);


--
-- Name: Fj6L8ZM_clans clans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_clans"
    ADD CONSTRAINT clans_pkey PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_heroes heroes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_heroes"
    ADD CONSTRAINT heroes_pkey PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_migrations"
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_navigations navigations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_navigations"
    ADD CONSTRAINT navigations_pkey PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_rating_heroes rating_heroes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_rating_heroes"
    ADD CONSTRAINT rating_heroes_pkey PRIMARY KEY (id);


--
-- Name: Fj6L8ZM_users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_users"
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: Fj6L8ZM_users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fj6L8ZM_users"
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON "Fj6L8ZM_password_resets" USING btree (email);


--
-- Name: password_resets_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_token_index ON "Fj6L8ZM_password_resets" USING btree (token);


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

