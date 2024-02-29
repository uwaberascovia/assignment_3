import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          ClipOval(
            child: Image.asset('images/image2.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Welcome.',
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left),
          const Text('Please login your account to continue'),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {},
            icon: Icon(Icons.mail),
            label: Text('Sign Up with Email'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {},
            icon: Icon(Icons.g_mobiledata_outlined, color: Colors.red),
            label: Text('Sign Up with Email'),
          )
        ],
      ),
    );
  }
}
