CREATE TABLE [dbo].[Transactions] (

	[TransactionId] bigint NULL, 
	[CustomerId] bigint NULL, 
	[TransactionAmount] varchar(8000) NULL, 
	[Currency] varchar(8000) NULL, 
	[TransactionDatetime] datetime2(6) NULL, 
	[AccountCreationDatetime] datetime2(6) NULL, 
	[LastModifiedDate] datetime2(6) NULL
);

