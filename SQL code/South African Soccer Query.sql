
CREATE TABLE ketro_sa_soccer_dataset_advanced (
    player_name VARCHAR(100),
    team VARCHAR(100),
    date_of_birth VARCHAR(50),
    age INT,
    marital_status VARCHAR(50),
    number_of_kids INT,
    nationality VARCHAR(100),
    country_of_birth VARCHAR(100),
    position VARCHAR(50),
    preferred_foot VARCHAR(10),
    height_cm INT,
    weight_kg INT,
    jersey_number INT,
    injury_status VARCHAR(50),
    agent VARCHAR(100),
    matches_played INT,
    minutes_played INT,
    goals INT,
    assists INT,
    tackles INT,
    interceptions INT,
    saves INT,
    clean_sheets INT,
    yellow_cards INT,
    red_cards INT,
    passing_accuracy FLOAT,
    shot_accuracy FLOAT,
    previous_club VARCHAR(100),
    years_at_club INT,
    contract_end_year INT,
    average_salary_zar FLOAT,
    market_value_zar FLOAT,
    signing_bonus_zar FLOAT,
    release_clause_zar FLOAT
);
-- Check if table has data
SELECT COUNT(*) FROM ketro_sa_soccer_dataset_advanced;

SELECT * FROM ketro_sa_soccer_dataset_advanced;

--question 1
SELECT top 100 * FROM ketro_sa_soccer_dataset_advanced;

--Question 2
SELECT COUNT(*) AS total_players FROM ketro_sa_soccer_dataset_advanced;

--3. List all unique teams in the league.
SELECT DISTINCT team FROM ketro_sa_soccer_dataset_advanced;

--4. Count how many players are in each team.
SELECT team, COUNT(*) AS players_per_team FROM ketro_sa_soccer_dataset_advanced GROUP BY team;


--5. Identify the top 10 players with the most goals.
SELECT TOP 10 player_name, goals FROM ketro_sa_soccer_dataset_advanced ORDER BY goals DESC;


--6. Find the average salary for players in each team.
SELECT team, AVG(average_salary_zar) AS avg_salary FROM ketro_sa_soccer_dataset_advanced GROUP BY team;


--7. Retrieve the top 10 players with the highest market value.
SELECT TOP 10 player_name, market_value_zar FROM ketro_sa_soccer_dataset_advanced ORDER BY market_value_zar DESC;


--8. Calculate the average passing accuracy for each position.
SELECT position, AVG(passing_accuracy) AS avg_passing_accuracy FROM ketro_sa_soccer_dataset_advanced GROUP BY position;


--9. Compare shot accuracy with goals to find correlations.
SELECT player_name, goals, shot_accuracy FROM ketro_sa_soccer_dataset_advanced;

--10. Compute total goals and assists for each team.
SELECT team, SUM(goals) AS total_goals, SUM(assists) AS total_assists FROM ketro_sa_soccer_dataset_advanced GROUP BY team;


--11. Count players by their marital status.
SELECT marital_status, COUNT(*) AS count_players FROM ketro_sa_soccer_dataset_advanced GROUP BY marital_status;


--12. Count players by nationality.
SELECT nationality, COUNT(*) AS count_players FROM ketro_sa_soccer_dataset_advanced GROUP BY nationality;

--13. Find average market value grouped by nationality.
SELECT nationality, AVG(market_value_zar) AS avg_market_value FROM ketro_sa_soccer_dataset_advanced GROUP BY nationality;

--14. Determine how many player contracts end in each year.
SELECT contract_end_year, COUNT(*) AS contracts_count FROM ketro_sa_soccer_dataset_advanced GROUP BY contract_end_year;

--15. Identify players whose contracts end next year.
SELECT player_name, team, contract_end_year FROM ketro_sa_soccer_dataset_advanced WHERE contract_end_year = YEAR(GETDATE()) + 1;

--16. Summarize the number of players by injury status.
SELECT injury_status, COUNT(*) AS count_players FROM ketro_sa_soccer_dataset_advanced GROUP BY injury_status;

--17. Calculate goals per match ratio for each player.
SELECT player_name, CAST(goals AS FLOAT)/NULLIF(matches_played,0) AS goals_per_match FROM ketro_sa_soccer_dataset_advanced;

--18. Count how many players are managed by each agent.
SELECT agent, COUNT(*) AS players_per_agent FROM ketro_sa_soccer_dataset_advanced GROUP BY agent;

--19. Calculate average height and weight by player position.
SELECT position, AVG(height_cm) AS avg_height, AVG(weight_kg) AS avg_weight FROM ketro_sa_soccer_dataset_advanced GROUP BY position;

--20. Identify players with the highest combined goals and assists.
SELECT TOP 10 player_name, (goals + assists) AS total_contribution FROM ketro_sa_soccer_dataset_advanced ORDER BY total_contribution DESC;

