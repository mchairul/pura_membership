import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text("Welcome to PURA GROUP",
              style: TextStyle(
                  color: Colors.deepPurple,fontSize: 28
              ),
            ),
          ),
          const Text("Membership Rewards",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20
              )
          ),
        ],
      ),
    );
  }
}