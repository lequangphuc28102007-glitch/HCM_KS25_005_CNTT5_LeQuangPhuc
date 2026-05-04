CREATE DATABASE ESportsManagement;

USE ESportsManagement;

CREATE TABLE team (
id VARCHAR(10) PRIMARY KEY,
full_name VARCHAR(100),
national VARCHAR(50),
owner VARCHAR(100),
founded_year INT
);

CREATE TABLE players (
id VARCHAR(10) PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
nickname VARCHAR(50) NOT NULL,
player_position VARCHAR(50) NOT NULL,
salary DECIMAL(15,2),
team_id VARCHAR(10),
FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE matchs (
id VARCHAR(10) PRIMARY KEY,
start_time DATETIME,
result VARCHAR(20)
);

CREATE TABLE match_statistic (
match_id VARCHAR(10),
player_id VARCHAR(10),
kills INT,
deaths INT,
assists INT,
PRIMARY KEY (match_id, player_id),
FOREIGN KEY (match_id) REFERENCES matchs (id),
FOREIGN KEY (player_id) REFERENCES player(id)
);

ALTER TABLE matchs
ADD COLUMN giaithuong INT;

ALTER TABLE Team
CHANGE national khu_vuc VARCHAR(50);

INSERT INTO team (full_name, national, owner, publish_year)
VALUES 
('T1', 'Korea', 'kama', 1997),
('GENG', 'Korea', 'textrue', 1996),
('JDG', 'China', 'ruler', 1999),
('HLE', 'Korea', 'gumayusi', 1995),
('GAM', 'Vietnam', 'bin', 1994);

INSERT INTO players (full_name, nickname, player_position, salary) 
VALUES
('GOAT', 'faker', 'mid', '200000000'),
('kim-seon-ho', 'ruler', 'bot', '100000000'),
('kim-min-jae', 'keria', 'support', '150000000'),
('park-chi-young', 'kanavi', 'jungle', '120000000'),
('kim-shang-chi', 'doran', 'top', '180000000');	

INSERT INTO Matchs VALUES
('MS_001', '2025-01-01 18:00:00', '2-1', 50000000),
('MS_002', '2025-01-02 18:00:00', '2-0', 60000000),
('MS_003', '2025-01-03 18:00:00', '1-2', 55000000),
('MS_004', '2025-01-04 18:00:00', '2-1', 70000000),
('MS_007', '2025-01-05 18:00:00', '2-0', 80000000);

INSERT INTO Match_Statistic VALUES
('MS_001', 'P01', 5, 2, 8),
('MS_001', 'P02', 10, 1, 5),
('MS_002', 'P03', 7, 3, 6),
('MS_003', 'P04', 6, 4, 7),
('MS_007', 'P05', 2, 2, 10);

UPDATE players
SET salary = salary * 1.2
WHERE player_position ='jungle';

DELETE FROM team
WHERE owner IS NULL;

SELECT *
FROM players
WHERE salary > 50000000 AND salary < 150000000;

SELECT *
FROM matchs
WHERE id = 'MS_007';

SELECT nickname, player_position
FROM players
WHERE id IN (
    SELECT id
    FROM Team
    WHERE khu_vuc = 'Vietnam'
);




