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

--- Default Rate by income group 
SELECT
    CASE
        WHEN person_income < 30000 THEN '<30K'
        WHEN person_income < 50000 THEN '30K-50K'
        WHEN person_income < 75000 THEN '50K-75K'
        WHEN person_income < 100000 THEN '75K-100K'
        ELSE '100K+'
    END AS income_group,

    COUNT(*) AS total_loans,

    SUM(loan_status = 1) AS defaults,

    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM credit_risk

GROUP BY income_group

ORDER BY default_rate DESC;

--- Loan burden and default 
SELECT
    CASE
        WHEN loan_percent_income < 0.10 THEN '<10%'
        WHEN loan_percent_income < 0.20 THEN '10%-20%'
        WHEN loan_percent_income < 0.30 THEN '20%-30%'
        WHEN loan_percent_income < 0.40 THEN '30%-40%'
        ELSE '40%+'
    END AS loan_burden_group,

    COUNT(*) AS total_loans,

    SUM(loan_status = 1) AS defaults,

    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM credit_risk

GROUP BY loan_burden_group

ORDER BY default_rate DESC;

--- Interest Rates and risk
SELECT
    CASE
        WHEN loan_int_rate < 8 THEN '<8%'
        WHEN loan_int_rate < 12 THEN '8%-12%'
        WHEN loan_int_rate < 16 THEN '12%-16%'
        WHEN loan_int_rate < 20 THEN '16%-20%'
        ELSE '20%+'
    END AS interest_rate_group,

    COUNT(*) AS total_loans,

    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM credit_risk

GROUP BY interest_rate_group

ORDER BY interest_rate_group;

--- Credit history
SELECT
    CASE
        WHEN cb_preson_cred_hist_length < 3 THEN '<3 years'
        WHEN cb_preson_cred_hist_length < 5 THEN '3-5 years'
        WHEN cb_preson_cred_hist_length < 10 THEN '5-10 years'
        ELSE '10+ years'
    END AS credit_history_group,

    COUNT(*) AS total_loans,

    SUM(loan_status = 1) AS defaults,

    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM credit_risk

GROUP BY credit_history_group

ORDER BY default_rate DESC;

--- Previous default history
SELECT
    cb_preson_default_on_file,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaults,
    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk
GROUP BY cb_preson_default_on_file
ORDER BY default_rate DESC;

