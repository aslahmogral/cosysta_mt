// services/internet_service.dart

import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  final _connectivity = Connectivity();
  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  InternetService() {
    _connectivity.onConnectivityChanged.listen((result) async {
      final hasInternet = await _hasRealInternet();
      _controller.sink.add(hasInternet);
    });
  }

  // Real internet check
  Future<bool> checkConnection() async {
    return await _hasRealInternet();
  }

  // Try pinging a real server
  Future<bool> _hasRealInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Stream<bool> get onStatusChange => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
