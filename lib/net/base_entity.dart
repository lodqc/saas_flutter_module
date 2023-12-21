
import 'package:saas_flutter_module/generated/json/base/json_convert_content.dart';
import 'package:saas_flutter_module/res/constant.dart';

class BaseEntity<T> {

  BaseEntity(this.code, this.msg, this.result);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[Constant.code] as int?;
    msg = json[Constant.msg] as String;
    if (json.containsKey(Constant.result)) {
      result = _generateOBJ<T>(json[Constant.result] as Object?);
    }
  }

  int? code;
  late String msg;
  T? result;

  T? _generateOBJ<O>(Object? json) {
    if (json == null) {
      return null;
    }
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List类型数据由fromJsonAsT判断处理
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }
}
