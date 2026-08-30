--- Types of borrowers
SELECT
    person_home_ownership,
    COUNT(*) AS borrowers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM credit_risk),
        2
    ) AS percentage
FROM credit_risk
GROUP BY person_home_ownership
ORDER BY borrowers DESC;

--- Loan Purpose
SELECT
    loan_intent,
    COUNT(*) AS loans,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate
FROM credit_risk
GROUP BY loan_intent
ORDER BY loans DESC;

--- Loan Grade
SELECT
    loan_grade,
    COUNT(*) AS loans,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;

--- Age Group 
SELECT
    CASE
        WHEN person_age < 25 THEN '18-24'
        WHEN person_age < 35 THEN '25-34'
        WHEN person_age < 45 THEN '35-44'
        WHEN person_age < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS borrowers,
    ROUND(AVG(person_income), 2) AS avg_income,
    ROUND(AVG(loan_amnt), 2) AS avg_loan
FROM credit_risk
GROUP BY age_group
ORDER BY age_group;
