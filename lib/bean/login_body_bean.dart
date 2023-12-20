/// platId : 1
/// userName : "18138819493@swap.com"
/// pwd : "e10adc3949ba59abbe56e057f20f883e"

class LoginBodyBean {
  LoginBodyBean({
      num? platId, 
      String? userName, 
      String? pwd,}){
    _platId = platId;
    _userName = userName;
    _pwd = pwd;
}

  LoginBodyBean.fromJson(dynamic json) {
    _platId = json['platId'];
    _userName = json['userName'];
    _pwd = json['pwd'];
  }
  num? _platId;
  String? _userName;
  String? _pwd;
LoginBodyBean copyWith({  num? platId,
  String? userName,
  String? pwd,
}) => LoginBodyBean(  platId: platId ?? _platId,
  userName: userName ?? _userName,
  pwd: pwd ?? _pwd,
);
  num? get platId => _platId;
  String? get userName => _userName;
  String? get pwd => _pwd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['platId'] = _platId;
    map['userName'] = _userName;
    map['pwd'] = _pwd;
    return map;
  }

}