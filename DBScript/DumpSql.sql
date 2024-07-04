-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 04, 2024 alle 16:23
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `its_2023_sale_cinematografiche`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attore`
--

CREATE TABLE `attore` (
  `codice_attore` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `anno_nascita` smallint(6) NOT NULL,
  `nazionalita` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `attore`
--

INSERT INTO `attore` (`codice_attore`, `nome`, `anno_nascita`, `nazionalita`) VALUES
(1, 'Marcello Mastroianni', 1934, 'IT'),
(2, 'Sofia Loren', 1934, 'IT'),
(3, 'Alberto Sordi', 1920, 'IT'),
(4, 'Anthony Quinn', 1915, 'US'),
(5, 'Giulietta Masina', 1921, 'IT'),
(6, 'Franco Interlenghi', 1931, 'IT'),
(7, 'Bruno Zanin', 1951, 'IT'),
(8, 'Pupella Maggio', 1910, 'IT'),
(9, 'Kipp Hamilton', 1934, 'US'),
(10, 'Russ Tamblyn', 1934, 'US'),
(11, 'Takeshi Kaneshiro', 1973, 'TW'),
(12, 'Anne Suzuki', 1987, 'JP'),
(13, 'Lambert Wilson', 1958, 'FR'),
(14, 'Dominique Pinon', 1955, 'FR'),
(15, 'Louis De Funès', 1914, 'FR'),
(16, 'Jean-Pierre Rambal', 1931, 'FR'),
(17, 'Humphrey Bogart', 1899, 'US'),
(18, 'Ingrid Bergman', 1914, 'US'),
(19, 'James Cagney', 1899, 'US'),
(20, 'Jean-Paul Belmondo', 1933, 'FR'),
(21, 'Dominique Pinon', 1955, 'FR'),
(22, 'Marie-Laure Dougnac', 1962, 'FR'),
(23, 'Karin Viard', 1966, 'FR'),
(24, 'prova', 0, 'IT');

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `codice_film` int(11) NOT NULL,
  `titolo` varchar(250) NOT NULL,
  `anno_produzione` smallint(6) NOT NULL,
  `nazionalita` varchar(2) NOT NULL,
  `regista` varchar(250) NOT NULL,
  `genere` varchar(50) NOT NULL,
  `durata` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`codice_film`, `titolo`, `anno_produzione`, `nazionalita`, `regista`, `genere`, `durata`) VALUES
(1, 'I vitelloni', 1953, 'IT', 'Federico Fellini', 'Commedia', 108),
(2, 'La strada', 1954, 'IT', 'Federico Fellini', 'Drammatico', 108),
(3, 'Amarcord', 1973, 'IT', 'Federico Fellini', 'Commedia', 123),
(4, 'Kong Uragano sulla metropoli', 1976, 'JP', 'Ishiro Honda', 'Fantascienza', 76),
(5, 'Returner', 2002, 'JP', 'Takashi Yamazaki', 'Fantascienza', 112),
(6, 'Dante 01', 2008, 'FR', 'Marc Caro', 'Fantascienza', 82),
(7, 'Il gendarme e gli extraterrestri', 1978, 'FR', 'Jean Girault', 'Fantascienza', 92),
(8, 'Casablanca', 1942, 'US', 'Michael Curtiz', 'Drammatico', 102),
(9, 'Gli angeli con la faccia sporca', 1938, 'US', 'Michael Curtiz', 'Drammatico', 97),
(10, 'Matrimonio all\'italiana', 1964, 'IT', 'Vittorio De Sica', 'Drammatico', 102),
(11, 'La Ciociara', 1960, 'IT', 'Vittorio De Sica', 'Drammatico', 110),
(12, 'Delicatessen', 1991, 'FR', 'Marc Caro', 'Grottesco', 99),
(13, 'Scarface', 1983, 'US', 'Brian De Palma', 'Drammatico', 170);

-- --------------------------------------------------------

--
-- Struttura della tabella `proiezione`
--

CREATE TABLE `proiezione` (
  `codice_proiezione` int(11) NOT NULL,
  `codice_film` int(11) NOT NULL,
  `codice_sala` int(11) NOT NULL,
  `incasso` decimal(6,2) NOT NULL,
  `data_proiezione` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `proiezione`
--

INSERT INTO `proiezione` (`codice_proiezione`, `codice_film`, `codice_sala`, `incasso`, `data_proiezione`) VALUES
(1, 8, 2, 840.00, '2021-12-25'),
(2, 8, 2, 600.00, '2021-12-25'),
(3, 8, 2, 834.00, '2021-12-26'),
(4, 8, 3, 540.00, '2021-12-25'),
(5, 5, 3, 588.00, '2021-12-26'),
(6, 9, 3, 582.00, '2021-12-25'),
(7, 4, 5, 240.00, '2021-12-25'),
(8, 10, 4, 400.00, '2021-12-25'),
(9, 10, 6, 842.00, '2021-12-25'),
(10, 11, 6, 606.00, '2021-12-26'),
(11, 10, 1, 832.00, '2021-12-27'),
(12, 6, 4, 185.00, '2021-12-27'),
(13, 6, 3, 702.00, '2021-12-27');

-- --------------------------------------------------------

--
-- Struttura della tabella `recita`
--

CREATE TABLE `recita` (
  `codice_film` int(11) NOT NULL,
  `codice_attore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `recita`
