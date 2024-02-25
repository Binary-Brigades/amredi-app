import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String? url;
  final DateTime time;
  final int likes;
  final String description;
  final String user;
  const Post(
      {super.key,
      required this.url,
      required this.likes,
      required this.user,
      required this.time,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8)),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user),
                  Text("${-time.day + DateTime.now().day} days ago")
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                // color: Colors.pinkAccent.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description),
                url == null
                    ? Container()
                    : Expanded(
                        child: Image.network(
                        url!,
                        width: MediaQuery.of(context).size.width,
                      )),
              ],
            ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite, color: Colors.redAccent),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(likes.toString()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      likes > 1 ? 'Likes' : 'Like',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
