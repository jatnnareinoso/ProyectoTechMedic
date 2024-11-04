PGDMP                  
    |         	   techmedic    16.4 (Debian 16.4-1.pgdg120+2)    16.4 (Debian 16.4-1.pgdg120+2) o    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16388 	   techmedic    DATABASE     t   CREATE DATABASE techmedic WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE techmedic;
                postgres    false            �            1259    16389    accesos    TABLE     �   CREATE TABLE public.accesos (
    id_acessos integer NOT NULL,
    modulo character varying(50),
    estado boolean DEFAULT true,
    id_especialidad integer
);
    DROP TABLE public.accesos;
       public         heap    postgres    false            �            1259    16393    accesos_id_acessos_seq    SEQUENCE     �   ALTER TABLE public.accesos ALTER COLUMN id_acessos ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesos_id_acessos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    215            �            1259    16394    accesos_usuario    TABLE     �   CREATE TABLE public.accesos_usuario (
    id_accesos integer NOT NULL,
    id_usuario integer NOT NULL,
    estado boolean DEFAULT true,
    motivo character varying,
    id_acc_usuario integer NOT NULL
);
 #   DROP TABLE public.accesos_usuario;
       public         heap    postgres    false            �            1259    16639 "   accesos_usuario_id_acc_usuario_seq    SEQUENCE     �   ALTER TABLE public.accesos_usuario ALTER COLUMN id_acc_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesos_usuario_id_acc_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16398    asistente_doctor    TABLE     �   CREATE TABLE public.asistente_doctor (
    id_us_doc integer NOT NULL,
    id_usuario integer NOT NULL,
    id_doctor integer NOT NULL,
    estado boolean DEFAULT true
);
 $   DROP TABLE public.asistente_doctor;
       public         heap    postgres    false            �            1259    16402    asistente_doctor_id_us_doc_seq    SEQUENCE     �   ALTER TABLE public.asistente_doctor ALTER COLUMN id_us_doc ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asistente_doctor_id_us_doc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    218            �            1259    16403    centro_medico    TABLE     �   CREATE TABLE public.centro_medico (
    id_centro_medico integer NOT NULL,
    centro_medico character varying(50) NOT NULL,
    observacion character varying(100),
    estado boolean DEFAULT true NOT NULL
);
 !   DROP TABLE public.centro_medico;
       public         heap    postgres    false            �            1259    16407 "   centro_medico_id_centro_medico_seq    SEQUENCE     �   ALTER TABLE public.centro_medico ALTER COLUMN id_centro_medico ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.centro_medico_id_centro_medico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    220            �            1259    16408    cita    TABLE     =  CREATE TABLE public.cita (
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
       public         heap    postgres    false            �            1259    16413    cita_id_cita_seq    SEQUENCE     �   ALTER TABLE public.cita ALTER COLUMN id_cita ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cita_id_cita_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    222            �            1259    16414    consulta    TABLE     m  CREATE TABLE public.consulta (
    id_consulta integer NOT NULL,
    motivo character varying,
    descripcion character varying,
    fecha_hora timestamp with time zone,
    estado boolean,
    id_cita integer,
    notas_internas character varying(255),
    notas_externas character varying(255),
    pruebas character varying(255),
    id_especialidad integer
);
    DROP TABLE public.consulta;
       public         heap    postgres    false            �            1259    16419    consulta_id_consulta_seq    SEQUENCE     �   ALTER TABLE public.consulta ALTER COLUMN id_consulta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.consulta_id_consulta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    224            �            1259    16420    diagnostico    TABLE     )  CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    id_consulta integer NOT NULL,
    descripcion character varying,
    resultado_pruebas character varying,
    observacion character varying,
    estado boolean,
    archivos bytea[],
    ruta_archivos character varying
);
    DROP TABLE public.diagnostico;
       public         heap    postgres    false            �            1259    16425    diagnostico_id_diagnostico_seq    SEQUENCE     �   ALTER TABLE public.diagnostico ALTER COLUMN id_diagnostico ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.diagnostico_id_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    226            �            1259    16426    doctor    TABLE     �   CREATE TABLE public.doctor (
    id_doctor integer NOT NULL,
    id_centro_medico integer NOT NULL,
    id_usuario integer NOT NULL,
    exequatur numeric,
    observacion character varying,
    estado boolean DEFAULT true
);
    DROP TABLE public.doctor;
       public         heap    postgres    false            �            1259    16432    doctor_especialidad    TABLE     �   CREATE TABLE public.doctor_especialidad (
    id_us_esp integer NOT NULL,
    id_doctor integer NOT NULL,
    id_especialidad integer NOT NULL,
    estado boolean DEFAULT true
);
 '   DROP TABLE public.doctor_especialidad;
       public         heap    postgres    false            �            1259    16436 !   doctor_especialidad_id_us_esp_seq    SEQUENCE     �   ALTER TABLE public.doctor_especialidad ALTER COLUMN id_us_esp ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.doctor_especialidad_id_us_esp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    229            �            1259    16437    doctor_id_doctor_seq    SEQUENCE     �   ALTER TABLE public.doctor ALTER COLUMN id_doctor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.doctor_id_doctor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    228            �            1259    16438    especialidad    TABLE     �   CREATE TABLE public.especialidad (
    id_especialidad integer NOT NULL,
    especialidad character varying,
    descripcion character varying,
    estado boolean DEFAULT true
);
     DROP TABLE public.especialidad;
       public         heap    postgres    false            �            1259    16444     especialidad_id_especialidad_seq    SEQUENCE     �   ALTER TABLE public.especialidad ALTER COLUMN id_especialidad ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.especialidad_id_especialidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    232            �            1259    16445    notificaciones    TABLE     @  CREATE TABLE public.notificaciones (
    id_notificaciones integer NOT NULL,
    id_usuario integer NOT NULL,
    correo character varying,
    fecha_envio timestamp with time zone,
    contenido character varying,
    estado boolean DEFAULT true,
    id_destinatario integer,
    tipo_destinatario character varying
);
 "   DROP TABLE public.notificaciones;
       public         heap    postgres    false            �            1259    16451 $   notificaciones_id_notificaciones_seq    SEQUENCE     �   ALTER TABLE public.notificaciones ALTER COLUMN id_notificaciones ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.notificaciones_id_notificaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    234            �            1259    16452    paciente    TABLE     �  CREATE TABLE public.paciente (
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
       public         heap    postgres    false            �            1259    16458    paciente_id_paciente_seq    SEQUENCE     �   ALTER TABLE public.paciente ALTER COLUMN id_paciente ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.paciente_id_paciente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    236            �            1259    16459    receta    TABLE     
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
       public         heap    postgres    false            �            1259    16464    receta_id_receta_seq    SEQUENCE     �   ALTER TABLE public.receta ALTER COLUMN id_receta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.receta_id_receta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    238            �            1259    16465    tipo_consulta    TABLE     �   CREATE TABLE public.tipo_consulta (
    id_tipo_consulta integer NOT NULL,
    consulta character varying,
    descripcion character varying,
    estado boolean DEFAULT true
);
 !   DROP TABLE public.tipo_consulta;
       public         heap    postgres    false            �            1259    16471 "   tipo_consulta_id_tipo_consulta_seq    SEQUENCE     �   ALTER TABLE public.tipo_consulta ALTER COLUMN id_tipo_consulta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_consulta_id_tipo_consulta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    240            �            1259    16472    tipo_usuario    TABLE     �   CREATE TABLE public.tipo_usuario (
    id_tipo_usuario integer NOT NULL,
    usuario character varying(50),
    estado boolean DEFAULT true
);
     DROP TABLE public.tipo_usuario;
       public         heap    postgres    false            �            1259    16476     tipo_usuario_id_tipo_usuario_seq    SEQUENCE     �   ALTER TABLE public.tipo_usuario ALTER COLUMN id_tipo_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_usuario_id_tipo_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    242            �            1259    16477    usuario    TABLE     �  CREATE TABLE public.usuario (
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
       public         heap    postgres    false            �            1259    16483    usuario_centro_medico    TABLE     �   CREATE TABLE public.usuario_centro_medico (
    id_us_cent integer NOT NULL,
    id_usuario integer NOT NULL,
    id_centro_medico integer NOT NULL,
    estado boolean DEFAULT true
);
 )   DROP TABLE public.usuario_centro_medico;
       public         heap    postgres    false            �            1259    16487 $   usuario_centro_medico_id_us_cent_seq    SEQUENCE     �   ALTER TABLE public.usuario_centro_medico ALTER COLUMN id_us_cent ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuario_centro_medico_id_us_cent_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    245            �            1259    16488    usuario_id_usuario_seq    SEQUENCE     �   ALTER TABLE public.usuario ALTER COLUMN id_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1
);
            public          postgres    false    244            �          0    16389    accesos 
   TABLE DATA           N   COPY public.accesos (id_acessos, modulo, estado, id_especialidad) FROM stdin;
    public          postgres    false    215   y�       �          0    16394    accesos_usuario 
   TABLE DATA           a   COPY public.accesos_usuario (id_accesos, id_usuario, estado, motivo, id_acc_usuario) FROM stdin;
    public          postgres    false    217   q�       �          0    16398    asistente_doctor 
   TABLE DATA           T   COPY public.asistente_doctor (id_us_doc, id_usuario, id_doctor, estado) FROM stdin;
    public          postgres    false    218   �       �          0    16403    centro_medico 
   TABLE DATA           ]   COPY public.centro_medico (id_centro_medico, centro_medico, observacion, estado) FROM stdin;
    public          postgres    false    220   U�       �          0    16408    cita 
   TABLE DATA           �   COPY public.cita (id_cita, id_paciente, id_doctor, id_centro_medico, id_usuario, fecha_hora, estado, color, id_tipo_consulta) FROM stdin;
    public          postgres    false    222   Ö       �          0    16414    consulta 
   TABLE DATA           �   COPY public.consulta (id_consulta, motivo, descripcion, fecha_hora, estado, id_cita, notas_internas, notas_externas, pruebas, id_especialidad) FROM stdin;
    public          postgres    false    224   ��       �          0    16420    diagnostico 
   TABLE DATA           �   COPY public.diagnostico (id_diagnostico, id_consulta, descripcion, resultado_pruebas, observacion, estado, archivos, ruta_archivos) FROM stdin;
    public          postgres    false    226   ��       �          0    16426    doctor 
   TABLE DATA           i   COPY public.doctor (id_doctor, id_centro_medico, id_usuario, exequatur, observacion, estado) FROM stdin;
    public          postgres    false    228   �       �          0    16432    doctor_especialidad 
   TABLE DATA           \   COPY public.doctor_especialidad (id_us_esp, id_doctor, id_especialidad, estado) FROM stdin;
    public          postgres    false    229   ��       �          0    16438    especialidad 
   TABLE DATA           Z   COPY public.especialidad (id_especialidad, especialidad, descripcion, estado) FROM stdin;
    public          postgres    false    232   ��       �          0    16445    notificaciones 
   TABLE DATA           �   COPY public.notificaciones (id_notificaciones, id_usuario, correo, fecha_envio, contenido, estado, id_destinatario, tipo_destinatario) FROM stdin;
    public          postgres    false    234   <�       �          0    16452    paciente 
   TABLE DATA           ?  COPY public.paciente (id_paciente, nombre, apellido, cedula, fecha_nacimiento, correo, sexo, telefono, nacionalidad, ciudad, direccion, menor, observacion, nombre_familiar, cedula_familiar, correo_familiar, telefono_familiar, celular_familiar, estado, celular, peso, altura, alergia, enfermedad, sustancia) FROM stdin;
    public          postgres    false    236   e�       �          0    16459    receta 
   TABLE DATA           v   COPY public.receta (id_receta, id_diagnostico, medicamentos, cantidad, dosis, dias, fecha_receta, imagen) FROM stdin;
    public          postgres    false    238   J�       �          0    16465    tipo_consulta 
   TABLE DATA           X   COPY public.tipo_consulta (id_tipo_consulta, consulta, descripcion, estado) FROM stdin;
    public          postgres    false    240   g�       �          0    16472    tipo_usuario 
   TABLE DATA           H   COPY public.tipo_usuario (id_tipo_usuario, usuario, estado) FROM stdin;
    public          postgres    false    242   ׫       �          0    16477    usuario 
   TABLE DATA           �   COPY public.usuario (id_usuario, id_centro_medico, id_tipo_usuario, nombre, apellido, cedula, fecha_nacimiento, sexo, correo, password, usuario, estado, celular, telefono) FROM stdin;
    public          postgres    false    244    �       �          0    16483    usuario_centro_medico 
   TABLE DATA           a   COPY public.usuario_centro_medico (id_us_cent, id_usuario, id_centro_medico, estado) FROM stdin;
    public          postgres    false    245   1�       �           0    0    accesos_id_acessos_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesos_id_acessos_seq', 18, true);
          public          postgres    false    216            �           0    0 "   accesos_usuario_id_acc_usuario_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.accesos_usuario_id_acc_usuario_seq', 3, true);
          public          postgres    false    248            �           0    0    asistente_doctor_id_us_doc_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.asistente_doctor_id_us_doc_seq', 37, true);
          public          postgres    false    219            �           0    0 "   centro_medico_id_centro_medico_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.centro_medico_id_centro_medico_seq', 2, true);
          public          postgres    false    221            �           0    0    cita_id_cita_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cita_id_cita_seq', 62, true);
          public          postgres    false    223            �           0    0    consulta_id_consulta_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.consulta_id_consulta_seq', 18, true);
          public          postgres    false    225            �           0    0    diagnostico_id_diagnostico_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.diagnostico_id_diagnostico_seq', 10, true);
          public          postgres    false    227            �           0    0 !   doctor_especialidad_id_us_esp_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.doctor_especialidad_id_us_esp_seq', 203, true);
          public          postgres    false    230            �           0    0    doctor_id_doctor_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.doctor_id_doctor_seq', 43, true);
          public          postgres    false    231            �           0    0     especialidad_id_especialidad_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.especialidad_id_especialidad_seq', 19, true);
          public          postgres    false    233            �           0    0 $   notificaciones_id_notificaciones_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.notificaciones_id_notificaciones_seq', 8, true);
          public          postgres    false    235            �           0    0    paciente_id_paciente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.paciente_id_paciente_seq', 13, true);
          public          postgres    false    237            �           0    0    receta_id_receta_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.receta_id_receta_seq', 1, false);
          public          postgres    false    239            �           0    0 "   tipo_consulta_id_tipo_consulta_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tipo_consulta_id_tipo_consulta_seq', 3, true);
          public          postgres    false    241            �           0    0     tipo_usuario_id_tipo_usuario_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tipo_usuario_id_tipo_usuario_seq', 3, true);
          public          postgres    false    243            �           0    0 $   usuario_centro_medico_id_us_cent_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.usuario_centro_medico_id_us_cent_seq', 1, false);
          public          postgres    false    246            �           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 64, true);
          public          postgres    false    247            �           2606    16490    accesos accesos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_pkey PRIMARY KEY (id_acessos);
 >   ALTER TABLE ONLY public.accesos DROP CONSTRAINT accesos_pkey;
       public            postgres    false    215            �           2606    16646 "   accesos_usuario accesos_usuario_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.accesos_usuario
    ADD CONSTRAINT accesos_usuario_pk PRIMARY KEY (id_acc_usuario);
 L   ALTER TABLE ONLY public.accesos_usuario DROP CONSTRAINT accesos_usuario_pk;
       public            postgres    false    217            �           2606    16494 &   asistente_doctor asistente_doctor_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.asistente_doctor
    ADD CONSTRAINT asistente_doctor_pkey PRIMARY KEY (id_us_doc);
 P   ALTER TABLE ONLY public.asistente_doctor DROP CONSTRAINT asistente_doctor_pkey;
       public            postgres    false    218            �           2606    16496     centro_medico centro_medico_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.centro_medico
    ADD CONSTRAINT centro_medico_pkey PRIMARY KEY (id_centro_medico);
 J   ALTER TABLE ONLY public.centro_medico DROP CONSTRAINT centro_medico_pkey;
       public            postgres    false    220            �           2606    16498    cita cita_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_pkey PRIMARY KEY (id_cita);
 8   ALTER TABLE ONLY public.cita DROP CONSTRAINT cita_pkey;
       public            postgres    false    222            �           2606    16500    consulta consulta_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_pkey PRIMARY KEY (id_consulta);
 @   ALTER TABLE ONLY public.consulta DROP CONSTRAINT consulta_pkey;
       public            postgres    false    224            �           2606    16502    diagnostico diagnostico_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);
 F   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_pkey;
       public            postgres    false    226            �           2606    16504 ,   doctor_especialidad doctor_especialidad_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.doctor_especialidad
    ADD CONSTRAINT doctor_especialidad_pkey PRIMARY KEY (id_us_esp);
 V   ALTER TABLE ONLY public.doctor_especialidad DROP CONSTRAINT doctor_especialidad_pkey;
       public            postgres    false    229            �           2606    16506    doctor doctor_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id_doctor);
 <   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_pkey;
       public            postgres    false    228            �           2606    16508    especialidad especialidad_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id_especialidad);
 H   ALTER TABLE ONLY public.especialidad DROP CONSTRAINT especialidad_pkey;
       public            postgres    false    232            �           2606    16510 "   notificaciones notificaciones_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificaciones);
 L   ALTER TABLE ONLY public.notificaciones DROP CONSTRAINT notificaciones_pkey;
       public            postgres    false    234            �           2606    16512    paciente paciente_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);
 @   ALTER TABLE ONLY public.paciente DROP CONSTRAINT paciente_pkey;
       public            postgres    false    236            �           2606    16514    receta receta_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.receta
    ADD CONSTRAINT receta_pkey PRIMARY KEY (id_receta);
 <   ALTER TABLE ONLY public.receta DROP CONSTRAINT receta_pkey;
       public            postgres    false    238            �           2606    16516     tipo_consulta tipo_consulta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.tipo_consulta
    ADD CONSTRAINT tipo_consulta_pkey PRIMARY KEY (id_tipo_consulta);
 J   ALTER TABLE ONLY public.tipo_consulta DROP CONSTRAINT tipo_consulta_pkey;
       public            postgres    false    240            �           2606    16518    tipo_usuario tipo_usuario_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id_tipo_usuario);
 H   ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_usuario_pkey;
       public            postgres    false    242                       2606    16520 0   usuario_centro_medico usuario_centro_medico_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.usuario_centro_medico
    ADD CONSTRAINT usuario_centro_medico_pkey PRIMARY KEY (id_us_cent);
 Z   ALTER TABLE ONLY public.usuario_centro_medico DROP CONSTRAINT usuario_centro_medico_pkey;
       public            postgres    false    245            �           2606    16522    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    244                       2606    16523    consulta consulta_id_cita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_id_cita_fkey FOREIGN KEY (id_cita) REFERENCES public.cita(id_cita);
 H   ALTER TABLE ONLY public.consulta DROP CONSTRAINT consulta_id_cita_fkey;
       public          postgres    false    224    3305    222                       2606    16528    accesos fk_especialidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT fk_especialidad FOREIGN KEY (id_especialidad) REFERENCES public.especialidad(id_especialidad);
 A   ALTER TABLE ONLY public.accesos DROP CONSTRAINT fk_especialidad;
       public          postgres    false    215    3315    232                       2606    16533    cita fk_tipo_consulta    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_tipo_consulta FOREIGN KEY (id_tipo_consulta) REFERENCES public.tipo_consulta(id_tipo_consulta);
 ?   ALTER TABLE ONLY public.cita DROP CONSTRAINT fk_tipo_consulta;
       public          postgres    false    222    3323    240                       2606    16538    accesos_usuario id_accesos_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.accesos_usuario
    ADD CONSTRAINT id_accesos_pk FOREIGN KEY (id_accesos) REFERENCES public.accesos(id_acessos);
 G   ALTER TABLE ONLY public.accesos_usuario DROP CONSTRAINT id_accesos_pk;
       public          postgres    false    217    3297    215                       2606    16543    doctor id_centro_medico    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT id_centro_medico FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 A   ALTER TABLE ONLY public.doctor DROP CONSTRAINT id_centro_medico;
       public          postgres    false    228    220    3303                       2606    16548    usuario id_centro_medico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT id_centro_medico_pk FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT id_centro_medico_pk;
       public          postgres    false    244    3303    220                       2606    16553 )   usuario_centro_medico id_centro_medico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_centro_medico
    ADD CONSTRAINT id_centro_medico_pk FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 S   ALTER TABLE ONLY public.usuario_centro_medico DROP CONSTRAINT id_centro_medico_pk;
       public          postgres    false    3303    220    245                       2606    16558    cita id_centro_medico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT id_centro_medico_pk FOREIGN KEY (id_centro_medico) REFERENCES public.centro_medico(id_centro_medico);
 B   ALTER TABLE ONLY public.cita DROP CONSTRAINT id_centro_medico_pk;
       public          postgres    false    222    220    3303                       2606    16563    diagnostico id_consulta_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT id_consulta_pk FOREIGN KEY (id_consulta) REFERENCES public.consulta(id_consulta);
 D   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT id_consulta_pk;
       public          postgres    false    226    224    3307                       2606    16568    receta id_diagnostico_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.receta
    ADD CONSTRAINT id_diagnostico_pk FOREIGN KEY (id_diagnostico) REFERENCES public.diagnostico(id_diagnostico);
 B   ALTER TABLE ONLY public.receta DROP CONSTRAINT id_diagnostico_pk;
       public          postgres    false    238    226    3309                       2606    16573    asistente_doctor id_doctor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistente_doctor
    ADD CONSTRAINT id_doctor_fk FOREIGN KEY (id_doctor) REFERENCES public.doctor(id_doctor);
 G   ALTER TABLE ONLY public.asistente_doctor DROP CONSTRAINT id_doctor_fk;
       public          postgres    false    3311    228    218            	           2606    16578    cita id_doctor_pk    FK CONSTRAINT     z   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT id_doctor_pk FOREIGN KEY (id_doctor) REFERENCES public.doctor(id_doctor);
 ;   ALTER TABLE ONLY public.cita DROP CONSTRAINT id_doctor_pk;
       public          postgres    false    228    3311    222                       2606    16583     doctor_especialidad id_doctor_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor_especialidad
    ADD CONSTRAINT id_doctor_pk FOREIGN KEY (id_doctor) REFERENCES public.doctor(id_doctor);
 J   ALTER TABLE ONLY public.doctor_especialidad DROP CONSTRAINT id_doctor_pk;
       public          postgres    false    229    3311    228                       2606    16588 &   doctor_especialidad id_especialidad_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor_especialidad
    ADD CONSTRAINT id_especialidad_pk FOREIGN KEY (id_especialidad) REFERENCES public.especialidad(id_especialidad);
 P   ALTER TABLE ONLY public.doctor_especialidad DROP CONSTRAINT id_especialidad_pk;
       public          postgres    false    232    3315    229            
           2606    16593    cita id_paciente_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT id_paciente_pk FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);
 =   ALTER TABLE ONLY public.cita DROP CONSTRAINT id_paciente_pk;
       public          postgres    false    236    3319    222                       2606    16598    usuario id_tipo_usuario_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT id_tipo_usuario_pk FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipo_usuario(id_tipo_usuario);
 D   ALTER TABLE ONLY public.usuario DROP CONSTRAINT id_tipo_usuario_pk;
       public          postgres    false    3325    244    242                       2606    16603    doctor id_usuario    FK CONSTRAINT     }   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 ;   ALTER TABLE ONLY public.doctor DROP CONSTRAINT id_usuario;
       public          postgres    false    244    228    3327                       2606    16608    asistente_doctor id_usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistente_doctor
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 H   ALTER TABLE ONLY public.asistente_doctor DROP CONSTRAINT id_usuario_fk;
       public          postgres    false    244    218    3327                       2606    16613 #   usuario_centro_medico id_usuario_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_centro_medico
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 M   ALTER TABLE ONLY public.usuario_centro_medico DROP CONSTRAINT id_usuario_pk;
       public          postgres    false    3327    245    244                       2606    16618    accesos_usuario id_usuario_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.accesos_usuario
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 G   ALTER TABLE ONLY public.accesos_usuario DROP CONSTRAINT id_usuario_pk;
       public          postgres    false    217    3327    244                       2606    16623    cita id_usuario_pk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 <   ALTER TABLE ONLY public.cita DROP CONSTRAINT id_usuario_pk;
       public          postgres    false    244    222    3327                       2606    16628    notificaciones id_usuario_pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 F   ALTER TABLE ONLY public.notificaciones DROP CONSTRAINT id_usuario_pk;
       public          postgres    false    244    3327    234            �   �   x�m�KN�@���)r��ΣI�ڬJ*$vl�Ġ�ҙ�,8��bL�P��g����z��M���! ��Cg����#��>HP3�e���YG��XD���
