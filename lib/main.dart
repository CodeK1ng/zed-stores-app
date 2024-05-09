import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zed_stores/core/theme/theme_data.dart';
import 'package:zed_stores/pages/app_screen.dart';
import 'package:zed_stores/pages/login_screen.dart';
import 'package:zed_stores/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    const appName = 'Zed Stores';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: zedStoresDarkTheme,
      darkTheme: zedStoresDarkTheme,
      // home: const MyHomePage(title: appName),
      home: auth.currentUser != null
          ? const MyHomePage(title: appName)
          : const LoginPage(),
    );
  }
}
