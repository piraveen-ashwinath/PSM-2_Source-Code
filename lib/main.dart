import 'package:utm_clime/landingpage.dart';
import 'package:utm_clime/mechanism.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:utm_clime/fetch.dart';
//import 'package:flutter_firebase_series/screens/fetch.dart';

//DatabaseReference database = FirebaseDatabase.instance.ref();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.white, //<-- SEE HERE
),
      ),
       home: const Mechanism(),
    );
  }
} 