--

INSERT INTO `recita` (`codice_film`, `codice_attore`) VALUES
(1, 3),
(1, 6),
(2, 4),
(2, 5),
(3, 7),
(3, 8),
(4, 9),
(4, 10),
(5, 11),
(5, 12),
(6, 13),
(6, 14),
(7, 15),
(7, 16),
(8, 17),
(8, 18),
(9, 17),
(9, 19),
(10, 1),
(10, 2),
(11, 2),
(11, 20),
(12, 21),
(12, 22),
(12, 23);

-- --------------------------------------------------------

--
-- Struttura della tabella `sala`
--

CREATE TABLE `sala` (
  `codice_sala` int(11) NOT NULL,
  `posti` tinyint(4) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `citta` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `sala`
--

INSERT INTO `sala` (`codice_sala`, `posti`, `nome`, `citta`) VALUES
(1, 100, 'Reposi', 'Torino'),
(2, 120, 'Ideal', 'Torino'),
(3, 80, 'Anteo Palazzo del Cinema', 'Milano'),
(4, 100, 'Orizzonte', 'Milano'),
(5, 60, 'Centrale', 'Biella'),
(6, 125, 'Massaua', 'Torino');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `id_role`) VALUES
(6, 'Federico', '$2a$11$wptg6vXbG3n.jNAeskvUheNUjO6P0OI4S30RWxTYYUagqYJcKU7c2', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_roles`
--

CREATE TABLE `user_roles` (
  `id_role` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `user_roles`
--

INSERT INTO `user_roles` (`id_role`, `role`) VALUES
(1, 'admin'),
(2, 'user');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attore`
--
ALTER TABLE `attore`
  ADD PRIMARY KEY (`codice_attore`);

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`codice_film`);

--
-- Indici per le tabelle `proiezione`
--
ALTER TABLE `proiezione`
  ADD PRIMARY KEY (`codice_proiezione`),
  ADD KEY `codice_film` (`codice_film`),
  ADD KEY `codice_sala` (`codice_sala`);

--
-- Indici per le tabelle `recita`
--
ALTER TABLE `recita`
  ADD PRIMARY KEY (`codice_film`,`codice_attore`),
  ADD KEY `codice_attore` (`codice_attore`);

--
-- Indici per le tabelle `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`codice_sala`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `FK_USERS_USERSROLE` (`id_role`);

--
-- Indici per le tabelle `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attore`
--
ALTER TABLE `attore`
  MODIFY `codice_attore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `codice_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `proiezione`
--
ALTER TABLE `proiezione`
  MODIFY `codice_proiezione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `sala`
--
ALTER TABLE `sala`
  MODIFY `codice_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `proiezione`
--
ALTER TABLE `proiezione`
  ADD CONSTRAINT `proiezione_ibfk_1` FOREIGN KEY (`codice_film`) REFERENCES `film` (`codice_film`),
  ADD CONSTRAINT `proiezione_ibfk_2` FOREIGN KEY (`codice_sala`) REFERENCES `sala` (`codice_sala`);

--
-- Limiti per la tabella `recita`
--
ALTER TABLE `recita`
  ADD CONSTRAINT `recita_ibfk_1` FOREIGN KEY (`codice_attore`) REFERENCES `attore` (`codice_attore`),
  ADD CONSTRAINT `recita_ibfk_2` FOREIGN KEY (`codice_film`) REFERENCES `film` (`codice_film`);

--
-- Limiti per la tabella `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_USERS_USERSROLE` FOREIGN KEY (`id_role`) REFERENCES `user_roles` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
