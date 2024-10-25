import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:nedaj/export.dart';

class FuelStationsScreen extends StatefulWidget {
  const FuelStationsScreen({Key? key}) : super(key: key);

  @override
  _FuelStationsScreenState createState() => _FuelStationsScreenState();
}

class _FuelStationsScreenState extends State<FuelStationsScreen> {
  WebViewController? _controller;
  List<Map<String, dynamic>> fuelStations = [];
  bool isLoading = true;
  String debugMessage = '';

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          debugMessage = 'Location services are not enabled.';
          isLoading = false;
        });
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            debugMessage = 'Location permissions are denied.';
            isLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          debugMessage = 'Location permissions are permanently denied.';
          isLoading = false;
        });
        return;
      }

      _loadFuelStations();
    } catch (e) {
      setState(() {
        debugMessage = "Error checking location permission: $e";
        isLoading = false;
      });
    }
  }

  Future<void> _loadFuelStations() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      String url =
          'https://www.google.com/maps/search/fuel+stations/@${position.latitude},${position.longitude},14z';

      setState(() {
        debugMessage = 'Loading WebView with URL: $url';
      });

      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              setState(() {
                debugMessage = 'Page started loading: $url';
              });
            },
            onPageFinished: (String url) {
              setState(() {
                debugMessage = 'Page finished loading: $url';
              });
              _extractFuelStations();
            },
            onWebResourceError: (WebResourceError error) {
              setState(() {
                debugMessage = 'Web resource error: ${error.description}';
                isLoading = false;
              });
            },
          ),
        )
        ..loadRequest(Uri.parse(url));

      setState(() {});
    } catch (e) {
      setState(() {
        debugMessage = "Error loading fuel stations: $e";
        isLoading = false;
      });
    }
  }

  void _extractFuelStations() {
    _controller?.runJavaScriptReturningResult('''
    var places = document.getElementsByClassName('hfpxzc');
    var results = [];
    for (var i = 0; i < places.length; i++) {
      var place = places[i];
      var name = place.getAttribute('aria-label');
      var distance = place.parentElement.nextElementSibling ? place.parentElement.nextElementSibling.textContent : 'Unknown';
      results.push({name: name, distance: distance});
    }
    JSON.stringify(results);
  ''').then((result) {
      if (result != null) {
        try {
          var decodedResult = json.decode(result.toString());
          if (decodedResult is List) {
            setState(() {
              fuelStations = List<Map<String, dynamic>>.from(decodedResult);
              isLoading = false;
              debugMessage = 'Extracted ${fuelStations.length} fuel stations';
            });
          } else {
            setState(() {
              debugMessage = 'Unexpected result format: ${result.toString()}';
              isLoading = false;
            });
          }
        } catch (e) {
          setState(() {
            debugMessage =
                'Error parsing result: $e\nRaw result: ${result.toString()}';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          debugMessage = 'No fuel stations extracted (null result)';
          isLoading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        debugMessage = 'Error extracting fuel stations: $error';
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Stations'),
      ),
      body: Stack(
        children: [
          if (_controller != null) WebViewWidget(controller: _controller!),
          if (isLoading)
            Center(child: CircularProgressIndicator())
          else
            Center(child: Text(debugMessage)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: Colors.white,
              child: fuelStations.isEmpty
                  ? Center(child: Text('No fuel stations found'))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fuelStations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    fuelStations[index]['name'] ?? '',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    fuelStations[index]['distance'] ?? '',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
