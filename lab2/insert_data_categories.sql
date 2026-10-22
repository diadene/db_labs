-- ============================================================
-- УРОВЕНЬ 1: корневые разделы (parent_id = NULL)
-- ============================================================
insert into categories (parent_id, name) values (null, 'Электроника');
insert into categories (parent_id, name) values (null, 'Бытовая техника');
insert into categories (parent_id, name) values (null, 'Товары для дома');
insert into categories (parent_id, name) values (null, 'Одежда и обувь');
insert into categories (parent_id, name) values (null, 'Красота и здоровье');
insert into categories (parent_id, name) values (null, 'Детские товары');
insert into categories (parent_id, name) values (null, 'Спорт и отдых');
insert into categories (parent_id, name) values (null, 'Авто');
insert into categories (parent_id, name) values (null, 'Зоотовары');
insert into categories (parent_id, name) values (null, 'Дача и сад');
insert into categories (parent_id, name) values (null, 'Строительство и ремонт');
insert into categories (parent_id, name) values (null, 'Хобби и творчество');
insert into categories (parent_id, name) values (null, 'Книги и канцелярия');
insert into categories (parent_id, name) values (null, 'Продукты и напитки');
insert into categories (parent_id, name) values (null, 'Ювелирные изделия');
insert into categories (parent_id, name) values (null, 'Умный дом');

-- ============================================================
-- УРОВЕНЬ 2: подразделы
-- ============================================================

-- Электроника
insert into categories (parent_id, name) values ((select id from categories where name = 'Электроника'), 'Смартфоны и гаджеты');
insert into categories (parent_id, name) values ((select id from categories where name = 'Электроника'), 'Аудиотехника');
insert into categories (parent_id, name) values ((select id from categories where name = 'Электроника'), 'Компьютеры и комплектующие');
insert into categories (parent_id, name) values ((select id from categories where name = 'Электроника'), 'Фото и видео');

-- Бытовая техника
insert into categories (parent_id, name) values ((select id from categories where name = 'Бытовая техника'), 'Крупная бытовая техника');
insert into categories (parent_id, name) values ((select id from categories where name = 'Бытовая техника'), 'Мелкая бытовая техника');
insert into categories (parent_id, name) values ((select id from categories where name = 'Бытовая техника'), 'Климатическая техника');

-- Товары для дома
insert into categories (parent_id, name) values ((select id from categories where name = 'Товары для дома'), 'Мебель');
insert into categories (parent_id, name) values ((select id from categories where name = 'Товары для дома'), 'Текстиль');
insert into categories (parent_id, name) values ((select id from categories where name = 'Товары для дома'), 'Посуда и кухня');
insert into categories (parent_id, name) values ((select id from categories where name = 'Товары для дома'), 'Декор и интерьер');

-- Одежда и обувь
insert into categories (parent_id, name) values ((select id from categories where name = 'Одежда и обувь'), 'Женская одежда');
insert into categories (parent_id, name) values ((select id from categories where name = 'Одежда и обувь'), 'Мужская одежда');
insert into categories (parent_id, name) values ((select id from categories where name = 'Одежда и обувь'), 'Обувь');
insert into categories (parent_id, name) values ((select id from categories where name = 'Одежда и обувь'), 'Бельё и купальники');

-- Красота и здоровье
insert into categories (parent_id, name) values ((select id from categories where name = 'Красота и здоровье'), 'Косметика');
insert into categories (parent_id, name) values ((select id from categories where name = 'Красота и здоровье'), 'Парфюмерия');
insert into categories (parent_id, name) values ((select id from categories where name = 'Красота и здоровье'), 'Аптека и БАДы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Красота и здоровье'), 'Оптика');

-- Детские товары
insert into categories (parent_id, name) values ((select id from categories where name = 'Детские товары'), 'Детская одежда');
insert into categories (parent_id, name) values ((select id from categories where name = 'Детские товары'), 'Игрушки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Детские товары'), 'Товары для новорождённых');

