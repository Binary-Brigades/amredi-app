import 'package:amredi/components/resource.dart';
import 'package:flutter/material.dart';

class ProjectDetail extends StatelessWidget {
  const ProjectDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.pinkAccent.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset('images/chickenPro.jpg',
              fit: BoxFit.cover,
              height: 250,
              width: MediaQuery.of(context).size.width),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
            "If you are serving your web app in a path other than the root, change the href value below to reflect the base path you are serving from.he path provided below has to start and end with a slash  in order for it to work correctly."),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 200,
          child: Row(
            children: [
              Expanded(
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                    Resource(),
                    Resource(),
                    Resource(),
                    Resource(),
                    Resource(),
                  ]))
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: MaterialButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('/login');
              },
              minWidth: MediaQuery.of(context).size.width,
              elevation: 0,
              height: 40,
              color: Colors.pink.shade100,
              child: const Text(
                'Join Group',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ]),
    );
  }
}
