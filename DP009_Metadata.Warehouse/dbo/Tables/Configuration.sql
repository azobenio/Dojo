CREATE TABLE [dbo].[Configuration] (

	[SourceFileDirectory] varchar(50) NOT NULL, 
	[SourceFileName] varchar(50) NOT NULL, 
	[DestinationTableName] varchar(50) NOT NULL, 
	[ExpectedColNames] varchar(999) NOT NULL
);

