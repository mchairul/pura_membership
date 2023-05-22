
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pura_membership/providers/app_provider.dart';
import 'package:pura_membership/screens/main_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.user});

  final String user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        //initiates the instance of DrawerScreenProvider from this point
        create: (context) => AppProvider(inputUser: user),
        //the child that dynamically changes is MainScreen
        child: const MainScreen(),
      ),
    );
  }
}
