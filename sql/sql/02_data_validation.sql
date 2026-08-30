USE credit_risk_analysis;

-- 1. Total number of records
SELECT COUNT(*) AS total_rows
FROM credit_risk;


-- 2. Check table structure
DESCRIBE credit_risk;


-- 3. Preview records
SELECT *
FROM credit_risk
LIMIT 10;


-- 4. Check missing values
SELECT
    COUNT(*) AS total_rows,
    SUM(person_age IS NULL) AS missing_age,
    SUM(person_income IS NULL) AS missing_income,
    SUM(person_home_ownership IS NULL) AS missing_home_ownership,
    SUM(person_emp_length IS NULL) AS missing_employment_length,
    SUM(loan_intent IS NULL) AS missing_loan_intent,
    SUM(loan_grade IS NULL) AS missing_loan_grade,
    SUM(loan_amnt IS NULL) AS missing_loan_amount,
    SUM(loan_int_rate IS NULL) AS missing_interest_rate,
    SUM(loan_status IS NULL) AS missing_loan_status,
    SUM(loan_percent_income IS NULL) AS missing_loan_percent_income,
    SUM(cb_person_default_on_file IS NULL) AS missing_default_history,
    SUM(cb_preson_cred_hist_length IS NULL) AS missing_credit_history
FROM credit_risk;


-- 5. Check target variable
SELECT
    loan_status,
    COUNT(*) AS customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM credit_risk),
        2
    ) AS percentage
FROM credit_risk
GROUP BY loan_status
ORDER BY loan_status;


-- 6. Numerical range check
SELECT
    MIN(person_age) AS min_age,
    MAX(person_age) AS max_age,
    ROUND(AVG(person_age), 2) AS avg_age,

    MIN(person_income) AS min_income,
    MAX(person_income) AS max_income,
    ROUND(AVG(person_income), 2) AS avg_income,

    MIN(loan_amnt) AS min_loan,
    MAX(loan_amnt) AS max_loan,
    ROUND(AVG(loan_amnt), 2) AS avg_loan,

    MIN(loan_int_rate) AS min_interest_rate,
    MAX(loan_int_rate) AS max_interest_rate,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate
FROM credit_risk;