+8y�>���Ao�k��ub�h�b����56��-����Ks�-<�����Q��Ý�X�'�B*�$�4*�p�d0��N�(O�*R�2'^5R,��]�vH5͠�|3q��_9��&��?� �7��	      �   `   x�u�A
� @���)<A�u�N��t�qb����6A��[v�ér���4)�_ɄJ�Sc)�9����ғQ��p}���&29��B���cF?!��c/�      �   d   x�%��C1�3�*&N�w��_���dld���wP�74�|B�މNtgϝ��Sa2����
]%0�"&�UU�{	}p��5��h��_;���5���E�      �   ^   x�3�t�9�6/39Q�)1�J!8�$_AM��� 5931'3%1%���/3/�4/���ˈ�95��(_���ʔ��|�0�@j^bQf�B��#��=... {N X      �   �  x���Kn�0@��)�/2�W�u������]LhRt�?�7�Ĥ�|��H������q4�T
�@8��{����P9��#P{�B�$�R�r�Ғ��IF�"Ԑ��d _B��&I�1I!�$�$WfK�OJ�j��7e�"��N�~Z��Ǣ�j��6�X{ߠR��'����G��\1����I`t�E�$�}�|������@����K@t�(\����i��xxٿ�Nr�ֆoø��yv����������2Kّp�t����i�I{�@�O)of[nJ�H�����$
��"�xv;'�͝t|z���$N�Ļ�ZJ���IxC��m�L|��r'�ⴖ�̙֕=���i�l�Bk�ۂu]ˌ���勣`��W�o*��;�{l�����M���i\;�����:;���� o������l?��W!Ѻ�Τ.��͑�ӘEA�/ܯ=��vP�nX��и&1����e�����$�~�]l���u�l<��1����      �   �  x����n�0���S�Փ�$�k�h�`ݱ�VV��Z���mvܡ�=B^l��&��~,�D�)���OF��VՍrP����U��J= k����b_�:כ�����n�u�:{�P���[4�pka�9޹�<چJt\`�/"N�hхLr�~" �L̲hF<��9kX<{%jeA0������R����}�U]��Gٲn�
Ad�J�Q�z󈷖�$�����#�X+r�`�Ε���bq�:�,�c��/KӺ)�1��{QG��<q8K{F���d]�v:�w�LB��εZ��e����$�]u���d�qj#�yK������˚Vh:P�8����@2cOV��S6��4Hv��f�*��;&�;��������Jep��y"�3fWm~���u
ݑ�A���'��]o~�tum�m����0�~�K~V���b�@�va���7�O��U�hUV���&����v'<���y&�P�x/Ց�^Q�&G��bd�M9�hs�wk vf��\w�~jKP�K|㬇�>�|J�Kr�k��6~�S/����i@���W�,J3��s.wŜ��E:~~if��L٥ϴU���5ژ7z��W�:7�VsO�A�s�����%x��2�\� �3.�zC!vrHSq�8Nf5���Љa�-t�I1?���(�^��g�3��q:ߋ��~���> ܆A��a�      �   L  x�u�]K�0���_��Z��4�wS�m� ^8ٚ6[R�T�7�`�/r8yO��=���R�a��L�҂�ə����>|�m�����"٫ ��߆�?��뚥e{�9EcM	b1�E��)�FQ�C)��HJr�Mm�h��g��4|{F�+�P��3��1ozW�@�����ooXҔUp- �`$���ζ�a�k}d�Z���r���9��e�sƏ��i���@���׿�LQ<s���C)�Ѧ�Sa�1�;q ���ǫ�{���JՕڜ�
U�SF/N�o���<~W·����+QKH��bT�A�!&	-��`��'IE����      �     x�ERɍ1{k�YX�e��� e���� �A񐓢�!j�"�K��\a��ILe嬇0	���ty��4[ʇ=HP%��0_��$q
?�"��*B�:J0�����f������Ph���l����#���\9��%7	�/�0�_Y�1����uls�ç����8�D�X�&���OU�A�-�9�	8���;��d�vs�:��zl�J&N���P��r�(	��^j��,ûb��X{r�@H��JP��_��H�{��w]�s�`U      �   �   x�-�ˑ!C�"�)�˄1��J����-l�cc��"�hB?�Dtkc`nkcb����-�ʅ�xL��M�z�XƁd�6��{��5$s+:y�W�@���Kd��-53�S��L�
pG	�S�5�o�tM�|[�NGU��+�}1�iq�v�1�Nb���.̚�n�k��ж���������� �&D�      �   m  x��VMo7=��~�¨�����Q �������ki����>��:����]�z�4@N�YI���#��ͩx����pO�ڜ-S��
5�[z2-G&�+������e=m$ӕ+��F�u�};�ݒ"݄�~�s�,[����,V�ɑ2u��0���c�-����L@�h�9Ds�{���G/��[�bhޥ���	,�O�G��#�6 ��ŏ�6��D[���c����y���m�-(vm肹��cf���b��	 \�A @�����l~�O�|�lK��a�4e��[KKvNo��3���9Y?�!c�F��6}

O*�ߚ�$��P��N��Le��>(xR�~]b��66G-2�����H	�o�ED�i���5E�1��
GѾnμ}�����"�n��8#:	�#�B��~��Sԝ�?��9�`��O��N���w�a�t؞x\�{ɂ��]��OM^�+jk)��4�`�F��C���j[�3��|��N}=qb��Ҽ�xcy�/9k�؁��,1�:��y2츪��Ysviu�)��a�d@��DВ�ob���]9* �&9��֪>w���z���]���^y�!":�O����{�jv84i��9����p��Fv_4syЍ�`wO��6j�� �+^r�q�z��	u_��� J�ԁ����|%m�M��_�L�B��W�2�}ټ��H�����"mSG��m:23Ѵ%����2�U	�)˭��K���5��8�
�]���Ys����&�F���a,y	��e�\}��Q	�	�-0�Q����� P�V�u*x2�����6��>����y)��Ʈ�ٟ�#S}�}H[��jt�I�I��t�X���h'���
!�#!����/.��W����+6`ZKH��ڛ�]}��q7���udY��E����N���*��b���9�˨W�|���T�c�<�'��M �d7�i|3����Ӽ��Ɋ�Q̪߯�ʨ�W��蟵��@R��y,�$=����h���d.��
�alS�k�(���k/��zU���Y��"�̩�)D	wX��/@9�ެ��NC+Ү��/<�D��5^.�6��7H��NdCڄ.�#$�����{|tt�=LU      �     x���AN�0еs��C��I�4Bv,XT�%'�*K��r ���b����D�Y?��'g%�s���~��2o�2�2[	��PTRVy�QdW��:u�4��S�\K���c�l��]�ɚm��E�"/Q���Cb��"�Ey�^�*��	��v��2ZN�gݐo�ޘ�`�]{�.�4��k㨧�h	�F7�$�6@�<N��>����T�.���J��e��l��ku��~����Rf�].aiܳ��z=3��[ݚF٨Q?�_y�$���x      �   �  x��V�R9}_���n#i��ewS�ℂ�ݪ����0"s!3�$𶟳y��cۭc��

�����}���$3׆ɴ�=%�>�M��+߶�wD1��έ�2"cf&ܐ
�p�B;l��\(O��"�����!�,7�q��kS�:�v��ѿ�b���|�@NK8��[�R´UZZ#��8]k΍V�OQ�`�k����s�'a�|=o}��b�����������E>��{�	%2�^%�a�>t�L
+�ʹ 5~��i<�
X����KV^~��"��>�D: 3-��)�9�un|�Z-�e����ݰk'Y�@[�%�������[wL/}�.�+�iSM;��o�p�6tzL��}C@�C�K8���u��]�h�̾�{��#]�i��c�3�ԝ��g����+���2�FB�yn̄�	���]nؒ@�\W,˱虑��$�sR�Ӷ
s�����z�	 �\��2F��j�����*dĕ��ZԵ���/G~��i��4������зT1�h�}� ���� .2 �P ��|٫�.W��9P���]�O)�|\Z֦[���y"sC,ۜUf%��%�\H��S++r�Z��G���g�Ϛ6�elh��?@�3��8)�0���.ӆ��5�C��i���ӳ�}Y�~�������w_N����ڣKr3�M�s�̷��*\m�
�E�g�)��A�L��g(��UFΖ����Z=�ϙ:u׭��5c�_��������q�"��N��߳6PDdh�`�;a���ZO�����r�{@nH�k�����h&�d�����'���������^VZN���BWAG�����ʡ�|{!m	چ@�e���m�K.��)ThI瞞{�\4He3����R9�"�q7Vs	j�M��­�+��1�j�&!x�Kpm<:�H+5��L��e�> �8tU�����|c�����Ok�i�,c�q,K0,�{@�Ri}���F��o7�#[�C�Ҩ��L�.��!��WFU��!W�����-`�F9�qIp(�����J�ɷ��0}�>2�
h{���d٧"NZ+6t5̚�-ZI��ud}��l�mX,�`�Vg(�\[��	$���w�6����{����r̹����mӿ�z֘\���5�����	�G�v�	�-n��*p�>Vq۲�m�*�W����[sT
]��L��^(%:�r�j��>�b-�trtt�?mlw�      �      x������ � �      �   `  x�mT;r�0��S��$9B�"]f�2͊\3�hl�ƥW���byR{�I�~�o���[�VCa��SW�F�頦x��_��S�EȄ�,��LS����d4�q�q~�K;�^3{�
�u��G�%$�_��?j%e=�S�sKY8�S�$<���j^�H�ZW����J&�_cI#Sr���>h~�Jơ�;���wR� �@�th���.�+�Og(������'��l�1�z۞�d.<zO"�����*�/gс�F��K����s?	�r��bS�_�gMi�@ȗڇ�;��s��`�B�W��9�P�ڼ!Xk���*.i=�e�
�F�� BH4+���q��Kt�h�1q�s�<��0T������),j�ӄ����@
4.����6�cDG^����>����m*:6+����)�� �N�;B�f�7�'�Y�D�>-<�1yF<�><��W�4K)"��םSƤq���~V(�]��A�4�O
�=u���Ė��1O)\s�Vڤ0�/�!��R��SP� jYņ�4.�4��x?MY��z� ���I{��@
2�L�y�.M��\x�H�6�x�z���d���������l6� �*�      �   9   x�3�tL����,.)JL�/�,�2�t�O.3�9��2�y%�
e%�e�@�=... ��I      �     x��X�n�6>KO�/�E�V�u�`�E���2�+G?i��y�{��#�u�?���m����p��|3#*
Z����m�͵��)>��\u;Jf8���F�-1[ʊ�v�A��'�A�;|��l�~S]��z>Z������8e��Ԅc����΍�3Z�`X����Jo	?�<Lne���3�SB@%�ካ�Qo��l��������k��a:�`SPRѦڂ�b�k������:��Bj��%~��c�k���~
�+�%��&{�o��q1�V�"�f	�-�n3�(��̛ŋ���z�s!3�UB�aF��n�V�c�(��w�U�d��1�ZRcк��jiJ���{��`�Ǳ�=�;�[��p���ST��*iC:˅ p7�}�sBJI2|]�qt��R�u�o-1���x�ۡ^��Z,����� ��R�ݹGH�����1]�)P��T�'�U�^�==���R`;�B�K�Z��c���Ӱ�w�h�1Aye��1�����\����Ơ���]���cSO�m8@e&{�X��k;¦3&����%܄�0p����K�+��f?�î��r��6����k�O�9��%Xx��B ������-�3HCoa>@���f.�+;����`���P$%&��fzp����֍�(\۞�����ȷsVʈH�er9�[�^���q��\��!$�Mx�
����0�G`ƽ� J<Eu����W�/X��ВV>ߏ���.f�	���4T͑<~��A���C»@����EY�=V�<�|��O�rs~�J��-%k"t�{��d��i&�W�
�c��%���+��JM�����)�z�n�j��R��Q���X�P��ӗ	��v��9}��H�y�k�Hr�ǡ��1����L:�ǀ�T�UpR�u���7���3�y�1a�T��� ��n�K&�փ���$JŒH�*q�RRCF����+�����E�R�
@�8P{b�Xt =�s�����?'�sQU��~3&D)B���z����_��j8�{���%8Ph��7�����~ !��G��"��Cؗ���B�?B���� =ς��JÙl8R�R��:dD�<���e�5^*�/�F��׺,�,5��!rJh�>�ek2n��Z8r�G�ZϽ!-4ގڝ?����E��A �B~������'��*vd�Ql4KF����O_j8�4AFDd�漏
���ٸ�%b��Uz��'�.]`��d�����mӦ��5�g�
E��^�2��������}Ȑ�wH9�"?��b	�8���/���C�o_A�,7>�i[ b//)�g����笇^Ô"b"V��Pz
��!�e��A���[�eh,�H@w����� ���U52��+�HYΥ�dG1�����~��x�XY��γ|4^�|Q��L��iE<��k���-Rlz���JUq�[�ۖ#�^>;@؀����H0�B���i���3��pOA4�L�;���{��Y.�V��@r���^1৿��g�:�7�Cu�¯b������)h]dz\�k�HmPa�إ	�_����{�c�������nnp;V|_{R�Y���Vl{���k�x�W%���8|g�aZ�HA�'��/G_L��Ȃ�w�9���4���:]��P�p!�З�3D�
ʐ��¹��A�͙'��<�"y�_M}
R��O}w���F������=�w���P�;��Zw���y/�
�����cڽ[����k�P6���!�y�l�R��y�#r���;5�_��,�Z#����a�Q�psVqH�RjO�7��Z��$`Z��+�s}h�r��+i����ϙ.t�U ��H�����Q����g���*�n����?:F(�ס��ٷ��kb�4O\�ؾ �����<����dx5��f�a����RV�u�c�A8λ�'�0���ׄ���e1LP���DM9�k���{�җ����T����TF�1��4���t�O(��l�����oʲ�W�OW      �      x������ � �     