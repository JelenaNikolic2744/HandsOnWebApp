PGDMP                      |           job    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16578    job    DATABASE     ~   CREATE DATABASE job WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE job;
                postgres    false            �            1259    16596 
   appliances    TABLE     �   CREATE TABLE public.appliances (
    appliace_id integer NOT NULL,
    job_id integer NOT NULL,
    user_name character varying(20) NOT NULL,
    user_email character varying(20) NOT NULL,
    appliance_text character varying(20) NOT NULL
);
    DROP TABLE public.appliances;
       public         heap    postgres    false            �            1259    16595    appliances_appliace_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appliances_appliace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.appliances_appliace_id_seq;
       public          postgres    false    220                       0    0    appliances_appliace_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.appliances_appliace_id_seq OWNED BY public.appliances.appliace_id;
          public          postgres    false    219            �            1259    16580    company    TABLE     r   CREATE TABLE public.company (
    company_id integer NOT NULL,
    company_name character varying(20) NOT NULL
);
    DROP TABLE public.company;
       public         heap    postgres    false            �            1259    16579    company_company_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.company_company_id_seq;
       public          postgres    false    216                       0    0    company_company_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.company_company_id_seq OWNED BY public.company.company_id;
          public          postgres    false    215            �            1259    16589    job    TABLE     �   CREATE TABLE public.job (
    job_id integer NOT NULL,
    job_name character varying(20) NOT NULL,
    job_description character varying(20) NOT NULL,
    company_id integer NOT NULL
);
    DROP TABLE public.job;
       public         heap    postgres    false            �            1259    16588    job_job_id_seq    SEQUENCE     �   CREATE SEQUENCE public.job_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.job_job_id_seq;
       public          postgres    false    218                       0    0    job_job_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.job_job_id_seq OWNED BY public.job.job_id;
          public          postgres    false    217            \           2604    16599    appliances appliace_id    DEFAULT     �   ALTER TABLE ONLY public.appliances ALTER COLUMN appliace_id SET DEFAULT nextval('public.appliances_appliace_id_seq'::regclass);
 E   ALTER TABLE public.appliances ALTER COLUMN appliace_id DROP DEFAULT;
       public          postgres    false    219    220    220            Z           2604    16583    company company_id    DEFAULT     x   ALTER TABLE ONLY public.company ALTER COLUMN company_id SET DEFAULT nextval('public.company_company_id_seq'::regclass);
 A   ALTER TABLE public.company ALTER COLUMN company_id DROP DEFAULT;
       public          postgres    false    216    215    216            [           2604    16592 
   job job_id    DEFAULT     h   ALTER TABLE ONLY public.job ALTER COLUMN job_id SET DEFAULT nextval('public.job_job_id_seq'::regclass);
 9   ALTER TABLE public.job ALTER COLUMN job_id DROP DEFAULT;
       public          postgres    false    218    217    218            �          0    16596 
   appliances 
   TABLE DATA           `   COPY public.appliances (appliace_id, job_id, user_name, user_email, appliance_text) FROM stdin;
    public          postgres    false    220           �          0    16580    company 
   TABLE DATA           ;   COPY public.company (company_id, company_name) FROM stdin;
    public          postgres    false    216   j        �          0    16589    job 
   TABLE DATA           L   COPY public.job (job_id, job_name, job_description, company_id) FROM stdin;
    public          postgres    false    218   �                   0    0    appliances_appliace_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.appliances_appliace_id_seq', 2, true);
          public          postgres    false    219                       0    0    company_company_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.company_company_id_seq', 3, true);
          public          postgres    false    215                       0    0    job_job_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.job_job_id_seq', 4, true);
          public          postgres    false    217            b           2606    16594 "   job PK_25526336589e1d6f5b5d9c5b74b 
   CONSTRAINT     f   ALTER TABLE ONLY public.job
    ADD CONSTRAINT "PK_25526336589e1d6f5b5d9c5b74b" PRIMARY KEY (job_id);
 N   ALTER TABLE ONLY public.job DROP CONSTRAINT "PK_25526336589e1d6f5b5d9c5b74b";
       public            postgres    false    218            d           2606    16601 )   appliances PK_94f6bc9bcb797860703d7c827a6 
   CONSTRAINT     r   ALTER TABLE ONLY public.appliances
    ADD CONSTRAINT "PK_94f6bc9bcb797860703d7c827a6" PRIMARY KEY (appliace_id);
 U   ALTER TABLE ONLY public.appliances DROP CONSTRAINT "PK_94f6bc9bcb797860703d7c827a6";
       public            postgres    false    220            ^           2606    16585 &   company PK_b7f9888ba8bd654c4860ddfcb3a 
   CONSTRAINT     n   ALTER TABLE ONLY public.company
    ADD CONSTRAINT "PK_b7f9888ba8bd654c4860ddfcb3a" PRIMARY KEY (company_id);
 R   ALTER TABLE ONLY public.company DROP CONSTRAINT "PK_b7f9888ba8bd654c4860ddfcb3a";
       public            postgres    false    216            `           2606    16587 &   company UQ_831e30688ec18c3fe41894e6b0a 
   CONSTRAINT     k   ALTER TABLE ONLY public.company
    ADD CONSTRAINT "UQ_831e30688ec18c3fe41894e6b0a" UNIQUE (company_name);
 R   ALTER TABLE ONLY public.company DROP CONSTRAINT "UQ_831e30688ec18c3fe41894e6b0a";
       public            postgres    false    216            f           2606    16607 )   appliances FK_083077067dd54266cb170e4649f    FK CONSTRAINT     �   ALTER TABLE ONLY public.appliances
    ADD CONSTRAINT "FK_083077067dd54266cb170e4649f" FOREIGN KEY (job_id) REFERENCES public.job(job_id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.appliances DROP CONSTRAINT "FK_083077067dd54266cb170e4649f";
       public          postgres    false    4706    220    218            e           2606    16602 "   job FK_51cb12c924d3e8c7465cc8edff2    FK CONSTRAINT     �   ALTER TABLE ONLY public.job
    ADD CONSTRAINT "FK_51cb12c924d3e8c7465cc8edff2" FOREIGN KEY (company_id) REFERENCES public.company(company_id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.job DROP CONSTRAINT "FK_51cb12c924d3e8c7465cc8edff2";
       public          postgres    false    218    4702    216            �   L   x�3�4��JMN44��鹉�9z�����
��
Y�9�y�
y���9��\F`�9��`IqIjq��(.����� �U@      �   $   x�3�L.163�2�NM,+-�2��s����� a�B      �   3   x�3�LI-�/(��/(���S0�4�2��(B�����L8|c�=... ��     