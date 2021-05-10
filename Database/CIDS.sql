-- Clean Infrastructure Deployment System (CIDS)
DROP DATABASE IF EXISTS CIDS;
CREATE DATABASE CIDS;
USE CIDS;

-- Look into using Engine thing for references
/*
When you omit the ENGINE option, the default storage engine is used. 
The default engine is InnoDB in MySQL 8.0. 
You can specify the default engine by using the --default-storage-engine server startup option, 
or by setting the default-storage-engine option in the my.cnf configuration file. 
You can set the default storage engine for the current session by setting the default_storage_engine variable: 
SET default_storage_engine=NDBCLUSTER;
*/
-- Government Officials and Project Managers will be listed here
CREATE TABLE Users(
    UserID          INT             NOT NULL AUTO_INCREMENT,
    FirstName       VARCHAR(256)    NOT NULL,
    MiddleInitial   CHAR,
    LastName        VARCHAR(256)    NOT NULL,
    Admin           BOOLEAN         NOT NULL,
    PRIMARY KEY(UserID)
) ENGINE=INNODB;

-- Sector that a nation will be divied into to better manage projects across a nation. 
CREATE TABLE Sector(
    ID              INT             NOT NULL AUTO_INCREMENT,
    SectorName      VARCHAR(256)    NOT NULL,
    SectorLeadID    INT             NOT NULL,
    LeadStartDate   DATE            NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(SectorLeadID) REFERENCES    Users(UserID)
) ENGINE=INNODB;

-- State or any larger province within a nation that will make up the Sector mentioned above
CREATE TABLE State(
    StateName       VARCHAR(256)        NOT NULL,
    SectorID        INT                 NOT NULL,
    StateLeadID     INT                 NOT NULL,
    PRIMARY KEY(StateName),
    FOREIGN KEY(SectorID)       REFERENCES  Sector(ID),
    FOREIGN KEY(StateLeadID)    REFERENCES  Users(UserID)
) ENGINE=INNODB;

-- Cities of the State or provinces where projects will be built
CREATE TABLE City(
    CityID          INT                 NOT NULL AUTO_INCREMENT,
    CityName        VARCHAR(256)        NOT NULL,
    State           VARCHAR(256)        NOT NULL,
    CityLeadID      INT                 NOT NULL,
    PRIMARY KEY(CityID),
    FOREIGN KEY(State)      REFERENCES  State(StateName),
    FOREIGN KEY(CityLeadID)      REFERENCES  Users(UserID)
) ENGINE=INNODB;

CREATE TABLE Type(
    TypeID          INT             NOT NULL AUTO_INCREMENT,
    TypeName        VARCHAR(256)    NOT NULL,
    PRIMARY KEY(TypeID)
) ENGINE=INNODB;  

-- Projects that are being managed by the database.
CREATE TABLE Project(
    PID             INT             NOT NULL AUTO_INCREMENT,
    ProjectName     VARCHAR(256)    NOT NULL,
    City            INT             NOT NULL,
    ProjectLeadID   INT             ,   -- Allow NULL so that projects can be added that are just in the works
    Description     VARCHAR(512)    NOT NULL,
    StartDate       DATE            NOT NULL,
    Deadline        DATE            NOT NULL,
    CompletionDate  DATE,
    Status          VARCHAR(256)    NOT NULL,
    EstimatedCost   INT             NOT NULL,
    FinalCost       INT,
    ProjectType     INT             NOT NULL,
    PRIMARY KEY(PID),
    FOREIGN KEY(City)               REFERENCES City(CityID),
    FOREIGN KEY(ProjectLeadID)      REFERENCES Users(UserID),
    FOREIGN key(ProjectType)        REFERENCES Type(TypeID)
) ENGINE=INNODB;

ALTER TABLE Users AUTO_INCREMENT=1000000;
ALTER TABLE City AUTO_INCREMENT=100;
ALTER TABLE Project AUTO_INCREMENT=1000;

-- Constraints to add in application:
-- status should be limited to certain text: finished, on track, behind, need assistance, failed