-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 24 2018 г., 13:45
-- Версия сервера: 5.5.58
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vevoblog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `date` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `article`
--

INSERT INTO `article` (`id`, `title`, `description`, `content`, `date`, `image`, `viewed`, `user_id`, `status`, `category_id`) VALUES
(7, 'Создать приложение-задачник', '<p>Создать приложение-задачник.</p>\r\n\r\n<p>Задачи состоят из:</p>\r\n\r\n<ul>\r\n	<li>имени пользователя;</li>\r\n	<li>е-mail;</li>\r\n	<li>текста задачи;</li>\r\n	<li>картинки;</li>\r\n</ul>\r\n', '<p>Стартовая страница - список задач с возможностью сортировки по имени пользователя, email и статусу. Вывод задач нужно сделать страницами по 3 штуки (с пагинацией). Видеть список задач и создавать новые может любой посетитель без регистрации.</p>\r\n\r\n<p>Перед сохранением новой задачи можнонажать &quot;Предварительный просмотр&quot;, он должен работать без перезагрузки страницы.</p>\r\n\r\n<p>К задаче можно прикрепить картинку. Требования к изображениям - формат JPG/GIF/PNG, не более 320х240 пикселей. При попытке загрузить изображение большего размера, картинка должна быть пропорционально уменьшена до заданных размеров.</p>\r\n\r\n<p>Сделайте вход для администратора (логин &quot;admin&quot;, пароль &quot;123&quot;). Администратор имеет возможность редактировать текст задачи и поставить галочку о выполнении. Выполненные задачи в общем списке выводятся с соответствующей отметкой.</p>\r\n\r\n<p>В приложении нужно с помощью чистого PHP реализовать модель MVC. Фреймворки PHP использовать нельзя, библиотеки - можно. Верстка на bootstrap. К дизайну особых требований нет, должно выглядеть аккуратно.</p>\r\n\r\n<p>https://task.vevovip.kz</p>\r\n', '2018-06-24', '88965e479611d283022822f947ed7ff6.png', 6, 2, NULL, 4),
(8, 'Персональный блог Yii2', '<blockquote>\r\n<p>Использованы возможности фреймворка:</p>\r\n</blockquote>\r\n\r\n<p>Миграции, модуль, GII, модели, CRUD.</p>\r\n', '<p>В данном проекте вы увидите:</p>\r\n\r\n<ul>\r\n	<li>На главной странице - посты (статьи), снизу будет пагинация</li>\r\n	<li>Разделение статей по категориям и тегам</li>\r\n	<li>Справа сайдбар, в котором популярные статьи, последние статьи и список категорий</li>\r\n	<li>В детальном просмотре статьи - полный текст, и комментарии</li>\r\n	<li>Нажав по категории, выводятся посты данной категории</li>\r\n	<li>Сверху страница авторизации, также можно войти через Вконтакте и доступна регистрация</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>В админ панели, создание статей, категорий, тегов.\r\n	<ul>\r\n		<li>Разрешение или удаление комментарией, которые могут видеть все, но оставлять комментарии только зарегистрированные пользователи</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n', '2018-06-24', '424e8d309f086e49519afd5331c82a19.png', 7, 2, NULL, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `article_tag`
--

CREATE TABLE `article_tag` (
  `id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `article_tag`
--

INSERT INTO `article_tag` (`id`, `article_id`, `tag_id`) VALUES
(12, 7, 4),
(13, 8, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(4, 'Projects');

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1525628104),
('m180506_155242_create_article_table', 1525628109),
('m180506_155305_create_category_table', 1525628109),
('m180506_155328_create_tag_table', 1525628109),
('m180506_155335_create_user_table', 1525628109),
('m180506_165905_create_comment_table', 1525628110),
('m180506_165934_create_article_tag_table', 1525628110),
('m180513_062205_add_date_to_comment', 1526192667);

-- --------------------------------------------------------

--
-- Структура таблицы `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tag`
--

INSERT INTO `tag` (`id`, `title`) VALUES
(4, 'project');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `isAdmin`, `photo`) VALUES
(32331008, 'Роман', NULL, NULL, 1, 'https://pp.userapi.com/c841338/v841338462/4956d/c64PNf3HuMY.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `article_tag`
--
ALTER TABLE `article_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_article_article_id` (`article_id`),
  ADD KEY `idx_tag_id` (`tag_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-post-user_id` (`user_id`),
  ADD KEY `idx-article_id` (`article_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `article_tag`
--
ALTER TABLE `article_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32331009;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `article_tag`
--
ALTER TABLE `article_tag`
  ADD CONSTRAINT `fk-tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tag_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk-article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-post-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
