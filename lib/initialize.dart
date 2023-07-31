import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:layer_architecture_template/isar_instance.dart';

import 'firebase_options.dart';

class Initialize {
  Future<void> init() async {
    // アプリ実行前の初期化処理
    await IsarInstance().init();
  }

  Future<void> main() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
