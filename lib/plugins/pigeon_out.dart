// Autogenerated from Pigeon (v15.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

class NetHeaderBean {
  NetHeaderBean({
    required this.authorization,
    required this.userAgent,
    required this.cityCode,
    required this.acceptLanguage,
    required this.baseUrl,
  });

  String authorization;

  String userAgent;

  String cityCode;

  String acceptLanguage;

  String baseUrl;

  Object encode() {
    return <Object?>[
      authorization,
      userAgent,
      cityCode,
      acceptLanguage,
      baseUrl,
    ];
  }

  static NetHeaderBean decode(Object result) {
    result as List<Object?>;
    return NetHeaderBean(
      authorization: result[0]! as String,
      userAgent: result[1]! as String,
      cityCode: result[2]! as String,
      acceptLanguage: result[3]! as String,
      baseUrl: result[4]! as String,
    );
  }
}

class BatteryMapBean {
  BatteryMapBean({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.time,
  });

  String address;

  double latitude;

  double longitude;

  String time;

  Object encode() {
    return <Object?>[
      address,
      latitude,
      longitude,
      time,
    ];
  }

  static BatteryMapBean decode(Object result) {
    result as List<Object?>;
    return BatteryMapBean(
      address: result[0]! as String,
      latitude: result[1]! as double,
      longitude: result[2]! as double,
      time: result[3]! as String,
    );
  }
}

class _FlutterToNativeCodec extends StandardMessageCodec {
  const _FlutterToNativeCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is NetHeaderBean) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return NetHeaderBean.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class FlutterToNative {
  /// Constructor for [FlutterToNative].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  FlutterToNative({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _FlutterToNativeCodec();

  Future<NetHeaderBean> getNetHeaderBean() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.saas_flutter_module.FlutterToNative.getNetHeaderBean';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as NetHeaderBean?)!;
    }
  }

  Future<void> navigation() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.saas_flutter_module.FlutterToNative.navigation';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}

class _NativeToFlutterCodec extends StandardMessageCodec {
  const _NativeToFlutterCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is BatteryMapBean) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return BatteryMapBean.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class NativeToFlutter {
  static const MessageCodec<Object?> pigeonChannelCodec = _NativeToFlutterCodec();

  void setBatteryMapBean(BatteryMapBean bean);

  static void setup(NativeToFlutter? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.saas_flutter_module.NativeToFlutter.setBatteryMapBean', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.saas_flutter_module.NativeToFlutter.setBatteryMapBean was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final BatteryMapBean? arg_bean = (args[0] as BatteryMapBean?);
          assert(arg_bean != null,
              'Argument for dev.flutter.pigeon.saas_flutter_module.NativeToFlutter.setBatteryMapBean was null, expected non-null BatteryMapBean.');
          try {
            api.setBatteryMapBean(arg_bean!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
