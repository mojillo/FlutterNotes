// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotesapp/view/login_view.dart';
import 'firebase_options.dart';
import 'package:mynotesapp/view/register_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mynotesapp/view/landin_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Welcome To Mangal',
        textAlign: TextAlign.center,
      )),
      backgroundColor: Colors.tealAccent,
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final user = FirebaseAuth.instance
                    .currentUser; // This is the part where email verification is tested for registered users
                if (user?.emailVerified ?? false) {
                  print('User is verified');
                } else {
                  print('User is not Verified');
                }
                return Text('Done');
              default:
                return Text('Loading');
            }
          }),
    );
  }
}