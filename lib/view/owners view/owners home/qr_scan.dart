import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final GlobalKey _key = GlobalKey();
  QRViewController? qrViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black45),
        centerTitle: true,
        title: const Text(
          'QRコードを読み取る',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
      ),
      //body: QRView(
       //key: _key,
        //onQRViewCreated: (QRViewController controller) {
         //setState(() {
          // qrViewController = controller;
        // });
         //controller.scannedDataStream.listen((data) {
          // print(data.code);
        // });
       // },
        //overlay: QrScannerOverlayShape(
          //borderColor: Colors.black,
          //borderRadius: 10,
         // borderLength: 30,
          //borderWidth: 10,
         // cutOutSize: 200,
        //),
      //),
    );
  }
}
