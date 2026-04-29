# Rockbuster Stealth SQL Data Analysis Project

## Project Summary
Facing increased competition from streaming platforms, Rockbuster Stealth LLC plans to launch an online video rental service using its existing movie licenses. This analysis provides data-driven insights to support the company strategy, with a focus on revenue optimization, customer value, and geographic expansion.

## Key Questions
- Which countries and regions are Rockbuster customers located in?
- Do sales figures vary significantly across geographic regions?
- Which genres contributed the most to higher rentals and revenues?
- What is the average rental duration across all videos?

## Tools used
- PostgreSQL / pgAdmin4: database management and SQL analysis  
- SQL: data querying, joins, CTEs, aggregation  
- Tableau Public: data visualization and dashboarding  

## Methodology
1. Loaded the Rockbuster dataset into PostgreSQL and explored table structure, relationships, and schema (ERD, data dictionary).
2. Used SQL aggregates to profile film and customer data and check for inconsistencies or missing values.
3. Combined multiple tables using joins, subqueries, and CTEs to prepare datasets for analysis.
4. Analyzed customer distribution and revenue by geography to identify key markets and high-value customers.
5. Calculated KPIs such as revenue and rental counts across genres.
6. Exported SQL outputs and built Tableau visualizations to present insights.

## Key Findings
- India, China, and the United States generate the highest revenue and are the top expansion markets  
- Sports, Sci-Fi, and Animation are the top-performing genres by revenue and rentals  
- Average rental duration is ~5 days, indicating short-term, intent-driven viewing  

View the interactive visualizations on [Tableau Public](https://public.tableau.com/app/profile/helena.robalinho/viz/RockbusterDataLaunchStrategyforOnlineVideoRental/Rentalsandrevenuebygenreandcountry)

## Recommendations
- Prioritize initial launch in India, China, and the United States  
- Focus early content strategy on Sports, Sci-Fi, and Animation genres  
- Target high-value customers in top-performing cities  
- Introduce customer retention strategies such as loyalty pricing, early access, and bundle offers  

---
<sub>Author: Helena Robalinho · CareerFoundry Data Analytics Immersion Program</sub>
