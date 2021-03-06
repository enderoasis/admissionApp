import 'package:flutter/material.dart';
import 'package:myapp/domain/authentication.dart';
import 'package:myapp/pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'v0.0.2-beta',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.black ),
              hintStyle: TextStyle(color: Colors.grey),
            )),

        home: new RootPage(auth: new Auth()),


    );
  }
}
