import 'package:flutter/material.dart';
import 'package:safezone_sulteng/view/login/login.dart';
import 'package:safezone_sulteng/view/welcome_screen/welcome.dart';
// import 'welcome.dart';  // Mengimpor file welcome.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),  // Memanggil WelcomeScreen dari welcome.dart
    );
  }
}
