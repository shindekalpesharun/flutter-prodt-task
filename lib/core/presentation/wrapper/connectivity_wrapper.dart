import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodt_task/core/bloc/connectivity_bloc/ConnectivityBloc.dart';

// Widget that wraps its child with connectivity status management
class ConnectivityWrapper extends StatelessWidget {
  final Widget child; // Child widget to be wrapped

  // Constructor requiring the child widget
  ConnectivityWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the ConnectivityBloc to manage connectivity state
      create: (context) => ConnectivityBloc(),
      child: BlocBuilder<ConnectivityBloc, ConnectivityStatus>(
        builder: (context, connectivityStatus) {
          // Check the connectivity status
          if (connectivityStatus == ConnectivityStatus.connected) {
            // If connected, simply return the child widget
            return child;
          } else {
            // If not connected, display a scaffold with a message
            return Scaffold(
              body: Center(
                child: Text('No Internet Connection'),
              ),
            );
          }
        },
      ),
    );
  }
}
