import 'dart:io';

import 'package:amredi/components/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profilepic;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null){
      return;
    }
    final imageTemp = File(image.path);
    setState(() {
      _profilepic = imageTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Column(
          children: [
            Stack(children: [
              Container(
                alignment: Alignment.center,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.pinkAccent[100],
                  ),
                  child: _profilepic == null
                      ? const Icon(Icons.person)
                      : Image.file(_profilepic!,fit:BoxFit.fitWidth,width:100)),
              Positioned(
                bottom: 0,
                right: 0,
                left: 70,
                child: IconButton(
                    onPressed: () {
                      getImage();
                    },
                    icon: const Icon(Icons.add_a_photo_rounded,color: Colors.pink)),
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
