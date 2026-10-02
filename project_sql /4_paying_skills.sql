/*
Question: What are the top-paying skills for Data Analysts?

- Calculate the average yearly salary associated with each skill.
- Focus on Data Analyst roles with specified yearly salaries, regardless of location.
- Round the average salary to the nearest whole number.
- Rank skills by average salary from highest to lowest.
- Return the top 25 skills based on average salary.
- Goal: Identify the skills associated with the highest-paying Data Analyst positions.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25; 