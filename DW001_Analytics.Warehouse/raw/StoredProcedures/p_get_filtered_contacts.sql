CREATE PROCEDURE raw.p_get_filtered_contacts
@customer_city_id INT
AS
BEGIN
SELECT customer_id
, customer_name
, customer_city_id
, customer_email 
FROM raw.hubspot_contacts
WHERE customer_city_id = @customer_city_id
END