set search_path="IPLDEMO";

CREATE TABLE Locations(
	locationid INTEGER PRIMARY KEY,
	lname VARCHAR(30) NOT NULL,
	city VARCHAR (20) NOT NULL,
	capacity INTEGER NOT NULL
);	


CREATE TABLE Player (	
	pid INTEGER PRIMARY KEY,
	pname VARCHAR(30) NOT NULL,
	country VARCHAR(20) NOT NULL,
	ptype VARCHAR(30) NOT NULL,
	teamid INT NOT NULL,
	auction_price INTEGER NOT NULL
	
);


CREATE TABLE Team (
	tid INTEGER PRIMARY KEY,
	tname	VARCHAR(20) NOT NULL,
	owner VARCHAR(20) NOT NULL,
	homeground_id INTEGER REFERENCES Locations (locationid),
	regular_capt_id INTEGER REFERENCES Player (pid)
);



ALTER table Player add FOREIGN KEY (teamid) REFERENCES Team(tid) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE  TABLE Matches (
	matchid INTEGER PRIMARY KEY ,
	team1_id INTEGER REFERENCES Team (tid) ON DELETE CASCADE ON UPDATE CASCADE,
	captain1_id INTEGER REFERENCES Player (pid) ON DELETE CASCADE ON UPDATE CASCADE,
	taem2_id INTEGER REFERENCES Team (tid) ON DELETE CASCADE ON UPDATE CASCADE,
	captain2_id INTEGER REFERENCES Player (pid) ON DELETE CASCADE ON UPDATE CASCADE,
	toss_winning_team_id INTEGER REFERENCES Team (tid) ON DELETE CASCADE ON UPDATE CASCADE,
	winningteam_id INTEGER REFERENCES Team (tid) ON DELETE CASCADE ON UPDATE CASCADE,
	margin_by_runs INTEGER  CHECK (margin_by_runs > 0),
	margin_by_wickets INTEGER  CHECK (margin_by_wickets < 11)
);




CREATE TABLE Overstats (
	match INTEGER REFERENCES Matches (matchid) ON DELETE CASCADE ON UPDATE CASCADE,
	innings INTEGER NOT NULL,
	overno INTEGER NOT NULL,
	bowler_id INTEGER REFERENCES Player (pid) ON DELETE CASCADE ON UPDATE CASCADE,
	batsman_id INTEGER REFERENCES Player (pid) ON DELETE CASCADE ON UPDATE CASCADE,
	balls_faced INTEGER NOT NULL,
	runs INTEGER,
	wickets INTEGER,
	extras INTEGER,
        PRIMARY KEY (match,innings,overno,batsman_id)
);

CREATE TABLE Catches(
	cid INTEGER PRIMARY KEY,
	player_id INTEGER REFERENCES Player (pid) ON DELETE CASCADE ON UPDATE CASCADE,
	match_no INTEGER REFERENCES Matches (matchid) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Sixes (
	sid INTEGER PRIMARY KEY,
	hit_by_pid INTEGER REFERENCES player (pid) ON DELETE CASCADE ON UPDATE CASCADE,
	during_match_id INTEGER REFERENCES Matches (matchid) ON DELETE CASCADE ON UPDATE CASCADE,
	distance INTEGER NOT NULL
);


create table runs(
pid integer primary key,
runs integer default 0);


CREATE TABLE sixcount
(
  pid integer primary key,
  sixeshit integer default 0,
  
);






