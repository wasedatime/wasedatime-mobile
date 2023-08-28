import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import '../utils/db_helper.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  OptionsScreenState createState() => OptionsScreenState();
}

class OptionsScreenState extends State<OptionsScreen> {
  String? errorMessage; // Add a variable to hold the error message

  Future<void> _handleGoogleSignIn() async {
    //await fetchAuthSession();
    //await fetchCognitoAuthSession();
    try {
      final result = await Amplify.Auth.signInWithWebUI(
        provider: AuthProvider.google,
      );
      safePrint('Result: $result');
      await fetchAuthSession();
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }

  Future<void> _handleLogout() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      safePrint('Sign out completed successfully');
      await fetchAuthSession();
    } else if (result is CognitoFailedSignOut) {
      safePrint('Error signing user out: ${result.exception.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _handleGoogleSignIn,
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogout, // Add the logout button
              child: const Text('Logout'),
            ),
            if (errorMessage != null) // Show the error message if not null
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ElevatedButton(
              onPressed: () async {
                await DatabaseHelper.instance.clearCache();
              },
              child: const Text('Clear Cache'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchAuthSession() async {
    try {
      final authUser = await Amplify.Auth.getCurrentUser();
      // ignore: unnecessary_null_comparison
      if (authUser != null) {
        safePrint('User ID: ${authUser.userId}');
        safePrint('Username: ${authUser.username}');

        final userAttributes = await Amplify.Auth.fetchUserAttributes();
        safePrint('User Attributes:');
        for (var attribute in userAttributes) {
          safePrint('${attribute.userAttributeKey}: ${attribute.value}');
        }
      } else {
        safePrint('No user is currently signed in.');
      }
    } catch (e) {
      safePrint('Error fetching current user: $e');
    }
  }
}
