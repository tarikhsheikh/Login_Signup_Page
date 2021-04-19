import "package:flutter/material.dart";
import 'package:myloginpage1st/app_example/SIgnup.dart';
import 'app_example/Login_Screen.dart';
import 'app_example/Forgate_Password.dart';
import 'package:cache_x/cache_x.dart';
import 'app_example/homepage.dart';

//void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 String password = 'CBoaDQIQAgceGg8dFAkMDBEOECEZCxg=';
  await CacheXCore().init(password: password);
  //await CacheXCore().init(password: username);

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SignupPage(),
        '/second': (context) => LoginPage(),
        '/third': (context) => ForgatePasswordPage(),
        '/four': (context) =>HomePage(),
      },
    );
  }
}
