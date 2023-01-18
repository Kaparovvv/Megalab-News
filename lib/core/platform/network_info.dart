import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<ConnectivityResult> get isConnected;
}

// class NetworkInfoImpl implements NetworkInfo {
//   final InternetConnectionChecker connectionChecker;

//   NetworkInfoImpl(this.connectionChecker);

//   @override
//   Future<bool> get isConnected => connectionChecker.hasConnection;
// }

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<ConnectivityResult> get isConnected =>
      Connectivity().checkConnectivity();
}
