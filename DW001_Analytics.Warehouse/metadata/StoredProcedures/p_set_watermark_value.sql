CREATE PROCEDURE metadata.p_set_watermark_value
@PipelineID VARCHAR(100),
@WatermarkValue DATETIME2(0)
AS
IF EXISTS (SELECT 1 FROM metadata.watermark WHERE pipeline_id = @PipelineID)
BEGIN
    UPDATE metadata.watermark
    SET watermakr_value = @watermarkvalue
    WHERE pipeline_id = @PipelineID 
END
ELSE
BEGIN 
    INSERT INTO metadata.watermark (pipeline_id, watermakr_value)
    VALUES (@PipelineID, @watermarkvalue);
END