DELIMITER $$
CREATE PROCEDURE is_armstrong(
    IN num INT
)
BEGIN
    DECLARE original_num INT;
    DECLARE remainder INT;
    DECLARE result INT DEFAULT 0;
    DECLARE n_digits INT DEFAULT 0;
    DECLARE temp_num INT;

    SET original_num = num;
    SET temp_num = num;

    WHILE temp_num > 0 DO
        SET n_digits = n_digits + 1;
        SET temp_num = FLOOR(temp_num / 10);
    END WHILE;

    SET temp_num = original_num;

    WHILE temp_num > 0 DO
        SET remainder = temp_num MOD 10;
        SET result = result + POWER(remainder, n_digits);
        SET temp_num = FLOOR(temp_num / 10);
    END WHILE;

    IF result = original_num THEN
        SELECT CONCAT(original_num, ' is an Armstrong number') AS result;
    ELSE
        SELECT CONCAT(original_num, ' is not an Armstrong number') AS result;
    END IF;
END $$
DELIMITER ;

CALL is_armstrong(153);
