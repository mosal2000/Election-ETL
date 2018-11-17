
DROP DATABASE IF EXISTS election_2018_db;
CREATE DATABASE election_2018_db;
USE election_2018_db;

CREATE TABLE house_candidate (
	id INT PRIMARY KEY,
	fec_candidate_id varchar(20), 
	name varchar(100),
	party varchar(30), 
	status char(1),
	address_one varchar(100),
	address_two varchar(100),
    city varchar(50),
	state char(2),
	zip char(5),
	fec_committee_id varchar(10),
	cycle int,
	cand_status char(1),
	office_state char(2),
	district int,
	clean_name varchar(100), 
	url varchar(100),
	crp_id varchar(20),
	google_entity_id varchar(20)
);

CREATE TABLE senate_candidate (
	id INT PRIMARY KEY,
	fec_candidate_id varchar(20), 
	name varchar(100),
	party varchar(30), 
	status char(1),
	address_one varchar(100),
	address_two varchar(100),
    city varchar(50),
	state char(2),
	zip char(5),
	fec_committee_id varchar(10),
	cycle int,
	cand_status char(1),
	office_state char(2),
	district int,
	clean_name varchar(100), 
	url varchar(100),
	crp_id varchar(20),
	google_entity_id varchar(20)
);

