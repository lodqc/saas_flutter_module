/// address : "深圳市南海大道2983号桂庙村"
/// latitude : 22.527033
/// longitude : 113.923659
/// time : 1701936916524

class BatteryMapBean {
  BatteryMapBean({
      String? address, 
      num? latitude, 
      num? longitude, 
      num? time,}){
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _time = time;
}

  BatteryMapBean.fromJson(dynamic json) {
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _time = json['time'];
  }
  String? _address;
  num? _latitude;
  num? _longitude;
  num? _time;
BatteryMapBean copyWith({  String? address,
  num? latitude,
  num? longitude,
  num? time,
}) => BatteryMapBean(  address: address ?? _address,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  time: time ?? _time,
);
  String? get address => _address;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  num? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['time'] = _time;
    return map;
  }

}