CREATE PROCEDURE raw.p_merge_customer_locations
@customer_country_id INT,
@customer_city_id INT,
@customer_country_name VARCHAR(1000),
@customer_city_name VARCHAR(100)
AS
IF EXISTS (SELECT 1 FROM raw.hubspot_location_lookup WHERE customer_city_id = @customer_city_id)
BEGIN
-- write your update
    UPDATE raw.hubspot_location_lookup
    SET customer_country_id = @customer_country_id
        ,customer_country_name = @customer_country_name
        ,customer_city_name = @customer_city_name
    WHERE customer_country_id = @customer_country_id
END
ELSE
BEGIN
        -- write you insert statement here
        INSERT INTO raw.hubspot_location_lookup
        VALUES (@customer_country_id, @customer_city_id,@customer_country_name,@customer_city_name)
END