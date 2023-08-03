--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 3, 'bfb13757-fff2-4985-affd-13f74c2380be', '2023-08-02 15:57:43.143072');
INSERT INTO public.sessions VALUES (2, 7, 'bc05ff20-d311-4e07-8705-c3d215bb3fd8', '2023-08-02 23:04:41.493481');
INSERT INTO public.sessions VALUES (3, 23, '087e983d-e092-43ed-bc0e-ef7139fa5e4a', '2023-08-03 13:04:45.272361');
INSERT INTO public.sessions VALUES (4, 37, '05e2d6a0-fce8-4e26-b171-0aa1aa184f93', '2023-08-03 13:19:14.320397');
INSERT INTO public.sessions VALUES (5, 25, 'c02c6dc9-fde3-4feb-a24f-3436a0126df5', '2023-08-03 13:19:38.47685');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 3, 'https://...', 'vfCCGwXv', 0, '2023-08-02 16:31:38.048756');
INSERT INTO public.urls VALUES (2, 3, 'https://...', 'dZTJx9if', 0, '2023-08-02 16:32:47.600932');
INSERT INTO public.urls VALUES (3, 3, 'https://...', 'u9_bxQrO', 0, '2023-08-02 16:35:47.510124');
INSERT INTO public.urls VALUES (4, 3, 'https://...', 'SUzpwwn2', 0, '2023-08-02 16:37:37.895422');
INSERT INTO public.urls VALUES (5, 3, 'https://...', 'zYmCe3p_', 0, '2023-08-02 16:42:42.991791');
INSERT INTO public.urls VALUES (6, 3, 'https://...', 'AbpEyB4S', 0, '2023-08-02 16:42:59.334002');
INSERT INTO public.urls VALUES (7, 3, 'https://...', 'TDXVNVyK', 0, '2023-08-02 16:43:36.01538');
INSERT INTO public.urls VALUES (8, 3, 'https://...', 'c2Jh9Zae', 0, '2023-08-02 16:43:50.182808');
INSERT INTO public.urls VALUES (9, 3, 'https://...', 'Afoc9RbJ', 0, '2023-08-02 16:44:17.64739');
INSERT INTO public.urls VALUES (10, 3, 'https://...', 'BE_lngmz', 0, '2023-08-02 16:45:13.393048');
INSERT INTO public.urls VALUES (11, 3, 'https://...', 'chRqbnVq', 0, '2023-08-02 16:45:27.489194');
INSERT INTO public.urls VALUES (12, 3, 'https://...', 'DV0UBZgd', 0, '2023-08-02 16:46:12.416191');
INSERT INTO public.urls VALUES (15, 7, 'https://www.google.com', 'En_L_ZKG', 0, '2023-08-02 23:29:17.95388');
INSERT INTO public.urls VALUES (17, 7, 'https://www.google.com', 'YxPAlInT', 0, '2023-08-02 23:29:18.687787');
INSERT INTO public.urls VALUES (18, 7, 'https://www.google.com', 'rfzjCXKE', 0, '2023-08-02 23:29:19.032693');
INSERT INTO public.urls VALUES (14, 7, 'https://www.google.com', 'pfyUQCPx', 3, '2023-08-02 23:29:16.707815');
INSERT INTO public.urls VALUES (16, 7, 'https://www.google.com', 'PZ8GKJJ2', 4, '2023-08-02 23:29:18.368135');
INSERT INTO public.urls VALUES (19, 23, 'https://www.google.com', 'TrH50REP', 0, '2023-08-03 13:05:00.723196');
INSERT INTO public.urls VALUES (20, 23, 'https://www.google.com', '9f9esrs2', 0, '2023-08-03 13:05:01.904302');
INSERT INTO public.urls VALUES (22, 23, 'https://www.google.com', 'laV7mgxm', 0, '2023-08-03 13:05:02.735353');
INSERT INTO public.urls VALUES (23, 23, 'https://www.google.com', '1K10CF58', 0, '2023-08-03 13:05:02.917368');
INSERT INTO public.urls VALUES (24, 23, 'https://www.google.com', 'YmyiPCP6', 0, '2023-08-03 13:05:03.085487');
INSERT INTO public.urls VALUES (25, 23, 'https://www.google.com', 'm2Lh6MdF', 0, '2023-08-03 13:05:03.254037');
INSERT INTO public.urls VALUES (26, 23, 'https://www.google.com', 'u2-6Uce3', 0, '2023-08-03 13:05:03.397569');
INSERT INTO public.urls VALUES (27, 23, 'https://www.google.com', 'n2u5mvC7', 0, '2023-08-03 13:05:03.566094');
INSERT INTO public.urls VALUES (28, 23, 'https://www.google.com', 'AW2aWcpt', 0, '2023-08-03 13:05:03.746928');
INSERT INTO public.urls VALUES (29, 23, 'https://www.google.com', 'MA_8d9y9', 0, '2023-08-03 13:05:03.904917');
INSERT INTO public.urls VALUES (30, 23, 'https://www.google.com', 'DcuI3_Iu', 0, '2023-08-03 13:05:04.062326');
INSERT INTO public.urls VALUES (31, 23, 'https://www.google.com', 'IMEhUr3J', 0, '2023-08-03 13:05:04.222447');
INSERT INTO public.urls VALUES (32, 23, 'https://www.google.com', 'WxXKgppi', 0, '2023-08-03 13:05:04.398208');
INSERT INTO public.urls VALUES (33, 23, 'https://www.google.com', 'iyxr2s1I', 0, '2023-08-03 13:05:04.557347');
INSERT INTO public.urls VALUES (34, 23, 'https://www.google.com', 'PpLNdpZE', 0, '2023-08-03 13:05:04.725336');
INSERT INTO public.urls VALUES (35, 23, 'https://www.google.com', '1k-kHCum', 0, '2023-08-03 13:05:04.901889');
INSERT INTO public.urls VALUES (36, 23, 'https://www.google.com', 'CJ9CUsyd', 0, '2023-08-03 13:05:05.069633');
INSERT INTO public.urls VALUES (37, 23, 'https://www.google.com', 'Gr9B2vf2', 0, '2023-08-03 13:05:05.237567');
INSERT INTO public.urls VALUES (38, 23, 'https://www.google.com', 'b_tac-Zy', 0, '2023-08-03 13:05:05.405465');
INSERT INTO public.urls VALUES (39, 23, 'https://www.google.com', '4B-YGSTx', 0, '2023-08-03 13:05:05.59808');
INSERT INTO public.urls VALUES (40, 23, 'https://www.google.com', '5uGZYHXq', 0, '2023-08-03 13:05:05.765613');
INSERT INTO public.urls VALUES (41, 23, 'https://www.google.com', 'SqfeyqAg', 0, '2023-08-03 13:05:05.910178');
INSERT INTO public.urls VALUES (42, 23, 'https://www.google.com', 'IgjsXTWu', 7, '2023-08-03 13:05:06.053606');
INSERT INTO public.urls VALUES (21, 23, 'https://www.google.com', 'fKmB2zG3', 2, '2023-08-03 13:05:02.391959');
INSERT INTO public.urls VALUES (43, 37, 'https://www.google.com', '9id7XQvZ', 0, '2023-08-03 13:19:28.617335');
INSERT INTO public.urls VALUES (44, 37, 'https://www.google.com', 'S71PBpKS', 0, '2023-08-03 13:19:29.792177');
INSERT INTO public.urls VALUES (45, 37, 'https://www.google.com', '-lth4YkB', 0, '2023-08-03 13:19:30.302515');
INSERT INTO public.urls VALUES (46, 37, 'https://www.google.com', 'PDmIZ6up', 0, '2023-08-03 13:19:30.70322');
INSERT INTO public.urls VALUES (47, 37, 'https://www.google.com', 'J9y36vsL', 0, '2023-08-03 13:19:31.069878');
INSERT INTO public.urls VALUES (48, 37, 'https://www.google.com', 'p5FMByI7', 0, '2023-08-03 13:19:31.454426');
INSERT INTO public.urls VALUES (49, 37, 'https://www.google.com', '-zHkAswo', 0, '2023-08-03 13:19:31.815055');
INSERT INTO public.urls VALUES (50, 25, 'https://www.google.com', 'ONy-N49y', 0, '2023-08-03 13:19:50.457415');
INSERT INTO public.urls VALUES (51, 25, 'https://www.google.com', 'S52TjVRv', 0, '2023-08-03 13:19:50.88829');
INSERT INTO public.urls VALUES (52, 25, 'https://www.google.com', 'oXC3dh3W', 0, '2023-08-03 13:19:51.23915');
INSERT INTO public.urls VALUES (53, 25, 'https://www.google.com', '4_qpcHFf', 3, '2023-08-03 13:19:51.598131');
INSERT INTO public.urls VALUES (54, 25, 'https://www.google.com', 'aAGuQUQ3', 1, '2023-08-03 13:20:03.597863');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven1.com.br', 'driven', '2023-08-02 15:27:10.391116');
INSERT INTO public.users VALUES (2, 'João', 'joao@driven2.com.br', 'driven', '2023-08-02 15:27:13.572369');
INSERT INTO public.users VALUES (3, 'João', 'joao@driven3.com.br', '$2b$10$ev5qt3FXErjx5anQ6nlYuuGDz8hBHMFRVxWVOxQVIDq.xpaR0KEPe', '2023-08-02 15:30:06.863632');
INSERT INTO public.users VALUES (7, 'João', 'joao@driven4.com.br', '$2b$10$6/UMWuNnAB40gORbA.E2/.OmqDObrUdRqBW5HWpBeeoJbftm/JcQO', '2023-08-02 15:46:06.560767');
INSERT INTO public.users VALUES (11, 'TESTE', 'joao@drivenA.com.br', '$2b$10$nakXrcldIaivNZtw19gEbuuHFsVTVoyGNyOpC1IibQ969NsjhHjoq', '2023-08-03 13:02:48.689443');
INSERT INTO public.users VALUES (12, 'TESTE', 'joao@drivenB.com.br', '$2b$10$bMd9XB1uarct20gHsE.eJecJsBZpwWloXamUklxtEjxda2PfmuTQm', '2023-08-03 13:02:51.995392');
INSERT INTO public.users VALUES (13, 'TESTE', 'joao@drivenC.com.br', '$2b$10$rn0Gxi16Ll1q/evXr6wg5.wKPgfTJunKFmLiN/qn9PCiKNfvUOpuC', '2023-08-03 13:02:54.706135');
INSERT INTO public.users VALUES (14, 'TESTE', 'joao@drivenD.com.br', '$2b$10$ypS8DIDSYwyVAq9JwUkKz.Er6Yzl9Z3jSnL7rrsx/ZBytA3K2DCEa', '2023-08-03 13:02:57.746116');
INSERT INTO public.users VALUES (15, 'TESTE6', 'joao@drivenGD.com.br', '$2b$10$J2s5i5gX38ckFu/ja9HUJuAcn0UcZREBMTIItSSQzceHG8SthrMKK', '2023-08-03 13:03:03.780903');
INSERT INTO public.users VALUES (16, 'TESTE654', 'joao@drivenGDD.com.br', '$2b$10$7rMUK/416hzTX95P3Omwg.lRHAQpE9UyaBGhfYXAHU4B5et/cJMuy', '2023-08-03 13:03:08.940789');
INSERT INTO public.users VALUES (17, 'TESTE654A', 'joao@drivenGDDA.com.br', '$2b$10$EBR/nTCl0p38Sw4Edg7pwOzl.eLB5rpx3ic/CF92JqhCKxef3Gy.2', '2023-08-03 13:03:11.589221');
INSERT INTO public.users VALUES (18, 'TESTE654SA', 'joao@drivenGDSDA.com.br', '$2b$10$INnH1zbriZOO8S56i3nObeSkO5S27XPIelMCBOqg35Foo5FNT85mq', '2023-08-03 13:03:14.628678');
INSERT INTO public.users VALUES (19, 'TESTE65A4SA', 'joao@drivenGDSADA.com.br', '$2b$10$6s8jStvpcFXIYEECw4ec9Ou8muQ9GvAlY3HpOYAZ7OOucJCjDoa.q', '2023-08-03 13:03:17.324239');
INSERT INTO public.users VALUES (20, 'TESTE65A4GSA', 'joao@drivenGDSADGA.com.br', '$2b$10$xlazQG/n7ivUOWLmzV1mK.Tv/9/W4BDWVYhbzJ8gtKqGgGLtpLkdu', '2023-08-03 13:03:19.596095');
INSERT INTO public.users VALUES (21, 'TESTE65A4AGSA', 'joao@drivenGDSADAGA.com.br', '$2b$10$mNd7Joh74jxdWcYDfSvTBeDecAHPxpQxOKzkaWlAzaoCl0Up2q1Nu', '2023-08-03 13:03:21.986194');
INSERT INTO public.users VALUES (22, 'TESTE65A4ADGSA', 'joao@drivenGDSAADAGA.com.br', '$2b$10$8nOeL0rfbqiY.W/OdE9hhegE3JBHzpO4Em/GrUdqOM2gM1vcWEvHC', '2023-08-03 13:03:24.0424');
INSERT INTO public.users VALUES (23, 'TESTE65A4ADDGSA', 'joao@drivenGDSAADAAGA.com.br', '$2b$10$E9/whRBAhKr3J/GxddurmOR55wZU3g5VnUpIvlW360ZbV16zZnKMS', '2023-08-03 13:03:26.122928');
INSERT INTO public.users VALUES (24, 'gabriel', 'gabriel@driven.com.br', '$2b$10$EA3erMjOZvwWgVeo4XIQ2.n28dF8Ou8HoWEoziu/5cWYKYyoXec1q', '2023-08-03 13:17:52.604589');
INSERT INTO public.users VALUES (25, 'daniel', 'daniel@driven.com.br', '$2b$10$6tXDZO3W5korYUS.89Rbfuk4TEmFiPJJlretld5BRE7eeSbeUEoeC', '2023-08-03 13:18:04.606407');
INSERT INTO public.users VALUES (26, 'jao1', 'jao1@driven.com.br', '$2b$10$9jQjEdDln/XWX23EcszxJusijTVJc/urbEe3v5mB2WIK/RbaCX21m', '2023-08-03 13:18:14.709588');
INSERT INTO public.users VALUES (27, 'jao2', 'jao2@driven.com.br', '$2b$10$f7823SpMcwzbJDyKCYJLUeMciSv5ysuLgpwTGXgLka56aGuYkWf.2', '2023-08-03 13:18:20.780472');
INSERT INTO public.users VALUES (28, 'jao3', 'jao3@driven.com.br', '$2b$10$YwPtzaClOOAp/BpGvimg2ew.9lbGvBX8ZlzgFK68wzkK2nF9pBtga', '2023-08-03 13:18:24.203873');
INSERT INTO public.users VALUES (29, 'jao4', 'jao4@driven.com.br', '$2b$10$vYLR2QFJlqSpv270qGLBu.y7MtpmW6uKNPvCtCvFWzzfrRul70/JO', '2023-08-03 13:18:27.724092');
INSERT INTO public.users VALUES (30, 'jao5', 'jao5@driven.com.br', '$2b$10$lZozeqIc1ctaqROzFEBsee5tdH/ahQP.2GjW9soh4wh7jflfYdtaW', '2023-08-03 13:18:31.299757');
INSERT INTO public.users VALUES (31, 'jao6', 'jao6@driven.com.br', '$2b$10$xNgGxgXzwonI9Xu4TXXSbuieL3Wy83tnWlP6ymoWvRPJb9Mnt.VsK', '2023-08-03 13:18:35.444107');
INSERT INTO public.users VALUES (32, 'jao7', 'jao7@driven.com.br', '$2b$10$uRGrXKh5K8cZ7LKutVGZFezO1O/uwsbzy4e0Q0fmcKdZBw/2sx2W6', '2023-08-03 13:18:39.492466');
INSERT INTO public.users VALUES (33, 'jao8', 'jao8@driven.com.br', '$2b$10$I3CnWMFFiuWhv0P3KrrRU.3BzweGBjbcvkq64RT0e4kKGt2fZdZAy', '2023-08-03 13:18:43.587807');
INSERT INTO public.users VALUES (34, 'jao9', 'jao9@driven.com.br', '$2b$10$APaIW0cKV0W6LETVYtj5duCQshYQNjCcPkaTrVRl2mr4NbeOf.1k2', '2023-08-03 13:18:47.972248');
INSERT INTO public.users VALUES (36, 'jao10', 'jao10@driven.com.br', '$2b$10$UGIMvqbrh0CUfgBOrIKNrecIFNVvC5I/dKQnxPuQOApekmlLoQg8.', '2023-08-03 13:18:56.45402');
INSERT INTO public.users VALUES (37, 'jao11', 'jao11@driven.com.br', '$2b$10$JHjbcHLt6WQgx1BaK9tyPuPRBaUQ0bLMBHonQDO1PhA2nMkFLG9g6', '2023-08-03 13:19:02.365298');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 5, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 54, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 37, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

