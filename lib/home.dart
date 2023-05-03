import 'package:utm_clime/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utm_clime/landingpage.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userId() {
    return Text(user?.email ?? 'User email');
  }

  Widget _tempMessage(){
    return const Text('Under construction...  :( ',
    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30));
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut ,
      child: const Text('Sign Out'),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("UTM Clime"),
        ),
        body: Container(
          width: 1000,
          decoration: const BoxDecoration(color: Colors.white10),
           child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,   
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _tempMessage(),
            _userId(),
            _signOutButton(),
          ],
        ),
        
        ),
        
        );
  }
}