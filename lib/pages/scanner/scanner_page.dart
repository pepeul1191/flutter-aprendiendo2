import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'scanner_controller.dart';

class ScannerPage extends StatelessWidget {
  ScannerController control = Get.put(ScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
      ),
      body: Center(
          child: QRView(
            key: control.qrKey,
            onQRViewCreated: control.onQRViewCreated,
          ),
      ),
    );
  }
}
