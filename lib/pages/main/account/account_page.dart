import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void handleClick(BuildContext context) {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        onPressed: () => handleClick(context),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(110, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: const Text('로그아웃', style: TextStyle(color: Colors.white),),
      ),
    ]));
  }
}
