import 'package:utm_clime/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utm_clime/landingpage.dart';
import 'package:firebase_database/firebase_database.dart';




class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userId() {
    return Text(user?.email ?? 'User email');
  }

  void fetchData(){
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref("Readings");
    Stream<DatabaseEvent> stream = ref.onValue;
    stream.listen((DatabaseEvent event) {
    print('Event Type: ${event.type}');
    print('Snapshot: ${event.snapshot}');
    });
  }

  Widget _tempMessage(){
    fetchData;
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
          title: const Text("Air Pollution & Weather Monitor",
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: 1000,
          decoration: const BoxDecoration(color: Colors.white),
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