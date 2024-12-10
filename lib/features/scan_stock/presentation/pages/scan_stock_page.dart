import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import '../../../../app/base/page/base_page_bloc_state.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';

@RoutePage()
class ScanStockPage extends StatefulWidget {
  const ScanStockPage({super.key});

  @override
  State<ScanStockPage> createState() => _ScanStockPageState();
}

class _ScanStockPageState
    extends BasePageBlocState<ScanStockPage, ScanStockBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(' Scanner'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                child: const Text('Scan Barcode'),
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AiBarcodeScanner(
                        onDispose: () {
                          /// This is called when the barcode scanner is disposed.
                          /// You can write your own logic here.
                          debugPrint("Barcode scanner disposed!");
                        },
                        hideGalleryButton: false,
                        controller: MobileScannerController(
                          detectionSpeed: DetectionSpeed.noDuplicates,
                        ),
                        onDetect: (BarcodeCapture capture) {
                          /// The row string scanned barcode value
                          // final String? scannedValue =
                          //     capture.barcodes.first.rawValue;
                          // debugPrint("Barcode scanned: $scannedValue");

                          // /// The `Uint8List` image is only available if `returnImage` is set to `true`.
                          // final Uint8List? image = capture.image;
                          // debugPrint("Barcode image: $image");

                          /// row data of the barcode
                          // final Object? raw = capture.raw;
                          // debugPrint("Barcode raw: $raw");

                          // /// List of scanned barcodes if any
                          // final List<Barcode> barcodes = capture.barcodes;
                          // debugPrint("Barcode list: $barcodes");
                        },
                        validator: (value) {
                          if (value.barcodes.isEmpty) {
                            return false;
                          }
                          if (!(value.barcodes.first.rawValue
                                  ?.contains('flutter.dev') ??
                              false)) {
                            debugPrint("---------false");
                            return false;
                          }
                          debugPrint("---------true");

                          return true;
                        },
                      ),
                    ),
                  );
                },
              ),
              const Text("bacondf"),
            ],
          ),
        ),
      ),
    );
  }
}
