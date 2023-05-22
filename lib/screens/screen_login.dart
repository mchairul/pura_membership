

import 'package:flutter/material.dart';
import 'package:pura_membership/home.dart';

class ScreenLogin extends StatefulWidget{
  const ScreenLogin({super.key});


  @override
  State<ScreenLogin> createState() => _ScreenLogin();
}

class _ScreenLogin extends State<ScreenLogin> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                  child: TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),labelText: "user",
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Harap isi user';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),labelText: "password",
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Harap isi password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                            return Home(user: userController.text);
                          }));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('harap isi semua input')),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}