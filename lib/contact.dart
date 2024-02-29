import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Text('Contact'),
          Divider(
            color: Colors.amber,
            thickness: 5,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.phone),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                '(+250) 781 262 725',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                'uwaberaange143@gmail.com',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_city),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                'Kigali, Rwanda',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
