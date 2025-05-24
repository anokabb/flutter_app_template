import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  final Connectivity _connectivity = Connectivity();

  Future<bool> get checkConnection async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (!connectivityResult.any(
        (connectivity) =>
            connectivity == ConnectivityResult.ethernet ||
            connectivity == ConnectivityResult.wifi ||
            connectivity == ConnectivityResult.mobile,
      )) {
        return false;
      }

      if (await InternetConnectionChecker.createInstance(checkTimeout: Duration(seconds: 3)).hasConnection) {
        return true;
      }
    } catch (_) {}

    return false;
  }
}
