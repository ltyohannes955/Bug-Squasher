import 'package:digital_business_card/views/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';


class ResultScreen extends StatelessWidget {
  final String code;
  final Function()closeScreen;
  const ResultScreen({super.key, required this.code, required this.closeScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#2B5B80'.toColor(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
                    "QR Scanner",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: code,
              size:150,
              version:QrVersions.auto,
              ),
            
            const Text(
                    "Scanned Result",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Text(
                    code,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      letterSpacing: 1,
                    ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: (){
                        Clipboard.setData(ClipboardData(text: code));
                      }, 
                      child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                    ),
                    ),
                    )
          ],
        ),
      ),
    );
  }
}