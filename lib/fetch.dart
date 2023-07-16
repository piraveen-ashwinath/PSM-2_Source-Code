import 'package:utm_clime/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utm_clime/home.dart';
import 'package:utm_clime/landingpage.dart';
import 'package:utm_clime/realtime.dart';
import 'package:firebase_database/firebase_database.dart';

//DatabaseReference database = FirebaseDatabase.instance.ref();
/*
void getData(){
  database.once().then((DatabaseEvent snapshot) {
    print('Data : ${snapshot.value}');
  });
}*/

/*
class Fetch extends StatelessWidget {
  Fetch({Key? key}) : super(key: key);
  final User? user = Auth().currentUser;
  DatabaseReference database = FirebaseDatabase.instance.ref();

/*  @override
  State<Fetch> createState() => _FetchState();
}*/

//class _FetchState extends State<Fetch> {
  @override
  Widget build(BuildContext context) {
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
  }
}*/


class Fetch extends StatefulWidget {
  Fetch({Key? key}) : super(key: key);
  final User? user = Auth().currentUser;
  @override
  State<Fetch> createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  late DatabaseReference _realtimeRef;
  Realtime? realtime;

  @override
  void initState() {
    super.initState();
    _realtimeRef = FirebaseDatabase.instance.ref('realtime');

    _realtimeRef.onValue.listen((event) {
      setState(() {
        realtime =
            Realtime.fromMap(event.snapshot.value as Map<dynamic, dynamic>);
      });
    }, onError: (Object o) {
      //
    });
  }

Widget temp() {
    return Text(realtime?.Temperature??'Temperature (Celsius): ',style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),);
  }

  Widget hum() {
    return Text(realtime?.Humidity??'Humidity (%): ',style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),);
  }

  Widget con() {
    return Text(realtime?.Rain??'Rain (0 = NO, 1 = YES): ',style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),);
  }

  Widget press() {
    return Text(realtime?.Pressure??'Pressure (hPa): ',style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),);
  }

  Widget co() {
    return Text(realtime?.CarbonMonoxideLevels??'Carbon Monoxide Levels (ppm): ',style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),);
  }

  Widget small() {
    return Text(realtime?.DustSmall??'PM 2.5: ',style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),);
  }

  Widget big() {
    return Text(realtime?.DustBig??'PM 1.0: ',style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),);
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
         // backgroundColor: Colors.transparent,
          //extendBodyBehindAppBar: true,
          body: Container(
            width: 1000,
          decoration: const BoxDecoration(color: Colors.white),
              // physics: const NeverScrollableScrollPhysics(),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,   
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                temp(),
                hum(),
                con(),
                press(),
                co(),
                small(),
                big(),
               /* InfoCard(
                  title: "Temperature",
                  value: realtime?.moisturePlant1 != null
                      ? realtime!.moisturePlant1.toDouble()
                      : 0.0,
                  symbol: "%",
                  
                ),

                InfoCard(
                  title: "Plant 2",
                  value: realtime?.moisturePlant2 != null
                      ? realtime!.moisturePlant2.toDouble()
                      : 0.0,
                  symbol: "%",
                  
                ),

                InfoCard(
                  title: "Plant 3",
                  value: realtime?.moisturePlant3 != null
                      ? realtime!.moisturePlant3.toDouble()
                      : 0.0,
                  symbol: "%",
                 
                ),*/
              ],
            
          )),
    );
    
  }
}
