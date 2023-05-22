import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pura_membership/providers/app_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              child: Center(
                child: Image.asset("assets/logo.png"),
              ),
            ),
          ),
          DrawerTile(
              title: 'Home',
              icon: Icons.home_filled,
              onTap: () {
                Provider.of<AppProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.homeScreen);
                Navigator.pop(context);
              }),
          DrawerTile(
              title: 'My Account',
              icon: Icons.account_circle,
              onTap: () {
                Provider.of<AppProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.profileScreen);
                Navigator.pop(context);
              }),
          DrawerTile(
              title: 'Hadiah',
              icon: Icons.card_giftcard_outlined,
              onTap: () {
                Provider.of<AppProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.prizesScreen);
                Navigator.pop(context);
              }
              ),
          DrawerTile(
              title: 'Histry Redeem',
              icon: Icons.history,
              onTap: () {
                Provider.of<AppProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.redeemScreen);
                Navigator.pop(context);
              }
          ),
          DrawerTile(
              title: 'Informasi',
              icon: Icons.info,
              onTap: () {
                Provider.of<AppProvider>(context, listen: false)
                    .changeCurrentScreen(CustomScreensEnum.infoScreen);
                Navigator.pop(context);
              }
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(icon, color: Colors.black),
      title: Text(title,
          style: const TextStyle(fontSize: 12, color: Colors.black)),
    );
  }
}
