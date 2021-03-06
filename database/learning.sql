PGDMP                 
        x           learning    12.2    12.2 '    u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            x           1262    16766    learning    DATABASE     f   CREATE DATABASE learning WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE learning;
                postgres    false            �            1259    16769    account    TABLE     #  CREATE TABLE public.account (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(250) NOT NULL,
    create_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    16792    account_job    TABLE     x   CREATE TABLE public.account_job (
    user_id integer,
    job_id integer,
    hire_date timestamp without time zone
);
    DROP TABLE public.account_job;
       public         heap    postgres    false            �            1259    16767    account_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.account_user_id_seq;
       public          postgres    false    203            y           0    0    account_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.account_user_id_seq OWNED BY public.account.user_id;
          public          postgres    false    202            �            1259    16827 	   employees    TABLE     �  CREATE TABLE public.employees (
    emp_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birthdate date,
    hire_date date,
    salary integer,
    CONSTRAINT employees_birthdate_check CHECK ((birthdate > '1900-01-01'::date)),
    CONSTRAINT employees_check CHECK ((hire_date > birthdate)),
    CONSTRAINT employees_salary_check CHECK ((salary > 0))
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16825    employees_emp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.employees_emp_id_seq;
       public          postgres    false    210            z           0    0    employees_emp_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.employees_emp_id_seq OWNED BY public.employees.emp_id;
          public          postgres    false    209            �            1259    16807    new_info    TABLE     j   CREATE TABLE public.new_info (
    info_id integer NOT NULL,
    title character varying(500) NOT NULL
);
    DROP TABLE public.new_info;
       public         heap    postgres    false            �            1259    16805    information_info_id_seq    SEQUENCE     �   CREATE SEQUENCE public.information_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.information_info_id_seq;
       public          postgres    false    208            {           0    0    information_info_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.information_info_id_seq OWNED BY public.new_info.info_id;
          public          postgres    false    207            �            1259    16781    job    TABLE     g   CREATE TABLE public.job (
    job_id integer NOT NULL,
    job_name character varying(200) NOT NULL
);
    DROP TABLE public.job;
       public         heap    postgres    false            �            1259    16779    job_job_id_seq    SEQUENCE     �   CREATE SEQUENCE public.job_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.job_job_id_seq;
       public          postgres    false    205            |           0    0    job_job_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.job_job_id_seq OWNED BY public.job.job_id;
          public          postgres    false    204            �           2604    16772    account user_id    DEFAULT     r   ALTER TABLE ONLY public.account ALTER COLUMN user_id SET DEFAULT nextval('public.account_user_id_seq'::regclass);
 >   ALTER TABLE public.account ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    16830    employees emp_id    DEFAULT     t   ALTER TABLE ONLY public.employees ALTER COLUMN emp_id SET DEFAULT nextval('public.employees_emp_id_seq'::regclass);
 ?   ALTER TABLE public.employees ALTER COLUMN emp_id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    16784 
   job job_id    DEFAULT     h   ALTER TABLE ONLY public.job ALTER COLUMN job_id SET DEFAULT nextval('public.job_job_id_seq'::regclass);
 9   ALTER TABLE public.job ALTER COLUMN job_id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    16810    new_info info_id    DEFAULT     w   ALTER TABLE ONLY public.new_info ALTER COLUMN info_id SET DEFAULT nextval('public.information_info_id_seq'::regclass);
 ?   ALTER TABLE public.new_info ALTER COLUMN info_id DROP DEFAULT;
       public          postgres    false    208    207    208            k          0    16769    account 
   TABLE DATA           \   COPY public.account (user_id, username, password, email, create_on, last_login) FROM stdin;
    public          postgres    false    203   i+       n          0    16792    account_job 
   TABLE DATA           A   COPY public.account_job (user_id, job_id, hire_date) FROM stdin;
    public          postgres    false    206   �+       r          0    16827 	   employees 
   TABLE DATA           `   COPY public.employees (emp_id, first_name, last_name, birthdate, hire_date, salary) FROM stdin;
    public          postgres    false    210   	,       m          0    16781    job 
   TABLE DATA           /   COPY public.job (job_id, job_name) FROM stdin;
    public          postgres    false    205   ^,       p          0    16807    new_info 
   TABLE DATA           2   COPY public.new_info (info_id, title) FROM stdin;
    public          postgres    false    208   �,       }           0    0    account_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.account_user_id_seq', 1, true);
          public          postgres    false    202            ~           0    0    employees_emp_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.employees_emp_id_seq', 4, true);
          public          postgres    false    209                       0    0    information_info_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.information_info_id_seq', 1, true);
          public          postgres    false    207            �           0    0    job_job_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.job_job_id_seq', 3, true);
          public          postgres    false    204            �           2606    16778    account account_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.account DROP CONSTRAINT account_email_key;
       public            postgres    false    203            �           2606    16774    account account_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    203            �           2606    16776    account account_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_username_key UNIQUE (username);
 F   ALTER TABLE ONLY public.account DROP CONSTRAINT account_username_key;
       public            postgres    false    203            �           2606    16835    employees employees_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    210            �           2606    16815    new_info information_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.new_info
    ADD CONSTRAINT information_pkey PRIMARY KEY (info_id);
 C   ALTER TABLE ONLY public.new_info DROP CONSTRAINT information_pkey;
       public            postgres    false    208            �           2606    16788    job job_job_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_job_name_key UNIQUE (job_name);
 >   ALTER TABLE ONLY public.job DROP CONSTRAINT job_job_name_key;
       public            postgres    false    205            �           2606    16786    job job_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (job_id);
 6   ALTER TABLE ONLY public.job DROP CONSTRAINT job_pkey;
       public            postgres    false    205            �           2606    16800 #   account_job account_job_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_job
    ADD CONSTRAINT account_job_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job(job_id);
 M   ALTER TABLE ONLY public.account_job DROP CONSTRAINT account_job_job_id_fkey;
       public          postgres    false    206    3045    205            �           2606    16795 $   account_job account_job_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_job
    ADD CONSTRAINT account_job_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.account(user_id);
 N   ALTER TABLE ONLY public.account_job DROP CONSTRAINT account_job_user_id_fkey;
       public          postgres    false    206    203    3039            k   T   x�3���/N�,H,..�/J���r3s���s9��tLu��L�����L�Q�L�����-,�̹b���� PU5      n   ,   x�3�4�4202�50�54P04�25�24�377401����� tp8      r   E   x�3���/N��/*���I�4�40�54�50�4204�5 29�L8�ss+9�s3K2����� ��      m   %   x�3�t,.)��K,-�2�(J-�LI�+����� ���      p      x�3�,��MU�K-W(�,�I����� PmM     