import 'package:amredi/components/resource.dart';
import 'package:flutter/material.dart';

class ResourceScreen extends StatelessWidget {
  const ResourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20,left:10,right:10),
      children: [
        SizedBox(
          height: 46,
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ProjectCategory1'),
                    Text('View all'),
                  ]
                ),
                const SizedBox(height: 20),
                SizedBox(
                
                height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder:(context,index)=> const Resource() ),
                      ),
                    ],
                  ),
                )
              ]
            ),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ProjectCategory1'),
                    Text('View all'),
                  ]
                ),
                const SizedBox(height: 20),
                SizedBox(
                
                height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder:(context,index)=> const Resource() ),
                      ),
                    ],
                  ),
                )
              ]
            ),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ProjectCategory1'),
                    Text('View all'),
                  ]
                ),
                const SizedBox(height: 20),
                SizedBox(
                
                height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder:(context,index)=> const Resource() ),
                      ),
                    ],
                  ),
                )
              ]
            ),
          ]
        )
      ]
    );
  }
}