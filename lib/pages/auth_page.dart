import 'package:celta/services/firebase/auth_app_state.dart';

import 'package:celta/widgets/authentication/firebase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final AppLoginState loginState = AppLoginState.loggedOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo-celtacoop.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          'Sucursal Virtual',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Center(
        child: Consumer<AuthAppState>(
          builder: (context, appState, _) => FirebaseAuthentication(
            email: appState.email,
            loginState: appState.loginState,
            verifyEmail: appState.verifyEmail,
            signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
            cancelRegistration: appState.cancelRegistration,
            registerAccount: appState.registerAccount,
            signOut: appState.signOut,
            emailVerified: appState.emailVerified,
          ),
        ),

        /*RegisterForm(
          formHeight: size.height * 0.5,
          formWidth: size.width * 0.90,
        ), */
      ),
    );
  }
}
