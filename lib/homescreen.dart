import 'package:utm_clime/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utm_clime/home.dart';
import 'package:utm_clime/landingpage.dart';
import 'package:utm_clime/realtime.dart';
import 'package:firebase_database/firebase_database.dart';
/*
class FirebaseRealtimeDemoScreen extends StatelessWidget {

  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    //readData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Realtime Database Demo'),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                
              ],
            ),
          )
      ), //center
    );
  }

  /*
  void readData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
*/
  void updateData(){
    databaseReference.child('flutterDevsTeam1').update({
      'description': 'CEO'
    });
    databaseReference.child('flutterDevsTeam2').update({
      'description': 'Team Lead'
    });
    databaseReference.child('flutterDevsTeam3').update({
      'description': 'Senior Software Engineer'
    });
  }

  void deleteData(){
    databaseReference.child('flutterDevsTeam1').remove();
    databaseReference.child('flutterDevsTeam2').remove();
    databaseReference.child('flutterDevsTeam3').remove();

  }
}*/

/*
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final User? user = Auth().currentUser;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  final TextEditingController _edtTemperatureController = TextEditingController();
  final TextEditingController _edtHumidityController = TextEditingController();
  final TextEditingController _edtRainController = TextEditingController();
  final TextEditingController _edtPressureController = TextEditingController();
  final TextEditingController _edtCoController = TextEditingController();
  final TextEditingController _edtSmallController = TextEditingController();
  final TextEditingController _edtBigController = TextEditingController();

  List<Realtime> realtimeList = [];

  bool updateStudent = false;


  @override
  void initState() {
    super.initState();

    retrieveRealTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Air Pollution & Weather Monitor"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i = 0 ; i < realtimeList.length ; i++)
              studentWidget(realtimeList[i])
          ],
        ),
      ),
      
    );
  }

  void studentDialog({String? key}) {
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _edtTemperatureController, decoration: const InputDecoration(helperText: "Temperature: "),),
              TextField(controller: _edtHumidityController, decoration: const InputDecoration(helperText: "Humidity: ")),
              TextField(controller: _edtRainController, decoration: const InputDecoration(helperText: "Rain (0 = NO, 1 = YES):")),
              TextField(controller: _edtPressureController, decoration: const InputDecoration(helperText: "Pressure: ")),
              TextField(controller: _edtCoController, decoration: const InputDecoration(helperText: "Carbon Monoxide Levels: ")),
              TextField(controller: _edtSmallController, decoration: const InputDecoration(helperText: "PM 2.5: ")),
              TextField(controller: _edtBigController, decoration: const InputDecoration(helperText: "PM 10: ")),
              const SizedBox(height: 10,),
              
            ],
          ),
        ),
      );
    });
  }

  void retrieveRealTime() {
    dbRef.child("Readings").child("Temperature").onChildAdded.listen((data) {
      RealTime realTime = RealTime.fromJson(data.snapshot.value as Map);
      Realtime realtime = Realtime(key: data.snapshot.key, realTime: realTime);
      realtimeList.add(realtime);
      setState(() {});
    });
  }

  Widget studentWidget(Realtime realtime) {
    return InkWell(
      onTap: (){
        _edtTemperatureController.text = realtime.realTime!.temperature!;
        _edtHumidityController.text = realtime.realTime!.humidity!;
        _edtRainController.text = realtime.realTime!.rain!;
        _edtPressureController.text = realtime.realTime!.pressure!;
        _edtCoController.text = realtime.realTime!.carbonMonoxideLevels!;
        _edtSmallController.text = realtime.realTime!.dustSmall!;
        _edtBigController.text = realtime.realTime!.dustBig!;
        updateStudent = true;
        studentDialog(key: realtime.key);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top:5,left: 10,right: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(realtime.realTime!.temperature!),
                Text(realtime.realTime!.humidity!),
                Text(realtime.realTime!.rain!),
                Text(realtime.realTime!.pressure!),
                Text(realtime.realTime!.carbonMonoxideLevels!),
                Text(realtime.realTime!.dustSmall!),
                Text(realtime.realTime!.dustBig!),
              ],
            ),

            
          ],
        ),
      ),
    );
  }
}
*/