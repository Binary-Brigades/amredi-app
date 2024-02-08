import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent.shade100,
                    borderRadius: BorderRadius.circular(20)),
              ),
              const SizedBox(width: 8),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username'),
                  Text('role')
                ],
              ),
      
            ],
          ),
          const SizedBox(height: 10),
          Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent.shade100,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed('/login');
                    },
                    minWidth: MediaQuery.of(context).size.width,
                    elevation: 0,
                    height: 40,
                    color: Colors.pink.shade100,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite,color: Colors.redAccent),
                        SizedBox(width: 10,),
                        Text(
                          'Like',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
        ],
      ),
    );
  }
}
