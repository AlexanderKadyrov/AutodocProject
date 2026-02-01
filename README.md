# AutodocProject - тестовое задание

Добрый день!

Предлагаю Вашему вниманию выполненное тестовое задание AutodocProject.
Проект выполнен для платформ iOS и iPadOS.

Предназначение проекта продемонстрировать навыки и умения автора работать с технологиями мобильной разработки Apple.

# Описание

В проекте реализован экран новостной ленты с использованием пагинированного списка.
Проект выполнен в модульном стиле с использованием нескольких слоев, каждый из которых разбит на логические модули.

Такой подход обусловлен тем, чтобы раскрыть умения автора делить проект на логические модули с применением инструмента менеджера зависимостей SPM.

Все модули выполнены автором данного проекта и нет сторонних зависимостей других авторов.

# SPM

В проекте используются следующие логические модули:

### Autodoc
Основной модуль проекта, включает в себя слои **Network** и **UI**
```https://github.com/AlexanderKadyrov/Autodoc```

### Network
Сетевой слой для работы с сетевыми запросов и кеширующей загрузкой изображений, включает в себя модуль внедрения зависимостей **DI**
```https://github.com/AlexanderKadyrov/Network```

### DI
Реализация внедрения зависимостей (Dependency Injection) с использованием **@propertyWrapper**, используется для сервисов и контроллеров
```https://github.com/AlexanderKadyrov/DI```

### UI
Слой UI по работе с UICollectionView и UIImageView
```https://github.com/AlexanderKadyrov/UI```

# UICollectionViewCompositionalLayout

В проекте применяется, унаследованный от **UICollectionViewCompositionalLayout**, **NewsCollectionViewLayout**. Данный layout предназначен для отображения блока новостей, в разном формате на разных устройствах, в зависимости от положения экрана.

### iOS Portrait
![](https://github.com/AlexanderKadyrov/AutodocProject/blob/master/Screenshots/screenshot_1.png?raw=true)

### iPadOS Portrait
![](https://github.com/AlexanderKadyrov/AutodocProject/blob/master/Screenshots/screenshot_2.png?raw=true)

### iPadOS Landscape
![](https://github.com/AlexanderKadyrov/AutodocProject/blob/master/Screenshots/screenshot_3.png?raw=true)