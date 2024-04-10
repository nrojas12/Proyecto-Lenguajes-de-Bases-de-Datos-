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
    CREATE OR REPLACE TRIGGER actualizar_ranking_visitas
    AFTER INSERT ON Visitas
    FOR EACH ROW
    BEGIN
        UPDATE Ranking
        SET visitas = visitas + 1
        WHERE id_noticia = :new.id_noticia;
    END;

-- Promedio de las noticias
    CREATE OR REPLACE TRIGGER calcular_promedio_calificaciones
    AFTER INSERT ON Calificaciones
    FOR EACH ROW
    BEGIN
        UPDATE Ranking r
        SET promedio_calificaciones = (SELECT AVG(calificacion) FROM Calificaciones WHERE id_noticia = :new.id_noticia)
        WHERE r.id_noticia = :new.id_noticia;
    END;

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

--Contador de visitas en la tabla de Ranking
    CREATE OR REPLACE TRIGGER incrementar_contador_visitas
    AFTER INSERT ON Visitas
    FOR EACH ROW
    BEGIN
        UPDATE Ranking
        SET visitas = visitas + 1
        WHERE id_noticia = :NEW.id_noticia;
    END;
--------------------------------------------------- Procedimientos Almacenados  ----------------------------    
--Registrar una visita a una noticia 
CREATE OR REPLACE PROCEDURE SP_AgregarVisita(
    p_noticia_id IN NUMBER
)
IS
BEGIN
    INSERT INTO Visitas (id_noticia, id_usuario, fecha_visita)
    VALUES (p_noticia_id, NULL, SYSDATE);
END SP_AgregarVisita;

-- Crear Procedimiento de registro Newsletter

CREATE PROCEDURE Newsletter_sub()
BEGIN
    DECLARE suscripciones_totales INT;
    SELECT COUNT(*) INTO suscripciones_totales FROM USUARIOS
    SELECT suscripciones_totales AS suscripciones_totales;
END

-- Crear procedimiento para mostrar cuantos usuarios se registraron durante el dia

CREATE PROCEDURE
BEGIN  
    DECLARE Usuarios_totales;
    DECLARE Fecha_hoy DATE;
    SET Fecha_hoy = CURRENT DATE();
    
    SELECT COUNT(*) INTO Usuarios_totales
    FROM USUARIOS
    WHERE DATE (Fecha_reg) = Fecha_hoy;

--Crear procedimiento para saber cuantas noticias se han publicado el día de hoy

CREATE PROCEDURE num_noticias_hoy(
    OUT total_noticias INT;
)
BEGIN
    DECLARE fecha_presente DATE;
    SET fecha_presente = CURRENT DATE();
    
    SELECT COUNT(*) INTO total_noticias
    FROM Noticias
    WHERE DATE(fecha_publicacion) = fecha_presente;
END

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