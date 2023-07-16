import 'package:flutter/material.dart';
import 'package:test_app/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text('Error in Firebase Initilisation');
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            title: 'Upload outlines',
            home: HomePage(),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return const CircularProgressIndicator();
      },
    );
  }
}
