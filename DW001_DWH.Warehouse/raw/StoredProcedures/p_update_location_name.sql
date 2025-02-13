CREATE PROC raw.p_update_location_name
@CityID INT,
@NewCityName VARCHAR(100)
AS
BEGIN
UPDATE raw.hubspot_location_lookup
SET customer_country_name = @NewCityName
WHERE customer_city_id = @CityID
END