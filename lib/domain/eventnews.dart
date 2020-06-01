import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      );

  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// Вложенные списки вопросов
final List<Entry> data = <Entry>[
  Entry(
    'Как поступить?',
    <Entry>[
      Entry(
        'Заполнить форму, заполнить заявление на участие в конкурсе, сфотографировать и отправить через приложение.',
        <Entry>[
          Entry('Сертификат ЕНТ;'),
          Entry('Аттестат или диплом об окончании начального профессионального или общего среднего учебного заведения (оригинал);'),
          Entry('Удостоверение личности оригинал (дополнительно копия);'),
          Entry('Медицинская справка, форма 086/у;'),
          Entry('Копию международного сертификата IELTS, TOEFL, ITP, TOEFL IBT (при наличии).'),
        ],
      ),
    ],
  ),
  Entry(
    'До какого числа можно зарегистрироваться?',
    <Entry>[
      Entry('С 20 июня по 20 июля'),

    ],
  ),
  Entry(
    'Сколько нужно получить баллов, чтобы поступить в Satbayev University??',
    <Entry>[
      Entry('На этот вопрос до экзаменов нельзя ответить точно, так как гранты распределяются на конкурсной основе, и проходной балл каждый год меняется. Сориентироваться помогут проходные баллы на грант прошлого года.Например, группа образовательных программ «Горное дело и добыча полезных ископаемых», в которую входит 5 программ Satbayev University, потребовала всего 65 баллов'),


    ],
  ),
  Entry (
    ''

  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