-- Спорт и отдых
insert into categories (parent_id, name) values ((select id from categories where name = 'Спорт и отдых'), 'Фитнес');
insert into categories (parent_id, name) values ((select id from categories where name = 'Спорт и отдых'), 'Туризм и кемпинг');
insert into categories (parent_id, name) values ((select id from categories where name = 'Спорт и отдых'), 'Велоспорт');
insert into categories (parent_id, name) values ((select id from categories where name = 'Спорт и отдых'), 'Рыбалка');

-- Авто
insert into categories (parent_id, name) values ((select id from categories where name = 'Авто'), 'Автозапчасти');
insert into categories (parent_id, name) values ((select id from categories where name = 'Авто'), 'Автоэлектрика');
insert into categories (parent_id, name) values ((select id from categories where name = 'Авто'), 'Автоаксессуары');

-- Зоотовары
insert into categories (parent_id, name) values ((select id from categories where name = 'Зоотовары'), 'Корма');
insert into categories (parent_id, name) values ((select id from categories where name = 'Зоотовары'), 'Аксессуары для питомцев');
insert into categories (parent_id, name) values ((select id from categories where name = 'Зоотовары'), 'Ветеринарные препараты');

-- Дача и сад
insert into categories (parent_id, name) values ((select id from categories where name = 'Дача и сад'), 'Садовый инструмент');
insert into categories (parent_id, name) values ((select id from categories where name = 'Дача и сад'), 'Семена и удобрения');
insert into categories (parent_id, name) values ((select id from categories where name = 'Дача и сад'), 'Садовая мебель');

-- Строительство и ремонт
insert into categories (parent_id, name) values ((select id from categories where name = 'Строительство и ремонт'), 'Стройматериалы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Строительство и ремонт'), 'Сантехника');
insert into categories (parent_id, name) values ((select id from categories where name = 'Строительство и ремонт'), 'Инструмент');

-- Хобби и творчество
insert into categories (parent_id, name) values ((select id from categories where name = 'Хобби и творчество'), 'Рукоделие');
insert into categories (parent_id, name) values ((select id from categories where name = 'Хобби и творчество'), 'Художественные товары');
insert into categories (parent_id, name) values ((select id from categories where name = 'Хобби и творчество'), 'Музыкальные инструменты');

-- Книги и канцелярия
insert into categories (parent_id, name) values ((select id from categories where name = 'Книги и канцелярия'), 'Книги');
insert into categories (parent_id, name) values ((select id from categories where name = 'Книги и канцелярия'), 'Канцелярия');

-- Продукты и напитки
insert into categories (parent_id, name) values ((select id from categories where name = 'Продукты и напитки'), 'Кофе и чай');
insert into categories (parent_id, name) values ((select id from categories where name = 'Продукты и напитки'), 'Сладости');

-- Ювелирные изделия
insert into categories (parent_id, name) values ((select id from categories where name = 'Ювелирные изделия'), 'Украшения');
insert into categories (parent_id, name) values ((select id from categories where name = 'Ювелирные изделия'), 'Бижутерия');

-- Умный дом
insert into categories (parent_id, name) values ((select id from categories where name = 'Умный дом'), 'Безопасность');
insert into categories (parent_id, name) values ((select id from categories where name = 'Умный дом'), 'Управление');

-- ============================================================
-- УРОВЕНЬ 3: конкретные категории
-- ============================================================

-- Смартфоны и гаджеты
insert into categories (parent_id, name) values ((select id from categories where name = 'Смартфоны и гаджеты'), 'Смартфоны');
insert into categories (parent_id, name) values ((select id from categories where name = 'Смартфоны и гаджеты'), 'Умные часы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Смартфоны и гаджеты'), 'Аксессуары для смартфонов');

-- Аудиотехника
insert into categories (parent_id, name) values ((select id from categories where name = 'Аудиотехника'), 'Наушники');
insert into categories (parent_id, name) values ((select id from categories where name = 'Аудиотехника'), 'Портативные колонки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Аудиотехника'), 'Студийное оборудование');

