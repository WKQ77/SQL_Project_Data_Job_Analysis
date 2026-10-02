/*
Question: What are the most in-demand skills for Data Analysts?

- Join Data Analyst job postings with their associated skills.
- Identify the top 5 most frequently requested skills.
- Focus on all Data Analyst job postings, regardless of location or salary information.
- Count how many job postings are associated with each skill.
- Goal: Identify the skills with the highest overall demand in the Data Analyst job market.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;