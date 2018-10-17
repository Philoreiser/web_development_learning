DELIMITER $$

DROP FUNCTION degreesToRadians$$
CREATE FUNCTION degreesToRadians (degrees FLOAT) 
RETURNS FLOAT DETERMINISTIC 
BEGIN
    RETURN degrees * PI() / 180.0;
END;$$

DROP FUNCTION gpsCoorToDistance$$
CREATE FUNCTION gpsCoorToDistance (lat1 FLOAT, lng1 FLOAT, lat2 FLOAT, lng2 FLOAT) 
RETURNS FLOAT DETERMINISTIC 
BEGIN
    DECLARE earthRadiusKm FLOAT;
    DECLARE dLat FLOAT;
    DECLARE dLng FLOAT;
    DECLARE rLat1 FLOAT;
    DECLARE rLat2 FLOAT;

    DECLARE a FLOAT;
    DECLARE c FLOAT;

    SET earthRadiusKm = 6371.0;
    SET dLat = degreesToRadians(lat2 - lat1);
    SET dLng = degreesToRadians(lng2 - lng1);
    SET rLat1 = degreesToRadians(lat1);
    SET rLat2 = degreesToRadians(lat2);

    SET a = SIN( dLat/2.0 ) * SIN( dLat/2.0 ) 
            + SIN( dLng/2.0 ) * SIN( dLng/2.0 ) * COS(rLat1) * COS(rLat2);

    SET c = 2.0 * ATAN2( SQRT(a), SQRT(1.0-a) );

    RETURN earthRadiusKm * c;

END;$$

DROP FUNCTION isInRange$$
CREATE FUNCTION isInRange (myRange FLOAT, myLat FLOAT, myLng FLOAT, lat FLOAT, lng FLOAT) 
RETURNS INT DETERMINISTIC 
BEGIN
    DECLARE isMatched INT;
    IF gpsCoorToDistance(myLat, myLng, lat, lng ) < myRange THEN 
        SET isMatched = 1;

    ELSE
        SET isMatched = 0;
    
    END IF;
    
    RETURN isMatched;
END;$$
DELIMITER ;
