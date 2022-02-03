import 'package:facebook_ui/pages/chats_page.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  // adding this static of() method to our StatefulWidget
  // makes its State object accessible for any descendant widget
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {

   ThemeMode _themeMode = ThemeMode.system;
   TextTheme _textTheme = TextTheme(
   );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
            actionsIconTheme: IconThemeData(
                color: Colors.black),
         titleTextStyle: TextStyle( color: Color.fromRGBO(0, 0, 0, 1),)

        ),
        textTheme: TextTheme(
            subtitle1: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),

            bodyText2: TextStyle(

            color: Color.fromRGBO(
              0,
              0,
              0,
              0.35,
            ),
          )
        )

      ),
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          actionsIconTheme: IconThemeData(
            color: Colors.white
          )
        ),
        scaffoldBackgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          bodyText2: TextStyle( color: Color.fromRGBO(
              255, 255, 255, 0.5
          ),
          ),
        )
      ), // standard dark theme
      themeMode: _themeMode,

      home: ChatsPage(),
      routes: {
        ChatsPage.id:(context)=>ChatsPage()

      },

    );
  }
  //  Call this to change theme from any context using "of" accessor
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

}
