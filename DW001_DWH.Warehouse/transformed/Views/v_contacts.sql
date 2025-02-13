-- Auto Generated (Do not modify) 113F9D50613ED319E21F58FDBB749EE318109D6A9B91B5D4981DAB1C87395E91
CREATE VIEW transformed.v_contacts 
AS 
SELECT [customer_id] 
    ,[customer_name] 
    ,con.[customer_city_id] 
    ,lk.[customer_country_id] 
    ,[customer_email] 
    ,'HubSpot'source_system
FROM raw.hubspot_contacts con
LEFT JOIN raw.hubspot_location_lookup lk ON con.customer_city_id = lk.customer_city_id