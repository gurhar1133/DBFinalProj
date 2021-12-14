DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Plays;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS sports;
DROP TABLE IF EXISTS CityYear;
DROP TABLE IF EXISTS Sports;
DROP TABLE IF EXISTS AthleteEvent;
DROP TABLE IF EXISTS AthleteCountry;
DROP TABLE IF EXISTS AthleteMedal;
DROP TABLE IF EXISTS sports_has_AthleteMedal;


CREATE TABLE IF NOT EXISTS Sports (
  `Sport` VARCHAR(45) NOT NULL,
  `Discipline` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Discipline`, `Sport`));



CREATE TABLE IF NOT EXISTS CityYear (
  `Year` INT NOT NULL,
  `City` VARCHAR(45) NULL,
  PRIMARY KEY (`Year`));


CREATE TABLE IF NOT EXISTS AthleteEvent (
  `Athlete` VARCHAR(45) NOT NULL,
  `Event` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NULL,
  PRIMARY KEY (`Athlete`, `Event`),
  CONSTRAINT `fk_AthleteEvent_sports1`
    FOREIGN KEY (`Event`)
    REFERENCES `Sports` (`Sport`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );



CREATE TABLE IF NOT EXISTS AthleteCountry (
  `Athlete` VARCHAR(45) NOT NULL,
  `Event` VARCHAR(45) NOT NULL,
  `Year` INT NOT NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`Athlete`, `Event`, `Year`),
  CONSTRAINT `fk_AthleteCountry_AthleteEvent1`
    FOREIGN KEY (`Event` , `Athlete`)
    REFERENCES `AthleteEvent` (`Event` , `Athlete`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_AthleteCountry_CityYear1`
    FOREIGN KEY (`Year`)
    REFERENCES `CityYear` (`Year`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_AthleteCountry_sports1`
    FOREIGN KEY (`Event`)
    REFERENCES `Sports` (`Sport`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );



CREATE TABLE IF NOT EXISTS AthleteMedal (
  `Athlete` VARCHAR(45) NOT NULL,
  `Event` VARCHAR(45) NOT NULL,
  `Year` INT NOT NULL,
  `Discipline` VARCHAR(45) NULL,
  `Medal` VARCHAR(45) NULL,
  PRIMARY KEY (`Athlete`, `Event`, `Year`, `Medal`, `Discipline`),
  CONSTRAINT `fk_AthleteMedal_sports1`
    FOREIGN KEY (`Discipline`)
    REFERENCES `Sports` (`Sport`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_AthleteMedal_AthleteEvent1`
    FOREIGN KEY (`Event` , `Athlete`)
    REFERENCES `AthleteEvent` (`Event` , `Athlete`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_AthleteMedal_CityYear1`
    FOREIGN KEY (`Year`)
    REFERENCES `CityYear` (`Year`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_AthleteMedal_sports2`
    FOREIGN KEY (`Event`)
    REFERENCES `Sports` (`Sport`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
   );


-- CREATE TABLE IF NOT EXISTS sports_has_AthleteMedal (
--   `sports_Discipline` VARCHAR(45) NOT NULL,
--   `sports_Sport` VARCHAR(45) NOT NULL,
--   `AthleteMedal_Athlete` VARCHAR(45) NOT NULL,
--   `AthleteMedal_Event` VARCHAR(45) NOT NULL,
--   `AthleteMedal_Year` INT NOT NULL,
--   PRIMARY KEY (`sports_Discipline`, `sports_Sport`, `AthleteMedal_Athlete`, `AthleteMedal_Event`, `AthleteMedal_Year`),
--   CONSTRAINT `fk_sports_has_AthleteMedal_sports`
--     FOREIGN KEY (`sports_Discipline`)
--     REFERENCES `Sports` (`Sport`)
--     ON DELETE CASCADE
--     ON UPDATE CASCADE,
--   CONSTRAINT `fk_sports_has_AthleteMedal_AthleteMedal1`
--     FOREIGN KEY (`AthleteMedal_Athlete` , `AthleteMedal_Event` , `AthleteMedal_Year`)
--     REFERENCES `AthleteMedal` (`Athlete` , `Event` , `Year`)
--     ON DELETE CASCADE
--     ON UPDATE CASCADE
--     );