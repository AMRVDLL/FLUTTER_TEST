import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignProvider{
  static Future<Map<String,String>?> handleSignIn() async {
    if(!await SignInWithApple.isAvailable())return null;
    try {
      //Añadir webAuth del server registrado
      final credentials=await SignInWithApple.getAppleIDCredential(scopes: [AppleIDAuthorizationScopes.email]);
      return 
      {
        "Email":credentials.email ?? "No email",
        "Name":credentials.givenName ?? "No name",
        "FamilyName":credentials.familyName ?? "No family name"
      };
    } catch (e) {
      return null;
    }
  }
}