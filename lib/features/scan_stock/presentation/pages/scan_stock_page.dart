import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

import '../../../../core/helper/local_data/storge_local.dart';
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
      child: BlocBuilder<ScanStockBloc, ScanStockState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: context.moonColors!.beerus,
              automaticallyImplyLeading: false,
              title: Text(
                t.scan.title,
                style: context.moonTypography!.heading.text16
                    .copyWith(color: context.moonColors!.bulma),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kPadding2),
                  width: 1,
                  color: context.moonColors!.trunks,
                ),
                MoonButton(
                    onTap: () {
                      bloc.add(ClickChangeLanguage());
                      setState(() {});
                    },
                    label: Text(t.scan.language)),
                MoonButton.icon(
                  onTap: () {
                    bloc.add(ClickChangeMode());
                    setState(() {});
                  },
                  icon: Icon(
                    LocalStorage.getStringValue(SharedPreferenceKeys.theme) ==
                            "light"
                        ? MoonIcons.other_sun_24_light
                        : MoonIcons.other_moon_24_light,
                    color: context.moonColors!.bulma,
                  ),
                ),
                kPadding.gap,
              ],
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AiBarcodeScanner(
                            actions: const [],

                            // sheetTitle: "Scan any QR",
                            onDispose: () {
                              /// This is called when the barcode scanner is disposed.
                              /// You can write your own logic here.
                              debugPrint("Barcode scanner disposed!");
                            },
                            hideGalleryButton: false,
                            controller: MobileScannerController(
                              detectionSpeed: DetectionSpeed.normal,
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
                    child: Container(
                        width: double.infinity,
                        color: context.moonColors!.beerus,
                        padding: const EdgeInsets.all(kPadding),
                        child: Center(
                          child: Text(
                            t.scan.buttonName,
                            style: context.moonTypography!.heading.text16
                                .copyWith(color: AppColor.primaryColor),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
