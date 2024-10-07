import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({super.key});

  @override
  _QrCodeScannerPageState createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? gasStationName;
  String? gasStationID;

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
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: [
          // QR Scanner in a square at the center of the screen
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
                // This is the square where the scanner is focused
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
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
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
