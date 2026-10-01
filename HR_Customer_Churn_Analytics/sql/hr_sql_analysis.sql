#HR Population Overview
SELECT
  COUNT(*) AS total_employees,
  ROUND(AVG(Age), 1) AS average_age,
  ROUND(AVG(Annual_Salary), 0) AS average_salary,
  ROUND(AVG(Tenure_Years), 2) AS average_tenure_years,
  COUNTIF(Attrition = TRUE) AS attrition_count,
  ROUND(
    COUNTIF(Attrition = TRUE) * 100.0 / COUNT(*),
    2
  ) AS attrition_rate
FROM `hr-customer-churn-analytics.hr_analytics.employees`;

#Attrition by Department
SELECT
  Department,
  COUNT(*) AS employee_count,
  COUNTIF(Attrition = TRUE) AS attrition_count,
  ROUND(
    COUNTIF(Attrition = TRUE) * 100.0 / COUNT(*),
    2
  ) AS attrition_rate,
  ROUND(AVG(Tenure_Years), 2) AS average_tenure_years
FROM `hr-customer-churn-analytics.hr_analytics.employees`
GROUP BY Department
ORDER BY attrition_rate DESC;


#Attrition by Key Employee Factors
SELECT 
  'Overtime' AS factor, 
  CAST(Overtime AS STRING) AS category, 
  COUNT(*) AS employee_count, 
  COUNTIF(Attrition = TRUE) AS attrition_count, 
  ROUND( 
    COUNTIF(Attrition = TRUE) * 100.0 / COUNT(*), 
    2 
  ) AS attrition_rate 
FROM `hr-customer-churn-analytics.hr_analytics.employees` 
GROUP BY Overtime 
 
UNION ALL 
 
SELECT 
  'Job Satisfaction' AS factor, 
  CAST(Job_Satisfaction AS STRING) AS category, 
  COUNT(*) AS employee_count, 
  COUNTIF(Attrition = TRUE) AS attrition_count, 
  ROUND( 
    COUNTIF(Attrition = TRUE) * 100.0 / COUNT(*), 
    2 
  ) AS attrition_rate 
FROM `hr-customer-churn-analytics.hr_analytics.employees` 
GROUP BY Job_Satisfaction 
 
UNION ALL 
 
SELECT 
  'Job Level' AS factor, 
  CAST(Job_Level AS STRING) AS category, 
  COUNT(*) AS employee_count, 
  COUNTIF(Attrition = TRUE) AS attrition_count, 
  ROUND( 
    COUNTIF(Attrition = TRUE) * 100.0 / COUNT(*), 
    2 
  ) AS attrition_rate 
FROM `hr-customer-churn-analytics.hr_analytics.employees` 
GROUP BY Job_Level 
 
UNION ALL 
 
SELECT 
  'Work Mode' AS factor, 
  CAST(Work_Mode AS STRING) AS category, 
  COUNT(*) AS employee_count, 
  COUNTIF(Attrition = TRUE) AS attrition_count, 
  ROUND( 
    COUNTIF(Attrition = TRUE) * 100.0 / COUNT(*), 
    2 
  ) AS attrition_rate 
FROM `hr-customer-churn-analytics.hr_analytics.employees` 
GROUP BY Work_Mode 
 
ORDER BY factor, attrition_rate DESC;


#Attrition vs Tenure and Salary
SELECT
  Attrition,
  COUNT(*) AS employee_count,
  ROUND(AVG(Tenure_Years), 2) AS average_tenure_years,
  ROUND(AVG(Annual_Salary), 0) AS average_salary,
  ROUND(AVG(Job_Satisfaction), 2) AS average_job_satisfaction
FROM `hr-customer-churn-analytics.hr_analytics.employees`
GROUP BY Attrition
ORDER BY Attrition DESC;

#Performance vs Attrition
WITH employee_performance_summary AS (
  SELECT
    Employee_ID,
    AVG(Performance_Score) AS average_performance_score,
    ANY_VALUE(Performance_Band) AS Performance_Band
  FROM `hr-customer-churn-analytics.hr_analytics.employee_performance`
  GROUP BY Employee_ID
)

SELECT
  eps.Performance_Band,
  COUNT(*) AS employee_count,
  COUNTIF(e.Attrition = TRUE) AS attrition_count,
  ROUND(
    COUNTIF(e.Attrition = TRUE) * 100.0 / COUNT(*),
    2
  ) AS attrition_rate,
  ROUND(
    AVG(eps.average_performance_score),
    2
  ) AS average_performance_score
FROM employee_performance_summary eps
JOIN `hr-customer-churn-analytics.hr_analytics.employees` e
  ON eps.Employee_ID = e.Employee_ID
GROUP BY eps.Performance_Band
ORDER BY attrition_rate DESC;


#Customer Churn
SELECT
  COUNT(*) AS total_customers,
  ROUND(AVG(Age), 1) AS average_age,
  ROUND(AVG(Tenure_Months), 2) AS average_tenure_months,
  ROUND(AVG(Monthly_Charge), 2) AS average_monthly_charge,
  COUNTIF(Churn = TRUE) AS churned_customers,
  ROUND(
    COUNTIF(Churn = TRUE) * 100.0 / COUNT(*),
    2
  ) AS churn_rate
