-- ************** Paquete Gestion de Usuarios ************************

EXEC PaqueteGestionUsuarios.SP_AgregarUsuario('Andres', 'andres@gmail.com', '123', 'No', SYSDATE);

EXEC PaqueteGestionUsuarios.SP_ActualizarUsuario(1, 'Juanito Perez', 'juanito.perez@email.com', 'nuevacontrase�a', 'Si', SYSDATE);

EXEC PaqueteGestionUsuarios.SP_EliminarUsuario(9); -- ID del usuario a eliminar

-- ************** Paquete Listar Noticias ************************

EXEC PaqueteListarNoticias.SP_ListarUltimasNoticiasDesc(p_max_noticias => 3);

EXEC PaqueteListarNoticias.SP_ListarNoticiasPorTema(p_id_tema => 3);

EXEC PaqueteListarNoticias.SP_BuscarNoticias(p_palabra_clave => 'Leonardo');

EXEC PaqueteListarNoticias.SP_ListarNoticiasPorSubtema(p_id_subtema => 2);

EXEC PaqueteListarNoticias.SP_ListarTodasNoticias;

-- ************** Paquete Gestion de Noticias ************************

BEGIN
    PaqueteGestionNoticias.SP_EliminarNoticia(p_id_noticia => 2);
END;

DECLARE
    v_resultado VARCHAR2(100);
BEGIN
    v_resultado := PaqueteGestionNoticias.insertar_noticia(
        p_id_noticia => 7,
        p_titulo => '',
        p_contenido => 'El Saprissa le gan� al Alajuelense...',
        p_fecha_publicacion => SYSDATE,
        p_id_tema => 2,
        p_id_subtema => 3,
        p_id_usuario => 1
    );
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;

INSERT INTO Noticias (id_noticia, titulo, contenido, fecha_publicacion, id_tema, id_subtema, id_usuario)
VALUES (7, '', 'El Saprissa le gan� al Alajuelense...', SYSDATE, 2, 3, 1);

BEGIN
    PaqueteGestionNoticias.SP_ActualizarNoticia(
        p_id_noticia => 6,
        p_titulo => 'Expo M�vil 2024',
        p_contenido => 'Variedad de carros en marcas como Toyota, Nissan, Ford, Chevrolet y muchas m�s...',
        p_fecha_publicacion => SYSDATE,
        p_id_tema => 3,
        p_id_subtema => 4
    );
END;

-- ************** Paquete Gestion de Imagenes ************************

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


-- ************** Paquete Gestion de Temas ************************

DECLARE
    v_resultado VARCHAR2(100);
    
BEGIN
    v_resultado := PaqueteGestionTemas.insertar_tema(p_id_tema => 1, p_nombre => 'Ciencia y Tecnologia', p_descripcion => 'Descripci�n del nuevo tema');
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;

EXEC PaqueteGestionTemas.SP_ActualizarTema(p_id_tema => 1, p_nombre => 'Ciencia y Tecnologia', p_descripcion => 'Las noticias mas relevantes sobre Ciencia y Tecnologia');

EXEC PaqueteGestionTemas.SP_ListarTemas;

EXEC PaqueteGestionTemas.SP_EliminarTema(p_id_tema => 1);


-- ************** Paquete Gestion de Subtemas ************************

DECLARE
    v_resultado VARCHAR2(100);
BEGIN
    v_resultado := PaqueteGestionSubtemas.insertar_subtema(
        p_id_subtema => 1,
        p_nombre => 'Nuevo Subtema',
        p_descripcion => 'Descripci�n del nuevo subtema',
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

-- ************** Paquete Generacion de Reportes ************************

EXEC PaqueteGeneracionReportes.SP_GenerarReporteVisitas(p_id_tema => 1, p_id_subtema => 2);
/

EXEC PaqueteGeneracionReportes.SP_GenerarReporteCalificaciones(p_id_tema => 2, p_id_subtema => 2);
/


-- ************** Paquete Gestion de Reportes ************************

BEGIN
    PaqueteGestion_Reportes.SP_AgregarVisita(p_noticia_id => 2);
    COMMIT; 
END;

BEGIN
    PaqueteGestion_Reportes.SP_RegistrarCalificacion(p_noticia_id => 2, p_calificacion => 15);
    COMMIT; 
END;


-- ************** Paquete Contar Estadisticas ************************

BEGIN
    PaqueteContarEstadisticas.SP_ContarUsuariosHoy;
END;

-- ************** Paquete Contar Estadisticas ************************
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

    