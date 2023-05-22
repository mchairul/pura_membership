import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pura_membership/providers/app_provider.dart';
import 'package:pura_membership/widgets/app_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            elevation: 0.25,
            flexibleSpace: Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset("assets/logo.png")
                ],
              ),
            ),
          ),
          endDrawer: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: const AppDrawer(),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 33),
              child: context.watch<AppProvider>().currentScreen,
            ),
          ),
        )
    );
  }
}
