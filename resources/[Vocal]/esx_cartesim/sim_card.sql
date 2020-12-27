CREATE TABLE `sim_card` (
  `owner` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `sim_card`
  ADD PRIMARY KEY (`phone_number`);

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('sim', 'Carte SIM', 1, 0, 1)
;