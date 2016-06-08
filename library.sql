-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 08 2016 г., 15:19
-- Версия сервера: 5.5.45
-- Версия PHP: 5.4.44

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `descript` text NOT NULL,
  `foto` varchar(100) NOT NULL,
  `ssilka` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `name`, `descript`, `foto`, `ssilka`) VALUES
(3, 'Ударные согласные', 'О пиарщиках умирающего завода, молодых самонадеянных властителях провинциальных умов, пытающихся корпоративным духом ударить по экономическому кризису, казнокрадству и разгильдяйству.', 'ud_sogl.jpg', '1-ja_trilogija_o_Serom_Legione_Smerti-2_Zvezda_naemnikov.txt'),
(45, '1-я трилогия о Сером Легионе', '(3030 г.)Герой этого романа оказался в безвыходной ситуации на мрачной планете Треллван. Победив в неравной схватке с бандитами и сформировав свой отряд, он становится жертвой интриг и чудом избегает смерти. На захваченных у врага боевых работах, он вместе с отрядом совершает дерзкую и удачную попытку восстановления на Треллване порядка. Полным разгромом армии противника он мстит за убитого отца.', '09014102.cover_185.jpg', '1-ja_trilogija_o_Serom_Legione_Smerti-1_Bitva.txt'),
(46, 'Звезда наемников', '(3031 г.)В битвах на планете Треллван Грейсон Карлайл создал великолепный отряд наемников. Вскоре они получили важное задание — помочь фермерам-повстанцам некогда мирной планеты Верзанди. И хотя Грейсон Карлайл считается опытным воином, объединение разрозненных отрядов повстанцев в борьбе против оккупантов очень трудное дело. Отряд Грейсона должен победить или погибнуть, потому что честь и совесть и в третьем тысячелетии иногда оказываются сильнее меркантильных расчетов.', '18919.jpg', '1-ja_trilogija_o_Serom_Legione_Smerti-1_Bitva.txt'),
(47, 'Апокалипсис', 'Умов, пытающихся корпоративным духом ударить по экономическому кризису, казнокрадству и разгильдяйству.', '18919.jpg', '1-ja_trilogija_o_Serom_Legione_Smerti-1_Bitva.txt'),
(51, 'йц', 'цу', '', '1-ja_trilogija_o_Serom_Legione_Smerti-1_Bitva (2).txt');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(4, 'Детективы'),
(5, 'Драма'),
(10, 'Ужасы'),
(16, 'Фантастика');

-- --------------------------------------------------------

--
-- Структура таблицы `relation`
--

CREATE TABLE IF NOT EXISTS `relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_book` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`,`id_category`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `relation`
--

INSERT INTO `relation` (`id`, `id_book`, `id_category`) VALUES
(20, 3, 4),
(25, 45, 10),
(27, 46, 5),
(26, 47, 16),
(31, 51, 4);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `relation`
--
ALTER TABLE `relation`
  ADD CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
