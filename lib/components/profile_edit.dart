import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _profileFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  bool checkbox(value) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _profileFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 46,
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 46,
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 46,
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 46,
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ),
          const SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MaterialButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/');
                },
                minWidth: MediaQuery.of(context).size.width,
                elevation: 0,
                height: 46,
                color: Colors.pinkAccent.shade100,
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
