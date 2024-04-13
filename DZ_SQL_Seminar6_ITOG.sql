-- оздайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '


DROP FUNCTION IF EXISTS sectotime;
DELIMITER $$
CREATE FUNCTION sectotime(val INT)
RETURNS char(45)
DETERMINISTIC
BEGIN
DECLARE DD char(3);
DECLARE HH, MI, SS char(2);
DECLARE res char(45);
SET DD = cast(floor(val/60/60/24) as char(3));
SET HH = cast(floor(mod(val/60/60/24,1)*24) as char(2));
SET MI = cast(floor(mod(mod(val/60/60/24,1)*24,1)*60) as char(2));
SET SS = cast(round(mod(mod(mod(val/60/60/24,1)*24,1)*60,1)*60) as char(2));
SET res = concat(DD,' days ',HH,' hours ',MI,' minutes ',SS, ' seconds ');
RETURN res;
END;

SELECT sectotime(123456) dt from dual;


-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DROP FUNCTION IF EXISTS input_chetn;
DELIMITER $$ 
CREATE FUNCTION input_chetn (num INT) 
RETURNS VARCHAR(256) 
DETERMINISTIC 
BEGIN 
DECLARE i INT DEFAULT 2; 
DECLARE result VARCHAR(256); 
SET result='2'; 
WHILE i < num DO 
SET i = i + 2; 
SET result = concat(result, ', ', i); 
END WHILE; 
RETURN result; 
END $$ 
DELIMITER ; 

SELECT input_chetn(10);

