/*
Question: What are the top-paying Data Analyst jobs?

- Identify the top 10 highest-paying Data Analyst roles available remotely.
- Focus on job postings with specified yearly salaries.
- Include company information to show which employers offer these positions.
- Sort jobs by average yearly salary from highest to lowest.
- Goal: Highlight the highest-paying remote opportunities for Data Analysts.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;