PGDMP     ;                    y            Livraria_Orleanz    13.3    13.3 (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    Livraria_Orleanz    DATABASE     r   CREATE DATABASE "Livraria_Orleanz" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
 "   DROP DATABASE "Livraria_Orleanz";
                postgres    false            �            1259    24579    administrador    TABLE     �   CREATE TABLE public.administrador (
    id integer NOT NULL,
    nome character varying NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL,
    email character varying NOT NULL
);
 !   DROP TABLE public.administrador;
       public         heap    postgres    false            �            1259    24577    administrador_id_seq    SEQUENCE     �   CREATE SEQUENCE public.administrador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.administrador_id_seq;
       public          postgres    false    201            �           0    0    administrador_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.administrador_id_seq OWNED BY public.administrador.id;
          public          postgres    false    200            �            1259    24599 	   categoria    TABLE     e   CREATE TABLE public.categoria (
    id integer NOT NULL,
    descricao character varying NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    24913    categoria_id_seq    SEQUENCE     �   ALTER TABLE public.categoria ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            �            1259    24636    categoria_produto    TABLE     n   CREATE TABLE public.categoria_produto (
    id_categoria integer NOT NULL,
    id_produto integer NOT NULL
);
 %   DROP TABLE public.categoria_produto;
       public         heap    postgres    false            �            1259    24590    cliente    TABLE     �   CREATE TABLE public.cliente (
    id integer NOT NULL,
    nome character varying NOT NULL,
    endereco character varying NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL,
    email character varying NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    24588    cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    203            �           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    202            �            1259    24626    compra    TABLE     �   CREATE TABLE public.compra (
    id integer NOT NULL,
    id_cliente integer,
    data_hora timestamp without time zone NOT NULL
);
    DROP TABLE public.compra;
       public         heap    postgres    false            �            1259    25069    compra_id_seq    SEQUENCE     �   ALTER TABLE public.compra ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    206            �            1259    24631    compra_produto    TABLE     �   CREATE TABLE public.compra_produto (
    id_produto integer NOT NULL,
    id_compra integer NOT NULL,
    quantidade integer NOT NULL
);
 "   DROP TABLE public.compra_produto;
       public         heap    postgres    false            �            1259    24607    produto    TABLE     �   CREATE TABLE public.produto (
    id integer NOT NULL,
    descricao character varying NOT NULL,
    preco double precision NOT NULL,
    quantidade integer NOT NULL,
    imagem character varying
);
    DROP TABLE public.produto;
       public         heap    postgres    false            �            1259    24911    produto_id_seq    SEQUENCE     �   ALTER TABLE public.produto ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            F           2604    24582    administrador id    DEFAULT     t   ALTER TABLE ONLY public.administrador ALTER COLUMN id SET DEFAULT nextval('public.administrador_id_seq'::regclass);
 ?   ALTER TABLE public.administrador ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            G           2604    24593 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            I           2606    24687 %   administrador administrador_login_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_login_key UNIQUE (login);
 O   ALTER TABLE ONLY public.administrador DROP CONSTRAINT administrador_login_key;
       public            postgres    false    201            K           2606    24587     administrador administrador_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.administrador DROP CONSTRAINT administrador_pkey;
       public            postgres    false    201            Q           2606    24606    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    204            \           2606    24640 (   categoria_produto categoria_produto_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.categoria_produto
    ADD CONSTRAINT categoria_produto_pkey PRIMARY KEY (id_categoria, id_produto);
 R   ALTER TABLE ONLY public.categoria_produto DROP CONSTRAINT categoria_produto_pkey;
       public            postgres    false    208    208            M           2606    24689    cliente cliente_login_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_login_key UNIQUE (login);
 C   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_login_key;
       public            postgres    false    203            O           2606    24598    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    203            X           2606    24635 "   compra_produto compra_produto_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.compra_produto
    ADD CONSTRAINT compra_produto_pkey PRIMARY KEY (id_produto, id_compra);
 L   ALTER TABLE ONLY public.compra_produto DROP CONSTRAINT compra_produto_pkey;
       public            postgres    false    207    207            V           2606    24630    compra pk_compra 
   CONSTRAINT     c   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT pk_compra PRIMARY KEY (id) INCLUDE (id_cliente);
 :   ALTER TABLE ONLY public.compra DROP CONSTRAINT pk_compra;
       public            postgres    false    206    206            S           2606    24614    produto produto_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    205            T           1259    24650    fki_fk_compra_id_cliente    INDEX     Q   CREATE INDEX fki_fk_compra_id_cliente ON public.compra USING btree (id_cliente);
 ,   DROP INDEX public.fki_fk_compra_id_cliente;
       public            postgres    false    206            ]           1259    24674    fki_fk_id_categoria    INDEX     Y   CREATE INDEX fki_fk_id_categoria ON public.categoria_produto USING btree (id_categoria);
 '   DROP INDEX public.fki_fk_id_categoria;
       public            postgres    false    208            Y           1259    24656    fki_fk_id_compra    INDEX     P   CREATE INDEX fki_fk_id_compra ON public.compra_produto USING btree (id_compra);
 $   DROP INDEX public.fki_fk_id_compra;
       public            postgres    false    207            Z           1259    24662    fki_fk_id_produto    INDEX     R   CREATE INDEX fki_fk_id_produto ON public.compra_produto USING btree (id_produto);
 %   DROP INDEX public.fki_fk_id_produto;
       public            postgres    false    207            ^           1259    24685    fki_fk_id_produto_categoria    INDEX     _   CREATE INDEX fki_fk_id_produto_categoria ON public.categoria_produto USING btree (id_produto);
 /   DROP INDEX public.fki_fk_id_produto_categoria;
       public            postgres    false    208            _           2606    25071    compra fk_compra_id_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_compra_id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id) ON DELETE SET NULL NOT VALID;
 E   ALTER TABLE ONLY public.compra DROP CONSTRAINT fk_compra_id_cliente;
       public          postgres    false    206    203    2895            b           2606    24669 !   categoria_produto fk_id_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoria_produto
    ADD CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id) NOT VALID;
 K   ALTER TABLE ONLY public.categoria_produto DROP CONSTRAINT fk_id_categoria;
       public          postgres    false    204    2897    208            a           2606    25076    compra_produto fk_id_compra    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra_produto
    ADD CONSTRAINT fk_id_compra FOREIGN KEY (id_compra) REFERENCES public.compra(id) ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.compra_produto DROP CONSTRAINT fk_id_compra;
       public          postgres    false    207    206    2902            `           2606    24657    compra_produto fk_id_produto    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra_produto
    ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto) REFERENCES public.produto(id) NOT VALID;
 F   ALTER TABLE ONLY public.compra_produto DROP CONSTRAINT fk_id_produto;
       public          postgres    false    205    207    2899            c           2606    24675    categoria_produto fk_id_produto    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoria_produto
    ADD CONSTRAINT fk_id_produto FOREIGN KEY (id_produto) REFERENCES public.produto(id) NOT VALID;
 I   ALTER TABLE ONLY public.categoria_produto DROP CONSTRAINT fk_id_produto;
       public          postgres    false    208    2899    205            d           2606    24680 )   categoria_produto fk_id_produto_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoria_produto
    ADD CONSTRAINT fk_id_produto_categoria FOREIGN KEY (id_produto) REFERENCES public.produto(id) NOT VALID;
 S   ALTER TABLE ONLY public.categoria_produto DROP CONSTRAINT fk_id_produto_categoria;
       public          postgres    false    208    205    2899           