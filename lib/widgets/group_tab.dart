import 'package:amredi/components/groups.dart';
import 'package:flutter/material.dart';

class GroupTab extends StatelessWidget {
  const GroupTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) => const GroupTile(),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Colors.pink),
            ) ;
  }
}