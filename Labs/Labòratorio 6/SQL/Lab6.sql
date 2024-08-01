---------- CODE START ----------
-- Se modifico el atributo de descripcion para que pudiera almacenar el texto de la anomalia

-- Implementacion del XML en la tabla
DECLARE
    v_xml CLOB;
    v_file BFILE := BFILENAME('XML_DIR', 'trueques.xml');
BEGIN
    -- Abrir el archivo
    DBMS_LOB.OPEN(v_file, DBMS_LOB.LOB_READONLY);

    -- Leer el archivo en un CLOB
    DBMS_LOB.CREATETEMPORARY(v_xml, TRUE);
    DBMS_LOB.LOADFROMFILE(v_xml, v_file, DBMS_LOB.GETLENGTH(v_file));

    -- Insertar el XML en la tabla
    INSERT INTO my_table (id, xml_data)
    VALUES (1, XMLTYPE(v_xml));

    -- Cerrar el archivo
    DBMS_LOB.CLOSE(v_file);
END;
/

-- Poblado Ok
INSERT INTO Evaluaciones (id, xml_data)
VALUES (1, XMLTYPE(
'<Descripciones>
    <descripcion codigo="D04">
        <anomalia prioridad="A" estado="Solucionado">El auditor no tiene acceso completo a la BD de Trueques.</anomalia>
        <anomalia prioridad="M" estado="Pendiente">El auditor trata de modificar datos en la tabla de Árticulos y eliminar datos de la tabla Categorías.</anomalia>
        <anomalia prioridad="B" estado="Solucionado">El administrador es notificado del intento de la alteración de la BD y envía una orden de arresto para el auditor (Ficción).</anomalia>
    </descripcion>
    <descripcion codigo="D05">
        <anomalia prioridad="A" estado="Pendiente">El auditor no tiene acceso completo a la BD de Trueques.</anomalia>
        <anomalia prioridad="M" estado="Solucionado">El auditor trata de modificar datos en la tabla de Árticulos y eliminar datos de la tabla Categorías.</anomalia>
        <anomalia prioridad="B" estado="Pendiente">El administrador es notificado del intento de la alteración de la BD y envía una orden de arresto para el auditor (Ficción).</anomalia>
    </descripcion>
    <descripcion codigo="D06">
        <anomalia prioridad="A" estado="Pendiente">El auditor no tiene acceso completo a la BD de Trueques.</anomalia>
        <anomalia prioridad="M" estado="Solucionado">El auditor trata de modificar datos en la tabla de Árticulos y eliminar datos de la tabla Categorías.</anomalia>
        <anomalia prioridad="B" estado="Solucionado">El administrador es notificado del intento de la alteración de la BD y envía una orden de arresto para el auditor (Ficción).</anomalia>
    </descripcion>
    <descripcion codigo="D07">
        <anomalia prioridad="A" estado="Pendiente">El auditor no tiene acceso completo a la BD de Trueques.</anomalia>
        <anomalia prioridad="M" estado="Solucionado">El auditor trata de modificar datos en la tabla de Árticulos y eliminar datos de la tabla Categorías.</anomalia>
        <anomalia prioridad="B" estado="Solucionado">El administrador es notificado del intento de la alteración de la BD y envía una orden de arresto para el auditor (Ficción).</anomalia>
    </descripcion>
</Descripciones>'
));

-- Poblado No Ok
INSERT INTO Evaluaciones (id, xml_data)
VALUES (1, XMLTYPE(
'<Descripciones>
    <anomalia prioridad="A">
        <descripcion codigo="D01">El auditor no tiene acceso completo a la BD de Trueques.</descripcion>
        <descripcion codigo="D02">El auditor trata de modificar datos en la tabla de Árticulos y eliminar datos de la tabla Categorías.</descripcion>
        <descripcion codigo="D03">El administrador es notificado del intento de la alteración de la BD y envía una orden de arresto para el auditor (Ficción).</descripcion>
    </anomalia>

    <anomalia prioridad="B"">
        <descripcion codigo="D04">El auditor no tiene acceso completo a la BD de Trueques.</descripcion>
        <descripcion codigo="D05">El auditor trata de modificar datos en la tabla de Árticulos y eliminar datos de la tabla Categorías.</descripcion>
        <descripcion codigo="D06">El administrador es notificado del intento de la alteración de la BD y envía una orden de arresto para el auditor (Ficción).</descripcion>
    </anomalia>

    <anomalia prioridad="M">
        <descripcion codigo="D07">El auditor no tiene acceso completo a la BD de Trueques.</descripcion>
        <descripcion codigo="D08">El auditor trata de modificar datos en la tabla de Árticulos y eliminar datos de la tabla Categorías.</descripcion>
        <descripcion codigo="D09">El administrador es notificado del intento de la alteración de la BD y envía una orden de arresto para el auditor (Ficción).</descripcion>
    </anomalia>
</Descripciones>'
));
-- Falla porque no se cumple con la estructura de la tabla

-- Implemente la consulta Consultar anomalias de prioridad alta en estado pendiente.
SELECT 
    evaluaciones.descripcion
FROM 
    evaluaciones,
    XMLTABLE(
        '/Descripciones/descripcion' 
        PASSING xml_data 
        COLUMNS 
            anomalias XMLTYPE PATH 'anomalia[@prioridad="A" and @estado="Pendiente"]'
    ) descripcion,
    XMLTABLE(
        '/anomalia' 
        PASSING evaluaciones.descripcion
        COLUMNS 
            anomalia_text VARCHAR2(4000) PATH 'text()'
    ) anomalias
WHERE evaluaciones.descripcion IS NOT NULL;


-- Proponga otra nueva consulta que use ese atributo

SELECT 
    evaluaciones.descripcion
FROM 
    evaluaciones,
    XMLTABLE(
        '/Descripciones/descripcion' 
        PASSING xml_data 
        COLUMNS 
            anomalias XMLTYPE PATH 'anomalia[@estado="Solucionado"]/text()'
    ) descripcion
WHERE evaluaciones.descripcion IS NOT NULL;

---------- CODE END ----------