--- High Risk borrower segmentation
SELECT
    CASE
        WHEN loan_grade IN ('D','E','F','G')
             AND loan_percent_income >= 0.30
             THEN 'High Risk'

        WHEN loan_grade IN ('C','D')
             OR loan_percent_income >= 0.20
             THEN 'Medium Risk'

        ELSE 'Lower Risk'
    END AS risk_segment,

    COUNT(*) AS borrowers,

    SUM(loan_status = 1) AS defaults,

    ROUND(
        SUM(loan_status = 1) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM credit_risk

GROUP BY risk_segment

ORDER BY default_rate DESC;
