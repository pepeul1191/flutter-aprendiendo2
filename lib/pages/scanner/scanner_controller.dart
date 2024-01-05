import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerController extends GetxController {
  late QRViewController qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void onClose() {
    qrViewController.dispose();
    super.onClose();
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    qrViewController.scannedDataStream.listen((scanData) {
      // Procesar los datos del código QR escaneado aquí
      print('Datos escaneados: ${scanData.code}');
      // Implementar la lógica para lo que se hará con los datos escaneados
    });
  }
}