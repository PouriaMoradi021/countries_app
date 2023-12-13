import 'package:countries/features/feature-login/presention/screens/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            StreamBuilder(
              builder: ((context, snapshot) => TextField(
                    onChanged: (val) => validation.sinkEmail.add(val),
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      errorText:
                          snapshot.error as String?,
                    ),
                  )),
              stream: validation.email,
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              builder: ((context, snapshot) => TextField(
                    onChanged: (val) => validation.sinkEmail.add(val),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText:
                          snapshot.error as String?,
                    ),
                  )),
              stream: validation.password,
            ),
            StreamBuilder(
              builder: ((context, snapshot) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: snapshot.data != true
                            ? Colors.grey[200]
                            : Colors.red),
                    onPressed: snapshot.hasData != true ? () {} : () {},
                    child: const Text('Login'),
                  )),
              stream: validation.loginValid,
            ),
          ],
        ),
      ),
    );
  }
}
