
/*
GO

CREATE TABLE dbo.Transactions (
    step            INT           NOT NULL,
    [type]          VARCHAR(20)   NOT NULL,   -- bracketed: type is reserved-ish
    amount          DECIMAL(18,2) NOT NULL,
    nameOrig        VARCHAR(20)   NOT NULL,
    oldbalanceOrg   DECIMAL(18,2) NOT NULL,
    newbalanceOrig  DECIMAL(18,2) NOT NULL,
    nameDest        VARCHAR(20)   NOT NULL,
    oldbalanceDest  DECIMAL(18,2) NOT NULL,
    newbalanceDest  DECIMAL(18,2) NOT NULL,
    isFraud         TINYINT       NOT NULL,
    isFlaggedFraud  TINYINT       NOT NULL
);
GO
*/
GO
USE FraudDetectionDB;
GO

-- 1. Drop the old tables if they exist
-- TRUNCATE TABLE dbo.live_transactions;
TRUNCATE TABLE dbo.fraud_predictions;
GO

-- 2. Create the historical table with the matching 'transaction_timestamp' column
CREATE TABLE dbo.historical_transactions (
    step INT,
    [type] VARCHAR(20),
    amount DECIMAL(18, 2),
    nameOrig VARCHAR(50),
    oldbalanceOrg DECIMAL(18, 2),
    newbalanceOrig DECIMAL(18, 2),
    nameDest VARCHAR(50),
    oldbalanceDest DECIMAL(18, 2),
    newbalanceDest DECIMAL(18, 2),
    isFraud INT,
    isFlaggedFraud INT,
    transaction_timestamp VARCHAR(50) -- This perfectly maps to your DataFrame column
);
GO

USE FraudDetectionDB;
GO
SELECT count(*) FROM dbo.fraud_predictions;
GO
USE FraudDetectionDB;
GO

-- Create an EMPTY table with the exact same schema to catch the live stream later
CREATE TABLE dbo.live_transactions (
    step INT,
    [type] VARCHAR(20),
    amount DECIMAL(18, 2),
    nameOrig VARCHAR(50),
    oldbalanceOrg DECIMAL(18, 2),
    newbalanceOrig DECIMAL(18, 2),
    nameDest VARCHAR(50),
    oldbalanceDest DECIMAL(18, 2),
    newbalanceDest DECIMAL(18, 2),
    isFraud INT,
    isFlaggedFraud INT,
    transaction_timestamp VARCHAR(50)
);
GO
GO
CREATE TABLE dbo.fraud_predictions (
    step INT,
    type NVARCHAR(50),
    amount FLOAT,
    nameOrig NVARCHAR(100),
    oldbalanceOrg FLOAT,
    newbalanceOrig FLOAT,
    nameDest NVARCHAR(100),
    oldbalanceDest FLOAT,
    newbalanceDest FLOAT,
    prediction FLOAT, 
    timestamp DATETIME 
GO

