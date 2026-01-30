SELECT 
    CustomerId,
    Surname,
    CAST(CreditScore AS INT) AS CreditScore,
    Geography,
    Gender,
    CAST(Age AS INT) AS Age,
    CAST(Tenure AS INT) AS Tenure,
    CAST(EstimatedSalary AS DECIMAL(18,2)) AS EstimatedSalary,
    CAST(Balance AS DECIMAL(18,2)) AS Balance,
    CAST(NumOfProducts AS INT) AS NumOfProducts,
    HasCrCard,
    IsActiveMember,
    Exited,

    CASE 
        WHEN Exited = 'Yes' AND CAST(CreditScore AS INT) < 600 AND CAST(Balance AS DECIMAL(18,2)) < 5000 THEN 'High Risk Churner'
        WHEN Exited = 'Yes' AND CAST(CreditScore AS INT) < 650 THEN 'Medium Risk Churner'
        WHEN Exited = 'Yes' THEN 'Churner'
        ELSE 'Non-Churner'
    END AS ChurnCategory,

    CASE 
        WHEN CAST(NumOfProducts AS INT) > 1 AND IsActiveMember = 'Yes' THEN 'Valued Customer'
        WHEN CAST(NumOfProducts AS INT) = 1 AND IsActiveMember = 'Yes' THEN 'Active Single-Product'
        ELSE 'Low Engagement'
    END AS CustomerSegment,

    AVG(CAST(Age AS INT)) OVER(PARTITION BY Geography) AS AvgAgeByCountry,
    AVG(CAST(CreditScore AS INT)) OVER(PARTITION BY Geography) AS AvgCreditScoreByCountry,
    SUM(CAST(Balance AS DECIMAL(18,2))) OVER(PARTITION BY Geography) AS TotalBalanceByCountry,
    COUNT(CustomerId) OVER(PARTITION BY Geography) AS NumCustomersByCountry,

    RANK() OVER(PARTITION BY Geography ORDER BY CAST(Balance AS DECIMAL(18,2)) DESC) AS BalanceRankInCountry

FROM customers
ORDER BY Geography, BalanceRankInCountry;

--Select * from [dbo].[Customers]