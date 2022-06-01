-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 15 2022 г., 21:46
-- Версия сервера: 5.7.33-log
-- Версия PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `questions`
--

-- --------------------------------------------------------

--
-- Структура таблицы `questionbase`
--

CREATE TABLE `questionbase` (
  `id` int(11) UNSIGNED NOT NULL,
  `subject` int(3) UNSIGNED NOT NULL COMMENT 'Предмет',
  `theme1` int(8) UNSIGNED DEFAULT NULL COMMENT 'Тема 1',
  `theme2` int(8) UNSIGNED DEFAULT NULL COMMENT 'Тема 2',
  `class` int(3) UNSIGNED NOT NULL COMMENT '1-11',
  `type` int(3) UNSIGNED NOT NULL COMMENT 'Тип',
  `text` varchar(255) DEFAULT NULL COMMENT 'Формулировка',
  `var1` varchar(128) DEFAULT NULL COMMENT 'Вариант 1',
  `var2` varchar(128) DEFAULT NULL COMMENT 'Вариант 2',
  `var3` varchar(128) DEFAULT NULL COMMENT 'Вариант 3',
  `var4` varchar(128) DEFAULT NULL COMMENT 'Вариант 4',
  `answer` varchar(64) NOT NULL COMMENT 'Правильный ответ',
  `media` varchar(128) DEFAULT NULL COMMENT 'Путь к файлу'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questionbase`
--

INSERT INTO `questionbase` (`id`, `subject`, `theme1`, `theme2`, `class`, `type`, `text`, `var1`, `var2`, `var3`, `var4`, `answer`, `media`) VALUES
(1, 1, 6, NULL, 1, 2, 'Найди слова-действия:', 'Зелёный', 'Бояться', 'Столб', 'Читать', '2,4', NULL),
(2, 1, 5, NULL, 1, 1, 'Сколько слогов в слове ЯБЛОКО?', '1', '2', '3', '4', '3', NULL),
(3, 1, 2, NULL, 2, 1, 'Сколько звуков в слове ЯБЛОКО?', '6', '7', '8', '9', '1', NULL),
(4, 1, 2, 4, 1, 3, 'Сколько гласных букв в слове <b>ПЫЛЬ</b>?', NULL, NULL, NULL, NULL, '1', NULL),
(5, 1, 1, 4, 1, 1, 'Сколько гласных букв в русском языке?', '6', '8', '10', '11', '10', NULL),
(6, 1, 1, 4, 1, 1, 'Сколько гласных звуков в русском языке?', '6', '8', '10', '11', '6', NULL),
(41, 2, NULL, NULL, 3, 3, 'Запиши пропущенное слово:\r\n\r\nСквозь волнистые туманы\r\nПробирается луна,\r\nНа печальные поляны\r\nЛьёт печально ... она.', NULL, NULL, NULL, NULL, 'свет', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `id` int(3) UNSIGNED NOT NULL,
  `SubjectName` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список предметов';

--
-- Дамп данных таблицы `subjects`
--

INSERT INTO `subjects` (`id`, `SubjectName`) VALUES
(1, 'Русский язык'),
(2, 'Литература'),
(3, 'Математика'),
(4, 'История'),
(5, 'Информатика'),
(6, 'Физика'),
(7, 'Химия'),
(8, 'География'),
(9, 'Биология'),
(10, 'Английский язык'),
(11, 'Обществознание');

-- --------------------------------------------------------

--
-- Структура таблицы `subthemes`
--

CREATE TABLE `subthemes` (
  `id` int(32) UNSIGNED NOT NULL,
  `subject` int(3) UNSIGNED NOT NULL,
  `theme` int(8) UNSIGNED NOT NULL,
  `subtheme` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подтемы';

--
-- Дамп данных таблицы `subthemes`
--

INSERT INTO `subthemes` (`id`, `subject`, `theme`, `subtheme`) VALUES
(1, 1, 1, NULL),
(2, 1, 2, NULL),
(3, 1, 2, 'Согласные буквы'),
(4, 1, 2, 'Гласные буквы'),
(5, 1, 2, 'Слоги'),
(6, 1, 3, NULL),
(7, 1, 3, 'Состав слова'),
(8, 1, 4, NULL),
(9, 1, 4, 'Типы предложений'),
(10, 1, 4, 'Члены предложения'),
(11, 1, 5, NULL),
(12, 1, 6, 'Имена существительные'),
(13, 1, 6, 'Имена прилагательные'),
(14, 1, 6, 'Имена числительные'),
(15, 1, 6, 'Глаголы'),
(16, 1, 6, 'Местоимения'),
(17, 1, 6, 'Наречия'),
(18, 1, 6, 'Причастия'),
(19, 1, 6, 'Деепричастия'),
(20, 1, 6, 'Предлоги'),
(21, 1, 6, 'Союзы'),
(22, 1, 6, 'Частицы'),
(23, 1, 6, 'Междометия'),
(24, 1, 7, NULL),
(25, 1, 8, NULL),
(26, 1, 9, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

CREATE TABLE `tests` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `subject` int(3) UNSIGNED DEFAULT NULL,
  `theme` int(3) UNSIGNED DEFAULT NULL,
  `class` int(3) UNSIGNED DEFAULT NULL,
  `qestions` varchar(128) DEFAULT NULL,
  `size` int(3) DEFAULT NULL COMMENT 'Если кол-во не равно 10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tests`
--

INSERT INTO `tests` (`id`, `name`, `subject`, `theme`, `class`, `qestions`, `size`) VALUES
(1, '', 1, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `themes`
--

CREATE TABLE `themes` (
  `id` int(8) UNSIGNED NOT NULL,
  `theme` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `themes`
--

INSERT INTO `themes` (`id`, `theme`) VALUES
(1, 'Общие вопросы'),
(2, 'Буквы и звуки'),
(3, 'Слова'),
(4, 'Предложения'),
(5, 'Орфография'),
(6, 'Части речи'),
(7, 'Синтаксис. Пунктуация'),
(8, 'Лексика. Фразеология'),
(9, 'Морфемика. Морфология');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id` int(3) UNSIGNED NOT NULL,
  `Type` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `Type`) VALUES
(1, 'Выбор одного варианта'),
(2, 'Выбор нескольких вариантов'),
(3, 'Запись ответа');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `questionbase`
--
ALTER TABLE `questionbase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Предмет` (`subject`),
  ADD KEY `Тип` (`type`),
  ADD KEY `theme` (`theme1`),
  ADD KEY `Тема 2` (`theme2`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subthemes`
--
ALTER TABLE `subthemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject`),
  ADD KEY `theme` (`theme`);

--
-- Индексы таблицы `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject`),
  ADD KEY `theme` (`theme`);

--
-- Индексы таблицы `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `questionbase`
--
ALTER TABLE `questionbase`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `subthemes`
--
ALTER TABLE `subthemes`
  MODIFY `id` int(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `questionbase`
--
ALTER TABLE `questionbase`
  ADD CONSTRAINT `Предмет` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `Тема 1` FOREIGN KEY (`theme1`) REFERENCES `subthemes` (`id`),
  ADD CONSTRAINT `Тема 2` FOREIGN KEY (`theme2`) REFERENCES `subthemes` (`id`),
  ADD CONSTRAINT `Тип` FOREIGN KEY (`type`) REFERENCES `types` (`id`);

--
-- Ограничения внешнего ключа таблицы `subthemes`
--
ALTER TABLE `subthemes`
  ADD CONSTRAINT `subthemes_ibfk_1` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `subthemes_ibfk_2` FOREIGN KEY (`theme`) REFERENCES `themes` (`id`);

--
-- Ограничения внешнего ключа таблицы `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `tests_ibfk_2` FOREIGN KEY (`theme`) REFERENCES `themes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
