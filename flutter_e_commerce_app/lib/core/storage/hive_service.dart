import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_service.g.dart';

class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();
  }
}

@riverpod
HiveService hiveService(HiveServiceRef ref) {
  return HiveService();
}
