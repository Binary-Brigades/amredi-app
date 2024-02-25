import 'package:amredi/pages/login_page.dart';
import 'package:amredi/pages/main_page.dart';
import 'package:amredi/pages/notifications.dart';
import 'package:amredi/pages/post_page.dart';
import 'package:amredi/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mybox = Hive.box('myBox');
    final token = mybox.get('TOKEN');
    // debugpr/
    // print(token);
    return MaterialApp(
      routes: {
        '/home': (context) => const MainPage(),
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/notifications': (context) => const NotificationScreen(),
        '/post': (context) => PostPage()
      },
      title: 'Amredi',
      debugShowCheckedModeBanner: false,
      home: token == null ? const LoginPage() : const MainPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade100),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      // home: const LoginPage(),
    );
  }
}
