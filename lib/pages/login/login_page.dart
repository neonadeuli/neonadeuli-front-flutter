import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO API 연동 시 Stateful 로 수정 필요
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // TODO api 연동 필요
  handleClick(BuildContext context) {
    print('button click');
    context.go('/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '로그인',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(
              height: 40,
            ),
            // 아이디 입력
            TextFormField(
              decoration: InputDecoration(
                  label: const Text('아이디'),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'password',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => handleClick(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(110, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text(
                'login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => handleClick(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text(
                '카카오 로그인',
                style: TextStyle(color: Colors.white),
              ),
            ),
             const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => handleClick(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text(
                '구글 로그인',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