FROM `hr-customer-churn-analytics.hr_analytics.customers`;

#Churn by Contract Type and Plan
SELECT
  'Contract Type' AS factor,
  Contract_Type AS category,
  COUNT(*) AS customer_count,
  COUNTIF(Churn = TRUE) AS churn_count,
  ROUND(
    COUNTIF(Churn = TRUE) * 100.0 / COUNT(*),
    2
  ) AS churn_rate
FROM `hr-customer-churn-analytics.hr_analytics.customers`
GROUP BY Contract_Type

UNION ALL

SELECT
  'Plan' AS factor,
  Plan AS category,
  COUNT(*) AS customer_count,
  COUNTIF(Churn = TRUE) AS churn_count,
  ROUND(
    COUNTIF(Churn = TRUE) * 100.0 / COUNT(*),
    2
  ) AS churn_rate
FROM `hr-customer-churn-analytics.hr_analytics.customers`
GROUP BY Plan

ORDER BY factor, churn_rate DESC;


#Churn by Customer Behavior
SELECT
  'Satisfaction' AS factor,
  CAST(Satisfaction_Score AS STRING) AS category,
  COUNT(*) AS customer_count,
  COUNTIF(Churn = TRUE) AS churn_count,
  ROUND(
    COUNTIF(Churn = TRUE) * 100.0 / COUNT(*),
    2
  ) AS churn_rate
FROM `hr-customer-churn-analytics.hr_analytics.customers`
WHERE Satisfaction_Score IS NOT NULL
GROUP BY Satisfaction_Score

UNION ALL

SELECT
  'Support Tickets' AS factor,
  CAST(Support_Tickets AS STRING) AS category,
  COUNT(*) AS customer_count,
  COUNTIF(Churn = TRUE) AS churn_count,
  ROUND(
    COUNTIF(Churn = TRUE) * 100.0 / COUNT(*),
    2
  ) AS churn_rate
FROM `hr-customer-churn-analytics.hr_analytics.customers`
GROUP BY Support_Tickets

UNION ALL

SELECT
  'Complaints' AS factor,
  CAST(Complaints AS STRING) AS category,
  COUNT(*) AS customer_count,
  COUNTIF(Churn = TRUE) AS churn_count,
  ROUND(
    COUNTIF(Churn = TRUE) * 100.0 / COUNT(*),
    2
  ) AS churn_rate
FROM `hr-customer-churn-analytics.hr_analytics.customers`
GROUP BY Complaints

UNION ALL

SELECT
  'Usage Score' AS factor,
  CASE
    WHEN Usage_Score < 40 THEN 'Below 40'
    WHEN Usage_Score < 60 THEN '40-59'
    WHEN Usage_Score < 80 THEN '60-79'
    ELSE '80+'
  END AS category,
  COUNT(*) AS customer_count,
  COUNTIF(Churn = TRUE) AS churn_count,
  ROUND(
    COUNTIF(Churn = TRUE) * 100.0 / COUNT(*),
    2
  ) AS churn_rate
FROM `hr-customer-churn-analytics.hr_analytics.customers`
GROUP BY
  CASE
    WHEN Usage_Score < 40 THEN 'Below 40'
    WHEN Usage_Score < 60 THEN '40-59'
    WHEN Usage_Score < 80 THEN '60-79'
    ELSE '80+'
  END

ORDER BY factor, churn_rate DESC;


#Churn vs Tenure and Monthly Charge
SELECT
  Churn,
  COUNT(*) AS customer_count,
  ROUND(AVG(Tenure_Months), 2) AS average_tenure_months,
  ROUND(AVG(Monthly_Charge), 2) AS average_monthly_charge,
  ROUND(AVG(Support_Tickets), 2) AS average_support_tickets,
  ROUND(AVG(Satisfaction_Score), 2) AS average_satisfaction
FROM `hr-customer-churn-analytics.hr_analytics.customers`
GROUP BY Churn
ORDER BY Churn DESC;

#High-Risk Churn Segment
WITH customer_risk AS (
  SELECT
    Customer_ID,
    Churn,

    (
      IF(Contract_Type = 'Monthly', 1, 0)
      + IF(Satisfaction_Score <= 2, 1, 0)
      + IF(Support_Tickets >= 4, 1, 0)
      + IF(Complaints >= 2, 1, 0)
      + IF(Tenure_Months <= 12, 1, 0)
    ) AS risk_factor_count

  FROM `hr-customer-churn-analytics.hr_analytics.customers`
)

SELECT
  CASE
    WHEN risk_factor_count >= 3 THEN 'High-Risk Segment'
    WHEN risk_factor_count = 2 THEN 'Moderate-Risk Segment'
    ELSE 'Lower-Risk Segment'
  END AS risk_segment,

  COUNT(*) AS customer_count,

  COUNTIF(Churn = TRUE) AS churn_count,

  ROUND(
    COUNTIF(Churn = TRUE) * 100.0 / COUNT(*),
    2
  ) AS churn_rate

FROM customer_risk

GROUP BY risk_segment

ORDER BY
  CASE risk_segment
    WHEN 'High-Risk Segment' THEN 1
    WHEN 'Moderate-Risk Segment' THEN 2
    WHEN 'Lower-Risk Segment' THEN 3
  END;










