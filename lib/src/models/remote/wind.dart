import 'package:feather/src/utils/types_helper.dart';

class Wind {
  final double speed;
  final double deg;

  Wind(this.speed, this.deg);

  Wind.fromJson(Map<String,dynamic> json): speed = changeToKilometersPerHour(TypesHelper.getDouble(json["speed"])), deg = TypesHelper.getDouble(json["deg"]);

  Map<String,dynamic> toJson () =>{
    "speed": speed,
    "deg": deg,
  };

  String getDegCode(){
    if (deg == null){
      return "N";
    }
    if (deg >= 0 && deg < 45) {
      return "N";
    } else if (deg >= 45 && deg < 90) {
      return"NE";
    } else if (deg >= 90 && deg < 135) {
      return"E";
    } else if (deg >= 135 && deg < 180) {
      return"SE";
    } else if (deg >= 180 && deg < 225) {
      return "S";
    } else if (deg >= 225 && deg < 270) {
      return "SW";
    } else if (deg >= 270 && deg < 315) {
      return "W";
    } else if (deg >= 315 && deg <= 360) {
      return "NW";
    } else {
      return "N";
    }
  }


  static double changeToKilometersPerHour(double value){
    if (value != null) {
      return value * 3.6;
    } else {
      return 0;
    }
  }

}
