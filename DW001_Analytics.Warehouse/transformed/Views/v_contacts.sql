-- Auto Generated (Do not modify) 34D44D1AA019E253AC293F70CAE4A5A7A846085DFB478904CAC5BF11EF3C6086
CREATE VIEW transformed.v_contacts
AS
SELECT [customer_id]
    , con.[customer_name] 
    , lk.[customer_city_id] 
    , [customer_country_id]  
    , [customer_email] 
FROM raw.hubspot_contacts con
LEFT JOIN raw.hubspot_locations_lookup lk ON con.customer_city_id = lk.customer_city_id