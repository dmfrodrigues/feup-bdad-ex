DROP TRIGGER IF EXISTS triggerB;

CREATE TRIGGER triggerB
BEFORE INSERT ON ConsultasMarcadas
FOR EACH ROW
WHEN EXISTS (
    -- Consultas desse médico nesse dia e a essa hora
    SELECT * FROM ConsultasMarcadas
    WHERE data      =NEW.data
    AND   horainicio=NEW.horainicio
    AND   codmedico =NEW.codmedico
) 
BEGIN
    SELECT RAISE(ROLLBACK, 'Colliding appointments');
END;
