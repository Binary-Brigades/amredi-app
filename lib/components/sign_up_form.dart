import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _signupFormKey = GlobalKey<FormState>();
  final _email_controller = TextEditingController();
  final _password_controller = TextEditingController();

  bool checkbox(value) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signupFormKey,
      child: Column(
        children: [
          Container(
            height: 46,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _email_controller,
                    decoration: InputDecoration(
                        labelText: 'Firstname',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _email_controller,
                    decoration: InputDecoration(
                        labelText: 'Lastname',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            height: 46,
            child: TextFormField(
              controller: _email_controller,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 46,
            child: TextFormField(
              controller: _password_controller,
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
                onPressed: () {},
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
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Sign In.',
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
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      size: 16,
                      color: Colors.white,
                    )),
                SizedBox(width: 5),
                Text('Sign Up with Google'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6),
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
                    child: FaIcon(
                      FontAwesomeIcons.facebookF,
                      size: 16,
                      color: Colors.white,
                    )),
                SizedBox(width: 5),
                Text('Sign Up with Facebook'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
