Q1. Total deposits by region

SELECT "Region" , SUM("Cash_Deposits")
FROM bank_data
GROUP BY "Region";

Q2. Branches with highest withdrawals

SELECT "Branch_ID", SUM("Cash_Withdrawals") AS Total_Withdrawal
FROM bank_data
GROUP BY "Branch_ID"
ORDER BY Total_Withdrawal DESC
LIMIT 5;

Q3. Cash shortage count

SELECT COUNT(*) 
FROM bank_data
WHERE "Cash_Shortage_Flag" = 1;

Q4. Avg balance by region

SELECT "Region", AVG("Closing_Balance")
FROM bank_data
GROUP BY "Region";

Q5. Monthly trend

SELECT TO_CHAR("Date", 'Month') AS Month_Name,
SUM("Cash_Withdrawals") AS Total_Withdrawals
FROM bank_data
GROUP BY TO_CHAR("Date", 'Month'),
    EXTRACT(MONTH FROM "Date")
ORDER BY 
    EXTRACT(MONTH FROM "Date");
