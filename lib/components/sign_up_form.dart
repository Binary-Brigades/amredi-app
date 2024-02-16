import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class SignUpForm extends ConsumerWidget {
  SignUpForm({super.key});

  final _signupFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _firstnameController = TextEditingController();

  final _lastnameController = TextEditingController();

  bool checkbox(value) {
    return true;
  }

  Future<void> requestPermission() async {
    // Request location permission
    var status = await Permission.location.request();
    if (status.isDenied) {
      // Permission denied
      // Handle the situation accordingly
    }
  }

  Future<bool> checkPermission() async {
    var status = await Permission.location.status;
    return status.isGranted;
  }

  Future<LocationData?> getLocation() async {
    var location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      // Handle any errors that might occur
      return null;
    }
  }

  Future<Widget> loc() async {
    LocationData? locationData = await getLocation();
    if (locationData != null) {
      return Text(
          'Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}');
    } else {
      return const Text('Failed to get location');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _signupFormKey,
      child: Column(
        children: [
          Text(getLocation().toString()),
          SizedBox(
            height: 46,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstnameController,
                    decoration: InputDecoration(
                        labelText: 'Firstname',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _lastnameController,
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
          const SizedBox(
            height: 30,
          ),
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
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MaterialButton(
                onPressed: () {},
                minWidth: MediaQuery.of(context).size.width,
                elevation: 0,
                height: 46,
                color: Colors.pinkAccent.shade100,
                child: const Text(
                  'Sign Up',
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
                  Navigator.of(context).pushNamed('/login');
                },
                child: const Text(
                  'Sign In.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const Text('OR'),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
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
                const Text('Sign Up with Google'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
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
                const Text('Sign Up with Facebook'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
