# HR & Customer Churn Analytics

## Project Overview

This project analyzes two business areas together:

1. Employee attrition and workforce patterns
2. Customer churn and retention patterns

The analysis identifies factors associated with employees leaving the organization and customers discontinuing their service. The project combines SQL, Python, and Power BI to transform raw data into actionable business insights.

## Business Objectives

- Measure overall employee attrition and customer churn
- Identify departments and employee factors associated with higher attrition
- Analyze the relationship between overtime and employee attrition
- Identify customer segments with higher churn rates
- Understand the impact of contract type and satisfaction on churn
- Identify high-risk customer groups
- Build an interactive management dashboard

## Technology Stack

- SQL — BigQuery
- Python — Pandas, NumPy, Matplotlib, Seaborn
- Power BI — Dashboard and interactive analysis
- GitHub — Project documentation and version control

## Dataset

The project contains:

- 8,000 employees
- 12,000 customers
- Employee performance records
- Customer transactions
- Customer support interactions

The employee data contains demographic, job, compensation, satisfaction, overtime, and attrition information.

The customer data contains plan, contract, tenure, charges, support activity, satisfaction, usage, and churn information.

## Key Business Results

### Workforce Overview

| Metric = Result |

| Total Employees = 8,000 | 
| Average Age = 38.4 | 
| Average Salary = 63,153 | 
| Average Tenure = 5.51 years | 
| Attrition Count = 530 | 
| Employee Attrition Rate = 6.62% | 

### Attrition by Department

| Department | Employees | Attrition | Attrition Rate |

| HR | 656 | 52 | 7.93% || 
| Finance | 788 | 60 | 7.61% || 
| IT | 1,248 | 87 | 6.97% || 
| Engineering | 780 | 53 | 6.79% || 
| Operations | 1,454 | 96 | 6.60% || 
| Sales | 1,207 | 76 | 6.30% || 
| Marketing | 767 | 48 | 6.26% || 
| Customer Support | 1,100 | 58 | 5.27% ||

### Employee Risk Factors

| Factor | Category | Attrition Rate |

| Overtime | Yes | 10.48% | 
| Overtime | No | 5.08% | 
| Job Satisfaction | 1 | 5.93% | 
| Job Satisfaction | 2 | 7.79% | 
| Job Satisfaction | 3 | 6.37% | 
| Job Satisfaction | 4 | 6.33% | 
| Job Satisfaction | 5 | 7.02% | 

The overtime comparison shows a notable difference in recorded attrition rates between employees working overtime and those who do not.

## Customer Overview

| Metric = Result |

| Total Customers = 12,000 | 
| Average Age = 42.3 | 
| Average Tenure = 28.76 months | 
| Average Monthly Charge = 72.31 | 
| Churned Customers = 780 | 
| Customer Churn Rate = 6.50% |

### Churn by Contract Type

| Contract Type | Customers | Churned | Churn Rate |

| Monthly | 6,717 | 614 | 9.14% | 
| Annual | 3,466 | 121 | 3.49% | 
| Two-Year | 1,817 | 45 | 2.48% | 

Contract type shows one of the clearest differences in customer churn within the analysis.

### Churn by Satisfaction

| Satisfaction Score | Customers | Churned | Churn Rate |

| 1 | 380 | 55 | 14.47% | 
| 2 | 2,040 | 205 | 10.05% | 
| 3 | 4,541 | 261 | 5.75% | 
| 4 | 3,740 | 199 | 5.32% | 
| 5 | 1,239 | 53 | 4.28% | 

Lower satisfaction scores are associated with higher recorded churn rates.

## Customer Risk Segments

| Risk Segment | Customers | Churned | Churn Rate |

| High-Risk Segment | 1,997 | 276 | 13.82% | 
| Moderate-Risk Segment | 2,982 | 236 | 7.91% | 
| Lower-Risk Segment | 7,021 | 268 | 3.82% | 

The high-risk segment has a substantially higher recorded churn rate than the lower-risk segment.

## Key Insights

### Employee Insights

1. Overall employee attrition is 6.62%, with 530 employees recorded as having left.

2. HR and Finance have the highest department-level attrition rates at 7.93% and 7.61%.

3. Employees working overtime have an attrition rate of 10.48%, compared with 5.08% for employees without overtime.

4. The highest observed job-satisfaction attrition rate occurs at satisfaction level 2, at 7.79%.

5. Attrition patterns vary across departments, suggesting that workforce retention analysis should consider departmental context rather than relying only on the overall company rate.

### Customer Insights

1. Overall customer churn is 6.50%, representing 780 churned customers.

2. Monthly-contract customers have a 9.14% churn rate compared with 3.49% for annual and 2.48% for two-year contracts.

3. Customers with satisfaction scores of 1 have a 14.47% churn rate, compared with 4.28% for customers scoring 5.

4. The high-risk customer segment has a 13.82% churn rate, compared with 3.82% for the lower-risk segment.

5. Churn generally increases as support-ticket volume increases, although categories with very small customer populations should be interpreted cautiously.

6. The contract type × satisfaction heatmap highlights particularly high churn combinations, with monthly-contract customers and low satisfaction showing the strongest observed churn rates.

## Recommendations

### Workforce Retention

- Review overtime workload and staffing requirements in teams with consistently high overtime exposure.
- Investigate the underlying causes of higher attrition in HR and Finance.
- Use employee satisfaction surveys and manager feedback to identify retention issues earlier.
- Develop targeted retention initiatives for departments or employee groups showing persistent attrition patterns.
- Monitor attrition together with tenure, job level, performance, and satisfaction rather than using a single indicator.

### Customer Retention

- Prioritize retention efforts for monthly-contract customers.
- Create early-warning processes for customers with low satisfaction scores.
- Follow up with customers experiencing frequent support interactions.
- Use the high-risk segment as a priority group for proactive retention activities.
- Encourage suitable customers to consider longer-term plans where commercially appropriate.
- Combine contract type, satisfaction, support activity, and usage when identifying customers requiring attention.

These recommendations are based on observed associations in the dataset and should be validated with additional business context before operational decisions are made.


## Data Quality

The employee datasets contained no missing values in the analyzed fields.

The customer dataset contained 60 missing Satisfaction Score values. These records were excluded where satisfaction-based analysis required a valid satisfaction score.

## Skills demonstrated
- SQL querying and aggregation
- Data cleaning and validation
- Exploratory data analysis
- KPI development
- Attrition and churn analysis
- Risk segmentation
- Data visualization
- Power BI dashboard development
- Business insight generation
- Data-driven recommendations

## Conclusion
This project demonstrates how HR and customer data can be combined to identify workforce attrition patterns and customer churn risks. The analysis highlights overtime, department, contract type, satisfaction, support activity, and customer risk segments as important areas for further investigation.
The Power BI dashboard converts these findings into an interactive management reporting tool that can support workforce planning and customer retention analysis.
This project demonstrates how HR and customer data can be combined to identify workforce attrition patterns and customer churn risks. The analysis highlights overtime, department, contract type, satisfaction, support activity, and customer risk segments as important areas for further investigation.

The Power BI dashboard converts these findings into an interactive management reporting tool that can support workforce planning and customer retention analysis.
