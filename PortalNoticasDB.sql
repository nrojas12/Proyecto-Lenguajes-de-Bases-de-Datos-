-------------------------------- Creación de tablas ----------------------------
-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    correo VARCHAR2(100) UNIQUE,
    contrasena VARCHAR2(100),
    preferencias_correo VARCHAR2(100)
);

-- Crear tabla Temas
CREATE TABLE Temas (
    id_tema NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    descripcion VARCHAR2(255)
);

-- Crear tabla Subtemas
CREATE TABLE Subtemas (
    id_subtema NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    descripcion VARCHAR2(255),
    id_tema NUMBER,
    FOREIGN KEY (id_tema) REFERENCES Temas(id_tema)
);

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

-- Crear tabla Calificaciones
CREATE TABLE Calificaciones (
    id_calificacion NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    id_usuario NUMBER,
    calificacion NUMBER(1, 0), -- De 1 a 5 estrellas
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Crear tabla Visitas
CREATE TABLE Visitas (
    id_visita NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    id_usuario NUMBER,
    fecha_visita DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

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

-- Crear tabla Ranking
CREATE TABLE Ranking (
    id_ranking NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    visitas NUMBER DEFAULT 0,
    promedio_calificaciones NUMBER(3, 2) DEFAULT 0,
    envios_correo NUMBER DEFAULT 0,
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia)
);

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

-- Crear tabla ImagenesNoticias (opcional)
CREATE TABLE ImagenesNoticias (
    id_imagen NUMBER PRIMARY KEY,
    id_noticia NUMBER,
    nombre_archivo VARCHAR2(100),
    ruta_archivo VARCHAR2(255),
    FOREIGN KEY (id_noticia) REFERENCES Noticias(id_noticia)
);