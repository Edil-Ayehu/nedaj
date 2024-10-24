import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nedaj/screens/no_internet_screen.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _ConnectivityWrapperState createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  // late Stream<ConnectivityResult> _connectivityStream;
  late Stream<List<ConnectivityResult>> _connectivityStream;

  @override
  void initState() {
    super.initState();
    _connectivityStream = Connectivity().onConnectivityChanged;
  }

  Future<bool> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.none) == false;
  }

  void _retryConnection() {
    setState(() {});
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
              return NoInternetScreen(onRetry: _retryConnection);
            }
          },
        );
      },
    );
  }
}