-- Компьютеры и комплектующие
insert into categories (parent_id, name) values ((select id from categories where name = 'Компьютеры и комплектующие'), 'Ноутбуки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Компьютеры и комплектующие'), 'Видеокарты');
insert into categories (parent_id, name) values ((select id from categories where name = 'Компьютеры и комплектующие'), 'Корпуса и охлаждение');

-- Фото и видео
insert into categories (parent_id, name) values ((select id from categories where name = 'Фото и видео'), 'Фотоаппараты');
insert into categories (parent_id, name) values ((select id from categories where name = 'Фото и видео'), 'Объективы');

-- Крупная бытовая техника
insert into categories (parent_id, name) values ((select id from categories where name = 'Крупная бытовая техника'), 'Холодильники');
insert into categories (parent_id, name) values ((select id from categories where name = 'Крупная бытовая техника'), 'Стиральные машины');
insert into categories (parent_id, name) values ((select id from categories where name = 'Крупная бытовая техника'), 'Посудомоечные машины');

-- Мелкая бытовая техника
insert into categories (parent_id, name) values ((select id from categories where name = 'Мелкая бытовая техника'), 'Блендеры');
insert into categories (parent_id, name) values ((select id from categories where name = 'Мелкая бытовая техника'), 'Мультиварки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Мелкая бытовая техника'), 'Кофемашины');

-- Климатическая техника
insert into categories (parent_id, name) values ((select id from categories where name = 'Климатическая техника'), 'Кондиционеры');
insert into categories (parent_id, name) values ((select id from categories where name = 'Климатическая техника'), 'Увлажнители воздуха');

-- Мебель
insert into categories (parent_id, name) values ((select id from categories where name = 'Мебель'), 'Столы и стулья');
insert into categories (parent_id, name) values ((select id from categories where name = 'Мебель'), 'Шкафы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Мебель'), 'Мягкая мебель');

-- Текстиль
insert into categories (parent_id, name) values ((select id from categories where name = 'Текстиль'), 'Постельное бельё');
insert into categories (parent_id, name) values ((select id from categories where name = 'Текстиль'), 'Матрасы и подушки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Текстиль'), 'Полотенца');

-- Посуда и кухня
insert into categories (parent_id, name) values ((select id from categories where name = 'Посуда и кухня'), 'Наборы кастрюль');
insert into categories (parent_id, name) values ((select id from categories where name = 'Посуда и кухня'), 'Кухонные принадлежности');

-- Декор и интерьер
insert into categories (parent_id, name) values ((select id from categories where name = 'Декор и интерьер'), 'Керамика ручной работы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Декор и интерьер'), 'Свечи и ароматы');

-- Женская одежда
insert into categories (parent_id, name) values ((select id from categories where name = 'Женская одежда'), 'Платья и юбки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Женская одежда'), 'Верхняя одежда');

-- Мужская одежда
insert into categories (parent_id, name) values ((select id from categories where name = 'Мужская одежда'), 'Рубашки и футболки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Мужская одежда'), 'Брюки и джинсы');

-- Обувь
insert into categories (parent_id, name) values ((select id from categories where name = 'Обувь'), 'Кроссовки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Обувь'), 'Ботинки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Обувь'), 'Домашняя обувь');

-- Бельё и купальники
insert into categories (parent_id, name) values ((select id from categories where name = 'Бельё и купальники'), 'Женское бельё');
insert into categories (parent_id, name) values ((select id from categories where name = 'Бельё и купальники'), 'Купальники');

-- Косметика
insert into categories (parent_id, name) values ((select id from categories where name = 'Косметика'), 'Уход за кожей');
insert into categories (parent_id, name) values ((select id from categories where name = 'Косметика'), 'Макияж');
insert into categories (parent_id, name) values ((select id from categories where name = 'Косметика'), 'Средства для волос');

-- Парфюмерия
insert into categories (parent_id, name) values ((select id from categories where name = 'Парфюмерия'), 'Женская парфюмерия');
insert into categories (parent_id, name) values ((select id from categories where name = 'Парфюмерия'), 'Мужская парфюмерия');

