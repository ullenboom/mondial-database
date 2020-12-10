SET SESSION sql_mode='ANSI,ORACLE';

DROP DATABASE IF EXISTS Mondial;

CREATE DATABASE Mondial;

USE Mondial;

CREATE TABLE country
(Name VARCHAR(35) NOT NULL UNIQUE,
 Code VARCHAR(4),
 Capital VARCHAR(35),
 Province VARCHAR(35),
 Area FLOAT,
 Population INT,
 CONSTRAINT CountryKey PRIMARY KEY(Code),
 CONSTRAINT CountryArea CHECK (Area >= 0),
 CONSTRAINT CountryPop CHECK (Population >= 0));

CREATE TABLE city
(Name VARCHAR(35),
 Country VARCHAR(4),
 Province VARCHAR(35),
 Population INT,
 Longitude FLOAT,
 Latitude FLOAT,
 CONSTRAINT CityKey PRIMARY KEY (Name, Country, Province),
 CONSTRAINT CityPop CHECK (Population >= 0),
 CONSTRAINT CityLon CHECK ((Longitude >= -180) AND (Longitude <= 180)),
 CONSTRAINT CityLat CHECK ((Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE province
(Name VARCHAR(35) NOT NULL,
 Country VARCHAR(4) NOT NULL ,
 Population INT,
 Area FLOAT,
 Capital VARCHAR(35),
 CapProv VARCHAR(35),
 CONSTRAINT PrKey PRIMARY KEY (Name, Country),
 CONSTRAINT PrPop CHECK (Population >= 0),
 CONSTRAINT PrAr CHECK (Area >= 0));

CREATE TABLE economy
(Country VARCHAR(4),
 GDP FLOAT,
 Agriculture FLOAT,
 Service FLOAT,
 Industry FLOAT,
 Inflation FLOAT,
 CONSTRAINT EconomyKey PRIMARY KEY(Country),
 CONSTRAINT EconomyGDP CHECK (GDP >= 0));

CREATE TABLE population
(Country VARCHAR(4),
 Population_Growth FLOAT,
 Infant_Mortality FLOAT,
 CONSTRAINT PopKey PRIMARY KEY(Country));

CREATE TABLE politics
(Country VARCHAR(4),
 Independence DATE,
 Dependent  VARCHAR(4),
 Government VARCHAR(120),
 CONSTRAINT PoliticsKey PRIMARY KEY(Country));

CREATE TABLE language
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage FLOAT,
 CONSTRAINT LanguageKey PRIMARY KEY (Name, Country),
 CONSTRAINT LanguagePercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE religion
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage FLOAT,
 CONSTRAINT ReligionKey PRIMARY KEY (Name, Country),
 CONSTRAINT ReligionPercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE ethnicGroup
(Country VARCHAR(4),
 Name VARCHAR(50),
 Percentage FLOAT,
 CONSTRAINT EthnicKey PRIMARY KEY (Name, Country),
 CONSTRAINT EthnicPercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE continent
(Name VARCHAR(20),
 Area FLOAT(10),
 CONSTRAINT ContinentKey PRIMARY KEY(Name));

CREATE TABLE borders
(Country1 VARCHAR(4),
 Country2 VARCHAR(4),
 Length FLOAT, 
 CONSTRAINT CHECK (Length > 0),
 CONSTRAINT BorderKey PRIMARY KEY (Country1,Country2));

CREATE TABLE encompasses
(Country VARCHAR(4) NOT NULL,
 Continent VARCHAR(20) NOT NULL,
 Percentage FLOAT,
 CONSTRAINT CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT EncompassesKey PRIMARY KEY (Country,Continent));

CREATE TABLE organization
(Abbreviation VARCHAR(12) PRIMARY KEY,
 Name VARCHAR(80) NOT NULL,
 City VARCHAR(35) ,
 Country VARCHAR(4) , 
 Province VARCHAR(35) ,
 Established DATE,
 CONSTRAINT OrgNameUnique UNIQUE (Name));

CREATE TABLE isMember
(Country VARCHAR(4),
 Organization VARCHAR(12),
 Type VARCHAR(35) DEFAULT 'member',
 CONSTRAINT MemberKey PRIMARY KEY (Country,Organization) );


CREATE TABLE mountain
(Name VARCHAR(35), 
 Mountains VARCHAR(35),
 Height FLOAT,
 Type VARCHAR(10),
 Longitude FLOAT,
 Latitude FLOAT,
 CONSTRAINT MountainKey PRIMARY KEY(Name),
 CONSTRAINT CHECK ((Longitude >= -180) AND (Longitude <= 180) 
              AND  (Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE desert
(Name VARCHAR(35),
 Area FLOAT,
 Longitude FLOAT,
 Latitude FLOAT,
 CONSTRAINT DesertKey PRIMARY KEY(Name),
 CONSTRAINT DesCoord 
   CHECK ((Longitude >= -180) AND (Longitude <= 180) 
     AND  (Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE island
(Name VARCHAR(35),
 Islands VARCHAR(35),
 Area FLOAT,
 Height FLOAT,
 Type VARCHAR(10),
 CONSTRAINT IslandKey PRIMARY KEY(Name),
 CONSTRAINT IslandAr check (Area >= 0),
 Longitude FLOAT,
 Latitude FLOAT,
 CONSTRAINT IslandCoord
   CHECK ((Longitude >= -180) AND (Longitude <= 180) 
     AND  (Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE lake
(Name VARCHAR(35),
 Area FLOAT,
 Depth FLOAT,
 Altitude FLOAT,
 Type VARCHAR(10),
 River VARCHAR(35),
 Longitude FLOAT,
 Latitude FLOAT,
 CONSTRAINT LakeKey PRIMARY KEY(Name),
 CONSTRAINT LakeAr CHECK (Area >= 0),
 CONSTRAINT LakeDpth CHECK (Depth >= 0),
 CONSTRAINT LakeCoord
   CHECK ((Longitude >= -180) AND (Longitude <= 180) 
     AND  (Latitude >= -90) AND (Latitude <= 90)));

CREATE TABLE sea
(Name VARCHAR(35),
 Depth FLOAT,
 CONSTRAINT SeaKey PRIMARY KEY(Name),
 CONSTRAINT SeaDepth CHECK (Depth >= 0));

CREATE TABLE river
(Name VARCHAR(35),
 River VARCHAR(35),
 Lake VARCHAR(35),
 Sea VARCHAR(35),
 Length FLOAT,
 SourceLongitude FLOAT,
 SourceLatitude FLOAT,
 Mountains VARCHAR(35),
 SourceAltitude FLOAT,
 EstuaryLongitude FLOAT,
 EstuaryLatitude FLOAT,
 CONSTRAINT RiverKey PRIMARY KEY(Name),
 CONSTRAINT RiverLength CHECK (Length >= 0),
 CONSTRAINT SourceCoord
     CHECK ((SourceLongitude >= -180) AND 
            (SourceLongitude <= 180) AND
            (SourceLatitude >= -90) AND
            (SourceLatitude <= 90)),
 CONSTRAINT EstCoord
     CHECK ((EstuaryLongitude >= -180) AND 
            (EstuaryLongitude <= 180) AND
            (EstuaryLatitude >= -90) AND
            (EstuaryLatitude <= 90)));

CREATE TABLE geo_mountain
(Mountain VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GMountainKey PRIMARY KEY (Province,Country,Mountain) );

CREATE TABLE geo_desert
(Desert VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GDesertKey PRIMARY KEY (Province, Country, Desert) );

CREATE TABLE geo_island
(Island VARCHAR(35) , 
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GIslandKey PRIMARY KEY (Province, Country, Island) );

CREATE TABLE geo_river
(River VARCHAR(35) , 
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GRiverKey PRIMARY KEY (Province ,Country, River) );

CREATE TABLE geo_sea
(Sea VARCHAR(35) ,
 Country VARCHAR(4)  ,
 Province VARCHAR(35) ,
 CONSTRAINT GSeaKey PRIMARY KEY (Province, Country, Sea) );

CREATE TABLE geo_lake
(Lake VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GLakeKey PRIMARY KEY (Province, Country, Lake) );

CREATE TABLE geo_source
(River VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GSourceKey PRIMARY KEY (Province, Country, River) );

CREATE TABLE geo_estuary
(River VARCHAR(35) ,
 Country VARCHAR(4) ,
 Province VARCHAR(35) ,
 CONSTRAINT GEstuaryKey PRIMARY KEY (Province, Country, River) );

CREATE TABLE mergesWith
(Sea1 VARCHAR(35) ,
 Sea2 VARCHAR(35) ,
 CONSTRAINT MergesWithKey PRIMARY KEY (Sea1, Sea2) );

CREATE TABLE located
(City VARCHAR(35) ,
 Province VARCHAR(35) ,
 Country VARCHAR(4) ,
 River VARCHAR(35),
 Lake VARCHAR(35),
 Sea VARCHAR(35) );

CREATE TABLE locatedOn
(City VARCHAR(35) ,
 Province VARCHAR(35) ,
 Country VARCHAR(4) ,
 Island VARCHAR(35) ,
 CONSTRAINT locatedOnKey PRIMARY KEY (City, Province, Country, Island) );

CREATE TABLE islandIn
(Island VARCHAR(35) ,
 Sea VARCHAR(35) ,
 Lake VARCHAR(35) ,
 River VARCHAR(35) );

CREATE TABLE mountainOnIsland
(Mountain VARCHAR(35),
 Island  VARCHAR(35),
 CONSTRAINT MntIslKey PRIMARY KEY (Mountain, Island) );
