import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'scanner_controller.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey _qrKey = GlobalKey();
  QRViewController? _controller;
  String qrText = "Acerca la cámara al código QR para escanear";

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor:  Colors.red,
                borderRadius: 10,
                borderLength: 50,
                borderWidth: 10,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Resultado: $qrText'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this._controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData.code!;
      });
    });
  }
}

class ScannerPage extends StatelessWidget {
  ScannerController control = Get.put(ScannerController());

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QRViewExample(),
    );
  }
}
