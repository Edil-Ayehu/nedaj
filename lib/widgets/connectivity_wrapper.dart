import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nedaj/export.dart';
import 'package:nedaj/screens/no_internet_screen.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _ConnectivityWrapperState createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  late Stream<List<ConnectivityResult>> _connectivityStream;
  bool _isRetrying = false;

  @override
  void initState() {
    super.initState();
    _connectivityStream = Connectivity().onConnectivityChanged;
  }

  Future<bool> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.none) == false;
  }

  Future<void> _retryConnection() async {
    if (_isRetrying) return;

    setState(() {
      _isRetrying = true;
    });

    // Add a slight delay to simulate the checking process
    await Future.delayed(Duration(seconds: 2));

    var isConnected = await _checkConnectivity();

    setState(() {
      _isRetrying = false;
    });

    if (!isConnected) {
      // If still not connected, you might want to show a snackbar or toast message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Still no internet connection. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: _connectivityStream,
      builder: (context, snapshot) {
        return FutureBuilder<bool>(
          future: _checkConnectivity(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return widget.child;
            } else {
              return NoInternetScreen(
                onRetry: _retryConnection,
                isRetrying: _isRetrying,
              );
            }
          },
        );
      },
    );
  }
}
