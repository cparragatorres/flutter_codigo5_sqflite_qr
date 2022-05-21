import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerQRPage extends StatefulWidget {
  @override
  State<ScannerQRPage> createState() => _ScannerQRPageState();
}

class _ScannerQRPageState extends State<ScannerQRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 260.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: kBrandPrimaryColor,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 7,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result!.code);
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: _buildQrView(context),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Carnet escaneado: ",
                    style: TextStyle(
                      color: kFontPrimaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "Por favor escanea un carnet",
                    style: TextStyle(
                      color: kFontPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 52.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kBrandPrimaryColor,
                        // primary: Color(0xff04CD8B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      },
                      child: const Text(
                        "Registrar carnet",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
