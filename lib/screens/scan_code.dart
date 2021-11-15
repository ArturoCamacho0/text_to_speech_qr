import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:text_qr/screens/text_tospeech.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  late String qrCodeResult = "";

  @override
  Widget build(BuildContext context) {
    qrCodeResult = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escaner de QR a voz"),
      ),
      body: Center(
        child: (qrCodeResult == null) || (qrCodeResult == "")
            ? ElevatedButton(
                onPressed: () {
                  _scan();
                },
                child: const Text("Escanea un código QR",
                    style:
                        TextStyle(fontSize: 20.0)),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(20)),
                ),
              )
            : TextSpeech(text: qrCodeResult),
      ),
    );
  }

  Future<void> _scan() async {
    ScanResult codeSanner = await BarcodeScanner.scan(
      options: const ScanOptions(
        useCamera: -1,
      ),
    );
    setState(() {
      qrCodeResult = codeSanner.rawContent;
    });

    if(qrCodeResult != ""){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TextSpeech(text: qrCodeResult)),
      );
    }
  }
}
