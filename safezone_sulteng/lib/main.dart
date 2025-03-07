import 'package:flutter/material.dart';
import 'package:safezone_sulteng/view/homepage/home.dart';
import 'package:safezone_sulteng/view/login/login.dart';
import 'package:safezone_sulteng/view/mitigasi/mitigasi_view.dart';
import 'package:safezone_sulteng/view/pemetaan/peta.dart';
import 'package:safezone_sulteng/view/profil/profil.dart';
import 'package:safezone_sulteng/view/welcome_screen/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/peta', // Halaman awal yang ditampilkan
      routes: {
        '/': (context) => WelcomeScreen(), // Halaman WelcomeScreen
        // '/login': (context) => LoginPage(), // Halaman Login
        '/homepage': (context) => HomePage(), // Halaman Home
        '/mitigasi': (context) => MitigasiView(), // Halaman Mitigasi
        '/peta': (context) => PetaPage(), // Halaman Peta
        '/profil': (context) => ProfilPage(), // Halaman Profil
      },
    );
  }
}
