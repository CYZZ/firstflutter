import 'dart:async';

import 'package:flutter/services.dart';

const MethodChannel _kChannel = MethodChannel('plugins.PackagePath');

class PackagePath {
  PackagePath({
    this.rootDirectory,
    this.AppConfigPath,
    this.packageConfig,
  });

  static PackagePath _fromPlatform;

  /// Retrieves package information from the platform.
  /// The result is cached.
  static Future<PackagePath> fromPlatform() async {
    if (_fromPlatform == null) {
      // TODO(amirh): remove this on when the invokeMethod update makes it to stable Flutter.
      String _rootDir = "";
      String _configDir = "";
      Map _config = {};

//      final Completer<PackagePath> completer = Completer<PackagePath>();

      ///1. 获取app的根目录
      await _kChannel.invokeMethod('getrooDirectory').then((dynamic result) {
        String rootDir = result;
        _rootDir = rootDir;
//        completer.complete(PackagePath(rootDirectory: rootDir));
      });

      ///2. 获取分包文件所在的位置
      await _kChannel.invokeMethod('getAppConfigPath').then((dynamic result) {
        String configPath = result;
        _configDir = configPath;
//        completer.complete(PackagePath(AppConfigPath: configPath));
      });

      ///3. 读取配置分包文件内容
      await _kChannel.invokeMethod('getpackageConfig').then((dynamic result) {
        Map<dynamic, dynamic> config = result;
        _config = config;
//        completer.complete(PackagePath(packageConfig: config));
      });

      /// 将获取到的值进行存储更新
//      _fromPlatform = completer.future;
      _fromPlatform = PackagePath(
        rootDirectory: _rootDir,
        AppConfigPath: _configDir,
        packageConfig: _config,
      );
    }

    return _fromPlatform;
  }

  /// The app rootDirectory.
  final String rootDirectory;

  /// 分包文件的路径.
  final String AppConfigPath;

  /// 分包的文件内容
  final Map packageConfig;
}
