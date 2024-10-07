
import 'package:app_test/pages/login_opts.dart';
import 'package:app_test/pages/purchases.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Row(children: [
          ElevatedButton(onPressed: ()=>{
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginPage()))
          }, child: const Text("Login"),),
          ElevatedButton(onPressed: ()=>{
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PurchasePage()))
          }, child: const Text("Purchase"),)
        ],
      ),
        )
    );
  }
}