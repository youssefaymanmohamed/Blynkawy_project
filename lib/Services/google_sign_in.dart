import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth for Firebase authentication
import 'package:flutter/foundation.dart'; // Import kDebugMode for debugging mode
import 'package:google_sign_in/google_sign_in.dart'; // Import GoogleSignIn for Google sign-in

class GoogleSignInService {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize FirebaseAuth instance
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Initialize GoogleSignIn instance

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn(); // Sign in with Google account
      if (googleUser == null) return null; // Return null if Google sign-in fails
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication; // Get Google authentication data
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ); // Create Firebase credential with Google authentication data
      final UserCredential result = await _auth.signInWithCredential(credential); // Sign in with Firebase credential
      return result.user; // Return signed-in user
    } catch (error) {
      if (kDebugMode) {
        print('Error signing in with Google: $error'); // Print error message in debug mode
      }
      return null; // Return null if sign-in with Google fails
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut(); // Sign out user from Firebase
    await _googleSignIn.signOut(); // Sign out user from Google
  }
}
