-- Match & Team Analysis
-- Win/Loss Records (From Team Standings)

SELECT Team_Name, Wins, Losses, Points, Net_Run_Rate 
FROM TeamStandings 
ORDER BY Points DESC, Net_Run_Rate DESC;

-- Most Player of the Match Awards

SELECT Player_of_the_Match, COUNT(*) AS Awards 
FROM Matches 
WHERE Player_of_the_Match <> "Not awarded."
GROUP BY Player_of_the_Match 
ORDER BY Awards DESC 
LIMIT 10;

 -- Match have No Result
SELECT *
FROM matches
WHERE Result ="No Result" OR Result ='Abandoned'