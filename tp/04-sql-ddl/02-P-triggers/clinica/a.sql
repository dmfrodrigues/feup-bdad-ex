DROP TRIGGER IF EXISTS triggerA;

CREATE TRIGGER triggerA
BEFORE INSERT ON ConsultasMarcadas
FOR EACH ROW
WHEN (
    -- Numero de consultas desse médico nesse dia
    SELECT COUNT(*) FROM ConsultasMarcadas
    WHERE data     =NEW.data
    AND   codmedico=NEW.codmedico
) >= (
    -- Numero de doentes nesse dia com esse médico
    SELECT numdoentes FROM Disponibilidade NATURAL JOIN HorarioConsultas
    WHERE Disponibilidade.codigo=New.codmedico
    AND   Disponibilidade.dia=New.data
)
BEGIN
    SELECT RAISE(ROLLBACK, 'Too many appointments');
END;
