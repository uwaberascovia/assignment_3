import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Home',
              textAlign: TextAlign.right,
            ),
            Divider(
              color: Colors.amber,
              thickness: 5,
            ),
            Image.asset('images/image2.jpg'),
            const Text(
              'Welcome to Introduction to Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
