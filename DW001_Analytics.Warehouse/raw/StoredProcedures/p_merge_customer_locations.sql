CREATE PROCEDURE raw.p_merge_customer_locations
@customer_country_id int, 
@customer_city_id int, 
@customer_country_name varchar(100), 
@customer_city_name varchar(100)
AS
IF EXISTS (SELECT 1 FROM raw.hubspot_locations_lookup WHERE customer_city_id = @customer_city_id)

BEGIN
    -- write your update statement here
    UPDATE raw.hubspot_locations_lookup
    SET customer_country_id = @customer_country_id
        , customer_country_name = @customer_country_name
        , customer_city_name = @customer_city_name
    WHERE customer_city_id = @customer_city_id
END
ELSE
BEGIN
    -- write your insert statement here
    INSERT INTO raw.hubspot_locations_lookup
    VALUES(@customer_country_id , @customer_city_id , @customer_country_name , @customer_city_name)
END