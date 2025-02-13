CREATE PROCEDURE metadata.p_get_watermark_value
@PipelineID VARCHAR(100)
AS 
BEGIN
SELECT watermark_value 
FROM metadata.watermark
WHERE pipeline_id = @PipelineID
END