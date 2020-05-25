import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain//focus_widget.dart';
import 'package:myapp/date_field.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class Forma extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppScreenMode();
  }
}

class MyData {

}

class MyAppScreenMode extends State<Forma> {
  DateTime selectedDate;
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  final FocusNode _surname = FocusNode(),
      _name = FocusNode(),
      _phone = FocusNode(),
      _patrname = FocusNode(),
      _birthdate = FocusNode(),
      _adress = FocusNode();

      TextEditingController field1 = new TextEditingController();
      TextEditingController field2 = new TextEditingController();
      TextEditingController field3 = new TextEditingController();
      TextEditingController field4  = new TextEditingController();
      TextEditingController field5 = new TextEditingController();
      TextEditingController field6 = new TextEditingController();
      TextEditingController field7 = new TextEditingController();
      TextEditingController field8 = new TextEditingController();
      TextEditingController field9 = new TextEditingController();
      TextEditingController field10 = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Center(
                child: Text('Основные данные',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
              ),
            ),
        Center(
            child: Container(       margin: new EdgeInsets.all(10.0),
              width: 200,
              child: FocusWidget(
                focusNode: _surname,
                child: TextField(
                  controller: field1,
                  focusNode: _surname,
                  decoration: InputDecoration(
                  hintText:'Фамилия'),
                ),
              ),
            ),
            ),
        Center(
          child:  Container(
          width: 200,
         child:   FocusWidget(

              focusNode: _name,
              child: TextField(
                controller: field2,
                focusNode: _name,
                decoration: InputDecoration(
                  hintText: 'Имя'),
              ),

            ),
        ),
        ),
        Center(
          child:  Container(       margin: new EdgeInsets.all(6.0),
              width: 200,
              child: FocusWidget(
                focusNode: _patrname,
                child: TextField(
                  controller: field3,
                  focusNode: _patrname,
                  decoration: InputDecoration(
                      hintText:'Отчество'),
                ),
              ),

            ),
        ),
        Center(

          child:  Column(
              children: <Widget>[
                Column(

                  children: <Widget>[
                    DateField(

                      label: '   Дата рождения',
                      selectedDate: selectedDate,
                      onDateSelected: (DateTime date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      lastDate: DateTime(2000),
                    ),
                  ],
                ),
              ],
            ),
        ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: DropDownFormField(
                        titleText: '',
                        hintText: 'Семейное положение',
                        value: _myActivity,
                        onSaved: (value) {
                          setState(() {
                            _myActivity = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _myActivity = value;
                          });
                        },
                        dataSource: [
                          {
                            "display": "Состою в браке",
                            "value": "Married",
                          },
                          {
                            "display": "В браке не состою",
                            "value": "NotMarried",
                          },

                        ],
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: RaisedButton(
                        child: Text('Сохранить'),
                        onPressed: _saveForm,
                      ),
                    ),

                  ],
                ),
              ),

        Center(
          child:  SizedBox(
              height: 100,
              child: Center(
                child: Text('Контактные данные',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18)
                ),
              ),
            ),
        ),
        Center(
          child: Container(
          width: 200,
           child: FocusWidget(

              focusNode: _phone,
              child: TextField(
                controller: field4,
                focusNode: _phone,
                decoration: InputDecoration(
                    hintText: 'Телефон'),
              ),

            ),
        ),
        ),


            Container(
              width: 200,
              child: FocusWidget(

                focusNode: _adress,
                child: TextField(
                  controller: field5,
                  focusNode: _adress,
                  decoration: InputDecoration(
                      hintText: 'Адрес'),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}