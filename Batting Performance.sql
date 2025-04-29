--  Batting Performance Analysis
-- Top 10 Batsmen (Most Runs)

SELECT p.Player_ID,p.Player_Name, P.Country,bp.Total_Runs
FROM battingperformance bp
JOIN player p
ON bp.Player_ID=p.Player_ID
ORDER BY  bp.Total_Runs DESC
LIMIT 10;

-- Best Strike Rate (Min 100 Balls Faced)
SELECT p.Player_ID,p.Player_Name, P.Country,bp.Strike_Rate
FROM battingperformance bp
JOIN player p
ON bp.Player_ID=p.Player_ID
WHERE bp.Total_Balls_Faced>=100
ORDER BY  bp.Strike_Rate DESC
LIMIT 10;

--  Boundary Hitters (Most Fours & Sixes)
SELECT p.Player_ID,p.Player_Name, P.Country,(bp.Total_Four+bp.Total_Six) AS Total_Boundaries
FROM battingperformance bp
JOIN player p
ON bp.Player_ID=p.Player_ID
ORDER BY  Total_Boundaries DESC
LIMIT 10;

-- Top 5 Overall Performers

SELECT 
	RANK() OVER (ORDER BY ((Total_Runs * 0.5) + (Strike_Rate * 0.3) + ((Total_Four + Total_Six) * 0.2)) DESC) AS Rank_No,
    p.Player_ID, 
    p.Player_Name,
    p.Country,
    Total_Runs, 
    Strike_Rate, 
    Total_Four, 
    Total_Six, 
    (Total_Four + Total_Six) AS Total_Boundaries,
    Round((Total_Runs * 0.5) + (Strike_Rate * 0.3) + ((Total_Four + Total_Six) * 0.2),2) AS Performance_Score
FROM BattingPerformance bp
JOIN player p
ON bp.Player_ID=p.Player_ID
LIMIT 5;

-- Analysis the right and left handed batsman

SELECT p.Batting_Style,
ROUND(AVG(bp.Total_Runs),2) AS AVG_Runs,
ROUND(AVG(Strike_Rate),2) AS Avg_Strike_Rate,
ROUND(AVG(Total_Four),2) AS Avg_Total_Four,
ROUND(AVG(Total_Six),2) AS Avg_Total_Six
FROM battingperformance bp
JOIN player p
ON bp.Player_ID=p.Player_ID
WHERE p.Batting_Style="Right-hand Bat" OR p.Batting_Style="Left-hand Bat"
GROUP BY p.Batting_Style


