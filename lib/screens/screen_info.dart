import 'package:flutter/material.dart';
import 'package:open_browser/open_browser.dart';

class ScreenInfo extends StatelessWidget{
  const ScreenInfo({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text("Informasi",
              style: TextStyle(
                  color: Colors.deepPurple,fontSize: 28
              ),
            ),
          ),
          SizedBox(height: 30,),
          const Text("Untuk informasi lebih lanjut, silahkan klik tombol dibawah",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20
              )
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                OpenBrowser().openBrowser("https://www.puragroup.com/en/home/");
              },
              child: Text("Kunjungin website"),
            ),
          )
        ],
      ),
    );
  }
}
