import 'package:utm_clime/auth.dart';
import 'package:utm_clime/home.dart';
import 'package:utm_clime/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:utm_clime/fingerprint.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const FingerprintPage();
        } else {
          return const LoginPage();
        }
      },
      
       );

    
  }
}