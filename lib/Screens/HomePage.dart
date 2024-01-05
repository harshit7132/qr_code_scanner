import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/Screens/webViewPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? scanQR;

  Future<void> Scanqr() async {
    String? qrCodeScan_res;
    try {
      qrCodeScan_res = await FlutterBarcodeScanner.scanBarcode(
          '#FF0000', "Cancle", false, ScanMode.QR);
    } on PlatformException {
      scanQR = 'Failed';
    }
    setState(() {
      scanQR = qrCodeScan_res;
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => webViewPage(
                  URL: scanQR,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Center(
            child: Stack(children: [
              Container(
                height: 600,
                width: 340,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 20)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, top: 25),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Scanqr();
                    });
                  },
                  child: Container(
                    height: 550,
                    alignment: Alignment.center,
                    child: Text('Click Me',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    width: 300,
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
