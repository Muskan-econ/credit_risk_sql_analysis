CREATE DATABASE IF NOT EXISTS credit_risk_analysis;

USE credit_risk_analysis;

DROP TABLE IF EXISTS credit_risk;

CREATE TABLE credit_risk (
    person_age INT,
    person_income INT,
    person_home_ownership VARCHAR(20),
    person_emp_length DECIMAL(5,2),
    loan_intent VARCHAR(50),
    loan_grade VARCHAR(5),
    loan_amnt INT,
    loan_int_rate DECIMAL(6,3),
    loan_status INT,
    loan_percent_income DECIMAL(6,3),
    cb_person_default_on_file VARCHAR(5),
    cb_preson_cred_hist_length INT
);
