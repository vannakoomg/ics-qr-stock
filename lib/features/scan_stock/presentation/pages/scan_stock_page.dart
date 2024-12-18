import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/features/scan_stock/presentation/pages/remark_buttomsheet.dart';
import 'package:sos_mobile/features/scan_stock/presentation/widgets/image_beas64.dart';
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kPadding2),
                  width: 1,
                  color: context.moonColors!.trunks,
                ),
                kPadding.gap,
                MoonButton.icon(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: GestureDetector(
                            onTap: () {
                              bloc.add(ClickLogout());
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(kPadding2 * 1.5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: context.moonColors!.beerus,
                                  ),
                                  color: context.moonColors!.goku,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    t.scan.logoutDes,
                                    textAlign: TextAlign.center,
                                    style: context.moonTypography!.body.text14
                                        .copyWith(
                                            color: context.moonColors!.trunks),
                                  ),
                                  kPadding2.gap,
                                  MoonButton(
                                    buttonSize: MoonButtonSize.sm,
                                    backgroundColor: AppColor.dangerColor,
                                    label: Text(
                                      t.common.confirm,
                                      style: context.moonTypography!.body.text12
                                          .copyWith(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    // bloc.add(ClickLogout());
                  },
                  icon: Icon(
                    MoonIcons.generic_log_out_24_light,
                    color: context.moonColors!.bulma,
                  ),
                ),
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: state.isLoading
                        ? const Center(
                            child: MoonCircularLoader(sizeValue: 20),
                          )
                        : state.isAssetNull
                            ? Center(
                                child: Text(
                                  t.scan.assetNull,
                                  style: context.moonTypography!.body.text18
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 128, 39, 0)),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : state.asset != null
                                ? Container(
                                  width: double.infinity,
                                    padding: const EdgeInsets.all(kPadding),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            state.asset!.image!.isNotEmpty?
                                            Base64Image(
                                                base64String:
                                                    state.asset!.image!):Container(
                                                      width: double.infinity,
                                                      color: context.moonColors!.beerus,
                                                      padding: EdgeInsets.all(kPadding2*2),
                                                      child: Center(child: Text("${t.scan.noImage}",))),
                                            if (state.asset!.isRemark!)
                                              Positioned(
                                                  right: 0,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            kPadding / 2),
                                                    color: Colors.red,
                                                    child: Text(
                                                      t.scan.remark,
                                                      style: context
                                                          .moonTypography!
                                                          .body
                                                          .text16
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  )),
                                          ],
                                        ),
                                        kPadding2.gap,
                                        Text(
                                          "${state.asset!.name}",
                                          style: context
                                              .moonTypography!.body.text18
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        kPadding.gap,
                                        Text(
                                          "${state.asset!.description_in_khmer}",
                                          style: context
                                              .moonTypography!.body.text18
                                              .copyWith(
                                                  fontWeight: FontWeight.w400),
                                        ),
                                        if (state.asset!.remark!.isNotEmpty)
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: kPadding2),
                                            padding:
                                                const EdgeInsets.all(kPadding2),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: context.moonColors!.beerus,
                                            )),
                                            child: Center(
                                              child: Text(
                                                "${state.asset!.remark}",
                                                style: context
                                                    .moonTypography!.body.text18
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        kPadding.gap,
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink()),
                Padding(
                  padding: const EdgeInsets.all(kPadding2),
                  child: Column(
                    children: [
                      if (state.asset != null)
                        MoonButton(
                          isFullWidth: true,
                          onTap: () async {
                            RemarkHH remark =
                                await RemarkButtomSheet.showBottomSheet(
                                    context, state.asset!.remark ?? "");
                            if (remark.isRemark) {
                              bloc.add(RemarkAsset(remark.remark));
                            }
                          },
                          label: Text(
                            t.scan.remark,
                            style: context.moonTypography!.heading.text16
                                .copyWith(color: Colors.white),
                          ),
                          backgroundColor: AppColor.primaryColor,
                        ),
                      kPadding.gap,
                      MoonButton(
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AiBarcodeScanner(
                                onDispose: () {
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
                                    debugPrint(
                                        "---------false ${value.barcodes.first.rawValue}");
                                    bloc.add(GetAssets('${value.barcodes.first.rawValue}'));
                                    return false;
                                  }
                                  debugPrint("---------true");

                                  return true;
                                },
                              ),
                            ),
                          );
                        },
                        isFullWidth: true,
                        label: const Icon(
                          MoonIcons.security_qr_code_alternative_24_regular,
                          color: AppColor.primaryColor,
                        ),
                        backgroundColor: AppColor.primaryColor.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
