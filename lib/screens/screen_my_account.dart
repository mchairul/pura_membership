import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class ScreenMyAccount extends StatelessWidget {
  const ScreenMyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text('My Account',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple)
          ),
        ),
        const SizedBox(height: 25.0),
        Center(
          child: Text(Provider.of<AppProvider>(context, listen: false).getUser,
            style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple)
          ),
        ),
        Center(
          child: Text( Provider.of<AppProvider>(context, listen: false).getSaldo.toString() + " Poin",
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green)
          ),
        ),
        const SizedBox(height: 25.0),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
              Provider.of<AppProvider>(context, listen: false)
                  .changeCurrentScreen(CustomScreensEnum.prizesScreen);
            },
            child: const Text('Tukar Poin'),
          ),
        )
      ],
    );
  }
}
