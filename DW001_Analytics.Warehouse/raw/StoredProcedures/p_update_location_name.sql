CREATE PROCEDURE raw.p_update_location_name
@CityID int,
@NewCityName VARCHAR(100)
AS
BEGIN
UPDATE raw.hubspot_locations_lookup
SET customer_city_name = @NewCityName
WHERE customer_city_id = @CityID
END