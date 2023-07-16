class Realtime {
  String Temperature;
  String Humidity;
  String Rain;
  String Pressure;
  String CarbonMonoxideLevels;
  String DustSmall;
  String DustBig;

  Realtime({
    required this.Temperature,
    required this.Humidity,
    required this.Rain,
    required this.Pressure,
    required this.CarbonMonoxideLevels,
    required this.DustSmall,
    required this.DustBig,
  });

  factory Realtime.fromMap(Map<dynamic, dynamic> map) {
    return Realtime(
      Temperature: map['Readings']['Temperature'] as String,
      Humidity: map['Readings']['Humidity'] as String,
      Rain: map['Readings']['Rain']as String,
      Pressure: map['Readings']['Pressure'] as String,
      CarbonMonoxideLevels: map['Readings']['CarbonMonoxideLevels'] as String,
      DustSmall: map['Readings']['DustSmall'] as String,
      DustBig: map['Readings']['DustBig'] as String,
    );
  }

  Map<dynamic, dynamic> toSetMap() {
    return {
      'Temperature': Temperature,
      'Humidity': Humidity,
      'Rain': Rain,
      'Pressure': Pressure,
      'CarbonMonoxideLevels': CarbonMonoxideLevels,
      'DustSmall': DustSmall,
      'DustBig': DustBig,
    };
  }
}

/*
class Realtime{
  String? key;
  RealTime? realTime;

  Realtime({this.key,this.realTime});
}

class RealTime{
  String? temperature;
  String? humidity;
  String? rain;
  String? pressure;
  String? carbonMonoxideLevels;
  String? dustSmall;
  String? dustBig;

  RealTime({this.temperature,this.humidity,this.rain,this.pressure,this.carbonMonoxideLevels,this.dustSmall,this.dustBig});

  RealTime.fromJson(Map<dynamic,dynamic> json){
    temperature = json["Readings"]["Temperature"];
    humidity = json["Readings"]["Humidity"];
    rain = json["Readings"]["Rain"];
    pressure = json["Readings"]["Pressure"];
    carbonMonoxideLevels = json["Readings"]["CarbonMonoxideLevels"];
    dustSmall = json["Readings"]["DustSmall"];
    dustBig = json["Readings"]["DustBig"];
  }
}
*/