-- Аптека и БАДы
insert into categories (parent_id, name) values ((select id from categories where name = 'Аптека и БАДы'), 'Витамины и БАДы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Аптека и БАДы'), 'Медицинские приборы');

-- Оптика
insert into categories (parent_id, name) values ((select id from categories where name = 'Оптика'), 'Очки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Оптика'), 'Контактные линзы');

-- Детская одежда
insert into categories (parent_id, name) values ((select id from categories where name = 'Детская одежда'), 'Одежда для малышей');
insert into categories (parent_id, name) values ((select id from categories where name = 'Детская одежда'), 'Одежда для школьников');

-- Игрушки
insert into categories (parent_id, name) values ((select id from categories where name = 'Игрушки'), 'Конструкторы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Игрушки'), 'Настольные игры');
insert into categories (parent_id, name) values ((select id from categories where name = 'Игрушки'), 'Мягкие игрушки');

-- Товары для новорождённых
insert into categories (parent_id, name) values ((select id from categories where name = 'Товары для новорождённых'), 'Коляски');
insert into categories (parent_id, name) values ((select id from categories where name = 'Товары для новорождённых'), 'Автокресла');

-- Фитнес
insert into categories (parent_id, name) values ((select id from categories where name = 'Фитнес'), 'Спортивная одежда');
insert into categories (parent_id, name) values ((select id from categories where name = 'Фитнес'), 'Спортивное питание');

-- Туризм и кемпинг
insert into categories (parent_id, name) values ((select id from categories where name = 'Туризм и кемпинг'), 'Палатки и спальники');
insert into categories (parent_id, name) values ((select id from categories where name = 'Туризм и кемпинг'), 'Мангалы и грили');
insert into categories (parent_id, name) values ((select id from categories where name = 'Туризм и кемпинг'), 'Термосы и фонари');

-- Велоспорт
insert into categories (parent_id, name) values ((select id from categories where name = 'Велоспорт'), 'Велосипеды');
insert into categories (parent_id, name) values ((select id from categories where name = 'Велоспорт'), 'Велоаксессуары');

-- Рыбалка
insert into categories (parent_id, name) values ((select id from categories where name = 'Рыбалка'), 'Удочки и снасти');
insert into categories (parent_id, name) values ((select id from categories where name = 'Рыбалка'), 'Эхолоты');

-- Автозапчасти
insert into categories (parent_id, name) values ((select id from categories where name = 'Автозапчасти'), 'Аккумуляторы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Автозапчасти'), 'Расходники');

-- Автоэлектрика
insert into categories (parent_id, name) values ((select id from categories where name = 'Автоэлектрика'), 'Автомобильные лампы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Автоэлектрика'), 'LED-освещение');

-- Автоаксессуары
insert into categories (parent_id, name) values ((select id from categories where name = 'Автоаксессуары'), 'Чехлы и коврики');
insert into categories (parent_id, name) values ((select id from categories where name = 'Автоаксессуары'), 'Держатели и зарядки');

-- Корма
insert into categories (parent_id, name) values ((select id from categories where name = 'Корма'), 'Корм для кошек');
insert into categories (parent_id, name) values ((select id from categories where name = 'Корма'), 'Корм для собак');

-- Аксессуары для питомцев
insert into categories (parent_id, name) values ((select id from categories where name = 'Аксессуары для питомцев'), 'Лежанки и домики');
insert into categories (parent_id, name) values ((select id from categories where name = 'Аксессуары для питомцев'), 'Игрушки для питомцев');

-- Ветеринарные препараты
insert into categories (parent_id, name) values ((select id from categories where name = 'Ветеринарные препараты'), 'Средства от паразитов');
insert into categories (parent_id, name) values ((select id from categories where name = 'Ветеринарные препараты'), 'Витамины для животных');

-- Садовый инструмент
insert into categories (parent_id, name) values ((select id from categories where name = 'Садовый инструмент'), 'Ручной инструмент');
insert into categories (parent_id, name) values ((select id from categories where name = 'Садовый инструмент'), 'Садовая техника');

