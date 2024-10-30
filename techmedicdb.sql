PGDMP  '    :            	    |        	   techmedic    16.2    16.2 m    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32949 	   techmedic    DATABASE     �   CREATE DATABASE techmedic WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Dominican Republic.1252';
    DROP DATABASE techmedic;
                postgres    false            �            1259    32961    accesos    TABLE     �   CREATE TABLE public.accesos (
    id_acessos integer NOT NULL,
    modulo character varying(50),
    estado boolean DEFAULT true
);
    DROP TABLE public.accesos;
       public         heap    postgres    false            �            1259    33044    accesos_usuario    TABLE     �   CREATE TABLE public.accesos_usuario (
    id_acc_usuario integer NOT NULL,
    id_accesos integer NOT NULL,
    id_usuario integer NOT NULL,
    id_centro_medico integer NOT NULL,
    estado boolean DEFAULT true
);
 #   DROP TABLE public.accesos_usuario;
       public         heap    postgres    false            �            1259    41997    asistente_doctor    TABLE     �   CREATE TABLE public.asistente_doctor (
    id_us_doc integer NOT NULL,
    id_usuario integer NOT NULL,
    id_doctor integer NOT NULL,
    estado boolean DEFAULT true
);
 $   DROP TABLE public.asistente_doctor;
       public         heap    postgres    false            �            1259    42013    asistente_doctor_id_us_doc_seq    SEQUENCE     �   ALTER TABLE public.asistente_doctor ALTER COLUMN id_us_doc ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asistente_doctor_id_us_doc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    245            �            1259    32950    centro_medico    TABLE     �   CREATE TABLE public.centro_medico (
    id_centro_medico integer NOT NULL,
    centro_medico character varying(50) NOT NULL,
    observacion character varying(100),
    estado boolean DEFAULT true NOT NULL
);
 !   DROP TABLE public.centro_medico;
       public         heap    postgres    false            �            1259    33780 "   centro_medico_id_centro_medico_seq    SEQUENCE     �   ALTER TABLE public.centro_medico ALTER COLUMN id_centro_medico ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.centro_medico_id_centro_medico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    215            �            1259    33143    cita    TABLE     =  CREATE TABLE public.cita (
    id_cita integer NOT NULL,
    id_paciente integer NOT NULL,
    id_doctor integer NOT NULL,
    id_centro_medico integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_hora timestamp with time zone,
    estado boolean,
    color character varying,
    id_tipo_consulta integer
);
    DROP TABLE public.cita;
       public         heap    postgres    false            �            1259    33781    cita_id_cita_seq    SEQUENCE     �   ALTER TABLE public.cita ALTER COLUMN id_cita ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cita_id_cita_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    226            �            1259    33202    consulta    TABLE     �  CREATE TABLE public.consulta (
    id_consulta integer NOT NULL,
    motivo character varying,
    descripcion character varying,
    fecha_hora timestamp with time zone,
    estado boolean,
    id_cita integer,
    notas_internas character varying(255),
    notas_externas character varying(255),
    pruebas character varying(255),
    resultados_pruebas character varying(255),
    id_especialidad integer
);
    DROP TABLE public.consulta;
       public         heap    postgres    false            �            1259    33782    consulta_id_consulta_seq    SEQUENCE     �   ALTER TABLE public.consulta ALTER COLUMN id_consulta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.consulta_id_consulta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    228            �            1259    33229    diagnostico    TABLE        CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    id_consulta integer NOT NULL,
    descripcion character varying,
    pruebas character varying,
    observacion character varying,
    fecha_diagnostico date,
    estado boolean
);
    DROP TABLE public.diagnostico;
       public         heap    postgres    false            �            1259    33783    diagnostico_id_diagnostico_seq    SEQUENCE     �   ALTER TABLE public.diagnostico ALTER COLUMN id_diagnostico ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.diagnostico_id_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    229            �            1259    33067    doctor    TABLE     �   CREATE TABLE public.doctor (
    id_doctor integer NOT NULL,
    id_centro_medico integer NOT NULL,
    id_usuario integer NOT NULL,
    exequatur numeric,
    observacion character varying,
    estado boolean DEFAULT true
);
    DROP TABLE public.doctor;
       public         heap    postgres    false            �            1259    33090    doctor_especialidad    TABLE     �   CREATE TABLE public.doctor_especialidad (
    id_us_esp integer NOT NULL,
    id_doctor integer NOT NULL,
    id_especialidad integer NOT NULL,
    estado boolean DEFAULT true
);
 '   DROP TABLE public.doctor_especialidad;
       public         heap    postgres    false            �            1259    33785 !   doctor_especialidad_id_us_esp_seq    SEQUENCE     �   ALTER TABLE public.doctor_especialidad ALTER COLUMN id_us_esp ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.doctor_especialidad_id_us_esp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    224            �            1259    33784    doctor_id_doctor_seq    SEQUENCE     �   ALTER TABLE public.doctor ALTER COLUMN id_doctor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.doctor_id_doctor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    223            �            1259    32983    especialidad    TABLE     �   CREATE TABLE public.especialidad (
    id_especialidad integer NOT NULL,
    especialidad character varying,
    descripcion character varying,
    estado boolean DEFAULT true
);
     DROP TABLE public.especialidad;
       public         heap    postgres    false            �            1259    33786     especialidad_id_especialidad_seq    SEQUENCE     �   ALTER TABLE public.especialidad ALTER COLUMN id_especialidad ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.especialidad_id_especialidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    220            �            1259    33170    notificaciones    TABLE     &  CREATE TABLE public.notificaciones (
    id_notificaciones integer NOT NULL,
    id_paciente integer NOT NULL,
    id_cita integer NOT NULL,
    id_usuario integer NOT NULL,
    correo character varying,
    fecha_envio date,
    contenido character varying,
    estado boolean DEFAULT true
);
 "   DROP TABLE public.notificaciones;
       public         heap    postgres    false            �            1259    33787 $   notificaciones_id_notificaciones_seq    SEQUENCE     �   ALTER TABLE public.notificaciones ALTER COLUMN id_notificaciones ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.notificaciones_id_notificaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    227            �            1259    32967    paciente    TABLE     �  CREATE TABLE public.paciente (
    id_paciente integer NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    cedula character varying(20),
    fecha_nacimiento date,
    correo character varying(30),
    sexo character varying(15),
    telefono numeric(15,0),
    nacionalidad character varying(30),
    ciudad character varying(30),
    direccion character varying(100),
    menor boolean,
    observacion character varying(100),
    nombre_familiar character varying(50),
    cedula_familiar character varying(20),
    correo_familiar character varying(30),
    telefono_familiar character varying(15),
    celular_familiar character varying(15),
    estado boolean DEFAULT true,
    celular character varying,
    peso character varying,
    altura character varying,
    alergia character varying,
    enfermedad character varying,
    sustancia character varying
);
    DROP TABLE public.paciente;
       public         heap    postgres    false            �            1259    33789    paciente_id_paciente_seq    SEQUENCE     �   ALTER TABLE public.paciente ALTER COLUMN id_paciente ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.paciente_id_paciente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    218            �            1259    33241    receta    TABLE     
  CREATE TABLE public.receta (
    id_receta integer NOT NULL,
    id_diagnostico integer NOT NULL,
    medicamentos character varying,
    cantidad character varying,
    dosis character varying,
    dias character varying,
    fecha_receta date,
    imagen bytea
);
    DROP TABLE public.receta;
       public         heap    postgres    false            �            1259    33790    receta_id_receta_seq    SEQUENCE     �   ALTER TABLE public.receta ALTER COLUMN id_receta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.receta_id_receta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    230            �            1259    32975    tipo_consulta    TABLE     �   CREATE TABLE public.tipo_consulta (
    id_tipo_consulta integer NOT NULL,
    consulta character varying,
    descripcion character varying,
    estado boolean DEFAULT true
);
 !   DROP TABLE public.tipo_consulta;
       public         heap    postgres    false            �            1259    33791 "   tipo_consulta_id_tipo_consulta_seq    SEQUENCE     �   ALTER TABLE public.tipo_consulta ALTER COLUMN id_tipo_consulta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_consulta_id_tipo_consulta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    219            �            1259    32956    tipo_usuario    TABLE     �   CREATE TABLE public.tipo_usuario (
    id_tipo_usuario integer NOT NULL,
    usuario character varying(50),
    estado boolean DEFAULT true
);
     DROP TABLE public.tipo_usuario;
       public         heap    postgres    false            �            1259    33792     tipo_usuario_id_tipo_usuario_seq    SEQUENCE     �   ALTER TABLE public.tipo_usuario ALTER COLUMN id_tipo_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_usuario_id_tipo_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    216            �            1259    33026    usuario    TABLE     �  CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    id_centro_medico integer NOT NULL,
    id_tipo_usuario integer NOT NULL,
    nombre character varying,
    apellido character varying,
    cedula character varying,
    fecha_nacimiento date,
    sexo character varying,
    correo character varying,
    password character varying,
    usuario character varying,
    estado boolean DEFAULT true,
    celular character varying,
    telefono character varying
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    33108    usuario_centro_medico    TABLE     �   CREATE TABLE public.usuario_centro_medico (
    id_us_cent integer NOT NULL,
    id_usuario integer NOT NULL,
    id_centro_medico integer NOT NULL,
    estado boolean DEFAULT true
);
 )   DROP TABLE public.usuario_centro_medico;
       public         heap    postgres    false            �            1259    33794 $   usuario_centro_medico_id_us_cent_seq    SEQUENCE     �   ALTER TABLE public.usuario_centro_medico ALTER COLUMN id_us_cent ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuario_centro_medico_id_us_cent_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    225            �            1259    33793    usuario_id_usuario_seq    SEQUENCE     �   ALTER TABLE public.usuario ALTER COLUMN id_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    221            v          0    32961    accesos 
   TABLE DATA           =   COPY public.accesos (id_acessos, modulo, estado) FROM stdin;
    public          postgres    false    217   l�       {          0    33044    accesos_usuario 
   TABLE DATA           k   COPY public.accesos_usuario (id_acc_usuario, id_accesos, id_usuario, id_centro_medico, estado) FROM stdin;
    public          postgres    false    222   ��       �          0    41997    asistente_doctor 
   TABLE DATA           T   COPY public.asistente_doctor (id_us_doc, id_usuario, id_doctor, estado) FROM stdin;
    public          postgres    false    245   ��       t          0    32950    centro_medico 
   TABLE DATA           ]   COPY public.centro_medico (id_centro_medico, centro_medico, observacion, estado) FROM stdin;
    public          postgres    false    215   �                 0    33143    cita 
   TABLE DATA           �   COPY public.cita (id_cita, id_paciente, id_doctor, id_centro_medico, id_usuario, fecha_hora, estado, color, id_tipo_consulta) FROM stdin;
    public          postgres    false    226   ��       �          0    33202    consulta 
   TABLE DATA           �   COPY public.consulta (id_consulta, motivo, descripcion, fecha_hora, estado, id_cita, notas_internas, notas_externas, pruebas, resultados_pruebas, id_especialidad) FROM stdin;
    public          postgres    false    228   <�       �          0    33229    diagnostico 
   TABLE DATA           �   COPY public.diagnostico (id_diagnostico, id_consulta, descripcion, pruebas, observacion, fecha_diagnostico, estado) FROM stdin;
    public          postgres    false    229   #�       |          0    33067    doctor 
   TABLE DATA           i   COPY public.doctor (id_doctor, id_centro_medico, id_usuario, exequatur, observacion, estado) FROM stdin;
    public          postgres    false    223   @�       }          0    33090    doctor_especialidad 
   TABLE DATA           \   COPY public.doctor_especialidad (id_us_esp, id_doctor, id_especialidad, estado) FROM stdin;
    public          postgres    false    224   E�       y          0    32983    especialidad 
   TABLE DATA           Z   COPY public.especialidad (id_especialidad, especialidad, descripcion, estado) FROM stdin;
    public          postgres    false    220   �       �          0    33170    notificaciones 
   TABLE DATA           �   COPY public.notificaciones (id_notificaciones, id_paciente, id_cita, id_usuario, correo, fecha_envio, contenido, estado) FROM stdin;
    public          postgres    false    227   �       w          0    32967    paciente 
   TABLE DATA           ?  COPY public.paciente (id_paciente, nombre, apellido, cedula, fecha_nacimiento, correo, sexo, telefono, nacionalidad, ciudad, direccion, menor, observacion, nombre_familiar, cedula_familiar, correo_familiar, telefono_familiar, celular_familiar, estado, celular, peso, altura, alergia, enfermedad, sustancia) FROM stdin;
    public          postgres    false    218   !�       �          0    33241    receta 
   TABLE DATA           v   COPY public.receta (id_receta, id_diagnostico, medicamentos, cantidad, dosis, dias, fecha_receta, imagen) FROM stdin;
    public          postgres    false    230   ��       x          0    32975    tipo_consulta 
   TABLE DATA           X   COPY public.tipo_consulta (id_tipo_consulta, consulta, descripcion, estado) FROM stdin;
    public          postgres    false    219   ��       u          0    32956    tipo_usuario 
   TABLE DATA           H   COPY public.tipo_usuario (id_tipo_usuario, usuario, estado) FROM stdin;
    public          postgres    false    216   �       z          0    33026    usuario 
   TABLE DATA           �   COPY public.usuario (id_usuario, id_centro_medico, id_tipo_usuario, nombre, apellido, cedula, fecha_nacimiento, sexo, correo, password, usuario, estado, celular, telefono) FROM stdin;
    public          postgres    false    221   _�       ~          0    33108    usuario_centro_medico 
   TABLE DATA           a   COPY public.usuario_centro_medico (id_us_cent, id_usuario, id_centro_medico, estado) FROM stdin;
    public          postgres    false    225   ��       �           0    0    asistente_doctor_id_us_doc_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.asistente_doctor_id_us_doc_seq', 34, true);
          public          postgres    false    246            �           0    0 "   centro_medico_id_centro_medico_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.centro_medico_id_centro_medico_seq', 2, true);
          public          postgres    false    231            �           0    0    cita_id_cita_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cita_id_cita_seq', 57, true);
          public          postgres    false    232            �           0    0    consulta_id_consulta_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.consulta_id_consulta_seq', 14, true);
          public          postgres    false    233            �           0    0    diagnostico_id_diagnostico_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.diagnostico_id_diagnostico_seq', 1, false);
          public          postgres    false    234            �           0    0 !   doctor_especialidad_id_us_esp_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.doctor_especialidad_id_us_esp_seq', 197, true);
          public          postgres    false    236            �           0    0    doctor_id_doctor_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.doctor_id_doctor_seq', 41, true);
          public          postgres    false    235            �           0    0     especialidad_id_especialidad_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.especialidad_id_especialidad_seq', 15, true);
          public          postgres    false    237            �           0    0 $   notificaciones_id_notificaciones_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.notificaciones_id_notificaciones_seq', 1, false);
          public          postgres    false    238            �           0    0    paciente_id_paciente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.paciente_id_paciente_seq', 11, true);
          public          postgres    false    239            �           0    0    receta_id_receta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.receta_id_receta_seq', 1, false);
          public          postgres    false    240            �           0    0 "   tipo_consulta_id_tipo_consulta_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tipo_consulta_id_tipo_consulta_seq', 3, true);
          public          postgres    false    241            �           0    0     tipo_usuario_id_tipo_usuario_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tipo_usuario_id_tipo_usuario_seq', 3, true);
          public          postgres    false    242            �           0    0 $   usuario_centro_medico_id_us_cent_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.usuario_centro_medico_id_us_cent_seq', 1, false);
          public          postgres    false    244            �           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 61, true);
          public          postgres    false    243            �           2606    33295    accesos accesos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_pkey PRIMARY KEY (id_acessos);
 >   ALTER TABLE ONLY public.accesos DROP CONSTRAINT accesos_pkey;
       public            postgres    false    217            �           2606    33289 $   accesos_usuario accesos_usuario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.accesos_usuario
    ADD CONSTRAINT accesos_usuario_pkey PRIMARY KEY (id_acc_usuario);
 N   ALTER TABLE ONLY public.accesos_usuario DROP CONSTRAINT accesos_usuario_pkey;
       public            postgres    false    222            �           2606    42002 &   asistente_doctor asistente_doctor_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.asistente_doctor
    ADD CONSTRAINT asistente_doctor_pkey PRIMARY KEY (id_us_doc);
 P   ALTER TABLE ONLY public.asistente_doctor DROP CONSTRAINT asistente_doctor_pkey;
       public            postgres    false    245            �           2606    33750     centro_medico centro_medico_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.centro_medico
    ADD CONSTRAINT centro_medico_pkey PRIMARY KEY (id_centro_medico);
 J   ALTER TABLE ONLY public.centro_medico DROP CONSTRAINT centro_medico_pkey;
       public            postgres    false    215            �           2606    33739    cita cita_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_pkey PRIMARY KEY (id_cita);
 8   ALTER TABLE ONLY public.cita DROP CONSTRAINT cita_pkey;
       public            postgres    false    226            �           2606    33412    consulta consulta_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_pkey PRIMARY KEY (id_consulta);
 @   ALTER TABLE ONLY public.consulta DROP CONSTRAINT consulta_pkey;
       public            postgres    false    228            �           2606    33726    diagnostico diagnostico_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);
 F   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_pkey;
       public            postgres    false    229            �           2606    33480 ,   doctor_especialidad doctor_especialidad_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.doctor_especialidad
    ADD CONSTRAINT doctor_especialidad_pkey PRIMARY KEY (id_us_esp);
 V   ALTER TABLE ONLY public.doctor_especialidad DROP CONSTRAINT doctor_especialidad_pkey;
       public            postgres    false    224            �           2606    33703    doctor doctor_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id_doctor);
 <   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_pkey;
       public            postgres    false    223            �           2606    33486    especialidad especialidad_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id_especialidad);
 H   ALTER TABLE ONLY public.especialidad DROP CONSTRAINT especialidad_pkey;
       public            postgres    false    220            �           2606    33505 "   notificaciones notificaciones_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificaciones);
 L   ALTER TABLE ONLY public.notificaciones DROP CONSTRAINT notificaciones_pkey;
       public            postgres    false    227            �           2606    33680    paciente paciente_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);
 @   ALTER TABLE ONLY public.paciente DROP CONSTRAINT paciente_pkey;
       public            postgres    false    218            �           2606    33557    receta receta_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.receta
    ADD CONSTRAINT receta_pkey PRIMARY KEY (id_receta);
 <   ALTER TABLE ONLY public.receta DROP CONSTRAINT receta_pkey;
       public            postgres    false    230            �           2606    33565     tipo_consulta tipo_consulta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.tipo_consulta
    ADD CONSTRAINT tipo_consulta_pkey PRIMARY KEY (id_tipo_consulta);
 J   ALTER TABLE ONLY public.tipo_consulta DROP CONSTRAINT tipo_consulta_pkey;
       public            postgres    false    219            �           2606    33669    tipo_usuario tipo_usuario_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id_tipo_usuario);
 H   ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_usuario_pkey;
       public            postgres    false    216            �           2606    33624 0   usuario_centro_medico usuario_centro_medico_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.usuario_centro_medico
    ADD CONSTRAINT usuario_centro_medico_pkey PRIMARY KEY (id_us_cent);
 Z   ALTER TABLE ONLY public.usuario_centro_medico DROP CONSTRAINT usuario_centro_medico_pkey;
       public            postgres    false    225            �           2606    33630    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    221            �           2606    50216    consulta consulta_id_cita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_id_cita_fkey FOREIGN KEY (id_cita) REFERENCES public.cita(id_cita);
 H   ALTER TABLE ONLY public.consulta DROP CONSTRAINT consulta_id_cita_fkey;
       public          postgres    false    226    4802    228            �           2606    50211    cita fk_tipo_consulta    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_tipo_consulta FOREIGN KEY (id_tipo_consulta) REFERENCES public.tipo_consulta(id_tipo_consulta);
 ?   ALTER TABLE ONLY public.cita DROP CONSTRAINT fk_tipo_consulta;
       public          postgres    false    226    219    4788            �           2606    33296    accesos_usuario id_accesos_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.accesos_usuario
    ADD CONSTRAINT id_accesos_pk FOREIGN KEY (id_accesos) REFERENCES public.accesos(id_acessos);
 G   ALTER TABLE ONLY public.accesos_usuario DROP CONSTRAINT id_accesos_pk;
       public          postgres    false    4784    217    222            �           2606    33771    doctor id_centro_medico    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT id_centro_medico FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 A   ALTER TABLE ONLY public.doctor DROP CONSTRAINT id_centro_medico;
       public          postgres    false    215    4780    223            �           2606    33751    usuario id_centro_medico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT id_centro_medico_pk FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT id_centro_medico_pk;
       public          postgres    false    215    4780    221            �           2606    33756 )   usuario_centro_medico id_centro_medico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_centro_medico
    ADD CONSTRAINT id_centro_medico_pk FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 S   ALTER TABLE ONLY public.usuario_centro_medico DROP CONSTRAINT id_centro_medico_pk;
       public          postgres    false    215    225    4780            �           2606    33761 #   accesos_usuario id_centro_medico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.accesos_usuario
    ADD CONSTRAINT id_centro_medico_pk FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 M   ALTER TABLE ONLY public.accesos_usuario DROP CONSTRAINT id_centro_medico_pk;
       public          postgres    false    215    222    4780            �           2606    33766    cita id_centro_medico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT id_centro_medico_pk FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 B   ALTER TABLE ONLY public.cita DROP CONSTRAINT id_centro_medico_pk;
       public          postgres    false    215    4780    226            �           2606    33740    notificaciones id_cita_pk    FK CONSTRAINT     |   ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT id_cita_pk FOREIGN KEY (id_cita) REFERENCES public.cita(id_cita);
 C   ALTER TABLE ONLY public.notificaciones DROP CONSTRAINT id_cita_pk;
       public          postgres    false    4802    227    226            �           2606    33413    diagnostico id_consulta_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT id_consulta_pk FOREIGN KEY (id_consulta) REFERENCES public.consulta(id_consulta);
 D   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT id_consulta_pk;
       public          postgres    false    4806    228    229            �           2606    33727    receta id_diagnostico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.receta
    ADD CONSTRAINT id_diagnostico_pk FOREIGN KEY (id_diagnostico) REFERENCES public.diagnostico(id_diagnostico);
 B   ALTER TABLE ONLY public.receta DROP CONSTRAINT id_diagnostico_pk;
       public          postgres    false    230    4808    229            �           2606    42008    asistente_doctor id_doctor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistente_doctor
    ADD CONSTRAINT id_doctor_fk FOREIGN KEY (id_doctor) REFERENCES public.doctor(id_doctor);
 G   ALTER TABLE ONLY public.asistente_doctor DROP CONSTRAINT id_doctor_fk;
       public          postgres    false    223    245    4796            �           2606    33704    cita id_doctor_pk    FK CONSTRAINT     z   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT id_doctor_pk FOREIGN KEY (id_doctor) REFERENCES public.doctor(id_doctor);
 ;   ALTER TABLE ONLY public.cita DROP CONSTRAINT id_doctor_pk;
       public          postgres    false    4796    226    223            �           2606    33714     doctor_especialidad id_doctor_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor_especialidad
    ADD CONSTRAINT id_doctor_pk FOREIGN KEY (id_doctor) REFERENCES public.doctor(id_doctor);
 J   ALTER TABLE ONLY public.doctor_especialidad DROP CONSTRAINT id_doctor_pk;
       public          postgres    false    4796    224    223            �           2606    33492 &   doctor_especialidad id_especialidad_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor_especialidad
    ADD CONSTRAINT id_especialidad_pk FOREIGN KEY (id_especialidad) REFERENCES public.especialidad(id_especialidad);
 P   ALTER TABLE ONLY public.doctor_especialidad DROP CONSTRAINT id_especialidad_pk;
       public          postgres    false    224    220    4790            �           2606    33681    cita id_paciente_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT id_paciente_pk FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);
 =   ALTER TABLE ONLY public.cita DROP CONSTRAINT id_paciente_pk;
       public          postgres    false    218    4786    226            �           2606    33691    notificaciones id_paciente_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT id_paciente_pk FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);
 G   ALTER TABLE ONLY public.notificaciones DROP CONSTRAINT id_paciente_pk;
       public          postgres    false    227    4786    218            �           2606    33670    usuario id_tipo_usuario_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT id_tipo_usuario_pk FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipo_usuario(id_tipo_usuario);
 D   ALTER TABLE ONLY public.usuario DROP CONSTRAINT id_tipo_usuario_pk;
       public          postgres    false    221    216    4782            �           2606    33651    doctor id_usuario    FK CONSTRAINT     }   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 ;   ALTER TABLE ONLY public.doctor DROP CONSTRAINT id_usuario;
       public          postgres    false    4792    223    221            �           2606    42003    asistente_doctor id_usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistente_doctor
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 H   ALTER TABLE ONLY public.asistente_doctor DROP CONSTRAINT id_usuario_fk;
       public          postgres    false    4792    221    245            �           2606    33631 #   usuario_centro_medico id_usuario_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_centro_medico
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 M   ALTER TABLE ONLY public.usuario_centro_medico DROP CONSTRAINT id_usuario_pk;
       public          postgres    false    225    4792    221            �           2606    33636    accesos_usuario id_usuario_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.accesos_usuario
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 G   ALTER TABLE ONLY public.accesos_usuario DROP CONSTRAINT id_usuario_pk;
       public          postgres    false    221    222    4792            �           2606    33641    cita id_usuario_pk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 <   ALTER TABLE ONLY public.cita DROP CONSTRAINT id_usuario_pk;
       public          postgres    false    226    221    4792            �           2606    33656    notificaciones id_usuario_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 F   ALTER TABLE ONLY public.notificaciones DROP CONSTRAINT id_usuario_pk;
       public          postgres    false    4792    221    227            v      x������ � �      {      x������ � �      �   `   x����0�o:�W�պ�c��	�{GSb]�Q�i��\�P��	>�_=��������u��d���f���V�+�QU����K���!�1��@;�      t   ^   x�3�t�9�6/39Q�)1�J!8�$_AM��� 5931'3%1%���/3/�4/���ˈ�95��(_���ʔ��|�0�@j^bQf�B��#��=... {N X         �  x���]n�0���S����4�!v^t��u� m�_RV��[���}�kǉgĠ���4�P�.0�؜��=~��$���?	A�T�1TN"׈�8#[�:)9�˘I�2��$E��!�Z&��$�L�q9�:ɉ������4$�Y�(H��ԧ�y�>u5J��R����M��PI�/��JT�G��Z�ՠ��@)�U�E��u�tT9��JmT��jX�
w������v8�ߣ㔮��3�[�η���m��l���p%�HX�%J#͝�:�	{��l�qU�IzȔ�O!���-��g!��)�h(��e��O�Q�y��ӣ�ɥL�"�f�g_�7�V���a헢�)j�����a!7�ۂ�.Z��*���O���;RZv��<隵��x��u����KY����"���^d���q���I6oUU�E���      �   �  x���=v�0�g�8@��Ӫթ_yׯ����<�'.)v�m:vȔ#�b%#�ud5i��� ��D\X���a��;��PK�[R��j��������Xµ�����޹>�b�a[���r�߫�[4%\��b�ZThB�DI���E��$*�L�0���(�Ȋg�&�@�?T�a0vOZ�y�f%���*6�R��p�-�i���q��v-�<H�ǩ�+hQ��t%y�"��"/�l�x��t�)�4��ɧ�����0%o�8���7��E;V�C5_�?Hf��T�X\H�\��Y�r�+#Y���]�N�!G/��h�P��DA�x�2��t ��<]�:��N/�L������ʢ���N��e��{�f���\��i>�+��S[�ƃ�l0��EK���W2�񮹄���[8��;?��;��E��$�jn]��?J��$��8�y2L�I��~���G�� ��}0      �      x������ � �      |   �   x�5Q˱�0;�bv����
����<)!3��I�[Tt�y����s����Ғ'�1�����6��Dm���7��R��A�*�$�������"�/?:�b���y�a��Wޒ��s�����U���$��J(�:W� �%7	�2�9�2Dy ���:Ɯ���ֲ��)Q��jHw�d��r�A�-�v�	8��Ⳉ�d׸9��f�^C⹒�J0�2���]�C�����exfL��u]���Y�      }   �   x�-��1C�r1�ŀ?����?�`O~��8�aV��^ɡ�(�wis�Wi��)DUq�r�"�MZ$�NU�u�`�mm�Nk���������*.<�����8��/9߫1�}����"���%�]���vob��6~�<�!4�'ESd�n���������U�vI<��^S������y@\      y   �  x��V�nG��_1p L=�[ ئ`�����沉y��q �7
(�1�s��ݑ{:J��vof����{�yw.�mtq�>��1�\�$�B�[6�֑L�Ƒ��jo�)���l����畑`]���G�ΰ_S�۸җ�R���^hӧ\��?%Q!/�@��<��sƻ3Y@��C��%{�iWN^t�R�e�C�:��N�`�U���Ϡm��S�y�YI�:B����9�#�=�n�m=$��6�h�d�T8d��PJR���͒�@	+����7,!�6��M�h	?�,��lv+ci���:}�e�>cN6Lw���U)n̘�ғF���M�wU���R�c�A�
�Fc�<i�-}�C��X�9��4賈��(eD���	������6[Nj6:����"��Z����/Aa��}������X8�(�2���`���4���9�<Nߥ��e`���94��ay���J���
y5}�o�tvֽ�Mh��|-�a���Ď�>Է������㯼l+�!/(#�5��H��u�;nn<{�]\�Z�+�� �O6 D�JDm��!fq\!���B�V�[��|@ԷF�y���.v�jz䩁�����D;w�J��'jњ�Km����^�������h=���o��TK��k��fܪ#pB�7��R~;�n��+|-}�����Ϳ�3�Ɓ�3�3��u&��{ �H�2���K�t���������L2}M��m��Nw�BP�r/s�N�4ݧA��[a��w>��`���Dڹ�V]:b�5�ze�L[�B��0:aC�L�A������(HTv����z+2�0��5�6b����D���`U�ޔ�R���1�u3��ΓfM�x�M�����4oBYgA��O�_\�Q+|���C���Fb^���]��g�+w{�JX�,딸hz�����L^�Dz+��|��/}�8���#O�	_uD�(�Mw�߂�U�ʹ캕q2��ͬ��o(�ܿ�'''����&      �      x������ � �      w   X  x��VKr�8\ç�$>$�hfR��]5��&a?I%�w9�,��t�i��9��*�R ��{���s��\cșm�����+�?aI&��:Q)��)�S���a��Em\u\�5��ֶqMK4�E"R��om�W�zj��v���!�����[�[�T
-3�*A�Kt��L-�ʸ�s2�\���c�5����p���YU��mu$ȉmwc;rii��+�uf0$a�K��$$���S��n�֏���EJs%�>����Wۙ	���+mS8S�y�mW:���t7���	��-L�عkKtb����.��D�ws��D �r�C�>I��J�;���}���T_q�/��9�$���,�21���e�-��e�)z�I�y���91�YW��������jd�K�-e��ջ�2	F:�x�Ì6���~����*�-���V����!�b�Ж�s�+l��f�#�HA�yd�<E���ԯ��9�z_�c�k[9������`�Adf�e�s�j��b���ȅ�����ض�	�����}��Y�gm�*44����r�2N
���y�.Sc���+<���*KOZ�e�������>L���ӏ=�|#ڣ�r�	��J�x��x7��#���
	B|A�)gI��Q^��@������*%'K��KS���L��ug�6�
�h��ɻ:ha��nāN�{:a��Z�@="c�3��^�*Z�������"4���%�����V��*�wo&h�M�6���HLo\}[��_e��rI�6V�U��k�ap�r�@������h�b �zig���&�d(��BKZZzj}�A&:/�	��A�܇ݾ�K�ɶ�+�_94�&��ڈ��������0"�T�� d�-��,<�ȡsT�Y�
��c����O+�4(���y�����L�:T�m#�!߷�E;� �׼4�,K�4^�E(&�|
빩]Ւ+�mO�©�
-�	�圇$�P~w6���������a�}��h{�˿ F8�r�/D��Zl�*̚�,:���
����Λ7zٖ�[,G�0Y�R/�\iX��(�9�6���8�Tr��k���f������ܼ�m��X�&W�z����O�GGG��S��      �      x������ � �      x   `  x�mT;r�0��S��$9B�"]f�2͊\3�hl�ƥW���byR{�I�~�o���[�VCa��SW�F�頦x��_��S�EȄ�,��LS����d4�q�q~�K;�^3{�
�u��G�%$�_��?j%e=�S�sKY8�S�$<���j^�H�ZW����J&�_cI#Sr���>h~�Jơ�;���wR� �@�th���.�+�Og(������'��l�1�z۞�d.<zO"�����*�/gс�F��K����s?	�r��bS�_�gMi�@ȗڇ�;��s��`�B�W��9�P�ڼ!Xk���*.i=�e�
�F�� BH4+���q��Kt�h�1q�s�<��0T������),j�ӄ����@
4.����6�cDG^����>����m*:6+����)�� �N�;B�f�7�'�Y�D�>-<�1yF<�><��W�4K)"��םSƤq���~V(�]��A�4�O
�=u���Ė��1O)\s�Vڤ0�/�!��R��SP� jYņ�4.�4��x?MY��z� ���I{��@
2�L�y�.M��\x�H�6�x�z���d���������l6� �*�      u   9   x�3�tL����,.)JL�/�,�2�t�O.3�9��2�y%�
e%�e�@�=... ��I      z   �  x��X͎�6>�O�p�_��e�n~	��
��ղ�6�dH�����CE�/��H��Ŷ9�4=���7��т����޵���h���[l�����[����SA�6�qi�*XeԚ�5W�[�w]���G�^�v��{۴��~����cah%�b�s\*_4'Lz�n�ڦ_m�h�U�c?����`��{T�JPF�#��՚��kP�Qs ��!s'�]��Y	�5�"��Up�O�np_�2�Z�,�fMř�~t��=�vx����p��p���qݣ�7�����ɵŦ�.�4�t��נ2ۼG�e3��46��i(������8������c��8%`�5_Syf����]���]6�[�Br��#����,^���E ���R��sJ)dw�2��E�,�x
�$��I7�UZ�J0�*"��~g�cc�=�04ۧp�xKB��n�}�*C�X� �&�sH7�s�J���6}w�`ǔ{��M^b�N�Yn�z�gK�� .�/:A)gD�ݺ(��n�l���n��-P��T�%�E
�Y�wv&R�h��v�x�Q%x!�z�N��'��}������D=5��h��ʹ�2�`*��R��Uq��{�����՝{�G&��H�>�#G8���^mZ&s�����=4u���D�ɖD� ��Щ�
�� ���a5,�6�������!�m��C�q_�S�W�`�������ts꫐z]E L4 �m򇰳e�m������
(a�_7�˞��n#./�pέqg�|��0V1�J���v�]���(r��*����E�̠߂i��,��	IJ�ǋ�߁�c�8�	Q���U�et�su��́�i�e)p��86�J"T�������fU�	ۧX2��
�%�/���%�Tb7�q"B��ߟ��Ho�;���{l.���C�THp4�����}��g���o��y�4�#�[8_�q�84_���]�	�U��'}�fl ��Z�ξ�I���A�U������+�vp�E�ʈ@�8�GZe�؃���Q�7�v�N��,���͹�D��~�oZy�wv�OY�f�D�������@�� ޼w.��=B0�X#2��C�w�޷:�ʘO��ݞ�W��_��L6�=���U�f"M���������k<�u�-�$��mW�Yi�3B�48\���#T\X�t���"��F?F4���?�����"������{�ݡ\����>Ҹ����9�9�p�8����9}���qj4���~��yj��3��$:I�d����`OC]`��h�S`���wM�z�0X3`�{*�Y�{�{T�,g���y�ëP��H9X"O��|z�+�{�!ʷ/�m��_�cF�8�c��q�Ý�.g=�!26y�����cΜ�˶�B�"�I'��_`���t�N۬
� s��Q#��_����4�)%���|G\?�G��_�4-b-T9B;��m�x��E���S6�����Wۭ`�k���`⅔���+���hv����q6��SG�Y�OMOy�9Q=Њ��"��r��
��R�m��$�	�	?��?���,����4~'<�L(�/A���>[�Ej��.=� �dr�Y_u�{n������2�4�Yz�J���֛F��b��I�-������#>�Ovu���q���/ 15�y���QkA������0y��
�m�� n�ÔЍTIg��د�mN@������m��.5Q��u@jm��W�]�� �߿�p�)s�Ci��p�;���*�
�o$ǿ�dK���u��rQ6V��C�x�sJ����n�� Exd�,<���z	x�8������E��P{Dϫ�~ ���S%��Ŀ�����Ė�\�I'�}�i}*xU�p��+B�?64�u      ~      x������ � �     