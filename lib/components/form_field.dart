import 'package:amredi/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginForm extends ConsumerWidget {
  // const LoginForm({super.key});

  final _loginFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  LoginForm({super.key});

  bool checkbox(value) {
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mybox = Hive.box('myBox');
    // final token = mybox.get('TOKEN');
    // print(token);
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              } else {
                return '';
              }
            },
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 4,
                )),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required";
              } else {
                return '';
              }
            },
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                gapPadding: 4,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.grey),
                  )),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MaterialButton(
                onPressed: () async {
                  // _loginFormKey.currentState!.validate();
                  _loginFormKey.currentState!.validate();
                  final x = await ref
                      .watch(loginProvide)
                      .login(_emailController.text, _passwordController.text);
                  mybox.put("TOKEN", x["access_token"]);
                  if (x["status"] == "success") {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Login Success!!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green[300],
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4,
                          top: 10,
                          right: MediaQuery.of(context).size.width / 4,
                          bottom: MediaQuery.of(context).size.height - 100),
                      behavior: SnackBarBehavior.floating,
                    ));
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else if (x["status"] == 401) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Invalid username or password!!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red[300],
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4,
                          top: 10,
                          right: MediaQuery.of(context).size.width / 4,
                          bottom: MediaQuery.of(context).size.height - 100),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
                minWidth: MediaQuery.of(context).size.width,
                elevation: 0,
                height: 46,
                color: Colors.pinkAccent.shade100,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: const Text(
                  'Sign Up.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const Text('OR'),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: const FaIcon(
                      FontAwesomeIcons.google,
                      size: 16,
                      color: Colors.white,
                    )),
                const SizedBox(width: 5),
                const Text('Login with Google'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: const FaIcon(
                      FontAwesomeIcons.facebookF,
                      size: 16,
                      color: Colors.white,
                    )),
                const SizedBox(width: 5),
                const Text('Login with Facebook'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
