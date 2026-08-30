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
