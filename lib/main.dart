import 'package:amredi/pages/edit_profile_page.dart';
import 'package:amredi/pages/login_page.dart';
import 'package:amredi/pages/main_page.dart';
import 'package:amredi/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage()
      },
      title: 'Amredi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade100),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      // home: const LoginPage(),
    );
  }
}
