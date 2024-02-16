import 'package:amredi/components/form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          // backgroundColor: Colors.white,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                  // physics: const FixedExtentScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('images/image1.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Login To Your Account',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    LoginForm(),
                  ]),
            )
          ]),
    );
  }
}
