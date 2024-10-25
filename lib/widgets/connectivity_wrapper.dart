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
  late Stream<ConnectivityResult> _connectivityStream;
  bool _isConnected = true;
  bool _isRetrying = false;

  @override
  void initState() {
    super.initState();
    _connectivityStream =
        Connectivity().onConnectivityChanged.cast<ConnectivityResult>();
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  Future<void> _retryConnection() async {
    if (_isRetrying) return;

    setState(() {
      _isRetrying = true;
    });

    await Future.delayed(Duration(seconds: 2));

    var isConnected =
        await Connectivity().checkConnectivity() != ConnectivityResult.none;

    setState(() {
      _isRetrying = false;
      _isConnected = isConnected;
    });

    if (!isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Still no internet connection. Please try again later.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: _connectivityStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          _isConnected = snapshot.data != ConnectivityResult.none;
        }

        return _isConnected
            ? widget.child
            : NoInternetScreen(
                onRetry: _retryConnection,
                isRetrying: _isRetrying,
              );
      },
    );
  }
}
