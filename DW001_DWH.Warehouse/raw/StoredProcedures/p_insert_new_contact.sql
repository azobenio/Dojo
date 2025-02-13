CREATE PROC raw.p_insert_new_contact
@customer_country_id INT,
@customer_city_id INT,
@customer_country_name VARCHAR(1000),
@customer_city_name VARCHAR(100)
AS
BEGIN
INSERT INTO raw.hubspot_location_lookup
VALUES(@customer_country_id, @customer_city_id , @customer_country_name , @customer_city_name)
END