import 'package:amredi/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Verify extends ConsumerWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var verify = ref.watch(registerProvider);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Enter Code Sent to your email to verify account!!"),
          TextField(
            onChanged: (value) async {
              if (value.length == 4) {
                var res = await verify.verify(value);
                if (res["status"] == "success") {
                  Navigator.pushReplacementNamed(context, "/login");
                }
              }
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Code",
            ),
          ),
        ],
      ),
    ));
  }
}
