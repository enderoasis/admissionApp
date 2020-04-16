import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain//focus_widget.dart';

class Forma extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppScreenMode();
  }
}

class MyData {

}

class MyAppScreenMode extends State<Forma> {
  final FocusNode _surname = FocusNode(), _name = FocusNode(), _phone = FocusNode();
  TextEditingController emailController1 = new TextEditingController();
  TextEditingController emailController2 = new TextEditingController();
  TextEditingController emailController3 = new TextEditingController();

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
                child: Text('Первичное заполнение данных.'
                    '                               После заполнения обязательных полей нажмите кнопку "Сохранить данные"'),
              ),
            ),
            Container(
              width: 200,
              child: FocusWidget(
                focusNode: _surname,
                child: TextField(
                  controller: emailController1,
                  focusNode: _surname,
                  decoration: InputDecoration(
                  hintText:'Фамилия'),
                ),
              ),

            ),
            FocusWidget(

              focusNode: _name,
              child: TextField(
                controller: emailController2,
                focusNode: _name,
                decoration: InputDecoration(
                  hintText: 'Имя'),
              ),

            ),
            SizedBox(
              height: 100,

            ),
            FocusWidget(

              focusNode: _phone,
              child: TextField(
                controller: emailController3,
                focusNode: _phone,
                decoration: InputDecoration(
                    hintText: 'Телефон'),
              ),

            ),
            SizedBox(
              height: 100,

            ),
          ],
        ),
      ),
    );
  }
}