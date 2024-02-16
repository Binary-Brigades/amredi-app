import 'package:flutter/material.dart';

class Activity extends StatelessWidget {

  final Widget child;
  final String activity;

  const Activity({super.key,required this.activity,required this.child});

  


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 330,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.pink[50],
            ),
            child: child
          ),
          Positioned(
            bottom: 10,
            left: 8,
            right: 8,
            child: Container(
              alignment: Alignment.center,
              height: 32,
              // margin: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.pink[300],
              ),
              child: Text(activity,style:const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }
}
