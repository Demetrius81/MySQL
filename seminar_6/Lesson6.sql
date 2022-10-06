WITH ts AS
(
  SELECT 
    *,
    LEAD(stantion_time) OVER(PARTITION BY train_id) AS next_stantion_time
  FROM train_schedule
)
SELECT
    train_id AS `Номер поезда`,
    stantion AS `Станция`, 
    stantion_time AS `Время убытия`,    
    TIMEDIFF(next_stantion_time, stantion_time) AS `Время в пути`
FROM ts;


CREATE TEMPORARY TABLE ttt (

);

CREATE PROCEDURE test(IN nun INT, OUT rez INT)
BEGIN

END;

CREATE FUNCTION test2(num INT) RETURN INT
BEGIN

RETURN 
END;

