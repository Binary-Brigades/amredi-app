import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool checkbox(value) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 46,
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 46,
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: false, onChanged: checkbox),
                  const Text('Remember me.')
                ],
              ),
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
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
