-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Kwi 2023, 12:03
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cms_js`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`, `value`) VALUES
(9, 33, 3, 1),
(10, 32, 3, 1),
(14, 34, 3, -1),
(16, 32, 4, 1),
(19, 33, 4, 1),
(20, 34, 4, -1),
(22, 35, 4, -1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `filename` varchar(265) NOT NULL,
  `title` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `timestamp`, `filename`, `title`, `userId`, `removed`) VALUES
(32, '2023-03-29 12:07:24', 'img/d1eb7365e8f15afbad65b24b2fb08c32ba658399e6798a8912e37ed289cee06d.webp', '', 3, 0),
(33, '2023-03-29 12:10:18', 'img/bdf8c5e6d6da99c8d2e11d7333e6896be560c4c8ad2863ba640681c6606426df.webp', 'sdasda', 3, 0),
(34, '2023-04-12 10:31:32', 'img/fdab8997d109d5da2dec3b85275500cb821f4ef74fa7241d4409b1950c0a880c.webp', 'shrek', 3, 0),
(35, '2023-04-19 11:35:32', 'img/49785397644c7edd89598df639ef6883e6586345088bf233ceaf959808b8c768.webp', 'shrek i bagno', 4, 0),
(36, '2023-04-26 10:28:31', 'img/079121303a9d93064b107490ebec417ee6f21115ff590ebf90f5ac007994affb.webp', 'gówno ', 4, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(3, 'admin@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$ckZNTmlXN2RqdkxHSEI4bw$PGCbzNxX+BDxAiyuMQTEXSL+FEhAVW7Yk5taypMwyLw'),
(4, 'admin1@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$TGhtSHpNbFI4T0wuZExnNg$seHgC/xXaxEd2YzFrt+X5AnoLNLc2/Ul65Q1+2jt+64'),
(5, 'adf@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$WFdGbzhveWQucDBuN0E2Tg$+HB8SFqqUV2K9NiZ9FaSAY57Rv6+rdN+6v0zub2FV/I');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
