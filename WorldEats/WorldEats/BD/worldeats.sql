toc.dat                                                                                             0000600 0004000 0002000 00000122055 13650326351 0014450 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       ,    9    	            x         	   worldeats    11.7    11.7 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         �           1262    24576 	   worldeats    DATABASE     �   CREATE DATABASE worldeats WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE worldeats;
             postgres    false         �           0    0    DATABASE worldeats    COMMENT     U   COMMENT ON DATABASE worldeats IS 'Base de datos para la plataforma web Worl Eats. ';
                  postgres    false    2979                     2615    24578    local    SCHEMA        CREATE SCHEMA local;
    DROP SCHEMA local;
             postgres    false         �           0    0    SCHEMA local    COMMENT     l   COMMENT ON SCHEMA local IS 'Esquema para almacenar las tablas de datos que tengan relación con el local.';
                  postgres    false    5                     2615    24577    usuario    SCHEMA        CREATE SCHEMA usuario;
    DROP SCHEMA usuario;
             postgres    false         �           0    0    SCHEMA usuario    COMMENT     p   COMMENT ON SCHEMA usuario IS 'Esquema para almacenar las tablas de datos que tengan relación con el usuario.';
                  postgres    false    6         �            1255    42152    f_eliminar_comida(bigint)    FUNCTION     �   CREATE FUNCTION local.f_eliminar_comida(_id_comida bigint) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
		BEGIN
			DELETE 
			FROM
				local.comida lc
			WHERE lc.id_comida = _id_comida;
			RETURN QUERY SELECT true;
		END
	$$;
 :   DROP FUNCTION local.f_eliminar_comida(_id_comida bigint);
       local       postgres    false    5         �            1259    32814 	   categoria    TABLE     c   CREATE TABLE local.categoria (
    id_categoria integer NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE local.categoria;
       local         postgres    false    5         �           0    0    TABLE categoria    COMMENT     b   COMMENT ON TABLE local.categoria IS 'Tabla de datos para almacenar los atributos de Categoría.';
            local       postgres    false    209         �            1255    42147    f_leer_categoria()    FUNCTION     �   CREATE FUNCTION local.f_leer_categoria() RETURNS SETOF local.categoria
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT 
				lc.*
			FROM 
				local.categoria lc;
		END;
	$$;
 (   DROP FUNCTION local.f_leer_categoria();
       local       postgres    false    5    209         �            1259    33969    comida    TABLE     �   CREATE TABLE local.comida (
    id_comida bigint NOT NULL,
    nombre text NOT NULL,
    descripcion text NOT NULL,
    precio integer NOT NULL,
    cantidad_disponible integer NOT NULL,
    imagen text NOT NULL,
    id_local bigint NOT NULL
);
    DROP TABLE local.comida;
       local         postgres    false    5         �           0    0    TABLE comida    COMMENT     [   COMMENT ON TABLE local.comida IS 'Tabla de datos para almacenar los atributos de Comida.';
            local       postgres    false    216         �            1255    33986    f_leer_comida()    FUNCTION     �   CREATE FUNCTION local.f_leer_comida() RETURNS SETOF local.comida
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT 
				ll.*
			FROM 
				local.comida ll;
		END;
	$$;
 %   DROP FUNCTION local.f_leer_comida();
       local       postgres    false    216    5         �            1255    42155    f_leer_comida1(text)    FUNCTION       CREATE FUNCTION local.f_leer_comida1(_doc text) RETURNS SETOF local.comida
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT 
				lc.*
			FROM 
				local.comida lc
			JOIN local.local ll ON lc.id_local = ll.id_local AND ll.doc_identidad = _doc;
		END;
	$$;
 /   DROP FUNCTION local.f_leer_comida1(_doc text);
       local       postgres    false    216    5         �            1259    33955    v_local    VIEW     �   CREATE VIEW local.v_local AS
 SELECT (0)::bigint AS id_local,
    ''::text AS nombre,
    ''::text AS eslogan,
    ''::text AS ciudad,
    ''::text AS direccion,
    (0)::bigint AS telefono,
    ''::text AS doc_identidad;
    DROP VIEW local.v_local;
       local       postgres    false    5         �            1255    33959    f_leer_local()    FUNCTION     &  CREATE FUNCTION local.f_leer_local() RETURNS SETOF local.v_local
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT 
				ll.id_local,
				ll.nombre,
				ll.eslogan,
				ll.ciudad,
				ll.direccion,
				ll.telefono,
				ll.doc_identidad
			FROM 
				local.local ll;
		END;
	$$;
 $   DROP FUNCTION local.f_leer_local();
       local       postgres    false    5    214         �            1259    34020    v_pedido    VIEW     �   CREATE VIEW local.v_pedido AS
 SELECT (0)::bigint AS id_local,
    ''::text AS nombre_local,
    ''::text AS nombre_comida,
    (0)::text AS documento,
    0 AS cantidad,
    ''::text AS direccion,
    (0)::bigint AS telefono,
    0 AS total;
    DROP VIEW local.v_pedido;
       local       postgres    false    5         �            1255    34024    f_leer_pedido()    FUNCTION     �  CREATE FUNCTION local.f_leer_pedido() RETURNS SETOF local.v_pedido
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT
				ll.id_local,
				ll.nombre,
				lc.nombre,
				lp.doc_identidad,
				lp.cantidad,
				lp.direccion,
				lp.telefono,
				lp.total
			FROM 
				local.pedidoopcional lp
			JOIN local.local ll ON ll.id_local = lp.id_local
			JOIN local.comida lc ON lc.id_comida = lp.id_comida;
		END;
	$$;
 %   DROP FUNCTION local.f_leer_pedido();
       local       postgres    false    219    5         �            1255    42149    f_registrar_categoria(text)    FUNCTION     	  CREATE FUNCTION local.f_registrar_categoria(_descripcion text) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
		BEGIN
			INSERT INTO local.categoria
				(
					descripcion
				)
			VALUES
				(
					_descripcion
				);
			RETURN QUERY SELECT true;
		END
	$$;
 >   DROP FUNCTION local.f_registrar_categoria(_descripcion text);
       local       postgres    false    5         �            1255    42150 8   f_registrar_comida(text, text, integer, integer, bigint)    FUNCTION     �  CREATE FUNCTION local.f_registrar_comida(_nombre text, _descripcion text, _precio integer, _cantidad_disponible integer, _id_local bigint) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
		BEGIN
			INSERT INTO local.comida
				(
					nombre,
					descripcion,
					precio,
					cantidad_disponible,
					imagen,
					id_local
				)
			VALUES
				(
					_nombre,
					_descripcion,
					_precio,
					_cantidad_disponible,
					'imagen',
					_id_local
				);
			RETURN QUERY SELECT true;
		END
	$$;
 �   DROP FUNCTION local.f_registrar_comida(_nombre text, _descripcion text, _precio integer, _cantidad_disponible integer, _id_local bigint);
       local       postgres    false    5         �            1255    33944 @   f_registrar_local(text, text, text, text, bigint, text, integer)    FUNCTION     &  CREATE FUNCTION local.f_registrar_local(_nombre text, _eslogan text, _ciudad text, _direccion text, _telefono bigint, _doc_identidad text, _id_categoria integer) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
		BEGIN
			INSERT INTO local.local
				(
					nombre,
					eslogan,
					ciudad,
					direccion,
					telefono,
					doc_identidad,
					id_categoria
				)
			VALUES
				(
					_nombre,
					_eslogan,
					_ciudad,
					_direccion,
					_telefono,
					_doc_identidad,
					_id_categoria
				);
			RETURN QUERY SELECT true;
		END
	$$;
 �   DROP FUNCTION local.f_registrar_local(_nombre text, _eslogan text, _ciudad text, _direccion text, _telefono bigint, _doc_identidad text, _id_categoria integer);
       local       postgres    false    5         �            1255    34014 ?   f_registrar_pedido(bigint, text, integer, text, bigint, bigint)    FUNCTION     H  CREATE FUNCTION local.f_registrar_pedido(_id_local bigint, _doc_identidad text, _cantidad integer, _direccion text, _telefono bigint, _id_comida bigint) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
	DECLARE
	_precio integer;
	_total integer;
		BEGIN
			_precio := (SELECT lc.precio FROM local.comida lc WHERE lc.id_comida = _id_comida);
			_total := _cantidad * _precio;
			INSERT INTO local.pedidoopcional
				(
					id_local,
					doc_identidad,
					cantidad,
					direccion,
					telefono,
					total,
					id_comida
				)
			VALUES
				(
					_id_local,
					_doc_identidad,
					_cantidad,
					_direccion,
					_telefono,
					_total,
					_id_comida
				);
			UPDATE local.comida
			SET 
				cantidad_disponible = cantidad_disponible - _cantidad
			WHERE 
				id_comida = _id_comida;
			RETURN QUERY SELECT true;
		END
	$$;
 �   DROP FUNCTION local.f_registrar_pedido(_id_local bigint, _doc_identidad text, _cantidad integer, _direccion text, _telefono bigint, _id_comida bigint);
       local       postgres    false    5         �            1255    42146 K   f_editar_usuario(text, text, text, integer, text, bigint, text, text, text)    FUNCTION     9  CREATE FUNCTION usuario.f_editar_usuario(_doc_identidad text, _nombre text, _apellido text, _edad integer, _direccion text, _telefono bigint, _correo text, _session text, _contrasena text) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
	DECLARE 
	_filtro text;
	BEGIN
		_filtro := (SELECT doc_identidad FROM usuario.usuario WHERE doc_identidad = _doc_identidad);
		IF NOT _filtro <> _doc_identidad
			THEN 
				UPDATE usuario.usuario
				SET 
					doc_identidad = _doc_identidad,
					nombre = _nombre,
					apellido = _apellido,
					edad = _edad,
					direccion = _direccion,
					telefono = _telefono,
					correo = _correo,
					session = _session,
					contrasena = _contrasena
				WHERE
					doc_identidad = _doc_identidad;
				RETURN QUERY SELECT true;
			ELSE 
				RETURN QUERY SELECT false;
		END IF;
	END
$$;
 �   DROP FUNCTION usuario.f_editar_usuario(_doc_identidad text, _nombre text, _apellido text, _edad integer, _direccion text, _telefono bigint, _correo text, _session text, _contrasena text);
       usuario       postgres    false    6         �            1259    24623    usuario    TABLE     ^  CREATE TABLE usuario.usuario (
    doc_identidad text NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    edad integer NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    correo text NOT NULL,
    session text NOT NULL,
    contrasena text NOT NULL,
    id_rol integer NOT NULL,
    id_estado integer NOT NULL
);
    DROP TABLE usuario.usuario;
       usuario         postgres    false    6         �           0    0    TABLE usuario    COMMENT     _   COMMENT ON TABLE usuario.usuario IS 'Tabla de datos para almacenar los atributos de Usuario.';
            usuario       postgres    false    203         �            1255    42139    f_iniciar_sesion(text, text)    FUNCTION     �  CREATE FUNCTION usuario.f_iniciar_sesion(_doc_identidad text, _contrasena text) RETURNS SETOF usuario.usuario
    LANGUAGE plpgsql
    AS $$
	BEGIN 
		IF (SELECT COUNT (*) FROM usuario.usuario uu WHERE uu.doc_identidad = _doc_identidad AND uu.contrasena = _contrasena AND uu.id_estado = 1) > 0
			THEN 
				RETURN QUERY 
				SELECT
					uu.*
				FROM usuario.usuario uu
				WHERE uu.doc_identidad = _doc_identidad AND uu.contrasena = _contrasena	AND uu.id_estado = 1;	
		END IF;
	END;
$$;
 O   DROP FUNCTION usuario.f_iniciar_sesion(_doc_identidad text, _contrasena text);
       usuario       postgres    false    6    203         �            1255    42145    f_leer_usuario()    FUNCTION     �   CREATE FUNCTION usuario.f_leer_usuario() RETURNS SETOF usuario.usuario
    LANGUAGE plpgsql
    AS $$
	BEGIN
		RETURN QUERY
		SELECT 
			uu.*
		FROM 
			usuario.usuario uu;
	END;
$$;
 (   DROP FUNCTION usuario.f_leer_usuario();
       usuario       postgres    false    203    6         �            1255    42143 W   f_registrar_usuario(text, text, text, integer, text, bigint, text, text, text, integer)    FUNCTION     S  CREATE FUNCTION usuario.f_registrar_usuario(_doc_identidad text, _nombre text, _apellido text, _edad integer, _direccion text, _telefono bigint, _correo text, _session text, _contrasena text, _id_rol integer) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
	BEGIN 
		IF (SELECT COUNT (*) FROM usuario.usuario uu WHERE uu.doc_identidad = _doc_identidad) = 0
			THEN 
				INSERT INTO usuario.usuario
				(
					doc_identidad,
					nombre,
					apellido,
					edad,
					direccion,
					telefono,
					correo,
					session,
					contrasena,
					id_rol,
					id_estado
				)
				VALUES
				(
					_doc_identidad,
					_nombre,
					_apellido,
					_edad,
					_direccion,
					_telefono,
					_correo,
					_session,
					_contrasena,
					_id_rol,
					1
				);
			RETURN QUERY SELECT true;
		ELSE
			RETURN QUERY SELECT false;
		END IF;
	END;
$$;
 �   DROP FUNCTION usuario.f_registrar_usuario(_doc_identidad text, _nombre text, _apellido text, _edad integer, _direccion text, _telefono bigint, _correo text, _session text, _contrasena text, _id_rol integer);
       usuario       postgres    false    6         �            1259    32803 	   calificar    TABLE     �   CREATE TABLE local.calificar (
    id_calificar bigint NOT NULL,
    id_local integer NOT NULL,
    doc_identidad text NOT NULL,
    descripcion text NOT NULL,
    fecha date NOT NULL,
    puntaje smallint NOT NULL
);
    DROP TABLE local.calificar;
       local         postgres    false    5         �           0    0    TABLE calificar    COMMENT     a   COMMENT ON TABLE local.calificar IS 'Tabla de datos para almacenar los atributos de Calificar.';
            local       postgres    false    207         �            1259    32801    calificar_id_calificar_seq    SEQUENCE     �   CREATE SEQUENCE local.calificar_id_calificar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE local.calificar_id_calificar_seq;
       local       postgres    false    5    207         �           0    0    calificar_id_calificar_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE local.calificar_id_calificar_seq OWNED BY local.calificar.id_calificar;
            local       postgres    false    206         �            1259    32812    categoria_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE local.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE local.categoria_id_categoria_seq;
       local       postgres    false    209    5         �           0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE local.categoria_id_categoria_seq OWNED BY local.categoria.id_categoria;
            local       postgres    false    208         �            1259    33967    comida_id_comida_seq    SEQUENCE     |   CREATE SEQUENCE local.comida_id_comida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE local.comida_id_comida_seq;
       local       postgres    false    216    5         �           0    0    comida_id_comida_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE local.comida_id_comida_seq OWNED BY local.comida.id_comida;
            local       postgres    false    215         �            1259    32836    factura    TABLE     �   CREATE TABLE local.factura (
    id_factura bigint NOT NULL,
    fecha date NOT NULL,
    id_pago integer NOT NULL,
    id_pedido integer NOT NULL
);
    DROP TABLE local.factura;
       local         postgres    false    5         �           0    0    TABLE factura    COMMENT     ]   COMMENT ON TABLE local.factura IS 'Tabla de datos para almacenar los atributos de Factura.';
            local       postgres    false    213         �            1259    32834    factura_id_factura_seq    SEQUENCE     ~   CREATE SEQUENCE local.factura_id_factura_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE local.factura_id_factura_seq;
       local       postgres    false    213    5         �           0    0    factura_id_factura_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE local.factura_id_factura_seq OWNED BY local.factura.id_factura;
            local       postgres    false    212         �            1259    24614    local    TABLE     	  CREATE TABLE local.local (
    id_local bigint NOT NULL,
    nombre text NOT NULL,
    eslogan text NOT NULL,
    ciudad text NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    doc_identidad text NOT NULL,
    id_categoria integer NOT NULL
);
    DROP TABLE local.local;
       local         postgres    false    5         �           0    0    TABLE local    COMMENT     Y   COMMENT ON TABLE local.local IS 'Tabla de datos para almacenar los atributos de Local.';
            local       postgres    false    202         �            1259    24612    local_id_local_seq    SEQUENCE     z   CREATE SEQUENCE local.local_id_local_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE local.local_id_local_seq;
       local       postgres    false    202    5         �           0    0    local_id_local_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE local.local_id_local_seq OWNED BY local.local.id_local;
            local       postgres    false    201         �            1259    32825    pago    TABLE     Y   CREATE TABLE local.pago (
    id_pago integer NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE local.pago;
       local         postgres    false    5         �           0    0 
   TABLE pago    COMMENT     W   COMMENT ON TABLE local.pago IS 'Tabla de datos para almacenar los atributos de Pago.';
            local       postgres    false    211         �            1259    32823    pago_id_pago_seq    SEQUENCE     �   CREATE SEQUENCE local.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE local.pago_id_pago_seq;
       local       postgres    false    211    5         �           0    0    pago_id_pago_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE local.pago_id_pago_seq OWNED BY local.pago.id_pago;
            local       postgres    false    210         �            1259    32792    pedido    TABLE     �   CREATE TABLE local.pedido (
    id_pedido bigint NOT NULL,
    id_local integer NOT NULL,
    doc_identidad text NOT NULL,
    lista_ped json NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    total integer NOT NULL
);
    DROP TABLE local.pedido;
       local         postgres    false    5         �           0    0    TABLE pedido    COMMENT     [   COMMENT ON TABLE local.pedido IS 'Tabla de datos para almacenar los atributos de Pedido.';
            local       postgres    false    205         �            1259    32790    pedido_id_pedido_seq    SEQUENCE     |   CREATE SEQUENCE local.pedido_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE local.pedido_id_pedido_seq;
       local       postgres    false    205    5         �           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE local.pedido_id_pedido_seq OWNED BY local.pedido.id_pedido;
            local       postgres    false    204         �            1259    33989    pedidoopcional    TABLE       CREATE TABLE local.pedidoopcional (
    id_pedido bigint NOT NULL,
    id_local bigint NOT NULL,
    doc_identidad text NOT NULL,
    cantidad integer NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    total integer NOT NULL,
    id_comida bigint NOT NULL
);
 !   DROP TABLE local.pedidoopcional;
       local         postgres    false    5         �           0    0    TABLE pedidoopcional    COMMENT     e   COMMENT ON TABLE local.pedidoopcional IS 'Tabla de datos para hacer el pedido en el primer sprint.';
            local       postgres    false    218         �            1259    33987    pedidoopcional_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE local.pedidoopcional_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE local.pedidoopcional_id_pedido_seq;
       local       postgres    false    5    218         �           0    0    pedidoopcional_id_pedido_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE local.pedidoopcional_id_pedido_seq OWNED BY local.pedidoopcional.id_pedido;
            local       postgres    false    217         �            1259    24603    estado    TABLE     _   CREATE TABLE usuario.estado (
    id_estado integer NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE usuario.estado;
       usuario         postgres    false    6         �           0    0    TABLE estado    COMMENT     ]   COMMENT ON TABLE usuario.estado IS 'Tabla de datos para almacenar los atributos de Estado.';
            usuario       postgres    false    200         �            1259    24601    estado_id_estado_seq    SEQUENCE     �   CREATE SEQUENCE usuario.estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE usuario.estado_id_estado_seq;
       usuario       postgres    false    6    200         �           0    0    estado_id_estado_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE usuario.estado_id_estado_seq OWNED BY usuario.estado.id_estado;
            usuario       postgres    false    199         �            1259    24592    rol    TABLE     Y   CREATE TABLE usuario.rol (
    id_rol integer NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE usuario.rol;
       usuario         postgres    false    6         �           0    0 	   TABLE rol    COMMENT     W   COMMENT ON TABLE usuario.rol IS 'Tabla de datos para almacenar los atributos de Rol.';
            usuario       postgres    false    198         �            1259    24590    rol_id_rol_seq    SEQUENCE     �   CREATE SEQUENCE usuario.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE usuario.rol_id_rol_seq;
       usuario       postgres    false    6    198         �           0    0    rol_id_rol_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE usuario.rol_id_rol_seq OWNED BY usuario.rol.id_rol;
            usuario       postgres    false    197         �
           2604    33462    calificar id_calificar    DEFAULT     ~   ALTER TABLE ONLY local.calificar ALTER COLUMN id_calificar SET DEFAULT nextval('local.calificar_id_calificar_seq'::regclass);
 D   ALTER TABLE local.calificar ALTER COLUMN id_calificar DROP DEFAULT;
       local       postgres    false    206    207    207         �
           2604    33463    categoria id_categoria    DEFAULT     ~   ALTER TABLE ONLY local.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('local.categoria_id_categoria_seq'::regclass);
 D   ALTER TABLE local.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       local       postgres    false    209    208    209         �
           2604    33972    comida id_comida    DEFAULT     r   ALTER TABLE ONLY local.comida ALTER COLUMN id_comida SET DEFAULT nextval('local.comida_id_comida_seq'::regclass);
 >   ALTER TABLE local.comida ALTER COLUMN id_comida DROP DEFAULT;
       local       postgres    false    215    216    216         �
           2604    33465    factura id_factura    DEFAULT     v   ALTER TABLE ONLY local.factura ALTER COLUMN id_factura SET DEFAULT nextval('local.factura_id_factura_seq'::regclass);
 @   ALTER TABLE local.factura ALTER COLUMN id_factura DROP DEFAULT;
       local       postgres    false    212    213    213         �
           2604    33466    local id_local    DEFAULT     n   ALTER TABLE ONLY local.local ALTER COLUMN id_local SET DEFAULT nextval('local.local_id_local_seq'::regclass);
 <   ALTER TABLE local.local ALTER COLUMN id_local DROP DEFAULT;
       local       postgres    false    201    202    202         �
           2604    33467    pago id_pago    DEFAULT     j   ALTER TABLE ONLY local.pago ALTER COLUMN id_pago SET DEFAULT nextval('local.pago_id_pago_seq'::regclass);
 :   ALTER TABLE local.pago ALTER COLUMN id_pago DROP DEFAULT;
       local       postgres    false    210    211    211         �
           2604    33468    pedido id_pedido    DEFAULT     r   ALTER TABLE ONLY local.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('local.pedido_id_pedido_seq'::regclass);
 >   ALTER TABLE local.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       local       postgres    false    204    205    205         �
           2604    33992    pedidoopcional id_pedido    DEFAULT     �   ALTER TABLE ONLY local.pedidoopcional ALTER COLUMN id_pedido SET DEFAULT nextval('local.pedidoopcional_id_pedido_seq'::regclass);
 F   ALTER TABLE local.pedidoopcional ALTER COLUMN id_pedido DROP DEFAULT;
       local       postgres    false    217    218    218         �
           2604    33469    estado id_estado    DEFAULT     v   ALTER TABLE ONLY usuario.estado ALTER COLUMN id_estado SET DEFAULT nextval('usuario.estado_id_estado_seq'::regclass);
 @   ALTER TABLE usuario.estado ALTER COLUMN id_estado DROP DEFAULT;
       usuario       postgres    false    200    199    200         �
           2604    33470 
   rol id_rol    DEFAULT     j   ALTER TABLE ONLY usuario.rol ALTER COLUMN id_rol SET DEFAULT nextval('usuario.rol_id_rol_seq'::regclass);
 :   ALTER TABLE usuario.rol ALTER COLUMN id_rol DROP DEFAULT;
       usuario       postgres    false    198    197    198         �          0    32803 	   calificar 
   TABLE DATA               f   COPY local.calificar (id_calificar, id_local, doc_identidad, descripcion, fecha, puntaje) FROM stdin;
    local       postgres    false    207       2963.dat �          0    32814 	   categoria 
   TABLE DATA               =   COPY local.categoria (id_categoria, descripcion) FROM stdin;
    local       postgres    false    209       2965.dat �          0    33969    comida 
   TABLE DATA               n   COPY local.comida (id_comida, nombre, descripcion, precio, cantidad_disponible, imagen, id_local) FROM stdin;
    local       postgres    false    216       2971.dat �          0    32836    factura 
   TABLE DATA               G   COPY local.factura (id_factura, fecha, id_pago, id_pedido) FROM stdin;
    local       postgres    false    213       2969.dat �          0    24614    local 
   TABLE DATA               s   COPY local.local (id_local, nombre, eslogan, ciudad, direccion, telefono, doc_identidad, id_categoria) FROM stdin;
    local       postgres    false    202       2958.dat �          0    32825    pago 
   TABLE DATA               3   COPY local.pago (id_pago, descripcion) FROM stdin;
    local       postgres    false    211       2967.dat �          0    32792    pedido 
   TABLE DATA               j   COPY local.pedido (id_pedido, id_local, doc_identidad, lista_ped, direccion, telefono, total) FROM stdin;
    local       postgres    false    205       2961.dat �          0    33989    pedidoopcional 
   TABLE DATA               |   COPY local.pedidoopcional (id_pedido, id_local, doc_identidad, cantidad, direccion, telefono, total, id_comida) FROM stdin;
    local       postgres    false    218       2973.dat �          0    24603    estado 
   TABLE DATA               9   COPY usuario.estado (id_estado, descripcion) FROM stdin;
    usuario       postgres    false    200       2956.dat �          0    24592    rol 
   TABLE DATA               3   COPY usuario.rol (id_rol, descripcion) FROM stdin;
    usuario       postgres    false    198       2954.dat �          0    24623    usuario 
   TABLE DATA               �   COPY usuario.usuario (doc_identidad, nombre, apellido, edad, direccion, telefono, correo, session, contrasena, id_rol, id_estado) FROM stdin;
    usuario       postgres    false    203       2959.dat �           0    0    calificar_id_calificar_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('local.calificar_id_calificar_seq', 1, false);
            local       postgres    false    206         �           0    0    categoria_id_categoria_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('local.categoria_id_categoria_seq', 6, true);
            local       postgres    false    208         �           0    0    comida_id_comida_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('local.comida_id_comida_seq', 6, true);
            local       postgres    false    215         �           0    0    factura_id_factura_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('local.factura_id_factura_seq', 1, false);
            local       postgres    false    212         �           0    0    local_id_local_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('local.local_id_local_seq', 24, true);
            local       postgres    false    201         �           0    0    pago_id_pago_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('local.pago_id_pago_seq', 1, false);
            local       postgres    false    210         �           0    0    pedido_id_pedido_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('local.pedido_id_pedido_seq', 1, false);
            local       postgres    false    204         �           0    0    pedidoopcional_id_pedido_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('local.pedidoopcional_id_pedido_seq', 5, true);
            local       postgres    false    217         �           0    0    estado_id_estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('usuario.estado_id_estado_seq', 1, false);
            usuario       postgres    false    199         �           0    0    rol_id_rol_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('usuario.rol_id_rol_seq', 1, false);
            usuario       postgres    false    197         �
           2606    32811    calificar calificar_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY local.calificar
    ADD CONSTRAINT calificar_pkey PRIMARY KEY (id_calificar);
 A   ALTER TABLE ONLY local.calificar DROP CONSTRAINT calificar_pkey;
       local         postgres    false    207         �
           2606    32822    categoria categoria_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY local.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);
 A   ALTER TABLE ONLY local.categoria DROP CONSTRAINT categoria_pkey;
       local         postgres    false    209         �
           2606    33977    comida comida_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY local.comida
    ADD CONSTRAINT comida_pkey PRIMARY KEY (id_comida);
 ;   ALTER TABLE ONLY local.comida DROP CONSTRAINT comida_pkey;
       local         postgres    false    216         �
           2606    32841    factura factura_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY local.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);
 =   ALTER TABLE ONLY local.factura DROP CONSTRAINT factura_pkey;
       local         postgres    false    213         �
           2606    24622    local local_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY local.local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id_local);
 9   ALTER TABLE ONLY local.local DROP CONSTRAINT local_pkey;
       local         postgres    false    202         �
           2606    32833    pago pago_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY local.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);
 7   ALTER TABLE ONLY local.pago DROP CONSTRAINT pago_pkey;
       local         postgres    false    211         �
           2606    32800    pedido pedido_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY local.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 ;   ALTER TABLE ONLY local.pedido DROP CONSTRAINT pedido_pkey;
       local         postgres    false    205                    2606    33997 "   pedidoopcional pedidoopcional_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY local.pedidoopcional
    ADD CONSTRAINT pedidoopcional_pkey PRIMARY KEY (id_pedido);
 K   ALTER TABLE ONLY local.pedidoopcional DROP CONSTRAINT pedidoopcional_pkey;
       local         postgres    false    218         �
           2606    24630    usuario doc_identidad_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY usuario.usuario
    ADD CONSTRAINT doc_identidad_pkey PRIMARY KEY (doc_identidad);
 E   ALTER TABLE ONLY usuario.usuario DROP CONSTRAINT doc_identidad_pkey;
       usuario         postgres    false    203         �
           2606    24611    estado estado_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY usuario.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);
 =   ALTER TABLE ONLY usuario.estado DROP CONSTRAINT estado_pkey;
       usuario         postgres    false    200         �
           2606    24600    rol rol_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY usuario.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);
 7   ALTER TABLE ONLY usuario.rol DROP CONSTRAINT rol_pkey;
       usuario         postgres    false    198         �
           1259    32894    fki_fk_calificar_local    INDEX     O   CREATE INDEX fki_fk_calificar_local ON local.calificar USING btree (id_local);
 )   DROP INDEX local.fki_fk_calificar_local;
       local         postgres    false    207         �
           1259    32900    fki_fk_calificar_usuario    INDEX     V   CREATE INDEX fki_fk_calificar_usuario ON local.calificar USING btree (doc_identidad);
 +   DROP INDEX local.fki_fk_calificar_usuario;
       local         postgres    false    207                     1259    33984    fki_fk_comida_local    INDEX     I   CREATE INDEX fki_fk_comida_local ON local.comida USING btree (id_local);
 &   DROP INDEX local.fki_fk_comida_local;
       local         postgres    false    216         �
           1259    32906    fki_fk_factura_pago    INDEX     I   CREATE INDEX fki_fk_factura_pago ON local.factura USING btree (id_pago);
 &   DROP INDEX local.fki_fk_factura_pago;
       local         postgres    false    213         �
           1259    32912    fki_fk_factura_pedido    INDEX     M   CREATE INDEX fki_fk_factura_pedido ON local.factura USING btree (id_pedido);
 (   DROP INDEX local.fki_fk_factura_pedido;
       local         postgres    false    213         �
           1259    32864    fki_fk_local_categoria    INDEX     O   CREATE INDEX fki_fk_local_categoria ON local.local USING btree (id_categoria);
 )   DROP INDEX local.fki_fk_local_categoria;
       local         postgres    false    202         �
           1259    32870    fki_fk_local_usuario    INDEX     N   CREATE INDEX fki_fk_local_usuario ON local.local USING btree (doc_identidad);
 '   DROP INDEX local.fki_fk_local_usuario;
       local         postgres    false    202         �
           1259    32882    fki_fk_pedido_local    INDEX     I   CREATE INDEX fki_fk_pedido_local ON local.pedido USING btree (id_local);
 &   DROP INDEX local.fki_fk_pedido_local;
       local         postgres    false    205         �
           1259    32888    fki_fk_pedido_usuario    INDEX     P   CREATE INDEX fki_fk_pedido_usuario ON local.pedido USING btree (doc_identidad);
 (   DROP INDEX local.fki_fk_pedido_usuario;
       local         postgres    false    205         �
           1259    32858    fki_fk_usuario_estado    INDEX     O   CREATE INDEX fki_fk_usuario_estado ON usuario.usuario USING btree (id_estado);
 *   DROP INDEX usuario.fki_fk_usuario_estado;
       usuario         postgres    false    203         �
           1259    32847    fki_usuario_rol    INDEX     F   CREATE INDEX fki_usuario_rol ON usuario.usuario USING btree (id_rol);
 $   DROP INDEX usuario.fki_usuario_rol;
       usuario         postgres    false    203         	           2606    33562    calificar fk_calificar_local    FK CONSTRAINT     �   ALTER TABLE ONLY local.calificar
    ADD CONSTRAINT fk_calificar_local FOREIGN KEY (id_local) REFERENCES local.local(id_local);
 E   ALTER TABLE ONLY local.calificar DROP CONSTRAINT fk_calificar_local;
       local       postgres    false    202    2793    207         
           2606    33567    calificar fk_calificar_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY local.calificar
    ADD CONSTRAINT fk_calificar_usuario FOREIGN KEY (doc_identidad) REFERENCES usuario.usuario(doc_identidad);
 G   ALTER TABLE ONLY local.calificar DROP CONSTRAINT fk_calificar_usuario;
       local       postgres    false    207    203    2795                    2606    33979    comida fk_comida_local    FK CONSTRAINT     z   ALTER TABLE ONLY local.comida
    ADD CONSTRAINT fk_comida_local FOREIGN KEY (id_local) REFERENCES local.local(id_local);
 ?   ALTER TABLE ONLY local.comida DROP CONSTRAINT fk_comida_local;
       local       postgres    false    202    2793    216                    2606    33547    factura fk_factura_pago    FK CONSTRAINT     x   ALTER TABLE ONLY local.factura
    ADD CONSTRAINT fk_factura_pago FOREIGN KEY (id_pago) REFERENCES local.pago(id_pago);
 @   ALTER TABLE ONLY local.factura DROP CONSTRAINT fk_factura_pago;
       local       postgres    false    2809    211    213                    2606    33552    factura fk_factura_pedido    FK CONSTRAINT     �   ALTER TABLE ONLY local.factura
    ADD CONSTRAINT fk_factura_pedido FOREIGN KEY (id_pedido) REFERENCES local.pedido(id_pedido);
 B   ALTER TABLE ONLY local.factura DROP CONSTRAINT fk_factura_pedido;
       local       postgres    false    205    2801    213                    2606    33537    local fk_local_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY local.local
    ADD CONSTRAINT fk_local_categoria FOREIGN KEY (id_categoria) REFERENCES local.categoria(id_categoria);
 A   ALTER TABLE ONLY local.local DROP CONSTRAINT fk_local_categoria;
       local       postgres    false    202    2807    209                    2606    33542    local fk_local_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY local.local
    ADD CONSTRAINT fk_local_usuario FOREIGN KEY (doc_identidad) REFERENCES usuario.usuario(doc_identidad);
 ?   ALTER TABLE ONLY local.local DROP CONSTRAINT fk_local_usuario;
       local       postgres    false    203    202    2795                    2606    33527    pedido fk_pedido_local    FK CONSTRAINT     z   ALTER TABLE ONLY local.pedido
    ADD CONSTRAINT fk_pedido_local FOREIGN KEY (id_local) REFERENCES local.local(id_local);
 ?   ALTER TABLE ONLY local.pedido DROP CONSTRAINT fk_pedido_local;
       local       postgres    false    2793    202    205                    2606    33532    pedido fk_pedido_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY local.pedido
    ADD CONSTRAINT fk_pedido_usuario FOREIGN KEY (doc_identidad) REFERENCES usuario.usuario(doc_identidad);
 A   ALTER TABLE ONLY local.pedido DROP CONSTRAINT fk_pedido_usuario;
       local       postgres    false    205    2795    203                    2606    33477    usuario fk_usuario_estado    FK CONSTRAINT     �   ALTER TABLE ONLY usuario.usuario
    ADD CONSTRAINT fk_usuario_estado FOREIGN KEY (id_estado) REFERENCES usuario.estado(id_estado);
 D   ALTER TABLE ONLY usuario.usuario DROP CONSTRAINT fk_usuario_estado;
       usuario       postgres    false    2789    203    200                    2606    33482    usuario fk_usuario_rol    FK CONSTRAINT     x   ALTER TABLE ONLY usuario.usuario
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES usuario.rol(id_rol);
 A   ALTER TABLE ONLY usuario.usuario DROP CONSTRAINT fk_usuario_rol;
       usuario       postgres    false    203    2787    198                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2963.dat                                                                                            0000600 0004000 0002000 00000000005 13650326351 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2965.dat                                                                                            0000600 0004000 0002000 00000000060 13650326351 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Vegetariana
2	Tex-Mex
5	Nikkei
6	Helados
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                2971.dat                                                                                            0000600 0004000 0002000 00000000433 13650326351 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Tofu marinado	Delicioso tofu marinado con jengibre, sesámo, tomate, chalota y aguacate.	12000	10	1	21
3	Pasta	Deliciosa pasta con calabacín y guisantes.	5000	20	1	21
4	Hamburguesa vegetariana	Deliciosa hamburguesa vegetariana con calabacín y semillas de chía.	8000	0	1	21
\.


                                                                                                                                                                                                                                     2969.dat                                                                                            0000600 0004000 0002000 00000000005 13650326351 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2958.dat                                                                                            0000600 0004000 0002000 00000000250 13650326351 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        21	Gambi	Comida vegetariana, tú mejor opción	Villeta	Bello Horizonte	3222695187	1077976549	1
24	Rolls	Tus mejores helados	Villeta	Parque	3124530928	1077976549	6
\.


                                                                                                                                                                                                                                                                                                                                                        2967.dat                                                                                            0000600 0004000 0002000 00000000005 13650326351 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2961.dat                                                                                            0000600 0004000 0002000 00000000005 13650326351 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2973.dat                                                                                            0000600 0004000 0002000 00000000347 13650326351 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	21	1077976549	1	Villeta	3222695187	12000	2
2	21	1077976549	3	Facatativa	3222695187	15000	3
3	21	1077976549	1	Villeta	3222695187	8000	4
4	21	1077976549	1	Villeta	3222695187	8000	4
5	21	1077976549	3	Villeta	3222695187	24000	4
\.


                                                                                                                                                                                                                                                                                         2956.dat                                                                                            0000600 0004000 0002000 00000000031 13650326351 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Activo
2	Inactivo
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       2954.dat                                                                                            0000600 0004000 0002000 00000000065 13650326351 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Super administrador
2	Administrador
3	Cliente
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2959.dat                                                                                            0000600 0004000 0002000 00000000344 13650326351 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1077976549	Andres	Tinoco	20	Facatativa	3222695187	atinoco@ucundinamarca.edu.co	kimlr5itwj5tnnjyqo5tlcft	acamilo	2	1
1077976548	Camilo	Barreto	20	Villeta	3222695187	kmilo1873@hotmail.com	pdjha2lcnnquwje5wdujqgjh	atinoco	2	1
\.


                                                                                                                                                                                                                                                                                            restore.sql                                                                                         0000600 0004000 0002000 00000103753 13650326351 0015401 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

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

DROP DATABASE worldeats;
--
-- Name: worldeats; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE worldeats WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';


ALTER DATABASE worldeats OWNER TO postgres;

\connect worldeats

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

--
-- Name: DATABASE worldeats; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE worldeats IS 'Base de datos para la plataforma web Worl Eats. ';


--
-- Name: local; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA local;


ALTER SCHEMA local OWNER TO postgres;

--
-- Name: SCHEMA local; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA local IS 'Esquema para almacenar las tablas de datos que tengan relación con el local.';


--
-- Name: usuario; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA usuario;


ALTER SCHEMA usuario OWNER TO postgres;

--
-- Name: SCHEMA usuario; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA usuario IS 'Esquema para almacenar las tablas de datos que tengan relación con el usuario.';


--
-- Name: f_eliminar_comida(bigint); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_eliminar_comida(_id_comida bigint) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
		BEGIN
			DELETE 
			FROM
				local.comida lc
			WHERE lc.id_comida = _id_comida;
			RETURN QUERY SELECT true;
		END
	$$;


ALTER FUNCTION local.f_eliminar_comida(_id_comida bigint) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categoria; Type: TABLE; Schema: local; Owner: postgres
--

CREATE TABLE local.categoria (
    id_categoria integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE local.categoria OWNER TO postgres;

--
-- Name: TABLE categoria; Type: COMMENT; Schema: local; Owner: postgres
--

COMMENT ON TABLE local.categoria IS 'Tabla de datos para almacenar los atributos de Categoría.';


--
-- Name: f_leer_categoria(); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_leer_categoria() RETURNS SETOF local.categoria
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT 
				lc.*
			FROM 
				local.categoria lc;
		END;
	$$;


ALTER FUNCTION local.f_leer_categoria() OWNER TO postgres;

--
-- Name: comida; Type: TABLE; Schema: local; Owner: postgres
--

CREATE TABLE local.comida (
    id_comida bigint NOT NULL,
    nombre text NOT NULL,
    descripcion text NOT NULL,
    precio integer NOT NULL,
    cantidad_disponible integer NOT NULL,
    imagen text NOT NULL,
    id_local bigint NOT NULL
);


ALTER TABLE local.comida OWNER TO postgres;

--
-- Name: TABLE comida; Type: COMMENT; Schema: local; Owner: postgres
--

COMMENT ON TABLE local.comida IS 'Tabla de datos para almacenar los atributos de Comida.';


--
-- Name: f_leer_comida(); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_leer_comida() RETURNS SETOF local.comida
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT 
				ll.*
			FROM 
				local.comida ll;
		END;
	$$;


ALTER FUNCTION local.f_leer_comida() OWNER TO postgres;

--
-- Name: f_leer_comida1(text); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_leer_comida1(_doc text) RETURNS SETOF local.comida
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT 
				lc.*
			FROM 
				local.comida lc
			JOIN local.local ll ON lc.id_local = ll.id_local AND ll.doc_identidad = _doc;
		END;
	$$;


ALTER FUNCTION local.f_leer_comida1(_doc text) OWNER TO postgres;

--
-- Name: v_local; Type: VIEW; Schema: local; Owner: postgres
--

CREATE VIEW local.v_local AS
 SELECT (0)::bigint AS id_local,
    ''::text AS nombre,
    ''::text AS eslogan,
    ''::text AS ciudad,
    ''::text AS direccion,
    (0)::bigint AS telefono,
    ''::text AS doc_identidad;


ALTER TABLE local.v_local OWNER TO postgres;

--
-- Name: f_leer_local(); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_leer_local() RETURNS SETOF local.v_local
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT 
				ll.id_local,
				ll.nombre,
				ll.eslogan,
				ll.ciudad,
				ll.direccion,
				ll.telefono,
				ll.doc_identidad
			FROM 
				local.local ll;
		END;
	$$;


ALTER FUNCTION local.f_leer_local() OWNER TO postgres;

--
-- Name: v_pedido; Type: VIEW; Schema: local; Owner: postgres
--

CREATE VIEW local.v_pedido AS
 SELECT (0)::bigint AS id_local,
    ''::text AS nombre_local,
    ''::text AS nombre_comida,
    (0)::text AS documento,
    0 AS cantidad,
    ''::text AS direccion,
    (0)::bigint AS telefono,
    0 AS total;


ALTER TABLE local.v_pedido OWNER TO postgres;

--
-- Name: f_leer_pedido(); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_leer_pedido() RETURNS SETOF local.v_pedido
    LANGUAGE plpgsql
    AS $$ 
		BEGIN 
			RETURN QUERY 
			SELECT
				ll.id_local,
				ll.nombre,
				lc.nombre,
				lp.doc_identidad,
				lp.cantidad,
				lp.direccion,
				lp.telefono,
				lp.total
			FROM 
				local.pedidoopcional lp
			JOIN local.local ll ON ll.id_local = lp.id_local
			JOIN local.comida lc ON lc.id_comida = lp.id_comida;
		END;
	$$;


ALTER FUNCTION local.f_leer_pedido() OWNER TO postgres;

--
-- Name: f_registrar_categoria(text); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_registrar_categoria(_descripcion text) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
		BEGIN
			INSERT INTO local.categoria
				(
					descripcion
				)
			VALUES
				(
					_descripcion
				);
			RETURN QUERY SELECT true;
		END
	$$;


ALTER FUNCTION local.f_registrar_categoria(_descripcion text) OWNER TO postgres;

--
-- Name: f_registrar_comida(text, text, integer, integer, bigint); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_registrar_comida(_nombre text, _descripcion text, _precio integer, _cantidad_disponible integer, _id_local bigint) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
		BEGIN
			INSERT INTO local.comida
				(
					nombre,
					descripcion,
					precio,
					cantidad_disponible,
					imagen,
					id_local
				)
			VALUES
				(
					_nombre,
					_descripcion,
					_precio,
					_cantidad_disponible,
					'imagen',
					_id_local
				);
			RETURN QUERY SELECT true;
		END
	$$;


ALTER FUNCTION local.f_registrar_comida(_nombre text, _descripcion text, _precio integer, _cantidad_disponible integer, _id_local bigint) OWNER TO postgres;

--
-- Name: f_registrar_local(text, text, text, text, bigint, text, integer); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_registrar_local(_nombre text, _eslogan text, _ciudad text, _direccion text, _telefono bigint, _doc_identidad text, _id_categoria integer) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
		BEGIN
			INSERT INTO local.local
				(
					nombre,
					eslogan,
					ciudad,
					direccion,
					telefono,
					doc_identidad,
					id_categoria
				)
			VALUES
				(
					_nombre,
					_eslogan,
					_ciudad,
					_direccion,
					_telefono,
					_doc_identidad,
					_id_categoria
				);
			RETURN QUERY SELECT true;
		END
	$$;


ALTER FUNCTION local.f_registrar_local(_nombre text, _eslogan text, _ciudad text, _direccion text, _telefono bigint, _doc_identidad text, _id_categoria integer) OWNER TO postgres;

--
-- Name: f_registrar_pedido(bigint, text, integer, text, bigint, bigint); Type: FUNCTION; Schema: local; Owner: postgres
--

CREATE FUNCTION local.f_registrar_pedido(_id_local bigint, _doc_identidad text, _cantidad integer, _direccion text, _telefono bigint, _id_comida bigint) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
	DECLARE
	_precio integer;
	_total integer;
		BEGIN
			_precio := (SELECT lc.precio FROM local.comida lc WHERE lc.id_comida = _id_comida);
			_total := _cantidad * _precio;
			INSERT INTO local.pedidoopcional
				(
					id_local,
					doc_identidad,
					cantidad,
					direccion,
					telefono,
					total,
					id_comida
				)
			VALUES
				(
					_id_local,
					_doc_identidad,
					_cantidad,
					_direccion,
					_telefono,
					_total,
					_id_comida
				);
			UPDATE local.comida
			SET 
				cantidad_disponible = cantidad_disponible - _cantidad
			WHERE 
				id_comida = _id_comida;
			RETURN QUERY SELECT true;
		END
	$$;


ALTER FUNCTION local.f_registrar_pedido(_id_local bigint, _doc_identidad text, _cantidad integer, _direccion text, _telefono bigint, _id_comida bigint) OWNER TO postgres;

--
-- Name: f_editar_usuario(text, text, text, integer, text, bigint, text, text, text); Type: FUNCTION; Schema: usuario; Owner: postgres
--

CREATE FUNCTION usuario.f_editar_usuario(_doc_identidad text, _nombre text, _apellido text, _edad integer, _direccion text, _telefono bigint, _correo text, _session text, _contrasena text) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
	DECLARE 
	_filtro text;
	BEGIN
		_filtro := (SELECT doc_identidad FROM usuario.usuario WHERE doc_identidad = _doc_identidad);
		IF NOT _filtro <> _doc_identidad
			THEN 
				UPDATE usuario.usuario
				SET 
					doc_identidad = _doc_identidad,
					nombre = _nombre,
					apellido = _apellido,
					edad = _edad,
					direccion = _direccion,
					telefono = _telefono,
					correo = _correo,
					session = _session,
					contrasena = _contrasena
				WHERE
					doc_identidad = _doc_identidad;
				RETURN QUERY SELECT true;
			ELSE 
				RETURN QUERY SELECT false;
		END IF;
	END
$$;


ALTER FUNCTION usuario.f_editar_usuario(_doc_identidad text, _nombre text, _apellido text, _edad integer, _direccion text, _telefono bigint, _correo text, _session text, _contrasena text) OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: usuario; Owner: postgres
--

CREATE TABLE usuario.usuario (
    doc_identidad text NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    edad integer NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    correo text NOT NULL,
    session text NOT NULL,
    contrasena text NOT NULL,
    id_rol integer NOT NULL,
    id_estado integer NOT NULL
);


ALTER TABLE usuario.usuario OWNER TO postgres;

--
-- Name: TABLE usuario; Type: COMMENT; Schema: usuario; Owner: postgres
--

COMMENT ON TABLE usuario.usuario IS 'Tabla de datos para almacenar los atributos de Usuario.';


--
-- Name: f_iniciar_sesion(text, text); Type: FUNCTION; Schema: usuario; Owner: postgres
--

CREATE FUNCTION usuario.f_iniciar_sesion(_doc_identidad text, _contrasena text) RETURNS SETOF usuario.usuario
    LANGUAGE plpgsql
    AS $$
	BEGIN 
		IF (SELECT COUNT (*) FROM usuario.usuario uu WHERE uu.doc_identidad = _doc_identidad AND uu.contrasena = _contrasena AND uu.id_estado = 1) > 0
			THEN 
				RETURN QUERY 
				SELECT
					uu.*
				FROM usuario.usuario uu
				WHERE uu.doc_identidad = _doc_identidad AND uu.contrasena = _contrasena	AND uu.id_estado = 1;	
		END IF;
	END;
$$;


ALTER FUNCTION usuario.f_iniciar_sesion(_doc_identidad text, _contrasena text) OWNER TO postgres;

--
-- Name: f_leer_usuario(); Type: FUNCTION; Schema: usuario; Owner: postgres
--

CREATE FUNCTION usuario.f_leer_usuario() RETURNS SETOF usuario.usuario
    LANGUAGE plpgsql
    AS $$
	BEGIN
		RETURN QUERY
		SELECT 
			uu.*
		FROM 
			usuario.usuario uu;
	END;
$$;


ALTER FUNCTION usuario.f_leer_usuario() OWNER TO postgres;

--
-- Name: f_registrar_usuario(text, text, text, integer, text, bigint, text, text, text, integer); Type: FUNCTION; Schema: usuario; Owner: postgres
--

CREATE FUNCTION usuario.f_registrar_usuario(_doc_identidad text, _nombre text, _apellido text, _edad integer, _direccion text, _telefono bigint, _correo text, _session text, _contrasena text, _id_rol integer) RETURNS SETOF boolean
    LANGUAGE plpgsql
    AS $$
	BEGIN 
		IF (SELECT COUNT (*) FROM usuario.usuario uu WHERE uu.doc_identidad = _doc_identidad) = 0
			THEN 
				INSERT INTO usuario.usuario
				(
					doc_identidad,
					nombre,
					apellido,
					edad,
					direccion,
					telefono,
					correo,
					session,
					contrasena,
					id_rol,
					id_estado
				)
				VALUES
				(
					_doc_identidad,
					_nombre,
					_apellido,
					_edad,
					_direccion,
					_telefono,
					_correo,
					_session,
					_contrasena,
					_id_rol,
					1
				);
			RETURN QUERY SELECT true;
		ELSE
			RETURN QUERY SELECT false;
		END IF;
	END;
$$;


ALTER FUNCTION usuario.f_registrar_usuario(_doc_identidad text, _nombre text, _apellido text, _edad integer, _direccion text, _telefono bigint, _correo text, _session text, _contrasena text, _id_rol integer) OWNER TO postgres;

--
-- Name: calificar; Type: TABLE; Schema: local; Owner: postgres
--

CREATE TABLE local.calificar (
    id_calificar bigint NOT NULL,
    id_local integer NOT NULL,
    doc_identidad text NOT NULL,
    descripcion text NOT NULL,
    fecha date NOT NULL,
    puntaje smallint NOT NULL
);


ALTER TABLE local.calificar OWNER TO postgres;

--
-- Name: TABLE calificar; Type: COMMENT; Schema: local; Owner: postgres
--

COMMENT ON TABLE local.calificar IS 'Tabla de datos para almacenar los atributos de Calificar.';


--
-- Name: calificar_id_calificar_seq; Type: SEQUENCE; Schema: local; Owner: postgres
--

CREATE SEQUENCE local.calificar_id_calificar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local.calificar_id_calificar_seq OWNER TO postgres;

--
-- Name: calificar_id_calificar_seq; Type: SEQUENCE OWNED BY; Schema: local; Owner: postgres
--

ALTER SEQUENCE local.calificar_id_calificar_seq OWNED BY local.calificar.id_calificar;


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: local; Owner: postgres
--

CREATE SEQUENCE local.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local.categoria_id_categoria_seq OWNER TO postgres;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: local; Owner: postgres
--

ALTER SEQUENCE local.categoria_id_categoria_seq OWNED BY local.categoria.id_categoria;


--
-- Name: comida_id_comida_seq; Type: SEQUENCE; Schema: local; Owner: postgres
--

CREATE SEQUENCE local.comida_id_comida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local.comida_id_comida_seq OWNER TO postgres;

--
-- Name: comida_id_comida_seq; Type: SEQUENCE OWNED BY; Schema: local; Owner: postgres
--

ALTER SEQUENCE local.comida_id_comida_seq OWNED BY local.comida.id_comida;


--
-- Name: factura; Type: TABLE; Schema: local; Owner: postgres
--

CREATE TABLE local.factura (
    id_factura bigint NOT NULL,
    fecha date NOT NULL,
    id_pago integer NOT NULL,
    id_pedido integer NOT NULL
);


ALTER TABLE local.factura OWNER TO postgres;

--
-- Name: TABLE factura; Type: COMMENT; Schema: local; Owner: postgres
--

COMMENT ON TABLE local.factura IS 'Tabla de datos para almacenar los atributos de Factura.';


--
-- Name: factura_id_factura_seq; Type: SEQUENCE; Schema: local; Owner: postgres
--

CREATE SEQUENCE local.factura_id_factura_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local.factura_id_factura_seq OWNER TO postgres;

--
-- Name: factura_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: local; Owner: postgres
--

ALTER SEQUENCE local.factura_id_factura_seq OWNED BY local.factura.id_factura;


--
-- Name: local; Type: TABLE; Schema: local; Owner: postgres
--

CREATE TABLE local.local (
    id_local bigint NOT NULL,
    nombre text NOT NULL,
    eslogan text NOT NULL,
    ciudad text NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    doc_identidad text NOT NULL,
    id_categoria integer NOT NULL
);


ALTER TABLE local.local OWNER TO postgres;

--
-- Name: TABLE local; Type: COMMENT; Schema: local; Owner: postgres
--

COMMENT ON TABLE local.local IS 'Tabla de datos para almacenar los atributos de Local.';


--
-- Name: local_id_local_seq; Type: SEQUENCE; Schema: local; Owner: postgres
--

CREATE SEQUENCE local.local_id_local_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local.local_id_local_seq OWNER TO postgres;

--
-- Name: local_id_local_seq; Type: SEQUENCE OWNED BY; Schema: local; Owner: postgres
--

ALTER SEQUENCE local.local_id_local_seq OWNED BY local.local.id_local;


--
-- Name: pago; Type: TABLE; Schema: local; Owner: postgres
--

CREATE TABLE local.pago (
    id_pago integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE local.pago OWNER TO postgres;

--
-- Name: TABLE pago; Type: COMMENT; Schema: local; Owner: postgres
--

COMMENT ON TABLE local.pago IS 'Tabla de datos para almacenar los atributos de Pago.';


--
-- Name: pago_id_pago_seq; Type: SEQUENCE; Schema: local; Owner: postgres
--

CREATE SEQUENCE local.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local.pago_id_pago_seq OWNER TO postgres;

--
-- Name: pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: local; Owner: postgres
--

ALTER SEQUENCE local.pago_id_pago_seq OWNED BY local.pago.id_pago;


--
-- Name: pedido; Type: TABLE; Schema: local; Owner: postgres
--

CREATE TABLE local.pedido (
    id_pedido bigint NOT NULL,
    id_local integer NOT NULL,
    doc_identidad text NOT NULL,
    lista_ped json NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    total integer NOT NULL
);


ALTER TABLE local.pedido OWNER TO postgres;

--
-- Name: TABLE pedido; Type: COMMENT; Schema: local; Owner: postgres
--

COMMENT ON TABLE local.pedido IS 'Tabla de datos para almacenar los atributos de Pedido.';


--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: local; Owner: postgres
--

CREATE SEQUENCE local.pedido_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local.pedido_id_pedido_seq OWNER TO postgres;

--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: local; Owner: postgres
--

ALTER SEQUENCE local.pedido_id_pedido_seq OWNED BY local.pedido.id_pedido;


--
-- Name: pedidoopcional; Type: TABLE; Schema: local; Owner: postgres
--

CREATE TABLE local.pedidoopcional (
    id_pedido bigint NOT NULL,
    id_local bigint NOT NULL,
    doc_identidad text NOT NULL,
    cantidad integer NOT NULL,
    direccion text NOT NULL,
    telefono bigint NOT NULL,
    total integer NOT NULL,
    id_comida bigint NOT NULL
);


ALTER TABLE local.pedidoopcional OWNER TO postgres;

--
-- Name: TABLE pedidoopcional; Type: COMMENT; Schema: local; Owner: postgres
--

COMMENT ON TABLE local.pedidoopcional IS 'Tabla de datos para hacer el pedido en el primer sprint.';


--
-- Name: pedidoopcional_id_pedido_seq; Type: SEQUENCE; Schema: local; Owner: postgres
--

CREATE SEQUENCE local.pedidoopcional_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE local.pedidoopcional_id_pedido_seq OWNER TO postgres;

--
-- Name: pedidoopcional_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: local; Owner: postgres
--

ALTER SEQUENCE local.pedidoopcional_id_pedido_seq OWNED BY local.pedidoopcional.id_pedido;


--
-- Name: estado; Type: TABLE; Schema: usuario; Owner: postgres
--

CREATE TABLE usuario.estado (
    id_estado integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE usuario.estado OWNER TO postgres;

--
-- Name: TABLE estado; Type: COMMENT; Schema: usuario; Owner: postgres
--

COMMENT ON TABLE usuario.estado IS 'Tabla de datos para almacenar los atributos de Estado.';


--
-- Name: estado_id_estado_seq; Type: SEQUENCE; Schema: usuario; Owner: postgres
--

CREATE SEQUENCE usuario.estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario.estado_id_estado_seq OWNER TO postgres;

--
-- Name: estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: usuario; Owner: postgres
--

ALTER SEQUENCE usuario.estado_id_estado_seq OWNED BY usuario.estado.id_estado;


--
-- Name: rol; Type: TABLE; Schema: usuario; Owner: postgres
--

CREATE TABLE usuario.rol (
    id_rol integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE usuario.rol OWNER TO postgres;

--
-- Name: TABLE rol; Type: COMMENT; Schema: usuario; Owner: postgres
--

COMMENT ON TABLE usuario.rol IS 'Tabla de datos para almacenar los atributos de Rol.';


--
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: usuario; Owner: postgres
--

CREATE SEQUENCE usuario.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario.rol_id_rol_seq OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: usuario; Owner: postgres
--

ALTER SEQUENCE usuario.rol_id_rol_seq OWNED BY usuario.rol.id_rol;


--
-- Name: calificar id_calificar; Type: DEFAULT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.calificar ALTER COLUMN id_calificar SET DEFAULT nextval('local.calificar_id_calificar_seq'::regclass);


--
-- Name: categoria id_categoria; Type: DEFAULT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('local.categoria_id_categoria_seq'::regclass);


--
-- Name: comida id_comida; Type: DEFAULT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.comida ALTER COLUMN id_comida SET DEFAULT nextval('local.comida_id_comida_seq'::regclass);


--
-- Name: factura id_factura; Type: DEFAULT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.factura ALTER COLUMN id_factura SET DEFAULT nextval('local.factura_id_factura_seq'::regclass);


--
-- Name: local id_local; Type: DEFAULT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.local ALTER COLUMN id_local SET DEFAULT nextval('local.local_id_local_seq'::regclass);


--
-- Name: pago id_pago; Type: DEFAULT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.pago ALTER COLUMN id_pago SET DEFAULT nextval('local.pago_id_pago_seq'::regclass);


--
-- Name: pedido id_pedido; Type: DEFAULT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('local.pedido_id_pedido_seq'::regclass);


--
-- Name: pedidoopcional id_pedido; Type: DEFAULT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.pedidoopcional ALTER COLUMN id_pedido SET DEFAULT nextval('local.pedidoopcional_id_pedido_seq'::regclass);


--
-- Name: estado id_estado; Type: DEFAULT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.estado ALTER COLUMN id_estado SET DEFAULT nextval('usuario.estado_id_estado_seq'::regclass);


--
-- Name: rol id_rol; Type: DEFAULT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.rol ALTER COLUMN id_rol SET DEFAULT nextval('usuario.rol_id_rol_seq'::regclass);


--
-- Data for Name: calificar; Type: TABLE DATA; Schema: local; Owner: postgres
--

COPY local.calificar (id_calificar, id_local, doc_identidad, descripcion, fecha, puntaje) FROM stdin;
\.
COPY local.calificar (id_calificar, id_local, doc_identidad, descripcion, fecha, puntaje) FROM '$$PATH$$/2963.dat';

--
-- Data for Name: categoria; Type: TABLE DATA; Schema: local; Owner: postgres
--

COPY local.categoria (id_categoria, descripcion) FROM stdin;
\.
COPY local.categoria (id_categoria, descripcion) FROM '$$PATH$$/2965.dat';

--
-- Data for Name: comida; Type: TABLE DATA; Schema: local; Owner: postgres
--

COPY local.comida (id_comida, nombre, descripcion, precio, cantidad_disponible, imagen, id_local) FROM stdin;
\.
COPY local.comida (id_comida, nombre, descripcion, precio, cantidad_disponible, imagen, id_local) FROM '$$PATH$$/2971.dat';

--
-- Data for Name: factura; Type: TABLE DATA; Schema: local; Owner: postgres
--

COPY local.factura (id_factura, fecha, id_pago, id_pedido) FROM stdin;
\.
COPY local.factura (id_factura, fecha, id_pago, id_pedido) FROM '$$PATH$$/2969.dat';

--
-- Data for Name: local; Type: TABLE DATA; Schema: local; Owner: postgres
--

COPY local.local (id_local, nombre, eslogan, ciudad, direccion, telefono, doc_identidad, id_categoria) FROM stdin;
\.
COPY local.local (id_local, nombre, eslogan, ciudad, direccion, telefono, doc_identidad, id_categoria) FROM '$$PATH$$/2958.dat';

--
-- Data for Name: pago; Type: TABLE DATA; Schema: local; Owner: postgres
--

COPY local.pago (id_pago, descripcion) FROM stdin;
\.
COPY local.pago (id_pago, descripcion) FROM '$$PATH$$/2967.dat';

--
-- Data for Name: pedido; Type: TABLE DATA; Schema: local; Owner: postgres
--

COPY local.pedido (id_pedido, id_local, doc_identidad, lista_ped, direccion, telefono, total) FROM stdin;
\.
COPY local.pedido (id_pedido, id_local, doc_identidad, lista_ped, direccion, telefono, total) FROM '$$PATH$$/2961.dat';

--
-- Data for Name: pedidoopcional; Type: TABLE DATA; Schema: local; Owner: postgres
--

COPY local.pedidoopcional (id_pedido, id_local, doc_identidad, cantidad, direccion, telefono, total, id_comida) FROM stdin;
\.
COPY local.pedidoopcional (id_pedido, id_local, doc_identidad, cantidad, direccion, telefono, total, id_comida) FROM '$$PATH$$/2973.dat';

--
-- Data for Name: estado; Type: TABLE DATA; Schema: usuario; Owner: postgres
--

COPY usuario.estado (id_estado, descripcion) FROM stdin;
\.
COPY usuario.estado (id_estado, descripcion) FROM '$$PATH$$/2956.dat';

--
-- Data for Name: rol; Type: TABLE DATA; Schema: usuario; Owner: postgres
--

COPY usuario.rol (id_rol, descripcion) FROM stdin;
\.
COPY usuario.rol (id_rol, descripcion) FROM '$$PATH$$/2954.dat';

--
-- Data for Name: usuario; Type: TABLE DATA; Schema: usuario; Owner: postgres
--

COPY usuario.usuario (doc_identidad, nombre, apellido, edad, direccion, telefono, correo, session, contrasena, id_rol, id_estado) FROM stdin;
\.
COPY usuario.usuario (doc_identidad, nombre, apellido, edad, direccion, telefono, correo, session, contrasena, id_rol, id_estado) FROM '$$PATH$$/2959.dat';

--
-- Name: calificar_id_calificar_seq; Type: SEQUENCE SET; Schema: local; Owner: postgres
--

SELECT pg_catalog.setval('local.calificar_id_calificar_seq', 1, false);


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: local; Owner: postgres
--

SELECT pg_catalog.setval('local.categoria_id_categoria_seq', 6, true);


--
-- Name: comida_id_comida_seq; Type: SEQUENCE SET; Schema: local; Owner: postgres
--

SELECT pg_catalog.setval('local.comida_id_comida_seq', 6, true);


--
-- Name: factura_id_factura_seq; Type: SEQUENCE SET; Schema: local; Owner: postgres
--

SELECT pg_catalog.setval('local.factura_id_factura_seq', 1, false);


--
-- Name: local_id_local_seq; Type: SEQUENCE SET; Schema: local; Owner: postgres
--

SELECT pg_catalog.setval('local.local_id_local_seq', 24, true);


--
-- Name: pago_id_pago_seq; Type: SEQUENCE SET; Schema: local; Owner: postgres
--

SELECT pg_catalog.setval('local.pago_id_pago_seq', 1, false);


--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: local; Owner: postgres
--

SELECT pg_catalog.setval('local.pedido_id_pedido_seq', 1, false);


--
-- Name: pedidoopcional_id_pedido_seq; Type: SEQUENCE SET; Schema: local; Owner: postgres
--

SELECT pg_catalog.setval('local.pedidoopcional_id_pedido_seq', 5, true);


--
-- Name: estado_id_estado_seq; Type: SEQUENCE SET; Schema: usuario; Owner: postgres
--

SELECT pg_catalog.setval('usuario.estado_id_estado_seq', 1, false);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: usuario; Owner: postgres
--

SELECT pg_catalog.setval('usuario.rol_id_rol_seq', 1, false);


--
-- Name: calificar calificar_pkey; Type: CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.calificar
    ADD CONSTRAINT calificar_pkey PRIMARY KEY (id_calificar);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- Name: comida comida_pkey; Type: CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.comida
    ADD CONSTRAINT comida_pkey PRIMARY KEY (id_comida);


--
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);


--
-- Name: local local_pkey; Type: CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id_local);


--
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);


--
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- Name: pedidoopcional pedidoopcional_pkey; Type: CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.pedidoopcional
    ADD CONSTRAINT pedidoopcional_pkey PRIMARY KEY (id_pedido);


--
-- Name: usuario doc_identidad_pkey; Type: CONSTRAINT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.usuario
    ADD CONSTRAINT doc_identidad_pkey PRIMARY KEY (doc_identidad);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- Name: fki_fk_calificar_local; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_calificar_local ON local.calificar USING btree (id_local);


--
-- Name: fki_fk_calificar_usuario; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_calificar_usuario ON local.calificar USING btree (doc_identidad);


--
-- Name: fki_fk_comida_local; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_comida_local ON local.comida USING btree (id_local);


--
-- Name: fki_fk_factura_pago; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_factura_pago ON local.factura USING btree (id_pago);


--
-- Name: fki_fk_factura_pedido; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_factura_pedido ON local.factura USING btree (id_pedido);


--
-- Name: fki_fk_local_categoria; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_local_categoria ON local.local USING btree (id_categoria);


--
-- Name: fki_fk_local_usuario; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_local_usuario ON local.local USING btree (doc_identidad);


--
-- Name: fki_fk_pedido_local; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_pedido_local ON local.pedido USING btree (id_local);


--
-- Name: fki_fk_pedido_usuario; Type: INDEX; Schema: local; Owner: postgres
--

CREATE INDEX fki_fk_pedido_usuario ON local.pedido USING btree (doc_identidad);


--
-- Name: fki_fk_usuario_estado; Type: INDEX; Schema: usuario; Owner: postgres
--

CREATE INDEX fki_fk_usuario_estado ON usuario.usuario USING btree (id_estado);


--
-- Name: fki_usuario_rol; Type: INDEX; Schema: usuario; Owner: postgres
--

CREATE INDEX fki_usuario_rol ON usuario.usuario USING btree (id_rol);


--
-- Name: calificar fk_calificar_local; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.calificar
    ADD CONSTRAINT fk_calificar_local FOREIGN KEY (id_local) REFERENCES local.local(id_local);


--
-- Name: calificar fk_calificar_usuario; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.calificar
    ADD CONSTRAINT fk_calificar_usuario FOREIGN KEY (doc_identidad) REFERENCES usuario.usuario(doc_identidad);


--
-- Name: comida fk_comida_local; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.comida
    ADD CONSTRAINT fk_comida_local FOREIGN KEY (id_local) REFERENCES local.local(id_local);


--
-- Name: factura fk_factura_pago; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.factura
    ADD CONSTRAINT fk_factura_pago FOREIGN KEY (id_pago) REFERENCES local.pago(id_pago);


--
-- Name: factura fk_factura_pedido; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.factura
    ADD CONSTRAINT fk_factura_pedido FOREIGN KEY (id_pedido) REFERENCES local.pedido(id_pedido);


--
-- Name: local fk_local_categoria; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.local
    ADD CONSTRAINT fk_local_categoria FOREIGN KEY (id_categoria) REFERENCES local.categoria(id_categoria);


--
-- Name: local fk_local_usuario; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.local
    ADD CONSTRAINT fk_local_usuario FOREIGN KEY (doc_identidad) REFERENCES usuario.usuario(doc_identidad);


--
-- Name: pedido fk_pedido_local; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.pedido
    ADD CONSTRAINT fk_pedido_local FOREIGN KEY (id_local) REFERENCES local.local(id_local);


--
-- Name: pedido fk_pedido_usuario; Type: FK CONSTRAINT; Schema: local; Owner: postgres
--

ALTER TABLE ONLY local.pedido
    ADD CONSTRAINT fk_pedido_usuario FOREIGN KEY (doc_identidad) REFERENCES usuario.usuario(doc_identidad);


--
-- Name: usuario fk_usuario_estado; Type: FK CONSTRAINT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.usuario
    ADD CONSTRAINT fk_usuario_estado FOREIGN KEY (id_estado) REFERENCES usuario.estado(id_estado);


--
-- Name: usuario fk_usuario_rol; Type: FK CONSTRAINT; Schema: usuario; Owner: postgres
--

ALTER TABLE ONLY usuario.usuario
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES usuario.rol(id_rol);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     