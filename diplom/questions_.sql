-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 20 2021 г., 11:35
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
  `theme` int(3) UNSIGNED DEFAULT NULL COMMENT 'тема',
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

INSERT INTO `questionbase` (`id`, `subject`, `theme`, `class`, `type`, `text`, `var1`, `var2`, `var3`, `var4`, `answer`, `media`) VALUES
(1, 1, 2, 1, 2, 'Найди слова-действия:', 'Зелёный', 'Бояться', 'Столб', 'Читать', '2,4', NULL),
(2, 1, 2, 1, 1, 'Сколько слогов в слове ЯБЛОКО?', '1', '2', '3', '4', '3', NULL),
(3, 1, 3, 2, 1, 'Сколько звуков в слове ЯБЛОКО?', '6', '7', '8', '9', '1', NULL),
(4, 2, NULL, 3, 3, 'Запиши пропущенное слово:\r\n\r\nСквозь волнистые туманы\r\nПробирается луна,\r\nНа печальные поляны\r\nЛьёт печально ... она.', NULL, NULL, NULL, NULL, 'свет', NULL);

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
-- Структура таблицы `themes`
--

CREATE TABLE `themes` (
  `id` int(3) UNSIGNED NOT NULL,
  `theme` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `themes`
--

INSERT INTO `themes` (`id`, `theme`) VALUES
(1, 'Общие вопросы'),
(2, 'Слова и слоги'),
(3, 'Буквы и звуки'),
(4, 'Правописание');

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
  ADD KEY `theme` (`theme`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `questionbase_ibfk_1` FOREIGN KEY (`theme`) REFERENCES `themes` (`id`),
  ADD CONSTRAINT `Предмет` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `Тип` FOREIGN KEY (`type`) REFERENCES `types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
