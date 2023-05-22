import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

showAlertDialog(BuildContext context, String nama, int cost) {

  int saldo = Provider.of<AppProvider>(context, listen: false).getSaldo;

  AlertDialog alertFail = AlertDialog(
    title: Text("Maaf"),
    content: Text("Saldo anda tidak mencukupi"),
    actions: [
      TextButton(onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      }, child: Text("Ok"))
    ],
  );

  AlertDialog alertSuccess = AlertDialog(
    title: const Text("Success"),
    content: const Text("Berhasil"),
    actions: [
      TextButton(onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Provider.of<AppProvider>(context, listen: false)
            .changeCurrentScreen(CustomScreensEnum.redeemScreen);
      }, child: const Text("Ok"))
    ],
  );

  Widget cancelButton = TextButton(onPressed: () {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }, child: const Text("Tidak"));

  Widget confirmButton = TextButton(onPressed: () {
    Navigator.of(context, rootNavigator: true).pop('dialog');
    if(saldo < cost) {
      showDialog(context: context, builder: (BuildContext context){ return alertFail;});
    } else {
      var newSaldo = saldo - cost;
      Provider.of<AppProvider>(context, listen: false)
          .setSaldo(newSaldo);
      Provider.of<AppProvider>(context, listen: false).addRedeem(nama, cost);
      showDialog(context: context, builder: (BuildContext context){ return alertSuccess;});
    }
  }, child: const Text("Ya"));

  AlertDialog alert = AlertDialog(
    title: const Text("Apakah anda yakin?"),
    content: const Text("Ingin menukar poin anda dengan hadiah ini ?"),
    actions: [
      cancelButton,
      confirmButton
    ],
  );

  showDialog(context: context, builder: (BuildContext context){ return alert;});
}
