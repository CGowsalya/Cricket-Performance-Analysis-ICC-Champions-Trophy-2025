-- Bowling Performance Analysis

-- Top 10 Wicket-Takers
SELECT 
p.Player_ID AS ID,
p.Player_Name AS Player_Name,
p.Country AS Country,
bo.Total_Wickets AS Wickets
FROM bowlingperformance bo
JOIN player p
ON bo.Player_ID=p.Player_ID
ORDER BY Wickets DESC
LIMIT 10;

-- Best Economy Rate (Min 10 Overs Bowled)
SELECT 
p.Player_ID AS ID,
p.Player_Name AS Player_Name,
p.Country AS Country,
bo.Economy AS Economy
FROM bowlingperformance bo
JOIN player p
ON bo.Player_ID=p.Player_ID
WHERE bo.Total_Overs>=10
ORDER BY Economy DESC
LIMIT 10;

-- Most Extras Conceded

SELECT 
p.Player_ID AS ID,
p.Player_Name AS Player_Name,
p.Country AS Country,
(bo.Total_No_of_Wide+bo.Total_No_of_No_Balls) AS Total_Extras
FROM bowlingperformance bo
JOIN player p
ON bo.Player_ID=p.Player_ID
ORDER BY Total_Extras DESC
LIMIT 10;

-- Most Maidens overs(Bowler)

SELECT 
p.Player_ID AS ID,
p.Player_Name AS Player_Name,
p.Country AS Country,
bo.Total_Maidens AS Total_Maidens
FROM bowlingperformance bo
JOIN player p
ON bo.Player_ID=p.Player_ID
ORDER BY Total_Maidens DESC
LIMIT 10;

-- -- Top 5 Overall Performers

SELECT 
	RANK() OVER (ORDER BY ((Total_Wickets * 0.5) - (Economy * 0.3) - ((Total_No_of_No_Balls + Total_No_of_Wide) * 0.2)) DESC) AS Rank_No,
    p.Player_ID, 
    p.Player_Name,
    p.Country,
    Total_Wickets, 
    Economy, 
    Total_No_of_No_Balls, 
    Total_No_of_Wide, 
    (Total_No_of_No_Balls + Total_No_of_Wide) AS Extras,
    Round((Total_Wickets * 0.5) - (Economy * 0.3) - ((Total_No_of_No_Balls + Total_No_of_Wide) * 0.2),2) AS Performance_Score
FROM bowlingperformance bo
JOIN player p
ON bo.Player_ID=p.Player_ID
LIMIT 5;

-- Analysis the Bowling Style
SELECT 
    p.Bowling_Style,
    SUM(bp.Total_Wickets) AS Total_Wickets,
    ROUND(AVG(bp.Economy),2) AS Avg_Economy,
    ROUND(AVG(bp.Total_No_of_No_Balls),2) AS Avg_No_Balls,
    ROUND(AVG(bp.Total_No_of_Wide),2) AS Avg_Wides
FROM bowlingperformance bp
JOIN player p
ON bp.Player_ID = p.Player_ID
WHERE p.Bowling_Style <> "None"
GROUP BY p.Bowling_Style;