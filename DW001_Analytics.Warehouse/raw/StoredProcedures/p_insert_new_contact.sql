CREATE PROCEDURE raw.p_insert_new_contact
@customer_country_id int, 
@customer_city_id int, 
@customer_country_name varchar(100), 
@customer_city_name varchar(100)
AS
BEGIN
INSERT INTO raw.hubspot_locations_lookup
VALUES(@customer_country_id , @customer_city_id , @customer_country_name , @customer_city_name)
END