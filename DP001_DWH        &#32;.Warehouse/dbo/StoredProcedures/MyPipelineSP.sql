CREATE PROCEDURE [dbo].[MyPipelineSP]
@FromNotebook int
AS
BEGIN
SELECT @FromNotebook/18 as OutputParam
END