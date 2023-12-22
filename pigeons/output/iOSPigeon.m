// Autogenerated from Pigeon (v15.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "iOSPigeon.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface FLTNetHeaderBean ()
+ (FLTNetHeaderBean *)fromList:(NSArray *)list;
+ (nullable FLTNetHeaderBean *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FLTBatteryMapBean ()
+ (FLTBatteryMapBean *)fromList:(NSArray *)list;
+ (nullable FLTBatteryMapBean *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation FLTNetHeaderBean
+ (instancetype)makeWithAuthorization:(NSString *)authorization
    userAgent:(NSString *)userAgent
    cityCode:(NSString *)cityCode
    acceptLanguage:(NSString *)acceptLanguage {
  FLTNetHeaderBean* pigeonResult = [[FLTNetHeaderBean alloc] init];
  pigeonResult.authorization = authorization;
  pigeonResult.userAgent = userAgent;
  pigeonResult.cityCode = cityCode;
  pigeonResult.acceptLanguage = acceptLanguage;
  return pigeonResult;
}
+ (FLTNetHeaderBean *)fromList:(NSArray *)list {
  FLTNetHeaderBean *pigeonResult = [[FLTNetHeaderBean alloc] init];
  pigeonResult.authorization = GetNullableObjectAtIndex(list, 0);
  pigeonResult.userAgent = GetNullableObjectAtIndex(list, 1);
  pigeonResult.cityCode = GetNullableObjectAtIndex(list, 2);
  pigeonResult.acceptLanguage = GetNullableObjectAtIndex(list, 3);
  return pigeonResult;
}
+ (nullable FLTNetHeaderBean *)nullableFromList:(NSArray *)list {
  return (list) ? [FLTNetHeaderBean fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.authorization ?: [NSNull null],
    self.userAgent ?: [NSNull null],
    self.cityCode ?: [NSNull null],
    self.acceptLanguage ?: [NSNull null],
  ];
}
@end

@implementation FLTBatteryMapBean
+ (instancetype)makeWithAddress:(NSString *)address
    latitude:(double )latitude
    longitude:(double )longitude
    time:(NSString *)time {
  FLTBatteryMapBean* pigeonResult = [[FLTBatteryMapBean alloc] init];
  pigeonResult.address = address;
  pigeonResult.latitude = latitude;
  pigeonResult.longitude = longitude;
  pigeonResult.time = time;
  return pigeonResult;
}
+ (FLTBatteryMapBean *)fromList:(NSArray *)list {
  FLTBatteryMapBean *pigeonResult = [[FLTBatteryMapBean alloc] init];
  pigeonResult.address = GetNullableObjectAtIndex(list, 0);
  pigeonResult.latitude = [GetNullableObjectAtIndex(list, 1) doubleValue];
  pigeonResult.longitude = [GetNullableObjectAtIndex(list, 2) doubleValue];
  pigeonResult.time = GetNullableObjectAtIndex(list, 3);
  return pigeonResult;
}
+ (nullable FLTBatteryMapBean *)nullableFromList:(NSArray *)list {
  return (list) ? [FLTBatteryMapBean fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.address ?: [NSNull null],
    @(self.latitude),
    @(self.longitude),
    self.time ?: [NSNull null],
  ];
}
@end

@interface FLTFlutterToNativeCodecReader : FlutterStandardReader
@end
@implementation FLTFlutterToNativeCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [FLTBatteryMapBean fromList:[self readValue]];
    case 129: 
      return [FLTNetHeaderBean fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FLTFlutterToNativeCodecWriter : FlutterStandardWriter
@end
@implementation FLTFlutterToNativeCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[FLTBatteryMapBean class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FLTNetHeaderBean class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FLTFlutterToNativeCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTFlutterToNativeCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTFlutterToNativeCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTFlutterToNativeCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLTFlutterToNativeGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FLTFlutterToNativeCodecReaderWriter *readerWriter = [[FLTFlutterToNativeCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpFLTFlutterToNative(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTFlutterToNative> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.saas_flutter_module.FlutterToNative.getNetHeaderBean"
        binaryMessenger:binaryMessenger
        codec:FLTFlutterToNativeGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getNetHeaderBeanWithError:)], @"FLTFlutterToNative api (%@) doesn't respond to @selector(getNetHeaderBeanWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FLTNetHeaderBean *output = [api getNetHeaderBeanWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.saas_flutter_module.FlutterToNative.getBatteryMapBean"
        binaryMessenger:binaryMessenger
        codec:FLTFlutterToNativeGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getBatteryMapBeanWithError:)], @"FLTFlutterToNative api (%@) doesn't respond to @selector(getBatteryMapBeanWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FLTBatteryMapBean *output = [api getBatteryMapBeanWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.saas_flutter_module.FlutterToNative.navigation"
        binaryMessenger:binaryMessenger
        codec:FLTFlutterToNativeGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(navigationWithError:)], @"FLTFlutterToNative api (%@) doesn't respond to @selector(navigationWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        [api navigationWithError:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
