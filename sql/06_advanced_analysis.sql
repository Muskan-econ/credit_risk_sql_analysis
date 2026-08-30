--- Calculating default rates 
WITH grade_analysis AS (

    SELECT
        loan_grade,
        COUNT(*) AS total_loans,
        SUM(loan_status = 1) AS defaults
    FROM credit_risk
    GROUP BY loan_grade

)

SELECT
    loan_grade,
    total_loans,
    defaults,
    ROUND(defaults * 100.0 / total_loans, 2) AS default_rate
FROM grade_analysis
ORDER BY default_rate DESC;

--- Ranking loan grades
WITH grade_analysis AS (

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
)

SELECT
    loan_grade,
    total_loans,
    defaults,
    default_rate,

    RANK() OVER (
        ORDER BY default_rate DESC
    ) AS risk_rank

FROM grade_analysis;

--- Combinations with high default rates
SELECT
    loan_grade,
    loan_intent,

    COUNT(*) AS total_loans,

    SUM(loan_status = 1) AS defaults,

    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM credit_risk

GROUP BY
    loan_grade,
    loan_intent

HAVING COUNT(*) >= 100

ORDER BY default_rate DESC;

--- Riskiest borrower profile
SELECT
    loan_grade,
    person_home_ownership,
    loan_intent,

    COUNT(*) AS borrowers,

    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM credit_risk

GROUP BY
    loan_grade,
    person_home_ownership,
    loan_intent

HAVING COUNT(*) >= 100

ORDER BY default_rate DESC

LIMIT 10;
