import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignProvider{
  GoogleSignProvider._();

  static final GoogleSignProvider _instance= GoogleSignProvider._();
  static GoogleSignProvider get googleSignProviderInstance => _instance;
  final GoogleSignIn _signIn = GoogleSignIn();

  Future<GoogleSignInAccount?> handleSignIn() async {
    try {
      GoogleSignInAccount? credentials=await _signIn.signIn();
      return credentials;
    } catch (e) {
      return null;
    }
  }
}