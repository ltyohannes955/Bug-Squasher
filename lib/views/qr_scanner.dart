import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/views/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;
  MobileScannerController controller = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: '#2B5B80'.toColor(),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFlashOn = !isFlashOn;
            });
            if(isFlashOn){

            }
          }, icon: const Icon(Icons.flash_on, color: Colors.grey,)),
        ],
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: const LocaleText(
                    "qr_scanner",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  LocaleText(
                    "place_your_QR_code_in_this_area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  LocaleText(
                    "scanning_will_start_automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    ),
                ],
              )
                ),
            Expanded(
              flex: 4,
              child: Stack(
                children:[
                  MobileScanner(
                     
                    onDetect: (BarcodeCapture barcode) { 
                      if (!isScanCompleted){
                  String code = barcode.barcodes.first.rawValue ?? '---';
                  isScanCompleted = true;
                  Navigator.push(
                    context, 
                    MaterialPageRoute (
                    builder: (context) => ResultScreen(
                      closeScreen: closeScreen,
                      code: code,
                      ),
                      ));
                }
                     }, 
                  
                
               ),
              ],
              )
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                    "DBC",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}