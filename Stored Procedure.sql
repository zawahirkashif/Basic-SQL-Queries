

DELIMITER //
 
CREATE PROCEDURE Update3Items(
    IN ISBNin INT,
    IN NPrice INT 
)
BEGIN
    UPDATE t1
    SET
    Price=Nprice
    WHERE ISBN = ISBNin;
END //
 
DELIMITER ;

	
CALL Update3Items('1','10000')
