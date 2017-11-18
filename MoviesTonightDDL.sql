CREATE DATABASE `MoviesTonight`;
 USE `MoviesTonight`;

CREATE TABLE Theaters (
	TID int(11)  NOT NULL auto_increment,
	`Name` Varchar(50) default NULL,
	Location Varchar(255) default NULL,
	Phone int(12) default NULL,
	PRIMARY KEY (TID)
);

CREATE TABLE `Show` (
	SID int(11) NOT NULL auto_increment,
	Showtime Time,
	MoviesID int(11) default NULL,
	TheatersID int(11) default NULL,
	PRIMARY KEY (SID)
);

CREATE TABLE `Movies` (
	`MID` int(11) NOT NULL auto_increment,
	Title varchar(50) default NULL,
	Rating varchar(5) default NULL,
	PRIMARY KEY (MID)
);

CREATE TABLE `Credits` (
	MoviesID int(11) default NULL,
	ARTISTID int(11) default NULL,
	CCode int(11) default NULL
);

CREATE TABLE `Artist` (
	AID int(11) NOT NULL auto_increment,
	`Name` varchar(50) NULL,
	PRIMARY KEY (AID)
);

#Add FK for show with theaters with TheatersI
ALTER TABLE `Show` 
	ADD FOREIGN KEY (`TheatersID`)
		REFERENCES Theaters (`TID`);

#ADD FK for show with Movies with MID
ALTER TABLE `Show`
	ADD FOREIGN KEY (`MoviesID`)
		references Movies (`MID`);

#ADD FK for credits with Movies on MID
ALTER TABLE `Credits`
	ADD FOREIGN KEY (`MoviesID`)
		REFERENCES Movies (`MID`);

#ADD FK for Credits with Artist on AID
ALTER TABLE `Credits`
	ADD FOREIGN KEY (`MoviesID`)
		REFERENCES `Artist` (AID);


	