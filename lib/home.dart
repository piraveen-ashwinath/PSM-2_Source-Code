import 'package:utm_clime/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utm_clime/fetch.dart';
import 'package:firebase_database/firebase_database.dart';

//DatabaseReference database = FirebaseDatabase.instance.ref();
//Realtime? realtime;


class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget userId() {
    return Text(user?.email ?? 'User email');
  }


/*
  Widget _TemperatureMessage(){
    //fetchData;
    return const Text('Under construction...  :( ',
    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30));
  }*/

  Widget signOutButton() {
    return ElevatedButton(
      onPressed: signOut ,
      child: const Text('Sign Out'),
      
    );
  }
/*
  Widget fetchData(){
    return StreamBuilder(
        stream: database.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){ 
          if (!snapshot.hasData) {
           return const Center();
          }
          return Text(snapshot.data!.snapshot.child('Readings').value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              );

  }
    );
  }*/



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
            //fetchData(),
            Fetch(),
            userId(),
            signOutButton(),
          ],
        ),
        
        ),
        
        );
  
  
  }
  
}


/*
class Realtime {
  String Temperature;
  String Humidity;
  String CarbonMonoxideLevels;
  String DustSmall;
  String DustBig;
  String Rain;
  String Pressure;

  Realtime({
    required this.Temperature,
    required this.Humidity,
    required this.CarbonMonoxideLevels,
    required this.DustSmall,
    required this.DustBig,
    required this.Rain,
    required this.Pressure,
  });

  factory Realtime.fromMap(Map<dynamic, dynamic> map) {
    return Realtime(
      Temperature: map['Temperature'] as String,
      Humidity: map['Humidity'] as String,
      CarbonMonoxideLevels: map['CarbonMonoxideLevels'] as String,
      DustSmall: map['DustSmall'] as String,
      DustBig: map['DustBig'] as String,
      Rain: map['Rain'] as String,
      Pressure: map['Pressure'] as String,
    );
  }

  Map<dynamic, dynamic> toSetMap() {
    return {
      'Temperature': Temperature,
      'Humidity': Humidity,
      'CarbonMonoxideLevels': CarbonMonoxideLevels,
      'DustSmall': DustSmall,
      'DustBig': DustBig,
      'Rain': Rain,
      'Pressure': Pressure,
    };
  }
}*/