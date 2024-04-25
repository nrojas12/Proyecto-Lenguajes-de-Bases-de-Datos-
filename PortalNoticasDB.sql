-------------------------------- Creaci�n de tablas ----------------------------
-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    correo VARCHAR2(100) UNIQUE,
    contrasena VARCHAR2(100)
);

-- Insert de datos tabla usuarios
    INSERT INTO Usuarios (id_usuario, nombre, correo, contrasena)
    VALUES (1, 'Juan Pérez', 'juan@example.com', 'password123');

    INSERT INTO Usuarios (id_usuario, nombre, correo, contrasena)
    VALUES (2, 'María López', 'maria@example.com', 'securepwd456');

    INSERT INTO Usuarios (id_usuario, nombre, correo, contrasena)
    VALUES (3, 'Carlos González', 'carlos@example.com', 'mipassword');

    INSERT INTO Usuarios (id_usuario, nombre, correo, contrasena)
    VALUES (4, 'Ana Martínez', 'ana@example.com', 'secreto');

    INSERT INTO Usuarios (id_usuario, nombre, correo, contrasena)
    VALUES (5, 'Luisa Rodríguez', 'luisa@example.com', 'contraseña123');


-- Crear tabla Temas
CREATE TABLE Temas (
    id_tema NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    descripcion VARCHAR2(255)
);

-- Insert de datos tabla temas
    INSERT INTO Temas (id_tema, nombre, descripcion)
    VALUES (1, 'Ciencia y Tecnología', 'Avances y descubrimientos en ciencia y tecnología.');

    INSERT INTO Temas (id_tema, nombre, descripcion)
    VALUES (2, 'Arte y Cultura', 'Eventos culturales, obras de arte, y expresiones culturales.');

    INSERT INTO Temas (id_tema, nombre, descripcion)
    VALUES (3, 'Deportes', 'Noticias y eventos deportivos.');

    INSERT INTO Temas (id_tema, nombre, descripcion)
    VALUES (4, 'Política', 'Desarrollos políticos y noticias sobre gobiernos y políticos.');

    INSERT INTO Temas (id_tema, nombre, descripcion)
    VALUES (5, 'Viajes y Turismo', 'Destinos turísticos, consejos de viaje, y experiencias de viaje.');

-- Crear tabla Subtemas
CREATE TABLE Subtemas (
    id_subtema NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    descripcion VARCHAR2(255),
    id_tema NUMBER,
    FOREIGN KEY (id_tema) REFERENCES Temas(id_tema)
);

-- Insert de datos tabla subtemas
    INSERT INTO Subtemas (id_subtema, nombre, descripcion, id_tema)
    VALUES (1, 'Inteligencia Artificial', 'Aplicaciones y avances en inteligencia artificial.', 1);

    INSERT INTO Subtemas (id_subtema, nombre, descripcion, id_tema)
    VALUES (2, 'Pintura Renacentista', 'Obras y artistas destacados del Renacimiento.', 2);

    INSERT INTO Subtemas (id_subtema, nombre, descripcion, id_tema)
    VALUES (3, 'Fútbol', 'Noticias y eventos relacionados con el fútbol.', 3);

    INSERT INTO Subtemas (id_subtema, nombre, descripcion, id_tema)
    VALUES (4, 'Política Internacional', 'Desarrollos políticos a nivel mundial.', 4);

    INSERT INTO Subtemas (id_subtema, nombre, descripcion, id_tema)
    VALUES (5, 'Destinos Exóticos', 'Viajes a lugares únicos y exóticos alrededor del mundo.', 5);

-- Crear tabla Noticias
CREATE TABLE Noticias (
    id_noticia NUMBER PRIMARY KEY,
    titulo VARCHAR2(255),
    contenido CLOB,
    fecha_publicacion DATE,
    id_tema NUMBER,
    id_subtema NUMBER,
    id_usuario NUMBER,
    FOREIGN KEY (id_tema) REFERENCES Temas(id_tema),
    FOREIGN KEY (id_subtema) REFERENCES Subtemas(id_subtema),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Insert de datos tabla noticias
    INSERT INTO Noticias (id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario)
    VALUES (1, 'Avances en la Robótica', 'Recientemente se han logrado importantes avances en el campo de la robótica, especialmente en la creación de robots autónomos.', TO_DATE('2024-03-19', 'YYYY-MM-DD'), 1, 1, 1);

    INSERT INTO Noticias (id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario)
    VALUES (2, 'Leonardo da Vinci y su legado artístico', 'Una exposición reciente destacó la vida y obra de Leonardo da Vinci, mostrando su impacto en el arte renacentista.', TO_DATE('2024-03-18', 'YYYY-MM-DD'), 2, 2, 2);

    INSERT INTO Noticias (id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario)
    VALUES (3, 'Final emocionante en la Copa del Mundo', 'El equipo local logró una victoria emocionante en la final de la Copa del Mundo, venciendo al favorito por 2-1 en tiempo extra.', TO_DATE('2024-03-17', 'YYYY-MM-DD'), 3, 3, 3);

    INSERT INTO Noticias (id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario)
    VALUES (4, 'Cumbre Global de Cambio Climático', 'Los líderes mundiales se reunieron en la cumbre global para discutir estrategias y compromisos para abordar el cambio climático.', TO_DATE('2024-03-16', 'YYYY-MM-DD'), 4, 4, 4);

    INSERT INTO Noticias (id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario)
    VALUES (5, 'Explorando las maravillas de África', 'Una pareja de viajeros compartió su experiencia al explorar las maravillas naturales y culturales de África.', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 5, 5, 5);

-- Crear tabla Calificaciones
CREATE TABLE Calificaciones (
    id_calificacion NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    id_usuario NUMBER,
    calificacion NUMBER(1, 0), -- De 1 a 5 estrellas
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia),
  <  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Insert de datos tabla calificaciones
    INSERT INTO Calificaciones (id_calificacion, id_noticia, id_usuario, calificacion)
    VALUES (1, 1, 1, 5);

    INSERT INTO Calificaciones (id_calificacion, id_noticia, id_usuario, calificacion)
    VALUES (2, 2, 2, 4);

    INSERT INTO Calificaciones (id_calificacion, id_noticia, id_usuario, calificacion)
    VALUES (3, 3, 3, 3);

    INSERT INTO Calificaciones (id_calificacion, id_noticia, id_usuario, calificacion)
    VALUES (4, 4, 4, 2);

    INSERT INTO Calificaciones (id_calificacion, id_noticia, id_usuario, calificacion)
    VALUES (5, 5, 5, 1);

-- Crear tabla Visitas
CREATE TABLE Visitas (
    id_visita NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    id_usuario NUMBER,
    fecha_visita DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Insert de datos tabla visitas
    INSERT INTO Visitas (id_visita, id_noticia, id_usuario)
    VALUES (1, 1, 1);

    INSERT INTO Visitas (id_visita, id_noticia, id_usuario)
    VALUES (2, 2, 2);

    INSERT INTO Visitas (id_visita, id_noticia, id_usuario)
    VALUES (3, 3, 3);

    INSERT INTO Visitas (id_visita, id_noticia, id_usuario)
    VALUES (4, 4, 4);

    INSERT INTO Visitas (id_visita, id_noticia, id_usuario)
    VALUES (5, 5, 5);

-- Crear tabla EnviosCorreo
CREATE TABLE EnviosCorreo (
    id_envio NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    id_usuario_envia NUMBER,
    id_usuario_recibe NUMBER,
    fecha_envio DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia),
    FOREIGN KEY (id_usuario_envia) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_usuario_recibe) REFERENCES Usuarios(id_usuario)
);

-- Insert de datos tabla EnviosCorreo
    INSERT INTO EnviosCorreo (id_envio, id_noticia, id_usuario_envia, id_usuario_recibe)
    VALUES (1, 1, 1, 2);

    INSERT INTO EnviosCorreo (id_envio, id_noticia, id_usuario_envia, id_usuario_recibe)
    VALUES (2, 2, 2, 3);

    INSERT INTO EnviosCorreo (id_envio, id_noticia, id_usuario_envia, id_usuario_recibe)
    VALUES (3, 3, 3, 4);

    INSERT INTO EnviosCorreo (id_envio, id_noticia, id_usuario_envia, id_usuario_recibe)
    VALUES (4, 4, 4, 5);

    INSERT INTO EnviosCorreo (id_envio, id_noticia, id_usuario_envia, id_usuario_recibe)
    VALUES (5, 5, 5, 1);

-- Crear tabla Ranking
CREATE TABLE Ranking (
    id_ranking NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    visitas NUMBER DEFAULT 0,
    promedio_calificaciones NUMBER(3, 2) DEFAULT 0,
    envios_correo NUMBER DEFAULT 0,
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia)
);

-- Insert de datos tabla ranking
    INSERT INTO Ranking (id_ranking, id_noticia)
    VALUES (1, 1);

    INSERT INTO Ranking (id_ranking, id_noticia)
    VALUES (2, 2);

    INSERT INTO Ranking (id_ranking, id_noticia)
    VALUES (3, 3);

    INSERT INTO Ranking (id_ranking, id_noticia)
    VALUES (4, 4);

    INSERT INTO Ranking (id_ranking, id_noticia)
    VALUES (5, 5);


-- Crear tabla Comentarios (opcional)
CREATE TABLE Comentarios (
    id_comentario NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    id_usuario NUMBER,
    comentario VARCHAR2(255),
    fecha_comentario DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Insert de datos tabla comentarios
    INSERT INTO Comentarios (id_comentario, id_noticia, id_usuario, comentario)
    VALUES (1, 1, 1, 'Interesante artículo sobre inteligencia artificial.');

    INSERT INTO Comentarios (id_comentario, id_noticia, id_usuario, comentario)
    VALUES (2, 2, 2, 'Me encanta el Renacimiento, ¡gracias por compartir!');

    INSERT INTO Comentarios (id_comentario, id_noticia, id_usuario, comentario)
    VALUES (3, 3, 3, '¡Qué emocionante final de la Copa del Mundo!');

    INSERT INTO Comentarios (id_comentario, id_noticia, id_usuario, comentario)
    VALUES (4, 4, 4, 'Es vital abordar el cambio climático a nivel global.');

    INSERT INTO Comentarios (id_comentario, id_noticia, id_usuario, comentario)
    VALUES (5, 5, 5, 'África tiene lugares increíbles para explorar.');

-- Crear tabla SeguimientoUsuarios (opcional)
CREATE TABLE SeguimientoUsuarios (
    id_seguimiento NUMBER PRIMARY KEY,
    id_usuario NUMBER,
    id_noticia NUMBER,
    tipo_accion VARCHAR2(50), -- Por ejemplo: "lectura", "calificacion", etc.
    fecha_accion DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia)
);

-- Insert de datos tabla SeguimientoUsuarios
    INSERT INTO SeguimientoUsuarios (id_seguimiento, id_usuario, id_noticia, tipo_accion)
    VALUES (1, 1, 1, 'lectura');

    INSERT INTO SeguimientoUsuarios (id_seguimiento, id_usuario, id_noticia, tipo_accion)
    VALUES (2, 2, 2, 'lectura');

    INSERT INTO SeguimientoUsuarios (id_seguimiento, id_usuario, id_noticia, tipo_accion)
    VALUES (3, 3, 3, 'lectura');

    INSERT INTO SeguimientoUsuarios (id_seguimiento, id_usuario, id_noticia, tipo_accion)
    VALUES (4, 4, 4, 'lectura');

    INSERT INTO SeguimientoUsuarios (id_seguimiento, id_usuario, id_noticia, tipo_accion)
    VALUES (5, 5, 5, 'lectura');


-- Crear tabla ImagenesNoticias (opcional)
CREATE TABLE ImagenesNoticias (
    id_imagen NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    nombre_archivo VARCHAR2(100),
    ruta_archivo VARCHAR2(255),
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia)
);

----------------------------------------------------------------------VISTAS----------------------------------------------------

--Vista de Las noticias mas recientes por fecha

    CREATE VIEW Vista_Noticias_Recientes AS
    SELECT id_noticia, titulo, fecha_publicacion
    FROM Noticias
    ORDER BY fecha_publicacion DESC;

    SELECT * FROM Vista_Noticias_Recientes;

--Vista de temas y subtemas

    CREATE VIEW Vista_Temas_Subtemas AS
    SELECT t.nombre AS tema, s.nombre AS subtema
    FROM Temas t
    INNER JOIN Subtemas s ON t.id_tema = s.id_tema;

    SELECT * FROM Vista_Temas_Subtemas;

--Noticias con calificaciones

    CREATE VIEW Vista_Noticias_Calificaciones AS
    SELECT n.id_noticia, n.titulo, AVG(c.calificacion) AS promedio_calificacion
    FROM Noticias n
    LEFT JOIN Calificaciones c ON n.id_noticia = c.id_noticia
    GROUP BY n.id_noticia, n.titulo;

    SELECT * FROM Vista_Noticias_Calificaciones;

--Visitas por usuarios

    CREATE VIEW Vista_Visitas_Usuario AS
    SELECT id_usuario, COUNT(id_visita) AS visitas_realizadas
    FROM Visitas
    GROUP BY id_usuario;

    SELECT * FROM Vista_Visitas_Usuario;

--Comentarios recientes en noticias

    CREATE VIEW Vista_Noticias_Comentarios AS
    SELECT n.id_noticia, n.titulo, c.comentario, c.fecha_comentario
    FROM Noticias n
    LEFT JOIN Comentarios c ON n.id_noticia = c.id_noticia
    ORDER BY c.fecha_comentario DESC;

    SELECT * FROM Vista_Noticias_Comentarios;

