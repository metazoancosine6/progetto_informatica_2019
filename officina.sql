-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 25, 2019 alle 16:22
-- Versione del server: 10.1.37-MariaDB
-- Versione PHP: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `officina`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `amministratore`
--

CREATE TABLE `amministratore` (
  `idAmministratore` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `cognome` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `amministratore`
--

INSERT INTO `amministratore` (`idAmministratore`, `username`, `password`, `nome`, `cognome`) VALUES
(1, 'D', 'D', '???', '???');

-- --------------------------------------------------------

--
-- Struttura della tabella `anagrafica_intervento`
--

CREATE TABLE `anagrafica_intervento` (
  `id_anagrafico` int(11) NOT NULL,
  `nome_intervento` varchar(30) NOT NULL,
  `costo_intervento` double(6,2) NOT NULL,
  `tempo_lavorazione` double(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `anagrafica_intervento`
--

INSERT INTO `anagrafica_intervento` (`id_anagrafico`, `nome_intervento`, `costo_intervento`, `tempo_lavorazione`) VALUES
(1, 'cambio olio', 10.00, 0.20),
(2, 'cambio freni', 35.00, 1.00),
(3, 'centralina', 480.99, 4.30),
(4, 'riparazione carrozzeria', 175.50, 6.00),
(5, 'sostituzione interni', 159.99, 3.30),
(6, 'tagliando', 50.00, 1.00),
(7, 'riparazione motore', 299.00, 5.00),
(8, 'albero di trasmissione', 125.00, 3.00),
(9, 'riparazione cambio', 250.00, 4.00),
(10, 'riverniciatura', 97.50, 2.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `data_nascita` date DEFAULT NULL,
  `cod_fisc` char(16) NOT NULL,
  `cognome` varchar(15) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `cap` char(5) NOT NULL,
  `via` varchar(25) NOT NULL,
  `civico` int(3) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `data_nascita`, `cod_fisc`, `cognome`, `nome`, `cap`, `via`, `civico`, `telefono`, `email`) VALUES
(201, '1976-11-10', 'ACOZAD28X17H929A', 'Fusco', 'Luca', '44458', '929-5483 Vulputate Rd.', 352, NULL, ''),
(202, '1959-09-30', 'GRZPTR06I78H511S', 'Greco', 'Nicolò', '61963', 'Ap #733-1335 Lacus. St.', 124, NULL, ''),
(203, '1969-09-01', 'KKOLPQ76B84Q574S', 'Parisi', 'Dario', '24146', '9937 Magna. Ave', 464, NULL, ''),
(204, '1990-01-09', 'WVJIDW73A61X952I', 'Grasso', 'Giacomo', '27208', 'P.O. Box 164, 8015 Mi Av.', 203, NULL, ''),
(205, '1994-07-21', 'HRISED63Z87Y966J', 'Milani', 'Emma', '56449', 'Ap #123-6660 Mauris. Av.', 43, NULL, ''),
(206, '1960-03-01', 'DIWZVX68C45B873Q', 'Poli', 'Luigi', '60517', 'P.O. Box 656, 6397 Tortor', 406, NULL, ''),
(207, '1988-10-22', 'KVGQUC23W93P752N', 'Pace', 'Nicolò', '18517', '4243 Etiam St.', 292, NULL, ''),
(208, '1996-09-02', 'LCEYGP06O09B165F', 'Bernardi', 'Irene', '92347', '171-5209 Tempor Ave', 74, NULL, ''),
(209, '1979-06-14', 'ORPQES47H07X969W', 'Pastore', 'Giulio', '62597', '3707 Lectus St.', 9, NULL, ''),
(210, '1916-01-15', 'ZNERBC45Q36F324M', 'Moro', 'Gabriele', '60641', '8164 Quisque St.', 307, NULL, ''),
(211, '1915-11-09', 'HURSIN10B67K954Z', 'Parisi', 'Andrea', '07462', '1953 Velit Rd.', 304, NULL, ''),
(212, '1953-05-07', 'QDCRBQ75Q50J522G', 'Grasso', 'Davide', '77084', 'Ap #915-5915 Lacus Road', 324, NULL, ''),
(213, '1962-06-19', 'NXNGJB60X04B242T', 'Fontana', 'Gianni', '50314', 'P.O. Box 937, 3517 Vel, A', 301, NULL, ''),
(214, '1996-03-15', 'QASGGB12B09J493X', 'Pellegrino', 'Ilaria', '97717', '702-1173 Habitant St.', 55, NULL, ''),
(215, '1919-07-19', 'WKSQAE00K35K819P', 'Pepe', 'Valentina', '78910', '364-9420 Duis Av.', 131, NULL, ''),
(216, '1938-12-14', 'EVSMZU93U84C996O', 'Rinaldi', 'Francesco', '63652', '283 Blandit Rd.', 315, NULL, ''),
(217, '1958-09-05', 'KVWJHZ39N53O866K', 'Barone', 'Antonio', '47249', '498-1394 Pretium St.', 356, NULL, ''),
(218, '1916-10-28', 'GBXJSC99G40Q033H', 'Pagano', 'Davide', '76537', '974-6880 Habitant Rd.', 28, NULL, ''),
(219, '1938-02-24', 'OPVDLI63N51X830C', 'Ferrari', 'Giorgio', '05392', 'Ap #435-5674 Nunc. Avenue', 243, NULL, ''),
(220, '1920-07-04', 'WFDSYA91G69R143M', 'Moretti', 'Fabio', '80414', 'Ap #464-334 Amet Av.', 12, NULL, ''),
(221, '1984-12-06', 'XVEGNZ94L02E903Y', 'Marchi', 'Roberto', '81144', 'P.O. Box 775, 4313 Phasel', 156, NULL, ''),
(222, '1975-10-16', 'RMXVJZ41R71P376H', 'Barone', 'Mario', '81765', '635-7741 Vitae, Ave', 429, NULL, ''),
(223, '1992-11-23', 'ZPOHCJ71F70V030M', 'Garofalo', 'Gianpiero', '27362', '353-2243 Risus St.', 448, NULL, ''),
(224, '1988-01-12', 'QGUIGS75O96U133D', 'Baldi', 'Nicoletta', '42092', 'P.O. Box 136, 9407 Non Av', 178, NULL, ''),
(225, '2000-04-05', 'HLZEZN53I57U801I', 'Gentile', 'Stefania', '59204', 'Ap #101-3725 Arcu St.', 107, NULL, ''),
(226, '1936-10-14', 'FRQBYH05A21U560Q', 'Marini', 'Armando', '99320', '568-6339 Nisi Rd.', 440, NULL, ''),
(227, '1962-06-01', 'RXVFCM99Y24Q529T', 'Sorrentino', 'Debora', '47764', 'P.O. Box 843, 4446 Lobort', 484, NULL, ''),
(228, '1984-10-16', 'NZHAYF82J28N876E', 'Gallo', 'Manuel', '53942', 'Ap #206-9256 Nullam Avenu', 197, NULL, ''),
(229, '1969-04-29', 'VKCIKX17W67H714I', 'Perrone', 'Gaia', '15053', 'Ap #433-1378 Lectus St.', 390, NULL, ''),
(230, '1988-11-29', 'HUHASU32A02N598N', 'Antonelli', 'Rebecca', '30048', 'Ap #846-648 Sed St.', 476, NULL, ''),
(231, '1926-12-07', 'FXGLJM40X09F665Y', 'Di Stefano', 'Marta', '28439', 'Ap #941-5564 Vitae St.', 267, NULL, ''),
(232, '1972-04-02', 'RLNFJG22Q62V840G', 'Sanna', 'Alex', '46008', '433-1562 Ac Ave', 361, NULL, ''),
(233, '1946-07-05', 'IXVKCD40I44U485Y', 'Perrone', 'Edoardo', '50294', 'Ap #188-4109 Mauris St.', 182, NULL, ''),
(234, '1919-10-06', 'DIHHDF78F11T047T', 'Bianco', 'Riccardo', '21364', '561-5209 Nullam Ave', 397, NULL, ''),
(235, '1985-03-18', 'CKIAQG31C13I482G', 'Fumagalli', 'Anna', '09695', 'P.O. Box 707, 9422 Cursus', 441, NULL, ''),
(236, '1966-01-24', 'PCYYSB51D86Z515T', 'Messina', 'Tommaso', '62954', '9472 Luctus Ave', 283, NULL, ''),
(237, '1975-05-25', 'KVLWJJ67N34W260H', 'Ceccarelli', 'Gianpiero', '63748', '8241 Arcu. Rd.', 125, NULL, ''),
(238, '1976-04-02', 'ROXCTW45U02C992S', 'Palmieri', 'Camilla', '73812', 'P.O. Box 501, 1975 Fringi', 297, NULL, ''),
(239, '1999-02-02', 'SMTEUI40L61B692J', 'Vitali', 'Augusto', '49130', 'P.O. Box 977, 1846 Euismo', 305, NULL, ''),
(240, '1933-11-27', 'KHJJJP09B79E445J', 'Arena', 'Federica', '01210', '802-8766 Sed Rd.', 409, NULL, ''),
(241, '1936-03-19', 'BMXFRD39U99O507B', 'Ferrari', 'Giada', '07812', 'Ap #784-6629 Malesuada St', 443, NULL, ''),
(242, '1970-07-27', 'SFOAJH50K45U622X', 'Romeo', 'Alice', '50081', '5957 Luctus. Avenue', 46, NULL, ''),
(243, '1920-02-20', 'CKBOFY65G62W781X', 'Marchetti', 'Vanessa', '95947', '4119 Suspendisse St.', 485, NULL, ''),
(244, '1948-10-15', 'IDHHPG28W52Q804L', 'Calabrese', 'Erica', '84866', 'Ap #771-8677 Ipsum. Road', 413, NULL, ''),
(245, '1957-03-13', 'THHFNH94K03R672U', 'Fontana', 'Armando', '54493', 'Ap #164-1028 Nec Av.', 213, NULL, ''),
(246, '1983-01-22', 'PWDUKU64V19W414O', 'Monti', 'Paola', '83122', '3552 Nec Rd.', 431, NULL, ''),
(247, '1940-02-03', 'MCFGBJ37D99H785F', 'Milani', 'Riccardo', '24009', 'P.O. Box 756, 4726 Purus ', 367, NULL, ''),
(248, '1945-05-11', 'NFNSHT98G93X400I', 'Conti', 'Giorgia', '94902', 'Ap #573-6910 Est. Avenue', 483, NULL, ''),
(249, '1916-02-17', 'TQDXJT13Z15G715C', 'Barone', 'Enrico', '84251', 'Ap #239-7888 Montes, Rd.', 264, NULL, ''),
(250, '1975-05-17', 'FFHCZE49O49Y986Z', 'Conte', 'Giuseppe', '51684', 'Ap #614-8227 Id, Road', 201, NULL, ''),
(251, '1980-04-24', 'YAUACG25J21G961B', 'Morelli', 'Francesco', '57816', 'Ap #625-936 Maecenas Stre', 237, NULL, ''),
(252, '1917-02-09', 'RVSKPK19D23U146H', 'Vitali', 'Aurora', '77234', '349-9227 Dolor. Rd.', 49, NULL, ''),
(253, '1916-12-15', 'RHPPQA90Y54E176C', 'Rizzo', 'Giuseppe', '67812', '1893 Consequat Road', 244, NULL, ''),
(254, '1988-10-18', 'QQLSVS81X77I797T', 'Serra', 'Enrico', '38496', 'P.O. Box 124, 8655 Nulla.', 158, NULL, ''),
(255, '1924-03-08', 'IKNWDQ04C84V082U', 'Agostini', 'Giorgio', '14935', 'P.O. Box 384, 6041 Elit. ', 413, NULL, ''),
(256, '1959-04-23', 'RXYITA59P49M994Q', 'Albanese', 'Nicola', '22714', '365-4573 Ipsum Street', 335, NULL, ''),
(257, '1934-08-13', 'VZBDBC62I81G305G', 'Volpe', 'Ilaria', '24131', '6388 At, St.', 316, NULL, ''),
(258, '1917-03-25', 'YYZSPM36B15E879O', 'Napolitano', 'Enrico', '79873', '471 Ac Road', 206, NULL, ''),
(259, '1982-02-10', 'ICBWNZ30M50K949W', 'Marra', 'Manuel', '05729', '867-9740 Nunc, St.', 235, NULL, ''),
(260, '1924-08-26', 'CTZGBP17W20V572A', 'Carbone', 'Emma', '63988', '772-5840 Lacus. Ave', 184, NULL, ''),
(261, '1978-05-22', 'YRBVDR60N17F522H', 'Mele', 'Cristiano', '37506', 'Ap #791-7504 Nisi. Avenue', 449, NULL, ''),
(262, '1922-12-09', 'UPQDHH56B66H639N', 'Lorusso', 'Federica', '05692', '6052 Bibendum Av.', 322, NULL, ''),
(263, '1943-08-30', 'LLQGMX97Z32S554Y', 'Proietti', 'Emanuele', '79359', 'Ap #396-8147 Mi Street', 373, NULL, ''),
(264, '1930-01-24', 'DVKINE60J17Z677E', 'Ferrante', 'Jessica', '08437', '5959 Nec, Avenue', 346, NULL, ''),
(265, '1954-11-12', 'MEHCSV12F55C586K', 'Proietti', 'Nicole', '69951', '614-6843 Faucibus Av.', 337, NULL, ''),
(266, '1941-09-02', 'FMQCAE54N10G418V', 'Pinna', 'Roberta', '95523', '3739 Tristique Av.', 329, NULL, ''),
(267, '1991-09-25', 'SWTXJE31C46U839E', 'De Angelis', 'Vincenzo', '82669', 'Ap #914-3768 Donec Street', 405, NULL, ''),
(268, '1958-01-25', 'WGGALO09N06F580R', 'Martino', 'Samuel', '61830', '699-411 Euismod Street', 222, NULL, ''),
(269, '1983-09-14', 'ZOTBMK63Q80P281C', 'Gatti', 'Vittoria', '32764', '540-3386 Vitae Av.', 54, NULL, ''),
(270, '1985-12-30', 'RNGNGQ22N04P634K', 'Volpe', 'Maria', '82925', '9402 Faucibus Ave', 78, NULL, ''),
(271, '1919-12-05', 'CPDTBZ70Y12I164T', 'Villani', 'Debora', '83496', '1358 Dolor St.', 365, NULL, ''),
(272, '1924-03-23', 'GYFYKF83X53X560S', 'Ruggeri', 'Martina', '68615', 'Ap #585-6609 Massa Ave', 377, NULL, ''),
(273, '1958-12-18', 'KRIOEM26B63R875F', 'Martino', 'Claudio', '87942', '814-574 Lacus Road', 423, NULL, ''),
(274, '1966-07-02', 'DHAONA99R95D659O', 'Sala', 'Sofia', '92131', '892-5065 Lectus Street', 217, NULL, ''),
(275, '1950-11-20', 'DILAKJ78D02I189U', 'Olivieri', 'Domenico', '56352', 'P.O. Box 100, 1349 Gravid', 60, NULL, ''),
(276, '1957-12-25', 'XILRUZ55N39K015F', 'Ferrero', 'Giacomo', '69082', '772-6284 Eleifend. Avenue', 4, NULL, ''),
(277, '1986-06-05', 'YACFZN89V84O872L', 'Ferro', 'Lucia', '70427', 'P.O. Box 466, 2176 Orci A', 415, NULL, ''),
(278, '1939-02-18', 'BTPWJW62X10I296S', 'Messina', 'Sofia', '81367', '3462 Placerat. Avenue', 84, NULL, ''),
(279, '1990-03-18', 'JNFIKH04G12W790N', 'Vitale', 'Valeria', '81495', 'P.O. Box 406, 3203 Netus ', 188, NULL, ''),
(280, '1925-01-13', 'YFKBYR67K30M918H', 'Albanese', 'Greta', '43629', 'Ap #842-7751 Justo St.', 294, NULL, ''),
(281, '1975-08-25', 'QTIWIO21F50C931N', 'Parisi', 'Giovanni', '29129', 'P.O. Box 806, 5997 In Rd.', 32, NULL, ''),
(282, '1968-06-10', 'AHEYPV60C29V530M', 'Pellegrino', 'Gianni', '87583', 'P.O. Box 882, 1829 Odio. ', 445, NULL, ''),
(283, '1935-09-06', 'RXDHAG92C70P013W', 'Orlando', 'Enrico', '78804', 'P.O. Box 184, 3824 Tellus', 119, NULL, ''),
(284, '1983-02-07', 'ZQGVOE13Z97T231O', 'Greco', 'Nicole', '74116', '5193 Diam. Av.', 371, NULL, ''),
(285, '1933-07-26', 'UPGIEB70M12N567M', 'Ferri', 'Lucio', '47716', 'P.O. Box 329, 8297 Ornare', 175, NULL, ''),
(286, '1956-02-17', 'GTJSIS55H58X336Y', 'Marra', 'Jessica', '98104', '573-1926 Sed Road', 167, NULL, ''),
(287, '1934-01-28', 'LNSWCK25Z76J273P', 'Marini', 'Claudio', '36566', 'P.O. Box 872, 7729 Ligula', 102, NULL, ''),
(288, '1997-04-20', 'ZZMGLR51M71T855S', 'Amato', 'Lisa', '16669', '540 Rutrum Avenue', 234, NULL, ''),
(289, '1983-03-14', 'ZXWSWR26S72T916L', 'Barbieri', 'Elena', '61732', '4130 Velit Avenue', 74, NULL, ''),
(290, '1969-02-08', 'MCSVVM07S95U830B', 'Piazza', 'Gabriele', '01723', 'P.O. Box 296, 8446 Nulla ', 238, NULL, ''),
(291, '1939-06-18', 'GNQDWT03C98T311P', 'Rizzi', 'Camilla', '54583', 'Ap #477-5862 Vitae Avenue', 488, NULL, ''),
(292, '1990-11-25', 'JXHZQN27Z91Q515S', 'Russo', 'Salvatore', '79705', '9843 Phasellus St.', 240, NULL, ''),
(293, '1944-07-10', 'DXFVAG97M85K728Y', 'Brambilla', 'Tommaso', '14204', 'P.O. Box 556, 6913 Sapien', 449, NULL, ''),
(294, '1954-01-19', 'NSDZRK51Q92D921V', 'De Santis', 'Nicola', '71714', '5168 Cum Rd.', 275, NULL, ''),
(295, '1968-01-04', 'DXVCES39E88G309D', 'Testa', 'Matilde', '64963', 'P.O. Box 986, 7668 Facili', 202, NULL, ''),
(296, '1991-03-24', 'NVFXCT05I81O468A', 'Ferrara', 'Luigi', '12686', '649-5662 Cras Avenue', 169, NULL, ''),
(297, '1928-01-27', 'UTFVAF02X46T959V', 'Bruni', 'Rebecca', '25927', '8142 Et Av.', 68, NULL, ''),
(298, '1930-10-18', 'YIJSQY42S68G871U', 'Pinna', 'Luigi', '29660', '3995 Enim Rd.', 356, NULL, ''),
(299, '1935-10-04', 'HSRIQD24P79C943X', 'Ferretti', 'Roberta', '43237', 'P.O. Box 394, 495 Neque S', 33, NULL, ''),
(300, '1955-08-15', 'VHCLDH74S59G012C', 'Battaglia', 'Lucia', '02669', 'Ap #708-7093 Nonummy Stre', 476, NULL, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `effettuare`
--

CREATE TABLE `effettuare` (
  `fk_id_intervento` int(11) NOT NULL,
  `fk_id_meccanico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `effettuare`
--

INSERT INTO `effettuare` (`fk_id_intervento`, `fk_id_meccanico`) VALUES
(8, 75),
(32, 52),
(86, 30),
(84, 47),
(82, 11),
(47, 58),
(38, 68),
(100, 39),
(69, 58),
(14, 70),
(49, 89),
(28, 52),
(61, 95),
(68, 78),
(38, 81),
(7, 22),
(54, 15),
(55, 25),
(51, 76),
(21, 91),
(95, 33),
(27, 55),
(36, 35),
(37, 71),
(98, 52),
(65, 70),
(51, 26),
(93, 100),
(26, 73),
(77, 82),
(40, 26),
(21, 63),
(29, 98),
(36, 42),
(6, 30),
(14, 67),
(34, 25),
(47, 96),
(86, 9),
(7, 78),
(20, 78),
(33, 18),
(68, 39),
(90, 23),
(55, 42),
(1, 68),
(15, 53),
(38, 89),
(84, 35),
(12, 12),
(87, 29),
(88, 65),
(69, 58),
(42, 52),
(7, 66),
(87, 90),
(67, 54),
(65, 89),
(60, 76),
(98, 82),
(87, 84),
(65, 14),
(69, 61),
(32, 30),
(88, 80),
(89, 65),
(9, 95),
(36, 67),
(37, 35),
(16, 18),
(31, 5),
(54, 35),
(25, 80),
(59, 72),
(76, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `fattura`
--

CREATE TABLE `fattura` (
  `id_fattura` int(11) NOT NULL,
  `data_emissione` date NOT NULL,
  `imponibile` double(6,2) NOT NULL,
  `imposta` double(6,2) NOT NULL,
  `fk_id_operazione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `fattura`
--

INSERT INTO `fattura` (`id_fattura`, `data_emissione`, `imponibile`, `imposta`, `fk_id_operazione`) VALUES
(301, '2006-04-06', 1986.00, 69.00, 84),
(302, '2012-09-27', 1035.00, 1152.00, 67),
(303, '2006-02-08', 1001.00, 1059.00, 81),
(304, '2013-02-12', 1865.00, 458.00, 21),
(305, '2015-07-09', 155.00, 40.00, 24),
(306, '2014-04-05', 1625.00, 984.00, 8),
(307, '2008-04-11', 1076.00, 740.00, 28),
(308, '2007-11-13', 1626.00, 1625.00, 76),
(309, '2009-12-01', 1137.00, 561.00, 6),
(310, '2005-09-29', 550.00, 1504.00, 51),
(311, '2010-12-20', 489.00, 1273.00, 94),
(312, '2009-05-31', 829.00, 125.00, 13),
(313, '2009-10-08', 1614.00, 1605.00, 87),
(314, '2013-04-11', 774.00, 666.00, 1),
(315, '2002-02-21', 1912.00, 210.00, 70),
(316, '2012-01-01', 842.00, 623.00, 84),
(317, '2016-08-19', 770.00, 381.00, 47),
(318, '2001-08-01', 369.00, 1594.00, 26),
(319, '2016-02-09', 377.00, 1109.00, 29),
(320, '2004-07-04', 722.00, 1626.00, 4),
(321, '2013-10-09', 1370.00, 365.00, 67),
(322, '2005-06-19', 487.00, 1392.00, 34),
(323, '2014-04-25', 1197.00, 42.00, 84),
(324, '2005-10-16', 1652.00, 1677.00, 60),
(325, '2015-05-02', 38.00, 365.00, 78),
(326, '2019-04-13', 894.00, 1331.00, 65),
(327, '2005-02-05', 978.00, 176.00, 96),
(328, '2015-06-18', 185.00, 1369.00, 72),
(329, '2006-04-04', 1606.00, 5.00, 23),
(330, '2009-11-19', 1556.00, 1704.00, 79),
(331, '2003-09-06', 445.00, 286.00, 38),
(332, '2012-10-31', 1407.00, 1818.00, 58),
(333, '2015-01-05', 1180.00, 1046.00, 70),
(334, '2011-02-22', 788.00, 298.00, 48),
(335, '2002-04-24', 1311.00, 1056.00, 33),
(336, '2010-02-01', 1214.00, 892.00, 39),
(337, '2017-04-07', 1982.00, 540.00, 10),
(338, '2009-09-14', 1613.00, 346.00, 29),
(339, '2011-08-11', 138.00, 527.00, 22),
(340, '2008-07-28', 353.00, 222.00, 5),
(341, '2011-05-21', 532.00, 805.00, 7),
(342, '2017-09-29', 1304.00, 279.00, 86),
(343, '2013-01-03', 982.00, 313.00, 40),
(344, '2001-12-14', 1472.00, 1721.00, 28),
(345, '2010-06-17', 137.00, 1108.00, 35),
(346, '2016-09-06', 918.00, 66.00, 59),
(347, '2009-01-06', 846.00, 509.00, 98),
(348, '2003-10-13', 1564.00, 1134.00, 40),
(349, '2018-08-06', 1761.00, 742.00, 8),
(350, '2005-05-21', 1004.00, 1567.00, 10),
(351, '2004-03-11', 634.00, 1251.00, 6),
(352, '2017-02-12', 402.00, 888.00, 8),
(353, '2014-09-15', 1818.00, 1746.00, 77),
(354, '2013-03-06', 87.00, 1244.00, 42),
(355, '2016-11-16', 715.00, 1431.00, 58),
(356, '2009-08-16', 472.00, 1278.00, 59),
(357, '2001-06-17', 216.00, 220.00, 26),
(358, '2016-12-17', 1023.00, 1417.00, 26),
(359, '2019-03-25', 1441.00, 43.00, 48),
(360, '2016-07-05', 148.00, 1527.00, 99),
(361, '2013-02-13', 1509.00, 408.00, 94),
(362, '2019-07-29', 1488.00, 1794.00, 43),
(363, '2008-04-13', 685.00, 438.00, 75),
(364, '2004-01-03', 1642.00, 1711.00, 15),
(365, '2009-12-06', 883.00, 1642.00, 26),
(366, '2009-11-18', 206.00, 995.00, 27),
(367, '2018-09-08', 334.00, 1935.00, 9),
(368, '2001-11-29', 1034.00, 215.00, 35),
(369, '2006-10-03', 31.00, 316.00, 89),
(370, '2008-03-16', 487.00, 553.00, 73),
(371, '2001-07-27', 1729.00, 660.00, 86),
(372, '2010-12-29', 361.00, 754.00, 82),
(373, '2004-12-01', 1138.00, 636.00, 32),
(374, '2007-08-05', 1795.00, 1793.00, 56),
(375, '2011-02-14', 65.00, 1481.00, 50),
(376, '2012-05-31', 1243.00, 572.00, 36),
(377, '2018-11-26', 533.00, 137.00, 61),
(378, '2001-04-18', 1850.00, 1919.00, 11),
(379, '2009-08-24', 100.00, 1498.00, 38),
(380, '2018-11-17', 936.00, 1242.00, 27),
(381, '2018-03-01', 1513.00, 1468.00, 42),
(382, '2011-04-02', 1030.00, 1584.00, 52),
(383, '2011-10-15', 306.00, 652.00, 10),
(384, '2012-08-16', 990.00, 1992.00, 66),
(385, '2005-11-05', 885.00, 1448.00, 100),
(386, '2004-11-19', 63.00, 159.00, 21),
(387, '2004-09-26', 238.00, 1445.00, 31),
(388, '2013-09-27', 19.00, 1878.00, 51),
(389, '2011-04-07', 1227.00, 397.00, 82),
(390, '2019-06-17', 831.00, 689.00, 61),
(391, '2012-07-20', 1850.00, 1732.00, 67),
(392, '2005-01-01', 132.00, 1457.00, 12),
(393, '2002-12-02', 1692.00, 1314.00, 50),
(394, '2008-05-27', 860.00, 176.00, 2),
(395, '2004-03-20', 1853.00, 986.00, 79),
(396, '2006-11-21', 1432.00, 673.00, 4),
(397, '2015-11-26', 819.00, 1767.00, 55),
(398, '2002-02-18', 1717.00, 1581.00, 82),
(399, '2018-04-14', 1095.00, 184.00, 59),
(400, '2003-04-10', 1203.00, 687.00, 68);

-- --------------------------------------------------------

--
-- Struttura della tabella `intervento`
--

CREATE TABLE `intervento` (
  `id_intervento` int(11) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `fk_id_operazione` int(11) NOT NULL,
  `fk_id_anagrafico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `intervento`
--

INSERT INTO `intervento` (`id_intervento`, `descrizione`, `fk_id_operazione`, `fk_id_anagrafico`) VALUES
(1, NULL, 63, 3),
(2, NULL, 72, 4),
(3, NULL, 38, 5),
(4, NULL, 18, 4),
(5, NULL, 31, 9),
(6, NULL, 17, 5),
(7, NULL, 2, 8),
(8, NULL, 86, 3),
(9, NULL, 36, 4),
(10, NULL, 31, 10),
(11, NULL, 84, 3),
(12, NULL, 98, 8),
(13, NULL, 22, 3),
(14, NULL, 24, 9),
(15, NULL, 39, 5),
(16, NULL, 66, 8),
(17, NULL, 10, 4),
(18, NULL, 90, 7),
(19, NULL, 83, 5),
(20, NULL, 40, 5),
(21, NULL, 72, 1),
(22, NULL, 6, 3),
(23, NULL, 12, 3),
(24, NULL, 93, 5),
(25, NULL, 71, 7),
(26, NULL, 1, 2),
(27, NULL, 66, 10),
(28, NULL, 22, 2),
(29, NULL, 54, 8),
(30, NULL, 10, 4),
(31, NULL, 16, 10),
(32, NULL, 33, 2),
(33, NULL, 47, 8),
(34, NULL, 6, 2),
(35, NULL, 55, 2),
(36, NULL, 92, 1),
(37, NULL, 72, 5),
(38, NULL, 84, 9),
(39, NULL, 90, 3),
(40, NULL, 87, 7),
(41, NULL, 22, 6),
(42, NULL, 27, 2),
(43, NULL, 61, 9),
(44, NULL, 80, 4),
(45, NULL, 65, 5),
(46, NULL, 64, 9),
(47, NULL, 17, 4),
(48, NULL, 68, 5),
(49, NULL, 87, 5),
(50, NULL, 13, 5),
(51, NULL, 75, 5),
(52, NULL, 11, 8),
(53, NULL, 32, 4),
(54, NULL, 16, 4),
(55, NULL, 94, 5),
(56, NULL, 11, 10),
(57, NULL, 39, 10),
(58, NULL, 90, 7),
(59, NULL, 60, 10),
(60, NULL, 39, 6),
(61, NULL, 28, 1),
(62, NULL, 52, 7),
(63, NULL, 70, 5),
(64, NULL, 33, 5),
(65, NULL, 47, 8),
(66, NULL, 24, 8),
(67, NULL, 40, 4),
(68, NULL, 24, 2),
(69, NULL, 81, 9),
(70, NULL, 80, 5),
(71, NULL, 65, 7),
(72, NULL, 39, 1),
(73, NULL, 56, 1),
(74, NULL, 36, 9),
(75, NULL, 12, 9),
(76, NULL, 4, 1),
(77, NULL, 68, 3),
(78, NULL, 90, 1),
(79, NULL, 13, 2),
(80, NULL, 15, 8),
(81, NULL, 80, 9),
(82, NULL, 38, 10),
(83, NULL, 83, 10),
(84, NULL, 14, 2),
(85, NULL, 75, 4),
(86, NULL, 7, 8),
(87, NULL, 21, 5),
(88, NULL, 53, 8),
(89, NULL, 25, 3),
(90, NULL, 22, 3),
(91, NULL, 45, 9),
(92, NULL, 22, 4),
(93, NULL, 93, 5),
(94, NULL, 21, 10),
(95, NULL, 76, 1),
(96, NULL, 97, 1),
(97, NULL, 96, 1),
(98, NULL, 92, 6),
(99, NULL, 27, 6),
(100, NULL, 91, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `meccanico`
--

CREATE TABLE `meccanico` (
  `id_meccanico` int(11) NOT NULL,
  `matricola` char(10) NOT NULL,
  `nome_m` varchar(10) DEFAULT NULL,
  `cognome_m` varchar(15) DEFAULT NULL,
  `livello` int(2) DEFAULT NULL,
  `pass_meccanico` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `meccanico`
--

INSERT INTO `meccanico` (`id_meccanico`, `matricola`, `nome_m`, `cognome_m`, `livello`, `pass_meccanico`) VALUES
(5, '84RDY2EH4', 'Sara', 'Lombardi', 7, 'a'),
(6, '88SVH2LK1', 'Giuseppe', 'De Santis', 6, 'a'),
(8, '61QCT9WY7', 'Marco', 'Leone', 8, 'a'),
(9, '21ICL3SI8', 'Lisa', 'Brambilla', 6, 'a'),
(11, '17PLP7NC6', 'Gianpaolo', 'Pinna', 7, 'a'),
(12, '55XUN2AT3', 'Giuseppe', 'Pepe', 8, 'a'),
(13, '63SVG3GQ2', 'Gaia', 'Fabbri', 4, 'a'),
(14, '60YRA8CQ9', 'Elisa', 'Orlando', 9, 'a'),
(15, '67MRR3BU9', 'Cristina', 'Marchi', 1, 'a'),
(18, '55FLS4LA8', 'Elena', 'Pastore', 5, 'a'),
(19, '64BCC3UW9', 'Alessio', 'Fusco', 2, 'a'),
(20, '52SXE4ZR4', 'Valeria', 'Poli', 2, 'a'),
(21, '59CLX2VU8', 'Irene', 'Monaco', 9, 'a'),
(22, '72OKP7KU5', 'Alessandra', 'Ferretti', 8, 'a'),
(23, '76HOU6OR4', 'Noemi', 'Palumbo', 5, 'a'),
(25, '45AIZ4PR4', 'Paola', 'Agostini', 5, 'a'),
(26, '72SUR5AE5', 'Manuela', 'Olivieri', 7, 'a'),
(27, '52FRW1TB0', 'Erica', 'Franco', 4, 'a'),
(29, '23ZZL3MJ3', 'Nicolò', 'Pellegrini', 1, 'a'),
(30, '59RQI3WR6', 'Samuele', 'Fontana', 5, 'a'),
(31, '45SLH8TI3', 'Filippo', 'Sartori', 4, 'a'),
(32, '23IBA7HR9', 'Lucio', 'Costa', 7, 'a'),
(33, '86IZT4VZ1', 'Simona', 'Marchetti', 9, 'a'),
(34, '78LQR3GU7', 'Gabriele', 'Olivieri', 2, 'a'),
(35, '95STP8GM9', 'Erica', 'Proietti', 5, 'a'),
(37, '95SHX1TH9', 'Erica', 'Ruggiero', 4, 'a'),
(38, '38RLF4YJ6', 'Elena', 'Donati', 6, 'a'),
(39, '28DHB0DZ5', 'Giulio', 'Basile', 9, 'a'),
(40, '61BPJ6SP2', 'Roberta', 'Vitali', 8, 'a'),
(42, '39AWZ8MR0', 'Giulio', 'Marchetti', 3, 'a'),
(43, '64RUA0JA0', 'Giulio', 'Guidi', 1, 'a'),
(44, '61KJU2IL5', 'Edoardo', 'Romano', 9, 'a'),
(45, '83ZHT8GR9', 'Laura', 'Sanna', 8, 'a'),
(47, '25XZW4WE8', 'Paolo', 'Gentile', 2, 'a'),
(48, '74ZUD4QK2', 'Emma', 'Volpe', 6, 'a'),
(49, '94FPA7NT5', 'Stefano', 'Monaco', 6, 'a'),
(50, '16NZO8LY1', 'Michele', 'Bianchi', 2, 'a'),
(51, '96IVV0DU9', 'Armando', 'Bianchi', 5, 'a'),
(52, '52TXZ5ZS5', 'Gaia', 'Coppola', 4, 'a'),
(53, '82NNL8UO8', 'Valeria', 'Costantini', 2, 'a'),
(54, '45BOO9QV0', 'Lisa', 'Piazza', 4, 'a'),
(55, '43QVD4XK0', 'Lorenzo', 'Messina', 8, 'a'),
(56, '41JLA6SP5', 'Lisa', 'Marino', 4, 'a'),
(58, '88WCP8SI3', 'Vincenzo', 'Rossi', 7, 'a'),
(60, '42KCR7FX8', 'Serena', 'Palmieri', 3, 'a'),
(61, '52FNE7YG5', 'Nicoletta', 'Pozzi', 7, 'a'),
(63, '32KLT9NW4', 'Manuela', 'Vitali', 8, 'a'),
(64, '97PSX1IJ3', 'Alessia', 'Gatti', 7, 'a'),
(65, '65ZNN6UR9', 'Samuele', 'Conte', 2, 'a'),
(66, '53QBX3EH4', 'Erica', 'Moro', 7, 'a'),
(67, '74SUP5YQ2', 'Viola', 'Bianco', 1, 'a'),
(68, '20JIW6OJ7', 'Simona', 'Bernardi', 5, 'a'),
(70, '24WYE2VG5', 'Lucia', 'Albanese', 1, 'a'),
(71, '95UVA0WJ3', 'Augusto', 'Caruso', 1, 'a'),
(72, '31WFY3YV2', 'Nicola', 'Ferrara', 2, 'a'),
(73, '36GYB6NZ5', 'Alessio', 'Rossi', 7, 'a'),
(75, '47NNB1SB5', 'Armando', 'Russo', 7, 'a'),
(76, '57XLI7HB3', 'Sofia', 'Messina', 5, 'a'),
(78, '11WOH0YY7', 'Gaia', 'Poli', 9, 'a'),
(79, '75GUG0AT8', 'Mattia', 'Lombardo', 6, 'a'),
(80, '26GOK6DX8', 'Silvia', 'Ruggiero', 5, 'a'),
(81, '45VOH2EJ7', 'Leonardo', 'Silvestri', 1, 'a'),
(82, '24ANO4WA8', 'Paola', 'Carbone', 2, 'a'),
(83, '21RIJ1QP7', 'Arianna', 'Proietti', 5, 'a'),
(84, '63OEP2BR6', 'Alessandro', 'Monti', 2, 'a'),
(88, '93JOU2KC9', 'Giulietta', 'Bianco', 9, 'a'),
(89, '60EFE6MU1', 'Martina', 'Ferri', 1, 'a'),
(90, '27MCL8NC9', 'Nicolò', 'Messina', 7, 'a'),
(91, '85YBR0PQ3', 'Giorgia', 'Pellegrino', 5, 'a'),
(92, '62GDT9DQ1', 'Davide', 'Battaglia', 1, 'a'),
(93, '94HWK1JS3', 'Nicole', 'Rossi', 8, 'a'),
(94, '22ZHW7IW8', 'Beatrice', 'Castelli', 6, 'a'),
(95, '44OHC6HO4', 'Mirko', 'Bianco', 5, 'a'),
(96, '33LYC6MC9', 'Alessandra', 'Bruno', 1, 'a'),
(97, '27DQA0JI0', 'Domenico', 'Bernardi', 2, 'a'),
(98, '70PMM2ZO5', 'Edoardo', 'Piazza', 5, 'a'),
(99, '78BDD4YY6', 'Marco', 'Cavallo', 4, 'a'),
(100, '46HQC9UA5', 'Laura', 'Messina', 1, 'a');

-- --------------------------------------------------------

--
-- Struttura della tabella `operazione`
--

CREATE TABLE `operazione` (
  `id_operazione` int(11) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine_prevista` date NOT NULL,
  `data_riconsegna_effettiva` date DEFAULT NULL,
  `fk_id_veicolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `operazione`
--

INSERT INTO `operazione` (`id_operazione`, `data_inizio`, `data_fine_prevista`, `data_riconsegna_effettiva`, `fk_id_veicolo`) VALUES
(1, '2009-02-03', '2019-08-17', NULL, 107),
(2, '2001-01-10', '2015-10-09', NULL, 49),
(3, '2007-02-10', '2007-09-25', NULL, 60),
(4, '2012-01-28', '2013-08-30', NULL, 57),
(5, '2002-11-03', '2017-03-02', NULL, 103),
(6, '2005-12-16', '2009-12-27', NULL, 39),
(7, '2007-06-09', '2014-04-18', NULL, 97),
(8, '2016-05-18', '2012-01-11', NULL, 103),
(9, '2001-02-04', '2007-07-24', NULL, 106),
(10, '2001-11-12', '2016-09-02', NULL, 49),
(11, '2008-05-02', '2014-07-27', NULL, 23),
(12, '2012-07-20', '2015-04-24', NULL, 58),
(13, '2013-06-08', '2014-09-30', NULL, 76),
(14, '2004-09-05', '2006-08-30', NULL, 63),
(15, '2015-01-01', '2015-07-16', NULL, 83),
(16, '2001-08-28', '2012-03-14', NULL, 44),
(17, '2008-01-10', '2015-01-11', NULL, 24),
(18, '2018-02-19', '2004-01-15', NULL, 69),
(19, '2003-01-17', '2016-07-21', NULL, 116),
(20, '2001-05-11', '2005-06-07', NULL, 47),
(21, '2006-08-24', '2002-08-11', NULL, 67),
(22, '2002-01-10', '2014-07-06', NULL, 30),
(23, '2007-02-23', '2015-04-15', NULL, 22),
(24, '2000-04-28', '2000-01-26', NULL, 29),
(25, '2018-05-25', '2000-08-31', NULL, 77),
(26, '2008-05-10', '2016-11-22', NULL, 69),
(27, '2010-01-14', '2013-12-26', NULL, 36),
(28, '2014-03-22', '2013-01-04', NULL, 30),
(29, '2002-01-28', '2000-04-25', NULL, 77),
(30, '2001-06-18', '2009-02-06', NULL, 86),
(31, '2008-12-25', '2016-06-08', NULL, 112),
(32, '2001-06-05', '2008-08-30', NULL, 70),
(33, '2013-12-24', '2017-09-19', NULL, 89),
(34, '2010-12-18', '2000-03-18', NULL, 37),
(35, '2013-11-21', '2006-11-15', NULL, 90),
(36, '2006-05-19', '2000-02-07', NULL, 61),
(37, '2014-10-24', '2009-07-21', NULL, 103),
(38, '2001-03-15', '2001-06-17', NULL, 68),
(39, '2009-02-12', '2015-08-10', NULL, 49),
(40, '2016-05-20', '2016-07-04', NULL, 33),
(41, '2008-08-17', '2004-07-08', NULL, 63),
(42, '2009-05-19', '2008-07-06', NULL, 38),
(43, '2000-03-26', '2000-09-02', NULL, 111),
(44, '2012-08-31', '2014-07-16', NULL, 54),
(45, '2003-08-02', '2019-02-05', NULL, 61),
(46, '2017-05-18', '2003-12-04', NULL, 79),
(47, '2014-08-17', '2008-12-06', NULL, 85),
(48, '2003-04-05', '2019-02-20', NULL, 108),
(49, '2008-03-24', '2010-08-07', NULL, 77),
(50, '2008-10-23', '2009-01-12', NULL, 25),
(51, '2011-11-17', '2001-07-08', NULL, 88),
(52, '2001-08-20', '2001-02-17', NULL, 35),
(53, '2000-11-16', '2008-09-04', NULL, 91),
(54, '2000-09-02', '2016-11-22', NULL, 26),
(55, '2016-02-24', '2014-05-09', NULL, 67),
(56, '2006-06-18', '2016-09-22', NULL, 35),
(57, '2001-06-18', '2005-05-20', NULL, 85),
(58, '2010-09-19', '2014-04-22', NULL, 47),
(59, '2000-02-26', '2012-04-11', NULL, 28),
(60, '2004-12-23', '2017-09-15', NULL, 69),
(61, '2012-12-21', '2006-01-09', NULL, 64),
(62, '2015-10-12', '2002-10-08', NULL, 110),
(63, '2011-04-09', '2007-04-12', NULL, 63),
(64, '2009-07-29', '2011-02-23', NULL, 77),
(65, '2002-11-07', '2000-05-15', NULL, 99),
(66, '2004-08-06', '2005-12-25', NULL, 119),
(67, '2006-10-16', '2013-02-13', NULL, 43),
(68, '2004-12-13', '2010-11-16', NULL, 81),
(69, '2012-02-22', '2011-09-24', NULL, 64),
(70, '2013-03-28', '2003-01-10', NULL, 27),
(71, '2002-05-19', '2015-02-04', NULL, 99),
(72, '2008-05-27', '2009-07-25', NULL, 65),
(73, '2009-06-17', '2012-10-14', NULL, 36),
(74, '2011-12-11', '2017-05-16', NULL, 97),
(75, '2014-03-29', '2010-03-29', NULL, 90),
(76, '2014-11-25', '2008-06-06', NULL, 44),
(77, '2000-07-28', '2006-11-10', NULL, 82),
(78, '2009-09-15', '2006-08-21', NULL, 34),
(79, '2014-06-11', '2002-12-12', NULL, 23),
(80, '2008-05-30', '2004-09-24', NULL, 23),
(81, '2000-04-02', '2013-10-10', NULL, 107),
(82, '2010-04-12', '2011-04-20', NULL, 48),
(83, '2006-05-01', '2011-02-23', NULL, 76),
(84, '2012-08-14', '2009-05-13', NULL, 24),
(85, '2007-05-16', '2003-06-27', NULL, 39),
(86, '2005-02-27', '2004-12-15', NULL, 28),
(87, '2009-08-20', '2013-09-22', NULL, 27),
(88, '2004-03-08', '2002-03-26', NULL, 45),
(89, '2007-06-11', '2012-04-14', NULL, 21),
(90, '2014-01-13', '2009-04-04', NULL, 65),
(91, '2017-01-28', '2007-10-08', NULL, 32),
(92, '2014-01-16', '2011-05-17', NULL, 96),
(93, '2000-10-15', '2010-11-22', NULL, 57),
(94, '2016-05-29', '2017-12-21', NULL, 91),
(95, '2017-10-09', '2014-04-05', NULL, 48),
(96, '2011-03-15', '2003-03-19', NULL, 64),
(97, '2005-05-28', '2007-06-05', NULL, 64),
(98, '2012-08-25', '2016-12-14', NULL, 118),
(99, '2003-01-21', '2004-01-25', NULL, 33),
(100, '2011-06-11', '2019-02-15', NULL, 98);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `id_prodotto` int(11) NOT NULL,
  `nome_prod` varchar(25) NOT NULL,
  `costo_unitario` double(5,2) NOT NULL,
  `aliquota_iva` int(2) NOT NULL,
  `categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`id_prodotto`, `nome_prod`, `costo_unitario`, `aliquota_iva`, `categoria`) VALUES
(1, 'olio tamoil', 4.99, 10, 'olio'),
(2, 'freni z', 15.99, 4, 'freni'),
(3, 'cambio AX', 69.99, 4, 'cambio'),
(4, 'pasticche q', 9.99, 10, 'freni'),
(5, 'vernice w', 11.99, 22, 'vernice'),
(6, 'centralina e', 80.00, 4, 'centraline'),
(7, 'portiera r', 59.99, 10, 'interni'),
(8, 'sedili qwerty', 39.99, 10, 'interni');

-- --------------------------------------------------------

--
-- Struttura della tabella `registrazione`
--

CREATE TABLE `registrazione` (
  `fk_id_cliente` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `registrazione`
--

INSERT INTO `registrazione` (`fk_id_cliente`, `username`, `password`) VALUES
(201, 'aa', 'vwbvwbv'),
(202, 'rr3gfregv', 'bhbte dnb'),
(206, 'cevewv', 'evwv'),
(216, 'wvrwv', 'vewvv'),
(218, 'aq3<klutklut', 'lutld,u '),
(234, 'geqhTE', 'NRYH T73I 7KJ6E'),
(241, 'etrnhtententen', 'tenetrhnteaq<KJE3'),
(243, 'EFHNATREM', 'JNQTE'),
(250, 'rwbrwb', 'rw'),
(271, 'ew', 'bwrbrw'),
(272, 'wgvwrebrw', 'brewbrewbvrew'),
(274, 'wwrgbwrbw', 'ETRKJMAYTRN'),
(278, 'ITLòIàIU', 'òIòTòI'),
(282, 'SJTREJNGDZHFDRG', 'HRWHREGVD'),
(291, 'WEYHTRSJ<', 'ZTRJE');

-- --------------------------------------------------------

--
-- Struttura della tabella `utilizzo`
--

CREATE TABLE `utilizzo` (
  `fk_id_intervento` int(11) NOT NULL,
  `fk_id_prodotto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utilizzo`
--

INSERT INTO `utilizzo` (`fk_id_intervento`, `fk_id_prodotto`, `quantita`) VALUES
(2, 1, 0),
(82, 6, 0),
(91, 2, 0),
(34, 7, 0),
(32, 5, 0),
(65, 1, 0),
(44, 3, 0),
(69, 7, 0),
(99, 1, 0),
(95, 3, 0),
(5, 7, 0),
(89, 8, 0),
(34, 8, 0),
(48, 7, 0),
(36, 6, 0),
(88, 1, 0),
(93, 1, 0),
(91, 6, 0),
(5, 7, 0),
(49, 4, 0),
(33, 1, 0),
(93, 1, 0),
(33, 3, 0),
(80, 5, 0),
(63, 2, 0),
(43, 2, 0),
(93, 1, 0),
(74, 3, 0),
(67, 7, 0),
(86, 6, 0),
(12, 2, 0),
(57, 8, 0),
(14, 7, 0),
(68, 4, 0),
(100, 3, 0),
(85, 4, 0),
(81, 1, 0),
(97, 3, 0),
(34, 7, 0),
(93, 4, 0),
(100, 2, 0),
(5, 5, 0),
(9, 6, 0),
(93, 3, 0),
(39, 7, 0),
(40, 3, 0),
(50, 4, 0),
(68, 3, 0),
(2, 3, 0),
(99, 7, 0),
(8, 6, 0),
(49, 7, 0),
(50, 2, 0),
(33, 4, 0),
(48, 4, 0),
(96, 7, 0),
(82, 3, 0),
(46, 2, 0),
(93, 2, 0),
(62, 1, 0),
(7, 6, 0),
(39, 1, 0),
(39, 4, 0),
(59, 4, 0),
(11, 7, 0),
(14, 7, 0),
(91, 7, 0),
(43, 8, 0),
(90, 3, 0),
(49, 8, 0),
(79, 3, 0),
(25, 7, 0),
(44, 1, 0),
(70, 1, 0),
(55, 3, 0),
(75, 5, 0),
(18, 4, 0),
(73, 8, 0),
(63, 8, 0),
(83, 4, 0),
(1, 8, 0),
(83, 4, 0),
(52, 4, 0),
(12, 1, 0),
(57, 7, 0),
(82, 6, 0),
(4, 4, 0),
(35, 1, 0),
(93, 6, 0),
(32, 2, 0),
(78, 6, 0),
(87, 5, 0),
(39, 7, 0),
(84, 5, 0),
(80, 2, 0),
(78, 3, 0),
(42, 4, 0),
(37, 5, 0),
(7, 3, 0),
(77, 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `veicolo`
--

CREATE TABLE `veicolo` (
  `id_veicolo` int(11) NOT NULL,
  `nomeV` varchar(20) NOT NULL,
  `targa` char(7) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `cavalli` int(4) DEFAULT NULL,
  `cilindrata` int(5) DEFAULT NULL,
  `fk_id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `veicolo`
--

INSERT INTO `veicolo` (`id_veicolo`, `nomeV`, `targa`, `tipo`, `cavalli`, `cilindrata`, `fk_id_cliente`) VALUES
(21, 'Volkswagen', 'DN 715', 'SuperCar', 5, 1064, 221),
(22, 'Volkswagen', 'VE 021', '4x4', 3, 917, 281),
(23, 'General Motors', 'VM 945', '4x4', 10, 1500, 215),
(24, 'Vauxhall', 'QA 421', 'Monovolume', 3, 880, 277),
(25, 'Seat', 'CI 843', 'SUV', 4, 2771, 209),
(26, 'Porsche', 'ID 164', 'SuperCar', 1, 2971, 296),
(27, 'Chrysler', 'FB 864', 'Utilitary', 7, 1696, 202),
(28, 'Toyota', 'OC 193', 'SUV', 4, 1627, 232),
(29, 'RAM Trucks', 'AA 922', '4x4', 3, 1132, 296),
(30, 'Dongfeng Motor', 'MN 022', 'Berlina', 8, 1201, 249),
(31, 'JLR', 'PN 690', 'SUV', 9, 1837, 223),
(32, 'Infiniti', 'HU 489', 'Monovolume', 3, 1843, 224),
(33, 'Dongfeng Motor', 'EZ 924', '4x4', 5, 2466, 209),
(34, 'Volkswagen', 'WN 547', 'Monovolume', 8, 2478, 281),
(35, 'JLR', 'KT 810', '4x4', 8, 1155, 248),
(36, 'Suzuki', 'NT 099', 'Monovolume', 1, 1869, 230),
(37, 'Mercedes-Benz', 'GX 049', 'Utilitary', 1, 2269, 282),
(38, 'Chevrolet', 'EU 440', 'Berlina', 6, 2257, 276),
(39, 'Volvo', 'OP 067', 'SuperCar', 5, 850, 270),
(40, 'Kia Motors', 'YS 850', 'Berlina', 7, 2505, 288),
(41, 'Lincoln', 'DJ 514', 'Utilitary', 7, 2166, 254),
(42, 'Daimler', 'BO 525', 'SuperCar', 1, 1310, 212),
(43, 'FAW', 'GP 565', 'Utilitary', 4, 1775, 217),
(44, 'Tata Motors', 'YT 860', 'SUV', 3, 2475, 268),
(45, 'Lexus', 'YZ 304', 'Utilitary', 8, 1566, 241),
(46, 'Honda', 'ZH 395', 'Berlina', 1, 2420, 216),
(47, 'Dacia', 'ND 859', 'Sportiva', 2, 1281, 204),
(48, 'General Motors', 'OB 198', '4x4', 10, 1290, 239),
(49, 'Porsche', 'VP 245', 'Monovolume', 5, 2311, 230),
(50, 'Hyundai Motors', 'FP 640', 'Berlina', 3, 1294, 266),
(51, 'Lexus', 'VX 634', 'SuperCar', 7, 2403, 277),
(52, 'Vauxhall', 'RQ 133', 'SUV', 1, 2481, 201),
(53, 'Jeep', 'CP 674', 'Sportiva', 2, 1313, 223),
(54, 'Chevrolet', 'YR 685', 'Berlina', 9, 1237, 289),
(55, 'Fiat', 'VP 994', 'Utilitary', 9, 2629, 269),
(56, 'Suzuki', 'KW 772', '4x4', 4, 2151, 272),
(57, 'Buick', 'VV 924', 'SuperCar', 8, 2936, 295),
(58, 'Suzuki', 'YF 898', 'SUV', 8, 913, 266),
(59, 'Mazda', 'UR 793', 'Sportiva', 6, 1827, 226),
(60, 'Maruti Suzuki', 'HU 582', 'Utilitary', 3, 1772, 238),
(61, 'Toyota', 'CW 232', 'Sportiva', 4, 2396, 233),
(62, 'Acura', 'AY 067', 'Utilitary', 2, 2074, 238),
(63, 'Fiat', 'LA 329', 'Berlina', 6, 2832, 236),
(64, 'Toyota', 'LN 285', 'SUV', 1, 1328, 266),
(65, 'Buick', 'WQ 880', 'SUV', 2, 2224, 298),
(66, 'Chevrolet', 'KS 718', 'Monovolume', 5, 2608, 258),
(67, 'Lincoln', 'ZT 671', 'Utilitary', 4, 1173, 204),
(68, 'Lincoln', 'IH 195', 'Monovolume', 1, 1981, 208),
(69, 'Peugeot', 'RO 974', '4x4', 8, 2954, 265),
(70, 'Lexus', 'YX 669', 'SUV', 1, 2355, 229),
(71, 'Mitsubishi Motors', 'TT 727', '4x4', 6, 2086, 251),
(72, 'JLR', 'LF 785', 'Utilitary', 4, 1232, 207),
(73, 'Isuzu', 'VX 822', 'Utilitary', 7, 818, 206),
(74, 'Ford', 'PX 364', 'SUV', 10, 1533, 211),
(75, 'Honda', 'DO 308', 'Utilitary', 2, 2158, 242),
(76, 'Dodge', 'KU 511', 'Monovolume', 5, 1697, 266),
(77, 'Toyota', 'YK 912', 'SUV', 10, 2401, 218),
(78, 'Daihatsu', 'HF 185', 'SUV', 6, 1806, 233),
(79, 'Kenworth', 'ZU 932', '4x4', 8, 1583, 207),
(80, 'Cadillac', 'PI 003', 'Sportiva', 6, 2522, 216),
(81, 'Nissan', 'AO 578', 'Berlina', 10, 952, 250),
(82, 'MINI', 'RG 734', 'SuperCar', 4, 830, 269),
(83, 'Subaru', 'UC 436', 'Utilitary', 1, 1564, 259),
(84, 'Dacia', 'RK 888', 'Monovolume', 5, 2269, 214),
(85, 'Peugeot', 'KP 705', 'Sportiva', 3, 2110, 233),
(86, 'MINI', 'EM 819', 'Monovolume', 10, 891, 233),
(87, 'Isuzu', 'OT 696', 'SUV', 7, 1811, 273),
(88, 'Mitsubishi Motors', 'PR 193', 'Sportiva', 3, 1093, 298),
(89, 'Cadillac', 'HX 713', 'Utilitary', 2, 2717, 201),
(90, 'FAW', 'BX 553', 'Monovolume', 8, 872, 202),
(91, 'Ferrari', 'PQ 884', 'SuperCar', 1, 2855, 216),
(92, 'General Motors', 'FO 039', 'Utilitary', 5, 2074, 286),
(93, 'Volvo', 'CQ 370', '4x4', 7, 1052, 285),
(94, 'RAM Trucks', 'UQ 338', 'Monovolume', 3, 2764, 238),
(95, 'Fiat', 'EX 178', 'Monovolume', 8, 1789, 228),
(96, 'MINI', 'GU 757', 'SUV', 5, 911, 236),
(97, 'Chrysler', 'GM 522', 'Monovolume', 6, 2497, 225),
(98, 'Infiniti', 'FI 983', 'Sportiva', 5, 1635, 210),
(99, 'General Motors', 'XV 270', 'SUV', 10, 2542, 286),
(100, 'Lincoln', 'SQ 908', 'SUV', 2, 2412, 247),
(101, 'Tata Motors', 'TB 737', 'Utilitary', 7, 1680, 261),
(102, 'Vauxhall', 'RP 352', 'Berlina', 3, 2785, 226),
(103, 'Tata Motors', 'XS 108', '4x4', 9, 2993, 291),
(104, 'Isuzu', 'IJ 101', 'SUV', 4, 2342, 265),
(105, 'Subaru', 'JF 987', 'Berlina', 4, 1279, 248),
(106, 'Porsche', 'GM 268', 'Utilitary', 10, 2829, 212),
(107, 'General Motors', 'TL 452', '4x4', 3, 1951, 284),
(108, 'Kia Motors', 'YC 930', 'Monovolume', 10, 2509, 234),
(109, 'Hyundai Motors', 'JQ 116', 'Sportiva', 3, 1084, 277),
(110, 'Chevrolet', 'IX 829', 'Monovolume', 9, 2672, 281),
(111, 'General Motors', 'GG 357', 'Sportiva', 1, 2390, 281),
(112, 'Vauxhall', 'TQ 098', 'Berlina', 5, 962, 260),
(113, 'Daimler', 'QF 890', 'Sportiva', 6, 2838, 215),
(114, 'Kenworth', 'VA 931', 'Sportiva', 2, 1507, 234),
(115, 'Dodge', 'FU 283', 'Monovolume', 4, 2233, 258),
(116, 'FAW', 'ZA 891', 'SUV', 9, 931, 201),
(117, 'Skoda', 'BI 922', 'SUV', 10, 1506, 206),
(118, 'Maruti Suzuki', 'NQ 659', 'SuperCar', 4, 1503, 284),
(119, 'Lexus', 'OR 638', 'Sportiva', 10, 2105, 213),
(120, 'Lincoln', 'PH 056', 'Berlina', 10, 1065, 216);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `amministratore`
--
ALTER TABLE `amministratore`
  ADD PRIMARY KEY (`idAmministratore`);

--
-- Indici per le tabelle `anagrafica_intervento`
--
ALTER TABLE `anagrafica_intervento`
  ADD PRIMARY KEY (`id_anagrafico`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `telefono` (`telefono`,`email`);

--
-- Indici per le tabelle `effettuare`
--
ALTER TABLE `effettuare`
  ADD KEY `fk_id_intervento` (`fk_id_intervento`),
  ADD KEY `fk_id_meccanico` (`fk_id_meccanico`);

--
-- Indici per le tabelle `fattura`
--
ALTER TABLE `fattura`
  ADD PRIMARY KEY (`id_fattura`),
  ADD KEY `fk_id_operazione` (`fk_id_operazione`);

--
-- Indici per le tabelle `intervento`
--
ALTER TABLE `intervento`
  ADD PRIMARY KEY (`id_intervento`),
  ADD KEY `fk_id_operazione` (`fk_id_operazione`),
  ADD KEY `fd_id_anagrafico` (`fk_id_anagrafico`);

--
-- Indici per le tabelle `meccanico`
--
ALTER TABLE `meccanico`
  ADD PRIMARY KEY (`id_meccanico`),
  ADD UNIQUE KEY `matricola` (`matricola`);

--
-- Indici per le tabelle `operazione`
--
ALTER TABLE `operazione`
  ADD PRIMARY KEY (`id_operazione`),
  ADD KEY `fk_id_veicolo` (`fk_id_veicolo`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`id_prodotto`);

--
-- Indici per le tabelle `registrazione`
--
ALTER TABLE `registrazione`
  ADD PRIMARY KEY (`fk_id_cliente`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_id_cliente` (`fk_id_cliente`);

--
-- Indici per le tabelle `utilizzo`
--
ALTER TABLE `utilizzo`
  ADD KEY `fk_id_intervento` (`fk_id_intervento`),
  ADD KEY `fk_id_prodotto` (`fk_id_prodotto`);

--
-- Indici per le tabelle `veicolo`
--
ALTER TABLE `veicolo`
  ADD PRIMARY KEY (`id_veicolo`),
  ADD UNIQUE KEY `targa` (`targa`),
  ADD KEY `fk_id_cliente` (`fk_id_cliente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `amministratore`
--
ALTER TABLE `amministratore`
  MODIFY `idAmministratore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `anagrafica_intervento`
--
ALTER TABLE `anagrafica_intervento`
  MODIFY `id_anagrafico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT per la tabella `fattura`
--
ALTER TABLE `fattura`
  MODIFY `id_fattura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT per la tabella `intervento`
--
ALTER TABLE `intervento`
  MODIFY `id_intervento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `meccanico`
--
ALTER TABLE `meccanico`
  MODIFY `id_meccanico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `operazione`
--
ALTER TABLE `operazione`
  MODIFY `id_operazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `id_prodotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `veicolo`
--
ALTER TABLE `veicolo`
  MODIFY `id_veicolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `effettuare`
--
ALTER TABLE `effettuare`
  ADD CONSTRAINT `effettuare_ibfk_1` FOREIGN KEY (`fk_id_intervento`) REFERENCES `intervento` (`id_intervento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `effettuare_ibfk_2` FOREIGN KEY (`fk_id_meccanico`) REFERENCES `meccanico` (`id_meccanico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `fattura`
--
ALTER TABLE `fattura`
  ADD CONSTRAINT `fattura_ibfk_1` FOREIGN KEY (`fk_id_operazione`) REFERENCES `operazione` (`id_operazione`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `intervento`
--
ALTER TABLE `intervento`
  ADD CONSTRAINT `intervento_ibfk_1` FOREIGN KEY (`fk_id_operazione`) REFERENCES `operazione` (`id_operazione`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `intervento_ibfk_2` FOREIGN KEY (`fk_id_anagrafico`) REFERENCES `anagrafica_intervento` (`id_anagrafico`) ON DELETE NO ACTION;

--
-- Limiti per la tabella `operazione`
--
ALTER TABLE `operazione`
  ADD CONSTRAINT `operazione_ibfk_1` FOREIGN KEY (`fk_id_veicolo`) REFERENCES `veicolo` (`id_veicolo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `registrazione`
--
ALTER TABLE `registrazione`
  ADD CONSTRAINT `registrazione_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limiti per la tabella `utilizzo`
--
ALTER TABLE `utilizzo`
  ADD CONSTRAINT `utilizzo_ibfk_1` FOREIGN KEY (`fk_id_intervento`) REFERENCES `intervento` (`id_intervento`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `utilizzo_ibfk_2` FOREIGN KEY (`fk_id_prodotto`) REFERENCES `prodotto` (`id_prodotto`);

--
-- Limiti per la tabella `veicolo`
--
ALTER TABLE `veicolo`
  ADD CONSTRAINT `veicolo_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
