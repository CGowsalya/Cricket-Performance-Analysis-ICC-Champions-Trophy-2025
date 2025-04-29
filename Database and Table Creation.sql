CREATE DATABASE iCC_2025;


CREATE TABLE Matches (
    Match_ID INT AUTO_INCREMENT PRIMARY KEY,
    Match_Number INT,
    Round_Number INT,
    Match_Date DATE,
    Location VARCHAR(100),
    Home_Team VARCHAR(50),
    Away_Team VARCHAR(50),
    Group_Name VARCHAR(10),
    Result VARCHAR(100),
    Player_of_the_Match VARCHAR(100),
    Tournament_Phase VARCHAR(50)
);

CREATE TABLE BattingPerformance (
    Player_ID VARCHAR(10) PRIMARY KEY,
    Total_Runs INT,
    Total_Balls_Faced INT,
    Total_Four INT,
    Total_Six INT,
    Strike_Rate DECIMAL(5,2)
);


CREATE TABLE BowlingPerformance (
    Player_ID VARCHAR(10) PRIMARY KEY,
    Total_Overs DECIMAL(4,1),
    Total_Maidens INT,
    Total_Wickets INT,
    Total_Runs INT,
    Total_No_of_No_Balls INT,
    Total_No_of_Wide INT,
    Economy DECIMAL(5,2)
);

CREATE TABLE TeamStandings (
    Team_ID VARCHAR(10) PRIMARY KEY,
    Group_Name VARCHAR(10),
    Team_Name VARCHAR(50),
    Total_Matches INT,
    Wins INT,
    Losses INT,
    No_Result INT,
    Net_Run_Rate DECIMAL(5,3),
    Points INT
);

CREATE TABLE Player(
Player_ID VARCHAR(10) PRIMARY KEY,
Player_Name VARCHAR(100),
Country VARCHAR(50),
Player_Role VARCHAR(25),
Batting_Style VARCHAR(100),
Bowling_style VARCHAR(100)
);
