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
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
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


--Vista de temas y subtemas

    CREATE VIEW Vista_Temas_Subtemas AS
    SELECT t.nombre AS tema, s.nombre AS subtema
    FROM Temas t
    INNER JOIN Subtemas s ON t.id_tema = s.id_tema;


--Noticias con calificaciones

    CREATE VIEW Vista_Noticias_Calificaciones AS
    SELECT n.id_noticia, n.titulo, AVG(c.calificacion) AS promedio_calificacion
    FROM Noticias n
    LEFT JOIN Calificaciones c ON n.id_noticia = c.id_noticia
    GROUP BY n.id_noticia, n.titulo;


--Visitas por usuarios

    CREATE VIEW Vista_Visitas_Usuario AS
    SELECT id_usuario, COUNT(id_visita) AS visitas_realizadas
    FROM Visitas
    GROUP BY id_usuario;

--Comentarios recientes en noticias

    CREATE VIEW Vista_Noticias_Comentarios AS
    SELECT n.id_noticia, n.titulo, c.comentario, c.fecha_comentario
    FROM Noticias n
    LEFT JOIN Comentarios c ON n.id_noticia = c.id_noticia
    ORDER BY c.fecha_comentario DESC;