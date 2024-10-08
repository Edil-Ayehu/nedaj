import 'dart:io';
import 'package:nedaj/export.dart';
import 'package:nedaj/main%20services/pay%20by%20qr/screens/pay_by_qr_scan_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

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
  }

  Future<void> _requestCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      // Camera permission granted
    } else {
      // Handle permission denial
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Camera permission is required")),
      );
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

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 114, 113, 111),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CustomButton(
          buttonText: 'Cancel',
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 60),

          // Toggle between "Scan QR" and "Generate QR"
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
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
                    child: Text('Scan QR'),
                  ),
                ),

                // Generate QR Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isScanQRSelected = false;
                    });
                    if (!isScanQRSelected) {
                      // Navigate to the QR Generation page when "Generate QR" is selected
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PayByQrGeneratePage(),
                        ),
                      );
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
                    child: Text('Generate QR'),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Show QR Scanner only if "Scan QR" is selected
          if (isScanQRSelected)
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderWidth: 10,
                      borderRadius: 10,
                      borderLength: 20,
                      cutOutSize: size.width * 0.8,
                      borderColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

          // Display the scanned information in ListTiles
          Expanded(
            flex: 1,
            child: Column(
              children: [
                if (gasStationName != null && gasStationID != null) ...[
                  ListTile(
                    title: Text('Gas Station Name'),
                    subtitle: Text(gasStationName!),
                    leading: Icon(Icons.local_gas_station),
                  ),
                  ListTile(
                    title: Text('Gas Station ID'),
                    subtitle: Text(gasStationID!),
                    leading: Icon(Icons.info),
                  ),
                ],
              ],
            ),
          ),
        ],
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

  void _handleScanData(String? data) {
    if (data != null) {
      final parts = data.split(',');
      if (parts.length == 2) {
        setState(() {
          gasStationName = parts[0];
          gasStationID = parts[1];
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data Scanned Successfully')),
        );

        // Optionally, you can pause the scanner once the data is scanned
        controller?.pauseCamera();

        // Navigate to PayByQrScanPage page with the scanned information
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayByQrScanPage(
              gasStationName: gasStationName!,
              gasStationID: gasStationID!,
            ),
          ),
        );
      }
    }
  }
}
