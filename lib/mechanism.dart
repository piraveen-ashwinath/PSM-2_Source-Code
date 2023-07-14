import 'package:utm_clime/auth.dart';
import 'package:utm_clime/home.dart';
import 'package:utm_clime/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:utm_clime/fingerprint.dart';

class Mechanism extends StatefulWidget {
  const Mechanism({Key? key}) : super(key: key);

  @override
  State<Mechanism> createState() => _MechanismState();
}

class _MechanismState extends State<Mechanism> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const FingerprintPage();
        } else {
          return const LandingPage();
        }
      },
      
       );

    
  }
}