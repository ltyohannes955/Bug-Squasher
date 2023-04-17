import 'package:digital_business_card/views/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

const bgColor = Color(0xfffafafa);

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
      backgroundColor: bgColor,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFlashOn = !isFlashOn;
            });
            if(isFlashOn){

            }
          }, icon: const Icon(Icons.flash_on, color: Colors.grey,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.camera_front, color: Colors.grey,)),
        ],
        iconTheme: const IconThemeData(color: Colors.black87),
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
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Place your QR coode in this area.",
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
                  Text(
                    "Scanning will be started automatically.",
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
                    "D.B.C",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
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