CREATE PROCEDURE raw.p_get_all_contacts
AS
BEGIN
SELECT customer_id
, customer_name
, customer_city_id
, customer_email 
FROM raw.hubspot_contacts
END