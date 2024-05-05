import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Enum to represent the connectivity status
enum ConnectivityStatus { connected, disconnected }

// Bloc class to manage connectivity status
class ConnectivityBloc extends Cubit<ConnectivityStatus> {
  final Connectivity connectivity = Connectivity(); // Instance of Connectivity

  // Constructor initializes the bloc with disconnected status and calls the init method
  ConnectivityBloc() : super(ConnectivityStatus.disconnected) {
    init();
  }

  // Method to initialize connectivity monitoring
  void init() {
    // Listen to connectivity changes
    connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      final result = results.first;
      // Check the result and emit corresponding connectivity status
      if (result == ConnectivityResult.none) {
        emit(ConnectivityStatus.disconnected); // Disconnected
      } else {
        emit(ConnectivityStatus.connected); // Connected
      }
    });
  }
}
