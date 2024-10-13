import 'package:nedaj/export.dart'; // Assuming this contains the necessary imports

class PayByQr extends StatefulWidget {
  const PayByQr({super.key});

  @override
  _PayByQrState createState() => _PayByQrState();
}

class _PayByQrState extends State<PayByQr> with WidgetsBindingObserver {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? gasStationName;
  String? gasStationID;
  bool isScanQRSelected = true; // By default, "Scan QR" is selected.
  bool cameraPermissionGranted = false; // Track if permission is granted
  bool isListenerAttached = false; // Track if the listener is attached

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissionAndInitializeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Check camera permission when the app is resumed
      _checkPermissionAndRestartScanner();
    }
  }

  Future<void> _checkPermissionAndInitializeCamera() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() {
        cameraPermissionGranted = true;
      });
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied, show dialog to guide user to app settings
      _showPermissionDialog();
    } else {
      // Request permission if it's not permanently denied
      var result = await Permission.camera.request();
      if (result.isGranted) {
        setState(() {
          cameraPermissionGranted = true;
        });
      } else if (result.isPermanentlyDenied) {
        _showPermissionDialog();
      } else {
        // Permission denied
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Camera permission is required to scan QR codes"),
          ),
        );
      }
    }
  }

  Future<void> _checkPermissionAndRestartScanner() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() {
        cameraPermissionGranted = true;
      });
      await controller?.resumeCamera();
    } else {
      _checkPermissionAndInitializeCamera();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Required'),
        content: Text(
            'Camera permission is permanently denied. Please enable it in the app settings to scan QR codes.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // QR Scanner if permission is granted
            if (cameraPermissionGranted)
              QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderWidth: 0,
                  borderRadius: 10,
                  borderLength: 20,
                  cutOutSize: size.width * 0.8,
                ),
              ),

            // Top Switch for Scan QR / Generate QR
            Positioned(
              top: 60,
              left: size.width * 0.05,
              right: size.width * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Scan QR Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isScanQRSelected = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                        color: isScanQRSelected
                            ? Colors.white
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Scan QR',
                        textScaler: TextScaler.linear(1),
                      ),
                    ),
                  ),

                  // Generate QR Button
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        isScanQRSelected = false;
                      });

                      // Stop the camera before navigating
                      await controller?.pauseCamera();

                      if (!isScanQRSelected) {
                        // Navigate to the QR Generation page when "Generate QR" is selected
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PayByQrGeneratePage(),
                          ),
                        ).then((_) async {
                          // This code runs when returning from PayByQrGeneratePage
                          setState(() {
                            isScanQRSelected = true; // Set back to "Scan QR"
                          });
                          await controller?.resumeCamera();
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                        color: isScanQRSelected
                            ? Colors.grey.shade200
                            : Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Generate QR',
                        textScaler: TextScaler.linear(1),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Cancel Button (always visible)
            Positioned(
              bottom: 20,
              left: size.width * 0.1,
              right: size.width * 0.1,
              child: CustomButton(
                buttonText: 'Cancel',
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    // Attach the listener only once
    if (!isListenerAttached) {
      controller.scannedDataStream.listen((scanData) {
        final data = scanData.code; // Get the QR code data
        _handleScanData(data); // Handle the scan data
      });
      isListenerAttached = true;
    }
  }

  // void _startScanListener() {
  //   controller?.scannedDataStream.listen((scanData) {
  //     final data = scanData.code; // Get the QR code data
  //     _handleScanData(data); // Handle the scan data
  //   });
  // }

  void _handleScanData(String? data) async {
    if (data != null) {
      final parts = data.split(',');
      if (parts.length == 2) {
        setState(() {
          gasStationName = parts[0];
          gasStationID = parts[1];
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data Scanned Successfully'),
          ),
        );

        await controller?.pauseCamera(); // Pause the camera before navigating

        // controller?.dispose();
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayByQrScanPage(
              gasStationName: gasStationName!,
              gasStationID: gasStationID!,
            ),
          ),
        );

        // Reset values after returning from the page
        setState(() {
          gasStationName = null;
          gasStationID = null;
        });

        // Resume the camera and reattach the scan listener when returning to the page
        await controller?.resumeCamera();
      }
    }
  }
}
