DROP DATABASE IF EXISTS tifosi;

-- base de donnée : 
CREATE DATABASE tifosi;

-- Sélection de la base de donnée : 
USE tifosi;

--Utilisateur :
GRANT ALL PRIVILEGES ON *.* TO `tifosi`@`%` IDENTIFIED BY PASSWORD '*010713040CFD7B2272A17D502D478CAFB296EA67' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `tifosi`.* TO `tifosi`@`%`;