--Vista noticias por ranking

    CREATE VIEW Vista_Ranking_Noticias AS
    SELECT n.id_noticia, n.titulo, r.visitas, r.promedio_calificaciones
    FROM Noticias n
    INNER JOIN Ranking r ON n.id_noticia = r.id_noticia
    ORDER BY r.visitas DESC, r.promedio_calificaciones DESC;

    SELECT * FROM Vista_Ranking_Noticias;

--Vista de Usuarios con numero de comentarios hechos 

    CREATE VIEW Vista_Usuarios_Comentarios AS
    SELECT u.id_usuario, u.nombre AS nombre_usuario, COUNT(c.id_comentario) AS cantidad_comentarios
    FROM Usuarios u
    LEFT JOIN Comentarios c ON u.id_usuario = c.id_usuario
    GROUP BY u.id_usuario, u.nombre;

    SELECT * FROM Vista_Usuarios_Comentarios;

--Vista de Noticias mas comentadas

    CREATE VIEW Vista_Noticias_Populares AS
    SELECT n.id_noticia, n.titulo, COUNT(c.id_comentario) AS cantidad_comentarios
    FROM Noticias n
    LEFT JOIN Comentarios c ON n.id_noticia = c.id_noticia
    GROUP BY n.id_noticia, n.titulo
    ORDER BY COUNT(c.id_comentario) DESC;    

    SELECT * FROM Vista_Noticias_Populares;

--Vista de noticias con imagenes

    CREATE VIEW Vista_Noticias_Imagenes AS
    SELECT n.id_noticia, n.titulo, COUNT(in.id_imagen) AS cantidad_imagenes
    FROM Noticias n
    LEFT JOIN ImagenesNoticias in ON n.id_noticia = in.id_noticia
    GROUP BY n.id_noticia, n.titulo;

    SELECT * FROM Vista_Noticias_Imagenes;

--Vista de Promedio de calificaciones y comentarios en noticias (esta no se si sirva .-.)

    CREATE VIEW Vista_Noticias_Calificaciones_Comentarios AS
    SELECT n.id_noticia, n.titulo, AVG(c.calificacion) AS promedio_calificacion, COUNT(co.id_comentario) AS cantidad_comentarios
    FROM Noticias n
    LEFT JOIN Calificaciones c ON n.id_noticia = c.id_noticia
    LEFT JOIN Comentarios co ON n.id_noticia = co.id_noticia
    GROUP BY n.id_noticia, n.titulo;

    SELECT * FROM Vista_Noticias_Calificaciones_Comentarios;


----------------------------------------------------------------- Funciones  ----------------------------

