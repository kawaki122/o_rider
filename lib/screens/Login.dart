import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/o-logo.png',
                    width: 40,
                  ),
                  Text(
                    'Rider',
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
                Text(
                  ' to your account',
                  style: TextStyle(fontSize: 24),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'Enter your phone number',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your phone number';
                  }
                  return null;
                },
              ),
            ),
            Padding(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Login', style: TextStyle(fontSize: 17),),
            ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