-- Семена и удобрения
insert into categories (parent_id, name) values ((select id from categories where name = 'Семена и удобрения'), 'Семена овощей');
insert into categories (parent_id, name) values ((select id from categories where name = 'Семена и удобрения'), 'Удобрения');

-- Садовая мебель
insert into categories (parent_id, name) values ((select id from categories where name = 'Садовая мебель'), 'Садовые качели');
insert into categories (parent_id, name) values ((select id from categories where name = 'Садовая мебель'), 'Беседки и зонты');

-- Стройматериалы
insert into categories (parent_id, name) values ((select id from categories where name = 'Стройматериалы'), 'Краски и лаки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Стройматериалы'), 'Строительные смеси');

-- Сантехника
insert into categories (parent_id, name) values ((select id from categories where name = 'Сантехника'), 'Смесители');
insert into categories (parent_id, name) values ((select id from categories where name = 'Сантехника'), 'Трубы и фитинги');

-- Инструмент
insert into categories (parent_id, name) values ((select id from categories where name = 'Инструмент'), 'Электроинструмент');
insert into categories (parent_id, name) values ((select id from categories where name = 'Инструмент'), 'Ручной инструмент (строительный)');

-- Рукоделие
insert into categories (parent_id, name) values ((select id from categories where name = 'Канцелярия'), 'Ручки и карандаши');
insert into categories (parent_id, name) values ((select id from categories where name = 'Кофе и чай'), 'Кофе в зёрнах');

-- Кофе и чай
insert into categories (parent_id, name) values ((select id from categories where name = 'Кофе и чай'), 'Чай');
insert into categories (parent_id, name) values ((select id from categories where name = 'Сладости'), 'Шоколад');

-- Сладости
insert into categories (parent_id, name) values ((select id from categories where name = 'Сладости'), 'Печенье');
insert into categories (parent_id, name) values ((select id from categories where name = 'Украшения'), 'Кольца');

-- Украшения
insert into categories (parent_id, name) values ((select id from categories where name = 'Украшения'), 'Серьги');
insert into categories (parent_id, name) values ((select id from categories where name = 'Украшения'), 'Цепочки и браслеты');
insert into categories (parent_id, name) values ((select id from categories where name = 'Бижутерия'), 'Броши');

-- Бижутерия
insert into categories (parent_id, name) values ((select id from categories where name = 'Бижутерия'), 'Заколки');
insert into categories (parent_id, name) values ((select id from categories where name = 'Безопасность'), 'Камеры видеонаблюдения');

-- Безопасность
insert into categories (parent_id, name) values ((select id from categories where name = 'Безопасность'), 'Датчики движения');
insert into categories (parent_id, name) values ((select id from categories where name = 'Управление'), 'Умные розетки');

-- Управление
insert into categories (parent_id, name) values ((select id from categories where name = 'Управление'), 'Умные лампы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Рукоделие'), 'Пряжа и спицы');
insert into categories (parent_id, name) values ((select id from categories where name = 'Рукоделие'), 'Наборы для вышивания');

-- Художественные товары
insert into categories (parent_id, name) values ((select id from categories where name = 'Художественные товары'), 'Краски и кисти');
insert into categories (parent_id, name) values ((select id from categories where name = 'Художественные товары'), 'Мольберты');

-- Музыкальные инструменты
insert into categories (parent_id, name) values ((select id from categories where name = 'Музыкальные инструменты'), 'Гитары');
insert into categories (parent_id, name) values ((select id from categories where name = 'Музыкальные инструменты'), 'Клавишные');

-- Книги
insert into categories (parent_id, name) values ((select id from categories where name = 'Книги'), 'Художественная литература');
insert into categories (parent_id, name) values ((select id from categories where name = 'Книги'), 'Нон-фикшн');
insert into categories (parent_id, name) values ((select id from categories where name = 'Книги'), 'Учебники');

-- Канцелярия
insert into categories (parent_id, name) values ((select id from categories where name = 'Канцелярия'), 'Бумага и блокноты');
