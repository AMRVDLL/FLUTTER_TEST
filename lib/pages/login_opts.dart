import 'package:app_test/providers/apple_sign.dart';
import 'package:app_test/providers/google_sign.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}
class LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [
        ElevatedButton(onPressed: ()=>GoogleSignProvider.googleSignProviderInstance.handleSignIn(), 
        child: const Text("Google login"))
        ,ElevatedButton(onPressed: ()=>AppleSignProvider.handleSignIn(), 
        child: const Text("Apple Sign"))
      ],),
    );
  }
  
}