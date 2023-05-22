import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

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

class AccountCard extends StatelessWidget {
  const AccountCard({Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      // width: 600,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.green[800],
              size: 40,
            ),
            Text(
              title,
              style:
              const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}