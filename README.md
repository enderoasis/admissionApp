## Про платформу 

Flutter — молодая, но очень многообещающая платформа, уже привлекшая к себе внимание крупных компаний, которые запустили свои приложения. Интересна эта платформа своей простотой сравнимой с разработкой веб-приложений, и скоростью работы на равне с нативными приложениями. Высокая производительность приложения и скорость разработки достигается за счет нескольких техник:

В отличии от многих известных на сегодняшний день мобильных платформ, Flutter не использует JavaScript ни в каком виде. В качестве языка программирования для Flutter выбрали Dart, который компилируется в бинарный код, за счет чего достигается скорость выполнения операций сравнимая с Objective-C, Swift, Java, или Kotlin.
Flutter не использует нативные компоненты, опять же, ни в каком виде, так что не приходится писать никаких прослоек для коммуникации с ними. Вместо этого, подобно игровым движкам (а вы ведь знаете что у игр очень динамичный UI), он отрисовывает весь интерфейс самостоятельно. Кнопки, текст, медиа-элементы, фон — все это отрисовывается внутри графического движка в самом Flutter. После вышесказанного стоит отметить, что “Hello World” приложение на Flutter занимает совсем немного места: iOS ≈ 2.5Mb и Android ≈ 4Mb.
Для построения UI во Flutter используется декларативный подход, вдохновленный веб-фреймворком ReactJS, на основе виджетов (в мире веба именуемых компонентами). Для еще большего прироста в скорости работы интерфейса виджеты перерисовываются по необходимости — только когда в них что-то изменилось (подобно тому как это делает Virtual DOM в мире веб-фронтенда).
В дополнение ко всему, в фреймворк встроен Hot-reload, такой привычный для веба, и до сих пор отсутствовавший в нативных платформах.

## Информация о проекте. 

Данный проект предназначен для приёмной комиссии университета

Для установки нужного окружения:

https://flutter.dev/docs/get-started/install

## Описание проекта

Трёхоконное мобильное приложения на платформах Android , IOS. <br>
Структура:<br>
1.Заявление<br>
Первое окно , целью которого является сбор и внесение введённой информации абитуриентом или сотрудником приёмной комиссии.
<br>

![Image alt](https://github.com/enderoasis/admissionApp/blob/master/assets/pic1.JPG)
<br>
2.Документы<br>
В этом разделе , осуществляется возможность загрузки нужных документов и.т.д <br>

![Image alt](https://github.com/enderoasis/admissionApp/blob/master/assets/pic2.JPG)

<br>
3.Новости<br>
Для своевременного оповещения абитуриентов о предстоящих мероприятиях и новостей.
<br>

![Image alt](https://github.com/enderoasis/admissionApp/blob/master/assets/pic3.JPG)

##Про структуру

Зайдем в папку со сгенерированным приложением и разберемся что у нас там есть. Не со всем, но с нужным: <br>


lib/ — По принципам pub (менеджер пакетов Dart’а) весь код лежит в этой подпапке;<br>
pubspec.yml — сюда записываются зависимости приложения<br>
test/ — Тесты. Запустить их можно вызвав flutter test;<br>
ios/ & android/ — папки с настройками для каждой из платформ, там указывается какие права нужны для запуска приложения (доступ к<br> локации, bluetooth), иконочки и все что специфично для платформы.<br>
