import 'package:amredi/components/profile_edit.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Column(
          children: [
            Stack(children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.pinkAccent,
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 5,
                child: Icon(Icons.add_a_photo_rounded),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            const ProfileForm()
          ],
        )
      ],
    );
  }
}
