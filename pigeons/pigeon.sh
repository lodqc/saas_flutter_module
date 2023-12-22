#sh F:\workspace\saas_flutter_module\pigeons\pigeon.sh
flutter pub run pigeon \
  --input pigeons/input/pigeon_input.dart \
  --dart_out pigeons/output/pigeon_out.dart \
  --objc_header_out pigeons/output/iOSPigeon.h \
  --objc_source_out pigeons/output/iOSPigeon.m \
  --java_out pigeons/output/AndroidPigeon.java \
  --objc_prefix FLT \
  --java_package "com.immotor.saas.flutter.pigeon"