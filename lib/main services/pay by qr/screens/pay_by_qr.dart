import 'dart:io';
import 'package:nedaj/export.dart';

class PayByQr extends StatefulWidget {
  const PayByQr({super.key});

  @override
  _PayByQrState createState() => _PayByQrState();
}

class _PayByQrState extends State<PayByQr> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? gasStationName;
  String? gasStationID;
  bool isScanQRSelected = true; // By default, "Scan QR" is selected.

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
    // Reset the scanned data when the screen is initialized
    gasStationName = null;
    gasStationID = null;
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      var result = await Permission.camera.request();
      if (result.isGranted) {
        // Permission granted, proceed with scanning
      } else {
        // Permission denied, handle appropriately
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Camera permission is required")),
        );
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light, // For light icons
        statusBarBrightness: Brightness.dark, // For dark background
      ),
      child: Scaffold(
        body: Stack(
          children: [
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
                          // Stop the camera before navigating
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

            // Cancel Button at the bottom
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

    controller.scannedDataStream.listen((scanData) {
      final data = scanData.code; // Get the QR code data
      _handleScanData(data);
    });
  }

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
            backgroundColor: Colors.black,
            content: Text(
              'Data Scanned Successfully',
              textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        );

        // Optionally, you can pause the scanner once the data is scanned
        controller?.dispose();

        // Navigate to PayByQrScanPage page with the scanned information
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayByQrScanPage(
              gasStationName: gasStationName!,
              gasStationID: gasStationID!,
            ),
          ),
        ).then((_) {
          // Clear the scanned data and resume the camera when returning
          setState(() {
            gasStationName = null; // Clear the previous scan
            gasStationID = null; // Clear the previous scan
          });
          controller?.resumeCamera(); // Resume the camera for a new scan
        });
      }
    }
  }
}