-- Función para insertar un nuevo usuario
    CREATE OR REPLACE FUNCTION insertar_usuario(
        p_id_usuario IN NUMBER,
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Usuarios (id_usuario, nombre, correo, contrasena)
        VALUES (p_id_usuario, p_nombre, p_correo, p_contrasena);
        
        RETURN 'Usuario insertado correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El correo electrónico ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar el usuario';
    END;
    /

-- Función para recuperar el nombre de un usuario dado su ID
    CREATE OR REPLACE FUNCTION obtener_nombre_usuario(
        p_id_usuario IN NUMBER
    ) RETURN VARCHAR2 IS
        v_nombre Usuarios.nombre%TYPE;
    BEGIN
        SELECT nombre INTO v_nombre FROM Usuarios WHERE id_usuario = p_id_usuario;
        RETURN v_nombre;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Usuario no encontrado';
        WHEN OTHERS THEN
            RETURN 'Error al recuperar el nombre del usuario';
    END;
    
-- Función para insertar un nuevo tema
    CREATE OR REPLACE FUNCTION insertar_tema(
        p_id_tema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Temas (id_tema, nombre, descripcion)
        VALUES (p_id_tema, p_nombre, p_descripcion);
        
        RETURN 'Tema insertado correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID del tema ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar el tema';
    END;

-- Función para obtener la descripción de un tema dado su ID
    CREATE OR REPLACE FUNCTION obtener_descripcion_tema(
        p_id_tema IN NUMBER
    ) RETURN VARCHAR2 IS
        v_descripcion Temas.descripcion%TYPE;
    BEGIN
        SELECT descripcion INTO v_descripcion FROM Temas WHERE id_tema = p_id_tema;
        RETURN v_descripcion;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Tema no encontrado';
        WHEN OTHERS THEN
            RETURN 'Error al recuperar la descripción del tema';
    END;    

-- Función para insertar un nuevo tema
    CREATE OR REPLACE FUNCTION insertar_tema(
        p_id_tema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Temas (id_tema, nombre, descripcion)
        VALUES (p_id_tema, p_nombre, p_descripcion);
        
        RETURN 'Tema insertado correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID de tema ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar el tema';
    END;

-- Funcion para insertar nuevo subtema
    CREATE OR REPLACE FUNCTION insertar_subtema(
        p_id_subtema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_id_tema IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Subtemas (id_subtema, nombre, descripcion, id_tema)
        VALUES (p_id_subtema, p_nombre, p_descripcion, p_id_tema);
        
        RETURN 'Subtema insertado correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID de subtema ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar el subtema';
    END;

-- Funcion para insertar una nueva noticia
    CREATE OR REPLACE FUNCTION insertar_noticia(
        p_id_noticia IN NUMBER,
        p_titulo IN VARCHAR2,
        p_contenido IN CLOB,
        p_fecha_publicacion IN DATE,
        p_id_tema IN NUMBER,
        p_id_subtema IN NUMBER,
        p_id_usuario IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Noticias (id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario)
        VALUES (p_id_noticia, p_titulo, p_contenido, p_fecha_publicacion, p_id_tema, p_id_subtema, p_id_usuario);
        
        RETURN 'Noticia insertada correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID de noticia ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar la noticia';
    END;

-- Funcion para obtener el contenido de una noticia por ID:
    CREATE OR REPLACE FUNCTION obtener_contenido_noticia(
        p_id_noticia IN NUMBER
    ) RETURN CLOB IS
        v_contenido Noticias.contenido%TYPE;
    BEGIN
        SELECT contenido INTO v_contenido FROM Noticias WHERE id_noticia = p_id_noticia;
        RETURN v_contenido;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN OTHERS THEN
            RETURN 'Error al obtener el contenido de la noticia';
    END;

-- Función para insertar una nueva calificación
    CREATE OR REPLACE FUNCTION insertar_calificacion(
        p_id_calificacion IN NUMBER,
        p_id_noticia IN NUMBER,
        p_id_usuario IN NUMBER,
        p_calificacion IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        IF p_calificacion < 1 OR p_calificacion > 5 THEN
            RETURN 'Error: La calificación debe estar entre 1 y 5 estrellas';
        ELSE
            INSERT INTO Calificaciones (id_calificacion, id_noticia, id_usuario, calificacion)
            VALUES (p_id_calificacion, p_id_noticia, p_id_usuario, p_calificacion);
            
            RETURN 'Calificación insertada correctamente';
        END IF;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID de calificación ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar la calificación';
    END;

-- Función para obtener la calificación promedio de una noticia:
    CREATE OR REPLACE FUNCTION obtener_calificacion_promedio(
        p_id_noticia IN NUMBER
    ) RETURN NUMBER IS
        v_promedio NUMBER;
    BEGIN
        SELECT AVG(calificacion) INTO v_promedio FROM Calificaciones WHERE id_noticia = p_id_noticia;
        RETURN v_promedio;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN OTHERS THEN
            RETURN -1; -- Indicador de error
    END;

-- Función para registrar una nueva visita
    CREATE OR REPLACE FUNCTION registrar_visita(
        p_id_visita IN NUMBER,
        p_id_noticia IN NUMBER,
        p_id_usuario IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Visitas (id_visita, id_noticia, id_usuario)
        VALUES (p_id_visita, p_id_noticia, p_id_usuario);
        
        RETURN 'Visita registrada correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID de visita ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al registrar la visita';
    END;

-- Funcion que insetar un nuevo envío de correo     
    CREATE OR REPLACE FUNCTION insertar_envio_correo(
        p_id_noticia IN NUMBER,
        p_id_usuario_envia IN NUMBER,
        p_id_usuario_recibe IN NUMBER
    ) RETURN NUMBER IS
    BEGIN
        INSERT INTO EnviosCorreo (id_envio, id_noticia, id_usuario_envia, id_usuario_recibe, fecha_envio)
        VALUES (seq_envios_correo.nextval, p_id_noticia, p_id_usuario_envia, p_id_usuario_recibe, SYSDATE);

        RETURN seq_envios_correo.currval; -- Devuelve el ID del envío de correo recién insertado
    END insertar_envio_correo;

-- Función para obtener el número de visitas de una noticia
    CREATE OR REPLACE FUNCTION obtener_numero_visitas(
        p_id_noticia IN NUMBER
    ) RETURN NUMBER IS
        v_numero_visitas NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_numero_visitas FROM Visitas WHERE id_noticia = p_id_noticia;
        RETURN v_numero_visitas;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            RETURN -1; -- Indicador de error
    END;

-- Funcion para promedio de calificaciones para una noticia
    CREATE OR REPLACE FUNCTION calcular_promedio_calificaciones(id_noticia_param IN NUMBER)
    RETURN NUMBER IS
        promedio NUMBER;
    BEGIN
        SELECT AVG(promedio_calificaciones)
        INTO promedio
        FROM Ranking
        WHERE id_noticia = id_noticia_param;

        RETURN promedio;
    END calcular_promedio_calificaciones;

--Funcion para insertar un nuevo comentario
    CREATE OR REPLACE FUNCTION insertar_comentario(
        id_noticia_param IN NUMBER,
        id_usuario_param IN NUMBER,
        comentario_param IN VARCHAR2
    ) RETURN NUMBER IS
    BEGIN
        INSERT INTO Comentarios (id_comentario, id_noticia, id_usuario, comentario, fecha_comentario)
        VALUES (seq_comentarios.nextval, id_noticia_param, id_usuario_param, comentario_param, SYSDATE);

        RETURN seq_comentarios.currval; -- Devuelve el ID del comentario recién insertado
    END insertar_comentario;

--Funcion para insertar un nuevo registro de seguimiento de usuario
    CREATE OR REPLACE FUNCTION registrar_accion_seguimiento(
        id_usuario_param IN NUMBER,
        id_noticia_param IN NUMBER,
        tipo_accion_param IN VARCHAR2
    ) RETURN NUMBER IS
    BEGIN
        INSERT INTO SeguimientoUsuarios (id_seguimiento, id_usuario, id_noticia, tipo_accion, fecha_accion)
        VALUES (seq_seguimiento_usuarios.nextval, id_usuario_param, id_noticia_param, tipo_accion_param, SYSDATE);

        RETURN seq_seguimiento_usuarios.currval; -- Devuelve el ID del seguimiento recién insertado
    END registrar_accion_seguimiento;


--------------------------------------------------------------- Trigers  ----------------------------

--Actualizar ranking de noticias
    CREATE SEQUENCE seq_ranking_visitas
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    CREATE OR REPLACE TRIGGER actualizar_ranking_visitas
    AFTER INSERT ON Visitas
    FOR EACH ROW
    BEGIN
        -- Verificar si existe un registro en la tabla Ranking para la noticia
        DECLARE
            v_count NUMBER;
        BEGIN
            SELECT COUNT(*)
            INTO v_count
            FROM Ranking
            WHERE id_noticia = :new.id_noticia;
    
            -- Si no existe, insertar un nuevo registro
            IF v_count = 0 THEN
                INSERT INTO Ranking (id_ranking, id_noticia, visitas)
                VALUES (seq_ranking_visitas.nextval, :new.id_noticia, 1);
            ELSE
                -- Si existe, incrementar el contador de visitas
                UPDATE Ranking
                SET visitas = visitas + 1
                WHERE id_noticia = :new.id_noticia;
            END IF;
        END;
    END;
    /

-- Promedio de las noticias
    CREATE OR REPLACE TRIGGER CALCULAR_PROMEDIO_BEFORE_INSERT
    BEFORE INSERT ON Calificaciones
    FOR EACH ROW
    BEGIN
        UPDATE Ranking
        SET promedio_calificaciones = (
            SELECT AVG(calificacion)
            FROM Calificaciones
            WHERE id_noticia = :new.id_noticia
        )
        WHERE id_noticia = :new.id_noticia;
    END;
    /
 CREATE SEQUENCE seq_ranking
    START WITH 5
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 
    
CREATE OR REPLACE TRIGGER CALCULAR_PROMEDIO_BEFORE_INSERT
BEFORE INSERT ON Calificaciones
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Ranking
    WHERE id_noticia = :new.id_noticia;

    IF v_count = 0 THEN
        INSERT INTO Ranking (id_ranking, id_noticia, promedio_calificaciones)
        VALUES (seq_ranking.nextval, :new.id_noticia, :new.calificacion);
    ELSE
        UPDATE Ranking
        SET promedio_calificaciones = (
            SELECT AVG(calificacion)
            FROM Calificaciones
            WHERE id_noticia = :new.id_noticia
        )
        WHERE id_noticia = :new.id_noticia;
    END IF;
END;
/
--Fecha de la ultima visita del usuario
    CREATE OR REPLACE TRIGGER actualizar_ultima_visita_usuario
    AFTER INSERT ON Visitas
    FOR EACH ROW
    BEGIN
        UPDATE Usuarios
        SET fecha_ultima_visita = SYSDATE
        WHERE id_usuario = :new.id_usuario;
    END;

--Registra cuando se publico una noticia en la tabla cuando se entra un registro nuevo 

    CREATE OR REPLACE TRIGGER registrar_fecha_publicacion
    BEFORE INSERT ON Noticias
    FOR EACH ROW
    BEGIN
        :new.fecha_publicacion := SYSDATE;
    END;

--------------------------------------------------- Procedimientos Almacenados  ----------------------------    
SET SERVEROUTPUT ON;
------------------------ Procedimientos --------------------------------
--Registrar una visita a una noticia 
CREATE SEQUENCE seq_visitas
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE PROCEDURE SP_AgregarVisita(
    p_noticia_id IN NUMBER
)
IS
    v_id_visita Visitas.id_visita%TYPE;
BEGIN
    -- Utiliza una secuencia para obtener el ID_VISITA
    SELECT seq_visitas.nextval INTO v_id_visita FROM dual;

    -- Inserta el registro en la tabla Visitas
    INSERT INTO Visitas (id_visita, id_noticia, id_usuario, fecha_visita)
    VALUES (v_id_visita, p_noticia_id, NULL, SYSDATE);
    
    COMMIT; 
    DBMS_OUTPUT.PUT_LINE('Visita agregada correctamente con ID_VISITA: ' || v_id_visita);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar la visita: ' || SQLERRM);
        ROLLBACK;
END SP_AgregarVisita;
/

BEGIN
    SP_AgregarVisita(p_noticia_id => 6);
    COMMIT; 
END;

--Registrar una calificación para una noticia específica y actualizar el promedio de calificaciones de esa noticia 
CREATE SEQUENCE seq_calificaciones
    START WITH 5
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE PROCEDURE SP_RegistrarCalificacion(
    p_noticia_id IN NUMBER,
    p_calificacion IN NUMBER
)
IS
BEGIN
    INSERT INTO Calificaciones (id_calificacion, id_noticia, calificacion)
    VALUES (seq_calificaciones.nextval, p_noticia_id, p_calificacion);
END SP_RegistrarCalificacion;
/

BEGIN
    SP_RegistrarCalificacion(p_noticia_id => 6, p_calificacion => 8); -- Reemplazar con el ID de la noticia y con la calificación a registrar
    COMMIT; 
END;

-- Listar las últimas noticias en orden desc
CREATE OR REPLACE PROCEDURE SP_LISTARULTIMASNOTICIAS_DESC(
    p_max_noticias IN NUMBER
)
IS
BEGIN
    FOR ultima_noticia IN (
        SELECT id_noticia, titulo, contenido, fecha_publicacion
        FROM (
            SELECT id_noticia, titulo, contenido, fecha_publicacion
            FROM Noticias
            ORDER BY fecha_publicacion DESC
        )
        WHERE ROWNUM <= p_max_noticias
    )
    LOOP
        -- Imprimir/procesar
        DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || ultima_noticia.id_noticia || ', Título: ' || ultima_noticia.titulo || ', Fecha Publicación: ' || TO_CHAR(ultima_noticia.fecha_publicacion, 'DD-MM-YYYY'));
    END LOOP;
END SP_LISTARULTIMASNOTICIAS_DESC;
/

BEGIN
    SP_LISTARULTIMASNOTICIAS(p_max_noticias => 2);
END;

-- Listar las últimas noticias en orden asc
CREATE OR REPLACE PROCEDURE SP_LISTARULTIMASNOTICIAS_ASC(
    p_max_noticias IN NUMBER
)
IS
BEGIN
    FOR ultima_noticia IN (
        SELECT id_noticia, titulo, contenido, fecha_publicacion
        FROM (
            SELECT id_noticia, titulo, contenido, fecha_publicacion
            FROM Noticias
            ORDER BY fecha_publicacion ASC -- Cambio a orden ascendente
        )
        WHERE ROWNUM <= p_max_noticias
    )
    LOOP
        -- Imprimir/procesar
        DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || ultima_noticia.id_noticia || ', Título: ' || ultima_noticia.titulo || ', Fecha Publicación: ' || TO_CHAR(ultima_noticia.fecha_publicacion, 'DD-MM-YYYY'));
    END LOOP;
END SP_LISTARULTIMASNOTICIAS_ASC;
/ 

--  Listar las noticias más visitadas, enviadas por correo o mejor calificadas, ya sea en la portada o por tema
CREATE OR REPLACE PROCEDURE SP_ListarNoticiasPopulares(
    p_tipo IN VARCHAR2, -- Puede ser 'visitas', 'envios', 'calificaciones'
    p_tema_id IN NUMBER DEFAULT NULL -- Opcional: ID del tema si se quiere filtrar por tema
)
IS
    v_sql VARCHAR2(1000);
BEGIN
    IF p_tema_id IS NULL THEN
        -- Listar noticias de portada
        v_sql := 'SELECT n.titulo, r.visitas, r.envios_correo, r.promedio_calificaciones
                  FROM Noticias n
                  JOIN Ranking r ON n.id_noticia = r.id_noticia
                  ORDER BY ';

        IF p_tipo = 'visitas' THEN
            v_sql := v_sql || 'r.visitas DESC';
        ELSIF p_tipo = 'envios' THEN
            v_sql := v_sql || 'r.envios_correo DESC';
        ELSIF p_tipo = 'calificaciones' THEN
            v_sql := v_sql || 'r.promedio_calificaciones DESC';
        ELSE
            DBMS_OUTPUT.PUT_LINE('Tipo de ranking no válido');
            RETURN;
        END IF;
    ELSE
        -- Listar noticias por tema
        v_sql := 'SELECT n.titulo, r.visitas, r.envios_correo, r.promedio_calificaciones
                  FROM Noticias n
                  JOIN Ranking r ON n.id_noticia = r.id_noticia
                  WHERE n.id_tema = ' || p_tema_id || '
                  ORDER BY ';

        IF p_tipo = 'visitas' THEN
            v_sql := v_sql || 'r.visitas DESC';
        ELSIF p_tipo = 'envios' THEN
            v_sql := v_sql || 'r.envios_correo DESC';
        ELSIF p_tipo = 'calificaciones' THEN
            v_sql := v_sql || 'r.promedio_calificaciones DESC';
        ELSE
            DBMS_OUTPUT.PUT_LINE('Tipo de ranking no válido');
            RETURN;
        END IF;
    END IF;

    EXECUTE IMMEDIATE v_sql;
END SP_ListarNoticiasPopulares;
/

EXEC SP_ListarNoticiasPopulares('visitas');

-- Generar un reporte de visitas de noticias según el tema, subtema o de manera general
CREATE OR REPLACE PROCEDURE SP_GenerarReporteVisitas(
    p_id_tema IN NUMBER DEFAULT NULL,
    p_id_subtema IN NUMBER DEFAULT NULL
)
IS
BEGIN
    IF p_id_tema IS NULL AND p_id_subtema IS NULL THEN
        -- Reporte general de visitas
        FOR visita IN (
            SELECT id_noticia, COUNT(*) AS total_visitas
            FROM Visitas
            GROUP BY id_noticia
            ORDER BY total_visitas DESC
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || visita.id_noticia || ', Total Visitas: ' || visita.total_visitas);
        END LOOP;
    ELSIF p_id_subtema IS NULL THEN
        -- Reporte por tema
        FOR visita IN (
            SELECT v.id_noticia, COUNT(*) AS total_visitas
            FROM Visitas v
            JOIN Noticias n ON v.id_noticia = n.id_noticia
            WHERE n.id_tema = p_id_tema
            GROUP BY v.id_noticia
            ORDER BY total_visitas DESC
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || visita.id_noticia || ', Total Visitas: ' || visita.total_visitas);
        END LOOP;
    ELSE
        -- Reporte por subtema
        FOR visita IN (
            SELECT v.id_noticia, COUNT(*) AS total_visitas
            FROM Visitas v
            JOIN Noticias n ON v.id_noticia = n.id_noticia
            WHERE n.id_subtema = p_id_subtema
            GROUP BY v.id_noticia
            ORDER BY total_visitas DESC
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || visita.id_noticia || ', Total Visitas: ' || visita.total_visitas);
        END LOOP;
    END IF;
END SP_GenerarReporteVisitas;
/
EXEC SP_GenerarReporteVisitas;

-- Generar reporte de calificaciones por tema, subtema y general
CREATE OR REPLACE PROCEDURE SP_GenerarReporteCalificaciones(
    p_id_tema IN NUMBER DEFAULT NULL,
    p_id_subtema IN NUMBER DEFAULT NULL
)
IS
BEGIN
    IF p_id_tema IS NOT NULL THEN
        -- Reporte por tema
        FOR calificacion IN (
            SELECT n.titulo, c.calificacion
            FROM Noticias n
            JOIN Calificaciones c ON n.id_noticia = c.id_noticia
            WHERE n.id_tema = p_id_tema
            ORDER BY n.titulo
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Título: ' || calificacion.titulo || ', Calificación: ' || calificacion.calificacion);
        END LOOP;
    ELSIF p_id_subtema IS NOT NULL THEN
        -- Reporte por subtema
        FOR calificacion IN (
            SELECT n.titulo, c.calificacion
            FROM Noticias n
            JOIN Calificaciones c ON n.id_noticia = c.id_noticia
            WHERE n.id_subtema = p_id_subtema
            ORDER BY n.titulo
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Título: ' || calificacion.titulo || ', Calificación: ' || calificacion.calificacion);
        END LOOP;
    ELSE
        -- Reporte general
        FOR calificacion IN (
            SELECT n.titulo, c.calificacion
            FROM Noticias n
            JOIN Calificaciones c ON n.id_noticia = c.id_noticia
            ORDER BY n.titulo
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Título: ' || calificacion.titulo || ', Calificación: ' || calificacion.calificacion);
        END LOOP;
    END IF;
END SP_GenerarReporteCalificaciones;
/
EXEC SP_GenerarReporteCalificaciones(p_id_subtema => 2);

-- Agregar Usuarios
CREATE SEQUENCE seq_usuarios --Crear secuencia
START WITH 6 --En 6 porque ya existen 5 y daba error con valor 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE PROCEDURE SP_AgregarUsuario(
    p_nombre IN VARCHAR2,
    p_correo IN VARCHAR2,
    p_contrasena IN VARCHAR2,
    p_preferencias_correo IN VARCHAR2 DEFAULT NULL,
    p_fecha_registro IN DATE -- Nueva columna fecha_registro
)
IS
BEGIN
    INSERT INTO Usuarios (id_usuario, nombre, correo, contrasena, preferencias_correo, fecha_registro)
    VALUES (seq_usuarios.nextval, p_nombre, p_correo, p_contrasena, p_preferencias_correo, p_fecha_registro);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario agregado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar el usuario: ' || SQLERRM);
END SP_AgregarUsuario;
/
BEGIN
    SP_AgregarUsuario('Pedro Rojas', 'pedro.rojas@email.com', '123456', 'No', SYSDATE);
END;

-- Actualizar Usuarios
CREATE OR REPLACE PROCEDURE SP_ActualizarUsuario(
    p_id_usuario IN NUMBER,
    p_nombre IN VARCHAR2,
    p_correo IN VARCHAR2,
    p_contrasena IN VARCHAR2,
    p_preferencias_correo IN VARCHAR2,
    p_fecha_registro IN DATE -- Nueva columna fecha_registro
)
IS
BEGIN
    UPDATE Usuarios
    SET nombre = p_nombre,
        correo = p_correo,
        contrasena = p_contrasena,
        preferencias_correo = p_preferencias_correo,
        fecha_registro = p_fecha_registro -- Actualizar la fecha_registro
    WHERE id_usuario = p_id_usuario;
    
    COMMIT; -- Confirmar la actualización en la base de datos
    DBMS_OUTPUT.PUT_LINE('Usuario actualizado correctamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el usuario con el ID especificado.');
    WHEN OTHERS THEN
        ROLLBACK; -- Revertir cambios en caso de error
        DBMS_OUTPUT.PUT_LINE('Error al actualizar usuario.');
END SP_ActualizarUsuario;
/
BEGIN
    SP_ActualizarUsuario(1, 'Juanito Perez', 'juanito.perez@email.com', '123456', 'No');
END;

-- Eliminar Usuarios
CREATE OR REPLACE PROCEDURE SP_EliminarUsuario(
    p_id_usuario IN NUMBER
)
IS
BEGIN
    DELETE FROM Usuarios
    WHERE id_usuario = p_id_usuario;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún usuario con el ID especificado.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Usuario eliminado correctamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Revertir cambios en caso de error
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el usuario: ' || SQLERRM);
END SP_EliminarUsuario;
/
BEGIN
    SP_EliminarUsuario(9); -- ID del usuario a eliminar
END;

---------------------------------------------------------------------------------
--Steven
-- Crear Procedimiento de registro Newsletter
CREATE OR REPLACE PROCEDURE SP_Newsletter_sub AS
    suscripciones_totales INT;
BEGIN
    SELECT COUNT(*) INTO suscripciones_totales FROM Usuarios;
    DBMS_OUTPUT.PUT_LINE('Suscripciones Totales: ' || suscripciones_totales);
END SP_Newsletter_sub;
/

-- Crear procedimiento para mostrar cuantos usuarios se registraron durante el dia

CREATE OR REPLACE PROCEDURE SP_ContarUsuariosHoy AS
    Usuarios_totales INT;
    Fecha_hoy DATE;
BEGIN
    Fecha_hoy := SYSDATE; -- Utiliza SYSDATE para obtener la fecha actual
    
    SELECT COUNT(*)
    INTO Usuarios_totales
    FROM Usuarios
    WHERE TRUNC(fecha_registro) = TRUNC(Fecha_hoy); -- TRUNC para comparar solo la fecha sin la hora

    DBMS_OUTPUT.PUT_LINE('Usuarios registrados hoy: ' || Usuarios_totales);
END SP_ContarUsuariosHoy;
/

--******************************************************************************
--Crear procedimiento para listar las noticias por tema
CREATE OR REPLACE PROCEDURE SP_ListarNoticiasPorTema(
    p_id_tema IN NUMBER
)
IS
BEGIN
    FOR noticia IN (
        SELECT id_noticia, titulo, contenido, fecha_publicacion
        FROM Noticias
        WHERE id_tema = p_id_tema
        ORDER BY fecha_publicacion DESC
    )
    LOOP
        -- Imprimir/procesar
        DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia.id_noticia || ', Título: ' || noticia.titulo || ', Fecha Publicación: ' || TO_CHAR(noticia.fecha_publicacion, 'DD-MM-YYYY'));
    END LOOP;
END SP_ListarNoticiasPorTema;
/

BEGIN
    SP_ListarNoticiasPorTema(2);
END;

--SP para eliminar una notica de la BD
CREATE OR REPLACE PROCEDURE SP_EliminarNoticia(
    p_id_noticia IN NUMBER
)
IS
BEGIN
    -- Eliminar calificaciones relacionadas con la noticia
    DELETE FROM Calificaciones WHERE id_noticia = p_id_noticia;

    -- Eliminar visitas relacionadas con la noticia
    DELETE FROM Visitas WHERE id_noticia = p_id_noticia;

    -- Eliminar envíos de correo relacionados con la noticia
    DELETE FROM EnviosCorreo WHERE id_noticia = p_id_noticia;

    -- Eliminar comentarios relacionados con la noticia
    DELETE FROM Comentarios WHERE id_noticia = p_id_noticia;

    -- Eliminar seguimientos de usuarios relacionados con la noticia
    DELETE FROM SeguimientoUsuarios WHERE id_noticia = p_id_noticia;

    DELETE FROM Ranking WHERE id_noticia = p_id_noticia;
    
    -- Eliminar la noticia
    DELETE FROM Noticias WHERE id_noticia = p_id_noticia;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Noticia eliminada junto con sus relaciones.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró la noticia con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar la noticia.');
        ROLLBACK; 
END SP_EliminarNoticia;
/
BEGIN
    SP_EliminarNoticia(p_id_noticia => 1);
END;

--SP para actualizar la informacion de un tema existente en la bd
CREATE OR REPLACE PROCEDURE SP_ActualizarTema(
    p_id_tema IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2
)
IS
BEGIN
    UPDATE Temas
    SET nombre = p_nombre,
        descripcion = p_descripcion
    WHERE id_tema = p_id_tema;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el tema con el ID especificado.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Tema actualizado correctamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el tema: ' || SQLERRM);
END SP_ActualizarTema;
/
BEGIN
    SP_ActualizarTema(p_id_tema => 1, p_nombre => 'Nuevo Nombre', p_descripcion => 'Nueva Descripción');
END;

SELECT * FROM Temas WHERE id_tema = 1;

--SP para eliminar un tema, junto con sus relaciones como subtemas y el tema en si, con la condicion
-- de que si existe una noticia relacionada a ese tema no se puede eliminar
CREATE OR REPLACE PROCEDURE SP_EliminarTema(
    p_id_tema IN NUMBER
)
IS
    v_noticias_existentes NUMBER;
BEGIN
    -- Verificar si existen noticias relacionadas con el tema
    SELECT COUNT(*)
    INTO v_noticias_existentes
    FROM Noticias
    WHERE id_tema = p_id_tema;

    IF v_noticias_existentes > 0 THEN
        -- Si hay noticias relacionadas, mostrar un mensaje
        DBMS_OUTPUT.PUT_LINE('No se puede eliminar el tema porque existen noticias asociadas.');
    ELSE
        -- Si no hay noticias relacionadas, eliminar los subtemas del tema
        DELETE FROM Subtemas WHERE id_tema = p_id_tema;

        -- Eliminar el tema principal
        DELETE FROM Temas WHERE id_tema = p_id_tema;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Tema y subtemas eliminados correctamente.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el tema con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el tema y sus subtemas.');
        ROLLBACK; 
END SP_EliminarTema;
/
BEGIN
    SP_EliminarTema(p_id_tema => 1); -- ID del tema que se quiere eliminar
END;

--SP para actualizar subtemas
CREATE OR REPLACE PROCEDURE SP_ActualizarSubtema(
    p_id_subtema IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2
)
IS
BEGIN
    UPDATE Subtemas
    SET nombre = p_nombre,
        descripcion = p_descripcion
    WHERE id_subtema = p_id_subtema;
    
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el subtema con el ID especificado.');
    ELSE
        COMMIT; 
        DBMS_OUTPUT.PUT_LINE('Subtema actualizado correctamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el subtema.');
        ROLLBACK; 
END SP_ActualizarSubtema;
/
BEGIN
    SP_ActualizarSubtema(p_id_subtema => 1, p_nombre => 'Nuevo Nombre', p_descripcion => 'Nueva Descripción');
END;

-- SP para eliminar subtemas si no hay relacion con noticias
CREATE OR REPLACE PROCEDURE SP_EliminarSubtema(
    p_id_subtema IN NUMBER
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar la existencia del subtema
    SELECT COUNT(*)
    INTO v_count
    FROM Subtemas
    WHERE id_subtema = p_id_subtema;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('El subtema con ID ' || p_id_subtema || ' no existe.');
    ELSE
        -- Verificar si hay noticias relacionadas al subtema
        SELECT COUNT(*)
        INTO v_count
        FROM Noticias
        WHERE id_subtema = p_id_subtema;

        IF v_count > 0 THEN
            DBMS_OUTPUT.PUT_LINE('No se puede eliminar el subtema con ID ' || p_id_subtema || ' porque tiene noticias relacionadas.');
        ELSE
            -- Eliminar el subtema si no tiene noticias relacionadas
            DELETE FROM Subtemas WHERE id_subtema = p_id_subtema;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('El subtema con ID ' || p_id_subtema || ' fue eliminado correctamente.');
        END IF;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al intentar eliminar el subtema.');
        ROLLBACK;
END SP_EliminarSubtema;
BEGIN
    SP_EliminarSubtema(p_id_subtema => 3);
END;

--Sp para listar todos los subtemas
CREATE OR REPLACE PROCEDURE SP_ListarSubtemas
IS
BEGIN
    -- Cursor implícito
    FOR subtema_row IN (SELECT id_subtema, nombre, descripcion FROM Subtemas)
    LOOP
        DBMS_OUTPUT.PUT_LINE('ID Subtema: ' || subtema_row.id_subtema || ', Nombre: ' || subtema_row.nombre || ', Descripción: ' || subtema_row.descripcion);
    END LOOP;
END SP_ListarSubtemas;
/

EXEC SP_ListarSubtemas;

--SP para buscar noticias por palabras claves en el titulo o contenido
CREATE OR REPLACE PROCEDURE SP_BuscarNoticias(
    p_palabra_clave IN VARCHAR2
)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Noticias
    WHERE UPPER(titulo) LIKE '%' || UPPER(p_palabra_clave) || '%' OR UPPER(contenido) LIKE '%' || UPPER(p_palabra_clave) || '%';

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron noticias relacionadas con la palabra clave "' || p_palabra_clave || '".');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Noticias relacionadas con la palabra clave "' || p_palabra_clave || '":');
        
        FOR news IN (SELECT id_noticia, titulo FROM Noticias
                     WHERE UPPER(titulo) LIKE '%' || UPPER(p_palabra_clave) || '%' OR UPPER(contenido) LIKE '%' || UPPER(p_palabra_clave) || '%'
                     ORDER BY fecha_publicacion DESC)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || news.id_noticia || ', Título: ' || news.titulo);
        END LOOP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al buscar noticias.');
END SP_BuscarNoticias;
/
BEGIN
    SP_BuscarNoticias('leonardo');
END;

--SP para listar las noticias por subtema
CREATE OR REPLACE PROCEDURE SP_ListarNoticiasPorSubtema(
    p_id_subtema IN NUMBER
)
IS
BEGIN
    FOR noticia IN (
        SELECT id_noticia, titulo, contenido, fecha_publicacion
        FROM Noticias
        WHERE id_subtema = p_id_subtema
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia.id_noticia || ', Título: ' || noticia.titulo || ', Contenido: ' || noticia.contenido || ', Fecha Publicación: ' || TO_CHAR(noticia.fecha_publicacion, 'DD-MM-YYYY'));
    END LOOP;
END SP_ListarNoticiasPorSubtema;
/
BEGIN
    SP_ListarNoticiasPorSubtema(3); -- ID del subtema
END;

--SP para insertar imagenes de noticas 
CREATE SEQUENCE seq_imagenes_noticias
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE OR REPLACE PROCEDURE SP_InsertarImagenNoticia(
    p_id_noticia IN NUMBER,
    p_nombre_archivo IN VARCHAR2,
    p_ruta_archivo IN VARCHAR2
)
IS
BEGIN
    INSERT INTO ImagenesNoticias (id_imagen, id_noticia, nombre_archivo, ruta_archivo)
    VALUES (seq_imagenes_noticias.nextval, p_id_noticia, p_nombre_archivo, p_ruta_archivo);
    
    COMMIT; 
    DBMS_OUTPUT.PUT_LINE('Imagen de noticia insertada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; 
        DBMS_OUTPUT.PUT_LINE('Error al insertar la imagen de noticia: ' || SQLERRM);
END SP_InsertarImagenNoticia;
/
BEGIN
    SP_InsertarImagenNoticia(2, 'noticia_leonardo.jpg', 'C:\xampp\htdocs\Proyecto-Lenguajes-de-Bases-de-Datos-\img_bd\noticia_leonardo.jpg');
END;

--SP para actualizar la imagen de una noticia
CREATE OR REPLACE PROCEDURE SP_ActualizarImagenNoticia(
    p_id_noticia IN NUMBER,
    p_nombre_archivo IN VARCHAR2,
    p_ruta_archivo IN VARCHAR2
)
IS
BEGIN
    UPDATE ImagenesNoticias
    SET nombre_archivo = p_nombre_archivo,
        ruta_archivo = p_ruta_archivo
    WHERE id_noticia = p_id_noticia;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Imagen de la noticia actualizada correctamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró la noticia con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar la imagen de la noticia: ' || SQLERRM);
END SP_ActualizarImagenNoticia;
/
BEGIN
    SP_ActualizarImagenNoticia(4, 'cambio_climatico.jpg', 'C:\xampp\htdocs\Proyecto-Lenguajes-de-Bases-de-Datos-\img_bd\cambio_climatico.jpg');
END;

--SP para eliminar la imagen de una noticia
CREATE OR REPLACE PROCEDURE SP_EliminarImagenNoticia(
    p_id_noticia IN NUMBER,
    p_id_imagen IN NUMBER
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar si la imagen que se desea eliminar está asociada a la noticia
    SELECT COUNT(*)
    INTO v_count
    FROM ImagenesNoticias
    WHERE id_noticia = p_id_noticia AND id_imagen = p_id_imagen;

    IF v_count > 0 THEN
        -- Eliminar la imagen de la noticia
        DELETE FROM ImagenesNoticias
        WHERE id_noticia = p_id_noticia AND id_imagen = p_id_imagen;

        DBMS_OUTPUT.PUT_LINE('Imagen eliminada correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('La imagen no está asociada a la noticia.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró la noticia o la imagen con los IDs especificados.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar la imagen de la noticia.');
END SP_EliminarImagenNoticia;
/
BEGIN
    SP_EliminarImagenNoticia(2,5); --ID de la notica y ID de la imagen, en caso de que una noticia tenga otra imagen
END;

--SP para listar todas las noticias
CREATE OR REPLACE PROCEDURE SP_ListarTodasNoticias
IS
BEGIN
    -- Seleccionar todas las noticias de la tabla Noticias
    FOR noticia_rec IN (SELECT * FROM Noticias)
    LOOP
        -- Mostrar información de cada noticia
        DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia_rec.id_noticia);
        DBMS_OUTPUT.PUT_LINE('Título: ' || noticia_rec.titulo);
        DBMS_OUTPUT.PUT_LINE('Contenido: ' || noticia_rec.contenido);
        DBMS_OUTPUT.PUT_LINE('Fecha de Publicación: ' || TO_CHAR(noticia_rec.fecha_publicacion, 'DD-MON-YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('ID Tema: ' || noticia_rec.id_tema);
        DBMS_OUTPUT.PUT_LINE('ID Subtema: ' || noticia_rec.id_subtema);
        DBMS_OUTPUT.PUT_LINE('ID Usuario: ' || noticia_rec.id_usuario);
        DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    END LOOP;
END SP_ListarTodasNoticias;
/
EXEC SP_ListarTodasNoticias;

--SP para listar todos los temas
CREATE OR REPLACE PROCEDURE SP_ListarTemas
IS
BEGIN
    --cursor implicito
    FOR tema_row IN (SELECT id_tema, nombre, descripcion FROM Temas)
    LOOP
        DBMS_OUTPUT.PUT_LINE('ID Tema: ' || tema_row.id_tema || ', Nombre: ' || tema_row.nombre || ', Descripción: ' || tema_row.descripcion);
    END LOOP;
END SP_ListarTemas;
/
EXEC SP_ListarTemas;

--********************************--HASTA ACÁ HAY 25 SP--*************************
CREATE OR REPLACE PROCEDURE SP_ActualizarNoticia(
    p_id_noticia IN NUMBER,
    p_titulo IN VARCHAR2,
    p_contenido IN CLOB,
    p_fecha_publicacion IN DATE,
    p_id_tema IN NUMBER,
    p_id_subtema IN NUMBER
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar si la noticia existe antes de actualizar
    SELECT COUNT(*)
    INTO v_count
    FROM Noticias
    WHERE id_noticia = p_id_noticia;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró la noticia con el ID especificado.');
    ELSE
        -- Actualizar la noticia si existe
        UPDATE Noticias
        SET titulo = p_titulo,
            contenido = p_contenido,
            fecha_publicacion = p_fecha_publicacion,
            id_tema = p_id_tema,
            id_subtema = p_id_subtema
        WHERE id_noticia = p_id_noticia;

        COMMIT; 
        DBMS_OUTPUT.PUT_LINE('Noticia actualizada correctamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al actualizar la noticia: ' || SQLERRM);
END SP_ActualizarNoticia;
/
BEGIN
    SP_ActualizarNoticia(
        p_id_noticia => 8,
        p_titulo => 'Nuevo título de la noticia',
        p_contenido => 'Nuevo contenido de la noticia',
        p_fecha_publicacion => SYSDATE,
        p_id_tema => 2,
        p_id_subtema => 3
    );
END;

------------------------------------------------ Cursores ------------------------------------

-- Cursor para obtener la lista de usuarios que han calificado una noticia
    DECLARE
        CURSOR calificaciones_cursor IS
            SELECT id_usuario
            FROM Calificaciones
            WHERE id_noticia = :id_noticia;
    BEGIN
        FOR calificacion_rec IN calificaciones_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('Usuario que calificó la noticia: ' || calificacion_rec.id_usuario);
        END LOOP;
    END;

-- Cursor para obtener la lista de usuarios que han visitado una noticia
    DECLARE
        CURSOR visitas_cursor IS
            SELECT id_usuario
            FROM Visitas
            WHERE id_noticia = :id_noticia;
    BEGIN
        FOR visita_rec IN visitas_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('Usuario que visitó la noticia: ' || visita_rec.id_usuario);
        END LOOP;
    END;    

-- Cursor para obtener la lista de usuarios que han comentado en una noticia
    DECLARE
        CURSOR comentarios_cursor IS
            SELECT id_usuario
            FROM Comentarios
            WHERE id_noticia = :id_noticia;
    BEGIN
        FOR comentario_rec IN comentarios_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('Usuario que comentó en la noticia: ' || comentario_rec.id_usuario);
        END LOOP;
    END;    

-- Cursor para obtener la lista de usuarios
    DECLARE
        CURSOR usuarios_cursor IS
            SELECT id_usuario, nombre, correo
            FROM Usuarios;
    BEGIN
        FOR usuario_rec IN usuarios_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('ID Usuario: ' || usuario_rec.id_usuario || ', Nombre: ' || usuario_rec.nombre || ', Correo: ' || usuario_rec.correo);
        END LOOP;
    END;

-- Cursor para obtener la lista de temas
    DECLARE
        CURSOR temas_cursor IS
            SELECT id_tema, nombre, descripcion
            FROM Temas;
    BEGIN
        FOR tema_rec IN temas_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('ID Tema: ' || tema_rec.id_tema || ', Nombre: ' || tema_rec.nombre || ', Descripción: ' || tema_rec.descripcion);
        END LOOP;
    END;

--Cursor para obtener el número total de temas
    DECLARE
    total_temas NUMBER;
    BEGIN
        SELECT COUNT(*) INTO total_temas FROM Temas;
        DBMS_OUTPUT.PUT_LINE('Total de temas: ' || total_temas);
    END;

--Cursor para obtener un tema específico por ID
    DECLARE
        v_tema_id NUMBER := 1; -- ID del tema que deseas obtener
        v_nombre_temas VARCHAR2(100);
        v_descripcion_temas VARCHAR2(255);
    BEGIN
        SELECT nombre, descripcion INTO v_nombre_temas, v_descripcion_temas
        FROM Temas
        WHERE id_tema = v_tema_id;
        DBMS_OUTPUT.PUT_LINE('Nombre del tema con ID ' || v_tema_id || ': ' || v_nombre_temas);
        DBMS_OUTPUT.PUT_LINE('Descripción del tema: ' || v_descripcion_temas);
    END;

-- Cursor para obtener la lista de noticias
    DECLARE
        CURSOR noticias_cursor IS
            SELECT id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario
            FROM Noticias;
    BEGIN
        FOR noticia_rec IN noticias_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia_rec.id_noticia || ', Título: ' || noticia_rec.titulo || ', Contenido: ' || noticia_rec.contenido || ', Fecha de Publicación: ' || noticia_rec.fecha_publicacion || ', ID Tema: ' || noticia_rec.id_tema || ', ID Subtema: ' || noticia_rec.id_subtema || ', ID Usuario: ' || noticia_rec.id_usuario);
        END LOOP;
    END;

--Cursor para obtener noticias por tema
    DECLARE
        v_tema_id NUMBER := 1; -- ID del tema que deseas filtrar
        CURSOR noticias_tema_cursor IS
            SELECT * FROM Noticias WHERE id_tema = v_tema_id;
        noticia_tema_rec Noticias%ROWTYPE;
    BEGIN
        OPEN noticias_tema_cursor;
        LOOP
            FETCH noticias_tema_cursor INTO noticia_tema_rec;
            EXIT WHEN noticias_tema_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia_tema_rec.id_noticia || ', Título: ' || noticia_tema_rec.titulo || ', Contenido: ' || noticia_tema_rec.contenido || ', Fecha de publicación: ' || noticia_tema_rec.fecha_publicacion || ', ID Tema: ' || noticia_tema_rec.id_tema || ', ID Subtema: ' || noticia_tema_rec.id_subtema || ', ID Usuario: ' || noticia_tema_rec.id_usuario);
        END LOOP;
        CLOSE noticias_tema_cursor;
    END;

--Cursor para obtener noticias por usuario
    DECLARE
        v_usuario_id NUMBER := 1; -- ID del usuario que deseas filtrar
        CURSOR noticias_usuario_cursor IS
            SELECT * FROM Noticias WHERE id_usuario = v_usuario_id;
        noticia_usuario_rec Noticias%ROWTYPE;
    BEGIN
        OPEN noticias_usuario_cursor;
        LOOP
            FETCH noticias_usuario_cursor INTO noticia_usuario_rec;
            EXIT WHEN noticias_usuario_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia_usuario_rec.id_noticia || ', Título: ' || noticia_usuario_rec.titulo || ', Contenido: ' || noticia_usuario_rec.contenido || ', Fecha de publicación: ' || noticia_usuario_rec.fecha_publicacion || ', ID Tema: ' || noticia_usuario_rec.id_tema || ', ID Subtema: ' || noticia_usuario_rec.id_subtema || ', ID Usuario: ' || noticia_usuario_rec.id_usuario);
        END LOOP;
        CLOSE noticias_usuario_cursor;
    END;


--Cursor para obtener la lista de subtemas   
    DECLARE
    CURSOR subtemas_cursor IS
        SELECT id_subtema, nombre, descripcion, id_tema FROM Subtemas;
    subtema_rec subtemas_cursor%ROWTYPE;
    BEGIN
        OPEN subtemas_cursor;
        LOOP
            FETCH subtemas_cursor INTO subtema_rec;
            EXIT WHEN subtemas_cursor%NOTFOUND; /*determina cuándo salir del bucle de lectura del cursor*/
            DBMS_OUTPUT.PUT_LINE('ID Subtema: ' || subtema_rec.id_subtema || ', Nombre: ' || subtema_rec.nombre || ', Descripción: ' || subtema_rec.descripcion || ', ID Tema: ' || subtema_rec.id_tema);
        END LOOP;
        CLOSE subtemas_cursor;
    END;

--Cursor para obtener el número total de subtemas    
    DECLARE
    total_subtemas NUMBER;
    BEGIN
        SELECT COUNT(*) INTO total_subtemas FROM Subtemas;
        DBMS_OUTPUT.PUT_LINE('Total de subtemas: ' || total_subtemas);
    END;

--Cursor para obtener un subtema específico por ID    
    DECLARE
        v_subtema_id NUMBER := 2; -- ID del subtema que deseas obtener
        v_nombre_subtema VARCHAR2(100);
        v_descripcion_subtema VARCHAR2(255);
        v_id_tema_subtema NUMBER;
    BEGIN
        SELECT nombre, descripcion, id_tema INTO v_nombre_subtema, v_descripcion_subtema, v_id_tema_subtema
        FROM Subtemas
        WHERE id_subtema = v_subtema_id;
        DBMS_OUTPUT.PUT_LINE('Nombre del subtema con ID ' || v_subtema_id || ': ' || v_nombre_subtema);
        DBMS_OUTPUT.PUT_LINE('Descripción del subtema: ' || v_descripcion_subtema);
        DBMS_OUTPUT.PUT_LINE('ID del tema asociado al subtema: ' || v_id_tema_subtema);
    END;


--Cursor para obtener la lista de calificaciones
    DECLARE
    CURSOR calificaciones_cursor IS
        SELECT id_calificacion, id_noticia, id_usuario, calificacion FROM Calificaciones;
    calificacion_rec calificaciones_cursor%ROWTYPE;
    BEGIN
        OPEN calificaciones_cursor;
        LOOP
            FETCH calificaciones_cursor INTO calificacion_rec;
            EXIT WHEN calificaciones_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID Calificación: ' || calificacion_rec.id_calificacion || ', ID Noticia: ' || calificacion_rec.id_noticia || ', ID Usuario: ' || calificacion_rec.id_usuario || ', Calificación: ' || calificacion_rec.calificacion);
        END LOOP;
        CLOSE calificaciones_cursor;
    END;
    
--Cursor para obtener calificaciones por noticia
    DECLARE
        v_noticia_id NUMBER := 1; 
        CURSOR calificaciones_noticia_cursor IS
            SELECT * FROM Calificaciones WHERE id_noticia = v_noticia_id;
        calificacion_noticia_rec Calificaciones%ROWTYPE;
    BEGIN
        OPEN calificaciones_noticia_cursor;
        LOOP
            FETCH calificaciones_noticia_cursor INTO calificacion_noticia_rec;
            EXIT WHEN calificaciones_noticia_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID Calificación: ' || calificacion_noticia_rec.id_calificacion || ', ID Noticia: ' || calificacion_noticia_rec.id_noticia || ', ID Usuario: ' || calificacion_noticia_rec.id_usuario || ', Calificación: ' || calificacion_noticia_rec.calificacion);
        END LOOP;
        CLOSE calificaciones_noticia_cursor;
    END;

--Cursor para obtener todas las visitas
    DECLARE
    CURSOR visitas_cursor IS
        SELECT * FROM Visitas;
    visita_rec Visitas%ROWTYPE;
    BEGIN
        OPEN visitas_cursor;
        LOOP
            FETCH visitas_cursor INTO visita_rec;
            EXIT WHEN visitas_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID Visita: ' || visita_rec.id_visita || ', ID Noticia: ' || visita_rec.id_noticia || ', ID Usuario: ' || visita_rec.id_usuario || ', Fecha de visita: ' || visita_rec.fecha_visita);
        END LOOP;
        CLOSE visitas_cursor;
    END;

--Cursor para obtener visitas por noticia
    DECLARE
        v_usuario_id NUMBER := 2; 
        CURSOR visitas_usuario_cursor IS
            SELECT * FROM Visitas WHERE id_usuario = v_usuario_id;
        visita_usuario_rec Visitas%ROWTYPE;
    BEGIN
        OPEN visitas_usuario_cursor;
        LOOP
            FETCH visitas_usuario_cursor INTO visita_usuario_rec;
            EXIT WHEN visitas_usuario_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID Visita: ' || visita_usuario_rec.id_visita || ', ID Noticia: ' || visita_usuario_rec.id_noticia || ', ID Usuario: ' || visita_usuario_rec.id_usuario || ', Fecha de visita: ' || visita_usuario_rec.fecha_visita);
        END LOOP;
        CLOSE visitas_usuario_cursor;
    END;

--*************************************** Paquetes *******************************************
--Paquete de Gestion de Usuarios
CREATE OR REPLACE PACKAGE PaqueteGestionUsuarios AS
    -- Procedimiento para agregar usuarios
    PROCEDURE SP_AgregarUsuario(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_preferencias_correo IN VARCHAR2 DEFAULT NULL,
        p_fecha_registro IN DATE -- Nueva columna fecha_registro
    );

    -- Procedimiento para actualizar usuarios
    PROCEDURE SP_ActualizarUsuario(
        p_id_usuario IN NUMBER,
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_preferencias_correo IN VARCHAR2,
        p_fecha_registro IN DATE -- Nueva columna fecha_registro
    );

    -- Procedimiento para eliminar usuarios
    PROCEDURE SP_EliminarUsuario(
        p_id_usuario IN NUMBER
    );
END PaqueteGestionUsuarios;
/

CREATE OR REPLACE PACKAGE BODY PaqueteGestionUsuarios AS
    -- Procedimiento para agregar usuarios
    PROCEDURE SP_AgregarUsuario(
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_preferencias_correo IN VARCHAR2 DEFAULT NULL,
        p_fecha_registro IN DATE 
    )
    IS
    BEGIN
        INSERT INTO Usuarios (id_usuario, nombre, correo, contrasena, preferencias_correo, fecha_registro)
        VALUES (seq_usuarios.nextval, p_nombre, p_correo, p_contrasena, p_preferencias_correo, p_fecha_registro);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Usuario agregado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al agregar el usuario: ' || SQLERRM);
    END SP_AgregarUsuario;

    -- Procedimiento para actualizar usuarios
    PROCEDURE SP_ActualizarUsuario(
        p_id_usuario IN NUMBER,
        p_nombre IN VARCHAR2,
        p_correo IN VARCHAR2,
        p_contrasena IN VARCHAR2,
        p_preferencias_correo IN VARCHAR2,
        p_fecha_registro IN DATE 
    )
    IS
    BEGIN
        UPDATE Usuarios
        SET nombre = p_nombre,
            correo = p_correo,
            contrasena = p_contrasena,
            preferencias_correo = p_preferencias_correo,
            fecha_registro = p_fecha_registro -- Actualizar la fecha_registro
        WHERE id_usuario = p_id_usuario;
        
        COMMIT; 
        DBMS_OUTPUT.PUT_LINE('Usuario actualizado correctamente.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró el usuario con el ID especificado.');
        WHEN OTHERS THEN
            ROLLBACK; -- Revertir cambios en caso de error
            DBMS_OUTPUT.PUT_LINE('Error al actualizar usuario.');
    END SP_ActualizarUsuario;

    -- Procedimiento para eliminar usuarios
    PROCEDURE SP_EliminarUsuario(
        p_id_usuario IN NUMBER
    )
    IS
    BEGIN
        DELETE FROM Usuarios
        WHERE id_usuario = p_id_usuario;

        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró ningún usuario con el ID especificado.');
        ELSE
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Usuario eliminado correctamente.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; 
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el usuario: ' || SQLERRM);
    END SP_EliminarUsuario;
END PaqueteGestionUsuarios;
/

EXEC PaqueteGestionUsuarios.SP_AgregarUsuario('Mariana', 'mariana@gmail.com', '123', 'No', SYSDATE);

EXEC PaqueteGestionUsuarios.SP_ActualizarUsuario(1, 'Juanito Perez', 'juanito.perez@email.com', 'nuevacontraseña', 'Si', SYSDATE);

EXEC PaqueteGestionUsuarios.SP_EliminarUsuario(9); -- ID del usuario a eliminar

--*****************************************************************************************************

--Paquete para listar noticias de diferentes formas, además de buscar por palabras clave.
CREATE OR REPLACE PACKAGE PaqueteListarNoticias AS
    -- Procedimiento para listar las últimas noticias en orden descendente
    PROCEDURE SP_ListarUltimasNoticiasDesc(p_max_noticias IN NUMBER);

    -- Procedimiento para listar las últimas noticias en orden ascendente
    PROCEDURE SP_ListarUltimasNoticiasAsc(p_max_noticias IN NUMBER);

    -- Procedimiento para listar las noticias por tema
    PROCEDURE SP_ListarNoticiasPorTema(p_id_tema IN NUMBER);

    -- Procedimiento para buscar noticias por palabras clave en el título o contenido
    PROCEDURE SP_BuscarNoticias(p_palabra_clave IN VARCHAR2);

    -- Procedimiento para listar las noticias por subtema
    PROCEDURE SP_ListarNoticiasPorSubtema(p_id_subtema IN NUMBER);

    -- Procedimiento para listar todas las noticias
    PROCEDURE SP_ListarTodasNoticias;
END PaqueteListarNoticias;
/

CREATE OR REPLACE PACKAGE BODY PaqueteListarNoticias AS
    -- Implementación del procedimiento para listar las últimas noticias en orden descendente
    PROCEDURE SP_ListarUltimasNoticiasDesc(p_max_noticias IN NUMBER) IS
    BEGIN
        FOR ultima_noticia IN (
            SELECT id_noticia, titulo, contenido, fecha_publicacion
            FROM (
                SELECT id_noticia, titulo, contenido, fecha_publicacion
                FROM Noticias
                ORDER BY fecha_publicacion DESC
            )
            WHERE ROWNUM <= p_max_noticias
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || ultima_noticia.id_noticia || ', Título: ' || ultima_noticia.titulo || ', Fecha Publicación: ' || TO_CHAR(ultima_noticia.fecha_publicacion, 'DD-MM-YYYY'));
        END LOOP;
    END SP_ListarUltimasNoticiasDesc;

    -- Implementación del procedimiento para listar las últimas noticias en orden ascendente
    PROCEDURE SP_ListarUltimasNoticiasAsc(p_max_noticias IN NUMBER) IS
    BEGIN
        FOR ultima_noticia IN (
            SELECT id_noticia, titulo, contenido, fecha_publicacion
            FROM (
                SELECT id_noticia, titulo, contenido, fecha_publicacion
                FROM Noticias
                ORDER BY fecha_publicacion ASC
            )
            WHERE ROWNUM <= p_max_noticias
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || ultima_noticia.id_noticia || ', Título: ' || ultima_noticia.titulo || ', Fecha Publicación: ' || TO_CHAR(ultima_noticia.fecha_publicacion, 'DD-MM-YYYY'));
        END LOOP;
    END SP_ListarUltimasNoticiasAsc;

    -- Implementación del procedimiento para listar las noticias por tema
    PROCEDURE SP_ListarNoticiasPorTema(p_id_tema IN NUMBER) IS
    BEGIN
        FOR noticia IN (
            SELECT id_noticia, titulo, contenido, fecha_publicacion
            FROM Noticias
            WHERE id_tema = p_id_tema
            ORDER BY fecha_publicacion DESC
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia.id_noticia || ', Título: ' || noticia.titulo || ', Fecha Publicación: ' || TO_CHAR(noticia.fecha_publicacion, 'DD-MM-YYYY'));
        END LOOP;
    END SP_ListarNoticiasPorTema;

    -- Implementación del procedimiento para buscar noticias por palabras clave en el título o contenido
    PROCEDURE SP_BuscarNoticias(p_palabra_clave IN VARCHAR2) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM Noticias
        WHERE UPPER(titulo) LIKE '%' || UPPER(p_palabra_clave) || '%' OR UPPER(contenido) LIKE '%' || UPPER(p_palabra_clave) || '%';

        IF v_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron noticias relacionadas con la palabra clave "' || p_palabra_clave || '".');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Noticias relacionadas con la palabra clave "' || p_palabra_clave || '":');
            
            FOR news IN (SELECT id_noticia, titulo FROM Noticias
                         WHERE UPPER(titulo) LIKE '%' || UPPER(p_palabra_clave) || '%' OR UPPER(contenido) LIKE '%' || UPPER(p_palabra_clave) || '%'
                         ORDER BY fecha_publicacion DESC)
            LOOP
                DBMS_OUTPUT.PUT_LINE('ID: ' || news.id_noticia || ', Título: ' || news.titulo);
            END LOOP;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al buscar noticias.');
    END SP_BuscarNoticias;

    -- Implementación del procedimiento para listar las noticias por subtema
    PROCEDURE SP_ListarNoticiasPorSubtema(p_id_subtema IN NUMBER) IS
    BEGIN
        FOR noticia IN (
            SELECT id_noticia, titulo, contenido, fecha_publicacion
            FROM Noticias
            WHERE id_subtema = p_id_subtema
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia.id_noticia || ', Título: ' || noticia.titulo || ', Contenido: ' || noticia.contenido || ', Fecha Publicación: ' || TO_CHAR(noticia.fecha_publicacion, 'DD-MM-YYYY'));
        END LOOP;
    END SP_ListarNoticiasPorSubtema;

    -- Implementación del procedimiento para listar todas las noticias
    PROCEDURE SP_ListarTodasNoticias IS
    BEGIN
        FOR noticia_rec IN (SELECT * FROM Noticias)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || noticia_rec.id_noticia);
            DBMS_OUTPUT.PUT_LINE('Título: ' || noticia_rec.titulo);
            DBMS_OUTPUT.PUT_LINE('Contenido: ' || noticia_rec.contenido);
            DBMS_OUTPUT.PUT_LINE('Fecha de Publicación: ' || TO_CHAR(noticia_rec.fecha_publicacion, 'DD-MON-YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('ID Tema: ' || noticia_rec.id_tema);
            DBMS_OUTPUT.PUT_LINE('ID Subtema: ' || noticia_rec.id_subtema);
            DBMS_OUTPUT.PUT_LINE('ID Usuario: ' || noticia_rec.id_usuario);
            DBMS_OUTPUT.PUT_LINE('--------------------------------------');
        END LOOP;
    END SP_ListarTodasNoticias;
END PaqueteListarNoticias;
/
EXEC PaqueteListarNoticias.SP_ListarUltimasNoticiasDesc(p_max_noticias => 3);

EXEC PaqueteListarNoticias.SP_ListarNoticiasPorTema(p_id_tema => 3);

EXEC PaqueteListarNoticias.SP_BuscarNoticias(p_palabra_clave => 'Leonardo');

EXEC PaqueteListarNoticias.SP_ListarNoticiasPorSubtema(p_id_subtema => 2);

EXEC PaqueteListarNoticias.SP_ListarTodasNoticias;
--***********************************************************************************

--Paquete para gestionar noticias (insertar, actualizar, eliminar)
CREATE OR REPLACE PACKAGE PaqueteGestionNoticias AS
    -- Procedimiento para eliminar una noticia de la BD.
    PROCEDURE SP_EliminarNoticia(
        p_id_noticia IN NUMBER
    );

    -- Función para insertar una nueva noticia
    FUNCTION insertar_noticia(
        p_id_noticia IN NUMBER,
        p_titulo IN VARCHAR2,
        p_contenido IN CLOB,
        p_fecha_publicacion IN DATE,
        p_id_tema IN NUMBER,
        p_id_subtema IN NUMBER,
        p_id_usuario IN NUMBER
    ) RETURN VARCHAR2;

    -- Procedimiento para actualizar una noticia
    PROCEDURE SP_ActualizarNoticia(
        p_id_noticia IN NUMBER,
        p_titulo IN VARCHAR2,
        p_contenido IN CLOB,
        p_fecha_publicacion IN DATE,
        p_id_tema IN NUMBER,
        p_id_subtema IN NUMBER
    );
END PaqueteGestionNoticias;
/

CREATE OR REPLACE PACKAGE BODY PaqueteGestionNoticias AS
    -- Procedimiento para eliminar una noticia de la BD.
    PROCEDURE SP_EliminarNoticia(
        p_id_noticia IN NUMBER
    )
    IS
    BEGIN
        -- Eliminar calificaciones relacionadas con la noticia
        DELETE FROM Calificaciones WHERE id_noticia = p_id_noticia;

        -- Eliminar visitas relacionadas con la noticia
        DELETE FROM Visitas WHERE id_noticia = p_id_noticia;

        -- Eliminar envíos de correo relacionados con la noticia
        DELETE FROM EnviosCorreo WHERE id_noticia = p_id_noticia;

        -- Eliminar comentarios relacionados con la noticia
        DELETE FROM Comentarios WHERE id_noticia = p_id_noticia;

        -- Eliminar seguimientos de usuarios relacionados con la noticia
        DELETE FROM SeguimientoUsuarios WHERE id_noticia = p_id_noticia;

        DELETE FROM Ranking WHERE id_noticia = p_id_noticia;
        
        -- Eliminar la noticia
        DELETE FROM Noticias WHERE id_noticia = p_id_noticia;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Noticia eliminada junto con sus relaciones.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró la noticia con el ID especificado.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar la noticia.');
            ROLLBACK; 
    END SP_EliminarNoticia;

    -- Función para insertar una nueva noticia
    FUNCTION insertar_noticia(
        p_id_noticia IN NUMBER,
        p_titulo IN VARCHAR2,
        p_contenido IN CLOB,
        p_fecha_publicacion IN DATE,
        p_id_tema IN NUMBER,
        p_id_subtema IN NUMBER,
        p_id_usuario IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Noticias (id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario)
        VALUES (p_id_noticia, p_titulo, p_contenido, p_fecha_publicacion, p_id_tema, p_id_subtema, p_id_usuario);
        
        RETURN 'Noticia insertada correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID de noticia ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar la noticia';
    END;

    -- Procedimiento para actualizar una noticia
    PROCEDURE SP_ActualizarNoticia(
        p_id_noticia IN NUMBER,
        p_titulo IN VARCHAR2,
        p_contenido IN CLOB,
        p_fecha_publicacion IN DATE,
        p_id_tema IN NUMBER,
        p_id_subtema IN NUMBER
    )
    IS
        v_count NUMBER;
    BEGIN
        -- Verificar si la noticia existe antes de actualizar
        SELECT COUNT(*)
        INTO v_count
        FROM Noticias
        WHERE id_noticia = p_id_noticia;

        IF v_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró la noticia con el ID especificado.');
        ELSE
            -- Actualizar la noticia si existe
            UPDATE Noticias
            SET titulo = p_titulo,
                contenido = p_contenido,
                fecha_publicacion = p_fecha_publicacion,
                id_tema = p_id_tema,
                id_subtema = p_id_subtema
            WHERE id_noticia = p_id_noticia;

            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Noticia actualizada correctamente.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; 
            DBMS_OUTPUT.PUT_LINE('Error al actualizar la noticia: ' || SQLERRM);
    END SP_ActualizarNoticia;
END PaqueteGestionNoticias;
/
BEGIN
    PaqueteGestionNoticias.SP_EliminarNoticia(p_id_noticia => 2);
END;

DECLARE
    v_resultado VARCHAR2(100);
BEGIN
    v_resultado := PaqueteGestionNoticias.insertar_noticia(
        p_id_noticia => 6,
        p_titulo => 'Expo Movil 2024',
        p_contenido => 'Variedad de carros en marcas como Toyota, Nissan, Ford y muchas más',
        p_fecha_publicacion => SYSDATE,
        p_id_tema => 2,
        p_id_subtema => 3,
        p_id_usuario => 1
    );
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;

BEGIN
    PaqueteGestionNoticias.SP_ActualizarNoticia(
        p_id_noticia => 6,
        p_titulo => 'Expo Móvil 2024',
        p_contenido => 'Variedad de carros en marcas como Toyota, Nissan, Ford, Chevrolet y muchas más...',
        p_fecha_publicacion => SYSDATE,
        p_id_tema => 3,
        p_id_subtema => 4
    );
END;


--***************************************************************************************
--Paquete Gestion de Imagenes (Insertar, Actualizar, ELiminar)
CREATE OR REPLACE PACKAGE PaqueteGestionImagenes AS
    --SP para insertar imagenes de noticas 
    PROCEDURE SP_InsertarImagenNoticia(
        p_id_noticia IN NUMBER,
        p_nombre_archivo IN VARCHAR2,
        p_ruta_archivo IN VARCHAR2
    );

    --SP para actualizar la imagen de una noticia
    PROCEDURE SP_ActualizarImagenNoticia(
        p_id_noticia IN NUMBER,
        p_nombre_archivo IN VARCHAR2,
        p_ruta_archivo IN VARCHAR2
    );

    --SP para eliminar la imagen de una noticia
    PROCEDURE SP_EliminarImagenNoticia(
        p_id_noticia IN NUMBER,
        p_id_imagen IN NUMBER
    );
END PaqueteGestionImagenes;
/

CREATE OR REPLACE PACKAGE BODY PaqueteGestionImagenes AS
    --SP para insertar imagenes de noticas 
    PROCEDURE SP_InsertarImagenNoticia(
        p_id_noticia IN NUMBER,
        p_nombre_archivo IN VARCHAR2,
        p_ruta_archivo IN VARCHAR2
    )
    IS
    BEGIN
        INSERT INTO ImagenesNoticias (id_imagen, id_noticia, nombre_archivo, ruta_archivo)
        VALUES (seq_imagenes_noticias.nextval, p_id_noticia, p_nombre_archivo, p_ruta_archivo);
        
        COMMIT; 
        DBMS_OUTPUT.PUT_LINE('Imagen de noticia insertada correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; 
            DBMS_OUTPUT.PUT_LINE('Error al insertar la imagen de noticia: ' || SQLERRM);
    END SP_InsertarImagenNoticia;

    --SP para actualizar la imagen de una noticia
    PROCEDURE SP_ActualizarImagenNoticia(
        p_id_noticia IN NUMBER,
        p_nombre_archivo IN VARCHAR2,
        p_ruta_archivo IN VARCHAR2
    )
    IS
    BEGIN
        UPDATE ImagenesNoticias
        SET nombre_archivo = p_nombre_archivo,
            ruta_archivo = p_ruta_archivo
        WHERE id_noticia = p_id_noticia;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Imagen de la noticia actualizada correctamente.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró la noticia con el ID especificado.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al actualizar la imagen de la noticia: ' || SQLERRM);
    END SP_ActualizarImagenNoticia;

    --SP para eliminar la imagen de una noticia
    PROCEDURE SP_EliminarImagenNoticia(
        p_id_noticia IN NUMBER,
        p_id_imagen IN NUMBER
    )
    IS
        v_count NUMBER;
    BEGIN
        -- Verificar si la imagen que se desea eliminar está asociada a la noticia
        SELECT COUNT(*)
        INTO v_count
        FROM ImagenesNoticias
        WHERE id_noticia = p_id_noticia AND id_imagen = p_id_imagen;

        IF v_count > 0 THEN
            -- Eliminar la imagen de la noticia
            DELETE FROM ImagenesNoticias
            WHERE id_noticia = p_id_noticia AND id_imagen = p_id_imagen;

            DBMS_OUTPUT.PUT_LINE('Imagen eliminada correctamente.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('La imagen no está asociada a la noticia.');
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró la noticia o la imagen con los IDs especificados.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar la imagen de la noticia.');
    END SP_EliminarImagenNoticia;
END PaqueteGestionImagenes;
/


--Ruta imagenes= C:\xampp\htdocs\Proyecto-Lenguajes-de-Bases-de-Datos-\img_bd\nombre.jpg
BEGIN
    PaqueteGestionImagenes.SP_InsertarImagenNoticia(
        p_id_noticia => 6, -- ID de la noticia a la que se asociara la imagen
        p_nombre_archivo => 'africa.jpg', 
        p_ruta_archivo => 'C:\xampp\htdocs\Proyecto-Lenguajes-de-Bases-de-Datos-\img_bd\africa.jpg' 
    );
END;

BEGIN
    PaqueteGestionImagenes.SP_ActualizarImagenNoticia(
        p_id_noticia => 1, -- ID de la noticia para actualizar imagen
        p_nombre_archivo => 'africa.jpg', -- Nuevo nombre 
        p_ruta_archivo => 'C:\xampp\htdocs\Proyecto-Lenguajes-de-Bases-de-Datos-\img_bd\africa.jpg' -- Nueva ruta 
    );
END;

BEGIN
    PaqueteGestionImagenes.SP_EliminarImagenNoticia(
        p_id_noticia => 6, -- ID de la noticia 
        p_id_imagen => 8 -- ID de la imagen a eliminar
    );
END;
--***********************************************************************************************

--Paquete de gestion de temas (inserta, actualiza, eliminar, muestra por descripcion o todos)
-- Crear el paquete GestionTemas
CREATE OR REPLACE PACKAGE PaqueteGestionTemas AS
    -- Función para insertar un nuevo tema
    FUNCTION insertar_tema(
        p_id_tema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2
    ) RETURN VARCHAR2;

    -- Procedimiento para actualizar la información de un tema existente en la BD
    PROCEDURE SP_ActualizarTema(
        p_id_tema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2
    );

    -- Procedimiento para eliminar un tema junto con sus relaciones
    PROCEDURE SP_EliminarTema(
        p_id_tema IN NUMBER
    );

    -- Función para obtener la descripción de un tema dado su ID
    FUNCTION obtener_descripcion_tema(
        p_id_tema IN NUMBER
    ) RETURN VARCHAR2;

    -- Procedimiento para listar todos los temas
    PROCEDURE SP_ListarTemas;
END PaqueteGestionTemas;
/

-- Cuerpo del paquete GestionTemas
CREATE OR REPLACE PACKAGE BODY PaqueteGestionTemas AS
    -- Función para insertar un nuevo tema
    FUNCTION insertar_tema(
        p_id_tema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Temas (id_tema, nombre, descripcion)
        VALUES (p_id_tema, p_nombre, p_descripcion);
        
        RETURN 'Tema insertado correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID de tema ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar el tema';
    END insertar_tema;

    -- Procedimiento para actualizar la información de un tema existente en la BD
    PROCEDURE SP_ActualizarTema(
        p_id_tema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Temas
        SET nombre = p_nombre,
            descripcion = p_descripcion
        WHERE id_tema = p_id_tema;
        
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró el tema con el ID especificado.');
        ELSE
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Tema actualizado correctamente.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al actualizar el tema: ' || SQLERRM);
    END SP_ActualizarTema;

    -- Procedimiento para eliminar un tema junto con sus relaciones
    PROCEDURE SP_EliminarTema(
        p_id_tema IN NUMBER
    ) IS
        v_noticias_existentes NUMBER;
    BEGIN
        -- Verificar si existen noticias relacionadas con el tema
        SELECT COUNT(*)
        INTO v_noticias_existentes
        FROM Noticias
        WHERE id_tema = p_id_tema;

        IF v_noticias_existentes > 0 THEN
            -- Si hay noticias relacionadas, mostrar un mensaje
            DBMS_OUTPUT.PUT_LINE('No se puede eliminar el tema porque existen noticias asociadas.');
        ELSE
            -- Si no hay noticias relacionadas, eliminar los subtemas del tema
            DELETE FROM Subtemas WHERE id_tema = p_id_tema;

            -- Eliminar el tema principal
            DELETE FROM Temas WHERE id_tema = p_id_tema;

            COMMIT;

            DBMS_OUTPUT.PUT_LINE('Tema y subtemas eliminados correctamente.');
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró el tema con el ID especificado.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el tema y sus subtemas.');
            ROLLBACK; 
    END SP_EliminarTema;

    -- Función para obtener la descripción de un tema dado su ID
    FUNCTION obtener_descripcion_tema(
        p_id_tema IN NUMBER
    ) RETURN VARCHAR2 IS
        v_descripcion Temas.descripcion%TYPE;
    BEGIN
        SELECT descripcion INTO v_descripcion FROM Temas WHERE id_tema = p_id_tema;
        RETURN v_descripcion;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Tema no encontrado';
        WHEN OTHERS THEN
            RETURN 'Error al recuperar la descripción del tema';
    END obtener_descripcion_tema;

    -- Procedimiento para listar todos los temas
    PROCEDURE SP_ListarTemas IS
    BEGIN
        --cursor implicito
        FOR tema_row IN (SELECT id_tema, nombre, descripcion FROM Temas)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Tema: ' || tema_row.id_tema || ', Nombre: ' || tema_row.nombre || ', Descripción: ' || tema_row.descripcion);
        END LOOP;
    END SP_ListarTemas;
END PaqueteGestionTemas;
/

DECLARE
    v_resultado VARCHAR2(100);
    
BEGIN
    v_resultado := PaqueteGestionTemas.insertar_tema(p_id_tema => 1, p_nombre => 'Ciencia y Tecnologia', p_descripcion => 'Descripción del nuevo tema');
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;

EXEC PaqueteGestionTemas.SP_ActualizarTema(p_id_tema => 1, p_nombre => 'Ciencia y Tecnologia', p_descripcion => 'Las noticias mas relevantes sobre Ciencia y Tecnologia');

EXEC PaqueteGestionTemas.SP_ListarTemas;

EXEC PaqueteGestionTemas.SP_EliminarTema(p_id_tema => 1);


--***********************************************************************************

--Paquete Gestion de Subtemas (Insertar, modificar, eliminar, listar)
CREATE OR REPLACE PACKAGE PaqueteGestionSubtemas AS
    -- Función para insertar un nuevo subtema
    FUNCTION insertar_subtema(
        p_id_subtema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_id_tema IN NUMBER
    ) RETURN VARCHAR2;

    -- SP para actualizar subtemas
    PROCEDURE SP_ActualizarSubtema(
        p_id_subtema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2
    );

    -- SP para eliminar subtemas si no hay relación con noticias
    PROCEDURE SP_EliminarSubtema(
        p_id_subtema IN NUMBER
    );

    -- SP para listar todos los subtemas
    PROCEDURE SP_ListarSubtemas;

END PaqueteGestionSubtemas;
/

CREATE OR REPLACE PACKAGE BODY PaqueteGestionSubtemas AS
    -- Función para insertar un nuevo subtema
    FUNCTION insertar_subtema(
        p_id_subtema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_id_tema IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        INSERT INTO Subtemas (id_subtema, nombre, descripcion, id_tema)
        VALUES (p_id_subtema, p_nombre, p_descripcion, p_id_tema);
        
        RETURN 'Subtema insertado correctamente';
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RETURN 'Error: El ID de subtema ya está en uso';
        WHEN OTHERS THEN
            RETURN 'Error: Ocurrió un error al insertar el subtema';
    END insertar_subtema;

    -- SP para actualizar subtemas
    PROCEDURE SP_ActualizarSubtema(
        p_id_subtema IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Subtemas
        SET nombre = p_nombre,
            descripcion = p_descripcion
        WHERE id_subtema = p_id_subtema;
        
        IF SQL%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró el subtema con el ID especificado.');
        ELSE
            COMMIT; 
            DBMS_OUTPUT.PUT_LINE('Subtema actualizado correctamente.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al actualizar el subtema.');
            ROLLBACK; 
    END SP_ActualizarSubtema;

    -- SP para eliminar subtemas si no hay relación con noticias
    PROCEDURE SP_EliminarSubtema(
        p_id_subtema IN NUMBER
    ) IS
        v_count NUMBER;
    BEGIN
        -- Verificar la existencia del subtema
        SELECT COUNT(*)
        INTO v_count
        FROM Subtemas
        WHERE id_subtema = p_id_subtema;

        IF v_count = 0 THEN
            DBMS_OUTPUT.PUT_LINE('El subtema con ID ' || p_id_subtema || ' no existe.');
        ELSE
            -- Verificar si hay noticias relacionadas al subtema
            SELECT COUNT(*)
            INTO v_count
            FROM Noticias
            WHERE id_subtema = p_id_subtema;

            IF v_count > 0 THEN
                DBMS_OUTPUT.PUT_LINE('No se puede eliminar el subtema con ID ' || p_id_subtema || ' porque tiene noticias relacionadas.');
            ELSE
                -- Eliminar el subtema si no tiene noticias relacionadas
                DELETE FROM Subtemas WHERE id_subtema = p_id_subtema;
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('El subtema con ID ' || p_id_subtema || ' fue eliminado correctamente.');
            END IF;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al intentar eliminar el subtema.');
            ROLLBACK;
    END SP_EliminarSubtema;

    -- SP para listar todos los subtemas
    PROCEDURE SP_ListarSubtemas IS
    BEGIN
        -- Cursor implícito
        FOR subtema_row IN (SELECT id_subtema, nombre, descripcion FROM Subtemas)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ID Subtema: ' || subtema_row.id_subtema || ', Nombre: ' || subtema_row.nombre || ', Descripción: ' || subtema_row.descripcion);
        END LOOP;
    END SP_ListarSubtemas;

END PaqueteGestionSubtemas;
/

DECLARE
    v_resultado VARCHAR2(100);
BEGIN
    v_resultado := PaqueteGestionSubtemas.insertar_subtema(
        p_id_subtema => 1,
        p_nombre => 'Nuevo Subtema',
        p_descripcion => 'Descripción del nuevo subtema',
        p_id_tema => 2
    );
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/

BEGIN
    PaqueteGestionSubtemas.SP_ActualizarSubtema(
        p_id_subtema => 1,
        p_nombre => 'Cocina',
        p_descripcion => 'Nuevas recetas del Chef Daniel Vargas'
    );
END;
/

BEGIN
    PaqueteGestionSubtemas.SP_EliminarSubtema(p_id_subtema => 1);
END;
/

EXEC PaqueteGestionSubtemas.SP_ListarSubtemas;

--*******************************************************************************


--SP Gestion de Reportes
CREATE OR REPLACE PACKAGE PaqueteGeneracionReportes AS
    -- Procedimientos para generar reportes
    PROCEDURE SP_GenerarReporteVisitas(
        p_id_tema IN NUMBER DEFAULT NULL,
        p_id_subtema IN NUMBER DEFAULT NULL
    );
    
    PROCEDURE SP_GenerarReporteCalificaciones(
        p_id_tema IN NUMBER DEFAULT NULL,
        p_id_subtema IN NUMBER DEFAULT NULL
    );
END PaqueteGeneracionReportes;
/

CREATE OR REPLACE PACKAGE BODY PaqueteGeneracionReportes AS
    -- Implementación de procedimientos para generar reportes
    PROCEDURE SP_GenerarReporteVisitas(
        p_id_tema IN NUMBER DEFAULT NULL,
        p_id_subtema IN NUMBER DEFAULT NULL
    )
    IS
    BEGIN
        IF p_id_tema IS NULL AND p_id_subtema IS NULL THEN
            -- Reporte general de visitas
            FOR visita IN (
                SELECT id_noticia, COUNT(*) AS total_visitas
                FROM Visitas
                GROUP BY id_noticia
                ORDER BY total_visitas DESC
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || visita.id_noticia || ', Total Visitas: ' || visita.total_visitas);
            END LOOP;
        ELSIF p_id_subtema IS NULL THEN
            -- Reporte por tema
            FOR visita IN (
                SELECT v.id_noticia, COUNT(*) AS total_visitas
                FROM Visitas v
                JOIN Noticias n ON v.id_noticia = n.id_noticia
                WHERE n.id_tema = p_id_tema
                GROUP BY v.id_noticia
                ORDER BY total_visitas DESC
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || visita.id_noticia || ', Total Visitas: ' || visita.total_visitas);
            END LOOP;
        ELSE
            -- Reporte por subtema
            FOR visita IN (
                SELECT v.id_noticia, COUNT(*) AS total_visitas
                FROM Visitas v
                JOIN Noticias n ON v.id_noticia = n.id_noticia
                WHERE n.id_subtema = p_id_subtema
                GROUP BY v.id_noticia
                ORDER BY total_visitas DESC
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE('ID Noticia: ' || visita.id_noticia || ', Total Visitas: ' || visita.total_visitas);
            END LOOP;
        END IF;
    END SP_GenerarReporteVisitas;

    PROCEDURE SP_GenerarReporteCalificaciones(
        p_id_tema IN NUMBER DEFAULT NULL,
        p_id_subtema IN NUMBER DEFAULT NULL
    )
    IS
    BEGIN
        IF p_id_tema IS NOT NULL THEN
            -- Reporte por tema
            FOR calificacion IN (
                SELECT n.titulo, c.calificacion
                FROM Noticias n
                JOIN Calificaciones c ON n.id_noticia = c.id_noticia
                WHERE n.id_tema = p_id_tema
                ORDER BY n.titulo
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE('Título: ' || calificacion.titulo || ', Calificación: ' || calificacion.calificacion);
            END LOOP;
        ELSIF p_id_subtema IS NOT NULL THEN
            -- Reporte por subtema
            FOR calificacion IN (
                SELECT n.titulo, c.calificacion
                FROM Noticias n
                JOIN Calificaciones c ON n.id_noticia = c.id_noticia
                WHERE n.id_subtema = p_id_subtema
                ORDER BY n.titulo
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE('Título: ' || calificacion.titulo || ', Calificación: ' || calificacion.calificacion);
            END LOOP;
        ELSE
            -- Reporte general
            FOR calificacion IN (
                SELECT n.titulo, c.calificacion
                FROM Noticias n
                JOIN Calificaciones c ON n.id_noticia = c.id_noticia
                ORDER BY n.titulo
            )
            LOOP
                DBMS_OUTPUT.PUT_LINE('Título: ' || calificacion.titulo || ', Calificación: ' || calificacion.calificacion);
            END LOOP;
        END IF;
    END SP_GenerarReporteCalificaciones;
END PaqueteGeneracionReportes;
/

EXEC PaqueteGeneracionReportes.SP_GenerarReporteVisitas(p_id_tema => 1, p_id_subtema => 2);
/

EXEC PaqueteGeneracionReportes.SP_GenerarReporteCalificaciones(p_id_tema => 2, p_id_subtema => 2);
/

--******************************************************************************************

--Paquete gestion de reportes
CREATE OR REPLACE PACKAGE PaqueteGestion_Reportes AS
    -- Registrar una visita a una noticia
    PROCEDURE SP_AgregarVisita(p_noticia_id IN NUMBER);
    
    -- Registrar una calificación para una noticia específica
    PROCEDURE SP_RegistrarCalificacion(p_noticia_id IN NUMBER, p_calificacion IN NUMBER);
END PaqueteGestion_Reportes;
/

CREATE OR REPLACE PACKAGE BODY PaqueteGestion_Reportes AS
    -- Registrar una visita a una noticia
    PROCEDURE SP_AgregarVisita(p_noticia_id IN NUMBER)
    IS
        v_id_visita Visitas.id_visita%TYPE;
    BEGIN
        -- Utiliza una secuencia para obtener el ID_VISITA
        SELECT seq_visitas.nextval INTO v_id_visita FROM dual;

        -- Inserta el registro en la tabla Visitas
        INSERT INTO Visitas (id_visita, id_noticia, id_usuario, fecha_visita)
        VALUES (v_id_visita, p_noticia_id, NULL, SYSDATE);
        
        COMMIT; 
        DBMS_OUTPUT.PUT_LINE('Visita agregada correctamente con ID_VISITA: ' || v_id_visita);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al agregar la visita: ' || SQLERRM);
            ROLLBACK;
    END SP_AgregarVisita;

    -- Registrar una calificación para una noticia específica
    PROCEDURE SP_RegistrarCalificacion(p_noticia_id IN NUMBER, p_calificacion IN NUMBER)
    IS
    BEGIN
        INSERT INTO Calificaciones (id_calificacion, id_noticia, calificacion)
        VALUES (seq_calificaciones.nextval, p_noticia_id, p_calificacion);
    END SP_RegistrarCalificacion;
END PaqueteGestion_Reportes;
/
BEGIN
    PaqueteGestion_Reportes.SP_AgregarVisita(p_noticia_id => 2);
    COMMIT; 
END;

BEGIN
    PaqueteGestion_Reportes.SP_RegistrarCalificacion(p_noticia_id => 2, p_calificacion => 8);
    COMMIT; 
END;

CREATE OR REPLACE PACKAGE PaqueteContarEstadisticas AS
    PROCEDURE SP_ContarUsuariosHoy;
END PaqueteContarEstadisticas;
/

CREATE OR REPLACE PACKAGE BODY PaqueteContarEstadisticas AS
    PROCEDURE SP_ContarUsuariosHoy AS
        Usuarios_totales INT;
        Fecha_hoy DATE;
    BEGIN
        Fecha_hoy := SYSDATE; -- Utiliza SYSDATE para obtener la fecha actual
        
        SELECT COUNT(*)
        INTO Usuarios_totales
        FROM Usuarios
        WHERE TRUNC(fecha_registro) = TRUNC(Fecha_hoy); -- TRUNC para comparar solo la fecha sin la hora
    
        DBMS_OUTPUT.PUT_LINE('Usuarios registrados hoy: ' || Usuarios_totales);
    END SP_ContarUsuariosHoy;
END PaqueteContarEstadisticas;
/

BEGIN
    PaqueteContarEstadisticas.SP_ContarUsuariosHoy;
END;

--*******************************************************************************
--Paquete obtencion de datos (otros)
-- Definición del paquete para obtener datos de la base de datos
CREATE OR REPLACE PACKAGE paquete_obtencion_de_datos AS
    -- Función para obtener el número de visitas de una noticia
    FUNCTION obtener_numero_visitas(
        p_id_noticia IN NUMBER
    ) RETURN NUMBER;

    -- Función para obtener el contenido de una noticia
    FUNCTION obtener_contenido_noticia(
        p_id_noticia IN NUMBER
    ) RETURN CLOB;

    -- Función para obtener la descripción de un tema dado su ID
    FUNCTION obtener_descripcion_tema(
        p_id_tema IN NUMBER
    ) RETURN VARCHAR2;

    -- Función para obtener el nombre de un usuario dado su ID
    FUNCTION obtener_nombre_usuario(
        p_id_usuario IN NUMBER
    ) RETURN VARCHAR2;
END paquete_obtencion_de_datos;
/

-- Implementación del paquete
CREATE OR REPLACE PACKAGE BODY paquete_obtencion_de_datos AS
    -- Función para obtener el número de visitas de una noticia
    FUNCTION obtener_numero_visitas(
        p_id_noticia IN NUMBER
    ) RETURN NUMBER IS
        v_numero_visitas NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_numero_visitas FROM Visitas WHERE id_noticia = p_id_noticia;
        RETURN v_numero_visitas;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            RETURN -1; -- Indicador de error
    END obtener_numero_visitas;

    -- Función para obtener el contenido de una noticia
    FUNCTION obtener_contenido_noticia(
        p_id_noticia IN NUMBER
    ) RETURN CLOB IS
        v_contenido Noticias.contenido%TYPE;
    BEGIN
        SELECT contenido INTO v_contenido FROM Noticias WHERE id_noticia = p_id_noticia;
        RETURN v_contenido;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN OTHERS THEN
            RETURN 'Error al obtener el contenido de la noticia';
    END obtener_contenido_noticia;

    -- Función para obtener la descripción de un tema dado su ID
    FUNCTION obtener_descripcion_tema(
        p_id_tema IN NUMBER
    ) RETURN VARCHAR2 IS
        v_descripcion Temas.descripcion%TYPE;
    BEGIN
        SELECT descripcion INTO v_descripcion FROM Temas WHERE id_tema = p_id_tema;
        RETURN v_descripcion;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Tema no encontrado';
        WHEN OTHERS THEN
            RETURN 'Error al recuperar la descripción del tema';
    END obtener_descripcion_tema;

    -- Función para obtener el nombre de un usuario dado su ID
    FUNCTION obtener_nombre_usuario(
        p_id_usuario IN NUMBER
    ) RETURN VARCHAR2 IS
        v_nombre Usuarios.nombre%TYPE;
    BEGIN
        SELECT nombre INTO v_nombre FROM Usuarios WHERE id_usuario = p_id_usuario;
        RETURN v_nombre;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Usuario no encontrado';
        WHEN OTHERS THEN
            RETURN 'Error al recuperar el nombre del usuario';
    END obtener_nombre_usuario;
END paquete_obtencion_de_datos;
/

DECLARE
    v_numero_visitas NUMBER;
BEGIN
    v_numero_visitas := paquete_obtencion_de_datos.obtener_numero_visitas(p_id_noticia => 6); 
    DBMS_OUTPUT.PUT_LINE('Número de visitas: ' || v_numero_visitas);
END;

DECLARE
    v_contenido CLOB;
BEGIN
    v_contenido := paquete_obtencion_de_datos.obtener_contenido_noticia(p_id_noticia => 6); 
    DBMS_OUTPUT.PUT_LINE('Contenido de la noticia:');
    DBMS_OUTPUT.PUT_LINE(v_contenido);
END;

DECLARE
    v_descripcion VARCHAR2(100);
BEGIN
    v_descripcion := paquete_obtencion_de_datos.obtener_descripcion_tema(p_id_tema => 2); 
    DBMS_OUTPUT.PUT_LINE('Descripción del tema: ' || v_descripcion);
END;


DECLARE
    v_nombre_usuario VARCHAR2(100);
BEGIN
    v_nombre_usuario := paquete_obtencion_de_datos.obtener_nombre_usuario(p_id_usuario => 1);
    DBMS_OUTPUT.PUT_LINE('Nombre del usuario: ' || v_nombre_usuario);
END;


