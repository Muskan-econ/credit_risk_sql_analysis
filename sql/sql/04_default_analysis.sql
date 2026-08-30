--- Overall Default Rate 
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaults,
    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk;

--- Default Loan By Grade
SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaults,
    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;

--- Default rate by loan purpose
SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaults,
    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk
GROUP BY loan_intent
ORDER BY default_rate DESC;

--- Default rate by home ownership 
SELECT
    person_home_ownership,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaults,
    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk
GROUP BY person_home_ownership
ORDER BY default_rate DESC;

--- Default rate by age group
SELECT
    CASE
        WHEN person_age < 25 THEN '18-24'
        WHEN person_age < 35 THEN '25-34'
        WHEN person_age < 45 THEN '35-44'
        WHEN person_age < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,

    COUNT(*) AS total_loans,

    SUM(loan_status = 1) AS defaults,

    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM credit_risk

GROUP BY age_group
ORDER BY default_rate DESC;
