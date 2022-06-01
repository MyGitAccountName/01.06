-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 14 2022 г., 21:33
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
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `class` int(3) UNSIGNED NOT NULL,
  `file_name` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `name`, `class`, `file_name`) VALUES
(1, 'Гласные буквы и звуки', 1, 4),
(2, 'Междометия', 7, 23);

-- --------------------------------------------------------

--
-- Структура таблицы `books_subjects`
--

CREATE TABLE `books_subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(6) UNSIGNED NOT NULL,
  `subject_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books_subjects`
--

INSERT INTO `books_subjects` (`id`, `book_id`, `subject_id`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `books_subthemes`
--

CREATE TABLE `books_subthemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(6) UNSIGNED NOT NULL,
  `subtheme_id` int(32) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books_subthemes`
--

INSERT INTO `books_subthemes` (`id`, `book_id`, `subtheme_id`) VALUES
(1, 1, 2),
(2, 1, 4),
(3, 2, 23);

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
  `media` varchar(128) DEFAULT NULL COMMENT 'Путь к файлу',
  `hint` varchar(128) DEFAULT NULL COMMENT 'Подсказка'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questionbase`
--

INSERT INTO `questionbase` (`id`, `subject`, `theme1`, `theme2`, `class`, `type`, `text`, `var1`, `var2`, `var3`, `var4`, `answer`, `media`, `hint`) VALUES
(1, 1, 6, NULL, 1, 2, 'Найди слова-действия:', 'зелёный', 'бояться', 'столб', 'читать', '2,4', NULL, 'Что делать? Что делает?'),
(2, 1, 5, NULL, 1, 1, 'Сколько слогов в слове <b>ЯБЛОКО</b>?', '1', '2', '3', '4', '3', NULL, NULL),
(3, 1, 2, NULL, 1, 1, 'Сколько звуков в слове <b>ЯБЛОКО</b>?', '6', '7', '8', '9', '1', NULL, NULL),
(4, 1, 2, 4, 1, 3, 'Сколько гласных букв в слове <b>ПЫЛЬ</b>?', NULL, NULL, NULL, NULL, '1', NULL, NULL),
(5, 1, 1, 4, 1, 1, 'Сколько гласных букв в русском языке?', '6', '8', '10', '11', '3', NULL, NULL),
(6, 1, 1, 4, 1, 1, 'Сколько гласных звуков в русском языке?', '6', '8', '10', '11', '1', NULL, 'Меньше чем гласных букв'),
(7, 1, 2, 3, 1, 1, 'Сколько твёрдых согласных звуков в слове <b>ПОЛЯНКА</b>?', '1', '2', '3', '4', '1', NULL, NULL),
(8, 1, 2, 3, 1, 1, 'Сколько глухих согласных звуков в слове <b>ПОДУШКА</b>?', '1', '2', '3', '4', '3', NULL, NULL),
(9, 1, 5, NULL, 1, 3, 'Сколько слогов в слове <b>ПЛАНШЕТ</b>?', NULL, NULL, NULL, NULL, '2', NULL, NULL),
(10, 1, 2, 3, 1, 2, 'В каких словах два глухих согласных звука?', 'учебник', 'чаща', 'нитка', 'путь', '1,2,3,4', NULL, NULL),
(11, 1, 11, NULL, 2, 1, 'Подбери проверочное слово к слову <b>ЛЕСНИК</b>', 'лес', 'лесной', 'лесами', NULL, '1', NULL, NULL),
(12, 1, 11, NULL, 2, 1, 'Какую букву необходимо вставить в слово <b>Г...РА</b>?', 'о', 'а', NULL, NULL, '1', NULL, NULL),
(13, 1, 11, NULL, 2, 1, 'Нужна ли буква Т в слове <b>ЧУДЕС...НЫЙ</b>? ', 'нужна', 'не нужна', NULL, NULL, '2', NULL, NULL),
(14, 1, 11, NULL, 2, 1, 'Какую букву необходимо вставить в слово <b>ГР...БОК</b>?', 'и', 'е', NULL, NULL, '1', NULL, NULL),
(15, 1, 11, NULL, 2, 1, 'Какую букву необходимо вставить в слово <b>НО...</b>?', 'ш', 'ж', NULL, NULL, '2', NULL, NULL),
(16, 1, 11, NULL, 2, 1, 'Нужна ли буква Т в слове <b>ЯРОС...НЫЙ</b>?', 'нужна', 'не нужна', NULL, NULL, '1', NULL, NULL),
(17, 1, 11, NULL, 2, 1, 'Какую букву необходимо вставить в слово <b>ГОЛОЛЁ...</b>?', 'д', 'т', NULL, NULL, '1', NULL, NULL),
(18, 1, 11, NULL, 2, 1, 'Какую букву необходимо вставить в слово <b>РЫ...КА</b>?', 'п', 'б', NULL, NULL, '2', NULL, NULL),
(19, 1, 11, NULL, 2, 1, 'Какую букву необходимо вставить в слово <b>К...ЗА</b> ?', 'о', 'а', NULL, NULL, '1', NULL, NULL),
(20, 1, 11, NULL, 2, 1, 'Какую букву необходимо вставить в слово <b>МОРО...</b> ?', 'с', 'з', NULL, NULL, '2', NULL, NULL),
(21, 2, NULL, NULL, 3, 3, 'Запиши пропущенное слово:\r\n\r\nСквозь волнистые туманы\r\nПробирается луна,\r\nНа печальные поляны\r\nЛьёт печально ... она.', NULL, NULL, NULL, NULL, 'свет', NULL, NULL),
(22, 3, 30, NULL, 1, 1, '<b>5 + 6 = ?</b>', '1', '9', '11', '14', '3', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `id` int(3) UNSIGNED NOT NULL,
  `subjectName` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список предметов';

--
-- Дамп данных таблицы `subjects`
--

INSERT INTO `subjects` (`id`, `subjectName`) VALUES
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
  `subtheme` varchar(256) NOT NULL DEFAULT 'Общие вопросы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подтемы';

--
-- Дамп данных таблицы `subthemes`
--

INSERT INTO `subthemes` (`id`, `subject`, `theme`, `subtheme`) VALUES
(1, 1, 1, 'Общие вопросы'),
(2, 1, 2, 'Буквы и звуки'),
(3, 1, 2, 'Согласные буквы'),
(4, 1, 2, 'Гласные буквы'),
(5, 1, 3, 'Слоги'),
(6, 1, 3, 'Слова'),
(7, 1, 3, 'Состав слова'),
(8, 1, 4, 'Предложения'),
(9, 1, 4, 'Типы предложений'),
(10, 1, 4, 'Члены предложения'),
(11, 1, 5, 'Орфография'),
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
(24, 1, 7, 'Синтаксис. Пунктуация'),
(25, 1, 8, 'Лексика. Фразеология'),
(26, 1, 9, 'Морфемика. Морфология'),
(27, 3, 29, 'Общие вопросы'),
(28, 3, 29, 'Основные понятия'),
(29, 3, 29, 'Сравнение'),
(30, 3, 29, 'Сложение'),
(31, 3, 29, 'Вычитание');

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

CREATE TABLE `tests` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `subject` int(3) UNSIGNED DEFAULT NULL,
  `theme1` int(32) UNSIGNED DEFAULT NULL,
  `theme2` int(32) UNSIGNED DEFAULT NULL,
  `theme3` int(32) UNSIGNED DEFAULT NULL,
  `class` int(3) UNSIGNED DEFAULT NULL,
  `questions` varchar(128) DEFAULT NULL,
  `questionTime` int(3) UNSIGNED DEFAULT NULL COMMENT 'Время на вопрос (сек.)',
  `difficulty` int(1) NOT NULL DEFAULT '1' COMMENT 'от 1 до 3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tests`
--

INSERT INTO `tests` (`id`, `name`, `subject`, `theme1`, `theme2`, `theme3`, `class`, `questions`, `questionTime`, `difficulty`) VALUES
(1, 'Самое начало', 1, 2, 6, 5, 1, '1,2,3,4,5,6,7,8,9,10', 61, 1),
(2, 'Орфограммы в корне', 1, NULL, NULL, NULL, 2, '[11-20]', 30, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tests_subjects`
--

CREATE TABLE `tests_subjects` (
  `test_id` int(6) UNSIGNED NOT NULL,
  `subject_id` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tests_subjects`
--

INSERT INTO `tests_subjects` (`test_id`, `subject_id`) VALUES
(1, 1),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `tests_subthemes`
--

CREATE TABLE `tests_subthemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_id` int(6) UNSIGNED NOT NULL,
  `subtheme_id` int(32) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tests_subthemes`
--

INSERT INTO `tests_subthemes` (`id`, `test_id`, `subtheme_id`) VALUES
(1, 1, 2),
(2, 1, 5),
(3, 1, 6),
(4, 2, 11);

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
(9, 'Морфемика. Морфология'),
(10, 'Русские народные сказки'),
(11, 'Сказки народов мира'),
(12, 'Былины'),
(13, 'А. С. Пушкин'),
(14, 'Л. Н. Толстой'),
(15, 'М. Ю. Лермонтов'),
(16, 'Н. В. Гоголь'),
(17, 'И. С. Тургенев'),
(18, 'Ф. М. Достоевский'),
(19, 'А. П. Чехов'),
(20, 'Максим Горький'),
(21, 'М. А. Булгаков'),
(22, 'И. А. Бунин'),
(23, 'М. А. Шолохов'),
(24, 'В. В. Маяковский'),
(25, 'С. А. Есенин'),
(26, 'А. А. Ахматова'),
(27, 'А. Т. Твардовский'),
(28, 'А. И. Солженицын'),
(29, 'Элементарная математика'),
(30, 'Алгебра'),
(31, 'Геометрия'),
(32, 'Тригонометрия'),
(33, 'Математический анализ');

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
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books_subjects`
--
ALTER TABLE `books_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Индексы таблицы `books_subthemes`
--
ALTER TABLE `books_subthemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `subtheme_id` (`subtheme_id`);

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
  ADD KEY `theme` (`theme1`),
  ADD KEY `theme2` (`theme2`),
  ADD KEY `theme3` (`theme3`);

--
-- Индексы таблицы `tests_subjects`
--
ALTER TABLE `tests_subjects`
  ADD KEY `test_id` (`test_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Индексы таблицы `tests_subthemes`
--
ALTER TABLE `tests_subthemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `subtheme_id` (`subtheme_id`);

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
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `books_subjects`
--
ALTER TABLE `books_subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `books_subthemes`
--
ALTER TABLE `books_subthemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `questionbase`
--
ALTER TABLE `questionbase`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `subthemes`
--
ALTER TABLE `subthemes`
  MODIFY `id` int(32) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tests_subthemes`
--
ALTER TABLE `tests_subthemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books_subjects`
--
ALTER TABLE `books_subjects`
  ADD CONSTRAINT `books_subjects_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `books_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Ограничения внешнего ключа таблицы `books_subthemes`
--
ALTER TABLE `books_subthemes`
  ADD CONSTRAINT `books_subthemes_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `books_subthemes_ibfk_2` FOREIGN KEY (`subtheme_id`) REFERENCES `subthemes` (`id`);

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
  ADD CONSTRAINT `tests_ibfk_2` FOREIGN KEY (`theme1`) REFERENCES `subthemes` (`id`),
  ADD CONSTRAINT `tests_ibfk_3` FOREIGN KEY (`theme2`) REFERENCES `subthemes` (`id`),
  ADD CONSTRAINT `tests_ibfk_4` FOREIGN KEY (`theme3`) REFERENCES `subthemes` (`id`);

--
-- Ограничения внешнего ключа таблицы `tests_subjects`
--
ALTER TABLE `tests_subjects`
  ADD CONSTRAINT `tests_subjects_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`),
  ADD CONSTRAINT `tests_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Ограничения внешнего ключа таблицы `tests_subthemes`
--
ALTER TABLE `tests_subthemes`
  ADD CONSTRAINT `tests_subthemes_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`),
  ADD CONSTRAINT `tests_subthemes_ibfk_2` FOREIGN KEY (`subtheme_id`) REFERENCES `subthemes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
