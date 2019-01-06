-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Gen 06, 2019 alle 21:54
-- Versione del server: 5.6.25
-- Versione PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unisair`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `aereo`
--

CREATE TABLE IF NOT EXISTS `aereo` (
  `cod_aereo` int(11) NOT NULL,
  `nomeAereo` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `passeggero`
--

CREATE TABLE IF NOT EXISTS `passeggero` (
  `codFiscale` char(16) NOT NULL,
  `tariffaBagaglio` double(8,2) NOT NULL,
  `tipologiaBagaglio` char(20) NOT NULL,
  `nome` char(30) NOT NULL,
  `cognome` char(30) NOT NULL,
  `eta` int(11) NOT NULL,
  `indirizzo` char(30) NOT NULL,
  `CAP` int(11) NOT NULL,
  `citta` char(30) NOT NULL,
  `paese` char(30) NOT NULL,
  `tipoDoc` char(30) NOT NULL,
  `numDoc` char(20) NOT NULL,
  `checkIsDone` tinyint(1) NOT NULL,
  `codPrenotazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `postiaereo`
--

CREATE TABLE IF NOT EXISTS `postiaereo` (
  `codPosto` char(3) NOT NULL,
  `classeDiViaggio` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `postiasedere`
--

CREATE TABLE IF NOT EXISTS `postiasedere` (
  `prenotato` tinyint(1) NOT NULL,
  `codVolo` int(11) NOT NULL,
  `codPosto` char(3) NOT NULL,
  `codFiscale` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE IF NOT EXISTS `prenotazione` (
  `codPrenotazione` int(11) NOT NULL,
  `dat` date NOT NULL,
  `ora` time NOT NULL,
  `prezzoTot` double(8,2) NOT NULL,
  `proprietarioCarta` char(30) NOT NULL,
  `numCartaCredito` int(11) NOT NULL,
  `scadenzaCarta` date NOT NULL,
  `CVV_CVC` int(11) NOT NULL,
  `numBiglietti` int(11) NOT NULL,
  `email` char(20) NOT NULL,
  `codVolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE IF NOT EXISTS `utente` (
  `email` char(20) NOT NULL,
  `passw` char(20) NOT NULL,
  `nome` char(30) NOT NULL,
  `cognome` char(30) NOT NULL,
  `tipo_doc` char(30) NOT NULL,
  `num_doc` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `volo`
--

CREATE TABLE IF NOT EXISTS `volo` (
  `codVolo` int(11) NOT NULL,
  `aereoportoPartenza` char(30) NOT NULL,
  `aereoportoDestinazione` char(30) NOT NULL,
  `dat` date NOT NULL,
  `oraPartenza` time NOT NULL,
  `oraArrivo` time NOT NULL,
  `prezzoEconomy` double(8,2) NOT NULL,
  `prezzoBusiness` double(8,2) NOT NULL,
  `prezzoPremium` double(8,2) NOT NULL,
  `cod_aereo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `aereo`
--
ALTER TABLE `aereo`
  ADD PRIMARY KEY (`cod_aereo`);

--
-- Indici per le tabelle `passeggero`
--
ALTER TABLE `passeggero`
  ADD PRIMARY KEY (`codFiscale`),
  ADD KEY `codPrenotazione` (`codPrenotazione`);

--
-- Indici per le tabelle `postiaereo`
--
ALTER TABLE `postiaereo`
  ADD PRIMARY KEY (`codPosto`);

--
-- Indici per le tabelle `postiasedere`
--
ALTER TABLE `postiasedere`
  ADD PRIMARY KEY (`codVolo`,`codPosto`,`codFiscale`),
  ADD KEY `codPosto` (`codPosto`),
  ADD KEY `codFiscale` (`codFiscale`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`codPrenotazione`),
  ADD KEY `email` (`email`),
  ADD KEY `codVolo` (`codVolo`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `volo`
--
ALTER TABLE `volo`
  ADD PRIMARY KEY (`codVolo`),
  ADD KEY `cod_aereo` (`cod_aereo`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `codPrenotazione` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `volo`
--
ALTER TABLE `volo`
  MODIFY `codVolo` int(11) NOT NULL AUTO_INCREMENT;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `passeggero`
--
ALTER TABLE `passeggero`
  ADD CONSTRAINT `passeggero_ibfk_1` FOREIGN KEY (`codPrenotazione`) REFERENCES `prenotazione` (`codPrenotazione`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `postiasedere`
--
ALTER TABLE `postiasedere`
  ADD CONSTRAINT `postiasedere_ibfk_1` FOREIGN KEY (`codVolo`) REFERENCES `volo` (`codVolo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `postiasedere_ibfk_2` FOREIGN KEY (`codPosto`) REFERENCES `postiaereo` (`codPosto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `postiasedere_ibfk_3` FOREIGN KEY (`codFiscale`) REFERENCES `passeggero` (`codFiscale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`email`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prenotazione_ibfk_2` FOREIGN KEY (`codVolo`) REFERENCES `volo` (`codVolo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `volo`
--
ALTER TABLE `volo`
  ADD CONSTRAINT `volo_ibfk_1` FOREIGN KEY (`cod_aereo`) REFERENCES `aereo` (`cod_aereo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
