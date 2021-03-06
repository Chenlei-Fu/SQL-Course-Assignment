PGDMP     3            
        x           School    12.2    12.2     V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Y           1262    16836    School    DATABASE     f   CREATE DATABASE "School" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE "School";
                postgres    false            �            1259    16839    student    TABLE       CREATE TABLE public.student (
    student_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    homeroom_number integer,
    phone character varying(20),
    email character varying(115),
    grad_year integer
);
    DROP TABLE public.student;
       public         heap    postgres    false            �            1259    16837    students_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.students_student_id_seq;
       public          postgres    false    203            Z           0    0    students_student_id_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.students_student_id_seq OWNED BY public.student.student_id;
          public          postgres    false    202            �            1259    16853    teacher    TABLE     $  CREATE TABLE public.teacher (
    teacher_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    homeroom_number integer,
    department character varying(45),
    email character varying(250),
    phone character varying(20)
);
    DROP TABLE public.teacher;
       public         heap    postgres    false            �            1259    16851    teacher_teacher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.teacher_teacher_id_seq;
       public          postgres    false    205            [           0    0    teacher_teacher_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.teacher_teacher_id_seq OWNED BY public.teacher.teacher_id;
          public          postgres    false    204            �           2604    16842    student student_id    DEFAULT     y   ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);
 A   ALTER TABLE public.student ALTER COLUMN student_id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    16856    teacher teacher_id    DEFAULT     x   ALTER TABLE ONLY public.teacher ALTER COLUMN teacher_id SET DEFAULT nextval('public.teacher_teacher_id_seq'::regclass);
 A   ALTER TABLE public.teacher ALTER COLUMN teacher_id DROP DEFAULT;
       public          postgres    false    205    204    205            Q          0    16839    student 
   TABLE DATA           n   COPY public.student (student_id, first_name, last_name, homeroom_number, phone, email, grad_year) FROM stdin;
    public          postgres    false    203   �       S          0    16853    teacher 
   TABLE DATA           o   COPY public.teacher (teacher_id, first_name, last_name, homeroom_number, department, email, phone) FROM stdin;
    public          postgres    false    205   )       \           0    0    students_student_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.students_student_id_seq', 1, true);
          public          postgres    false    202            ]           0    0    teacher_teacher_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.teacher_teacher_id_seq', 1, true);
          public          postgres    false    204            �           2606    16848    student students_email_key 
   CONSTRAINT     V   ALTER TABLE ONLY public.student
    ADD CONSTRAINT students_email_key UNIQUE (email);
 D   ALTER TABLE ONLY public.student DROP CONSTRAINT students_email_key;
       public            postgres    false    203            �           2606    16846    student students_phone_key 
   CONSTRAINT     V   ALTER TABLE ONLY public.student
    ADD CONSTRAINT students_phone_key UNIQUE (phone);
 D   ALTER TABLE ONLY public.student DROP CONSTRAINT students_phone_key;
       public            postgres    false    203            �           2606    16844    student students_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.student
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);
 ?   ALTER TABLE ONLY public.student DROP CONSTRAINT students_pkey;
       public            postgres    false    203            �           2606    16864    teacher teacher_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_email_key;
       public            postgres    false    205            �           2606    16862    teacher teacher_phone_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_phone_key UNIQUE (phone);
 C   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_phone_key;
       public            postgres    false    205            �           2606    16858    teacher teacher_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacher_id);
 >   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_pkey;
       public            postgres    false    205            Q   2   x�3��M,��O,�K��4�477�555�5426���4206����� �-	.      S   @   x�3����K,�N���4�t����O���*���3��s���9���uMMMuM���b���� Ue     