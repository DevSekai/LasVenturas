CREATE TABLE `users_accessories` (
  `Id` int(11) NOT NULL,
  `Identifier` varchar(255) NOT NULL,
  `Stuff` varchar(255) NOT NULL,
  `Label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `users_accessories` CHANGE `Id` `Id` INT(11) NOT NULL AUTO_INCREMENT, add PRIMARY KEY (`Id`); 