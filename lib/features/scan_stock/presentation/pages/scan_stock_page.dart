import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/core/constants/constants.dart';
import 'package:sos_mobile/features/scan_stock/alert/unverify_alert.dart';
import 'package:sos_mobile/features/scan_stock/presentation/pages/remark_buttomsheet.dart';
import 'package:sos_mobile/features/scan_stock/presentation/widgets/image_beas64.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:sos_mobile/utils/widgets/custom_textfile.dart';

import '../../../../core/helper/local_data/storge_local.dart';
import '../bloc/bloc.dart';
import '../../../../app/base/page/base_page_bloc_state.dart';

@RoutePage()
class ScanStockPage extends StatefulWidget {
  const ScanStockPage({super.key});

  @override
  State<ScanStockPage> createState() => _ScanStockPageState();
}

List<String> campus = ["Main Campus", "Calmette Campus", "N/A"];
List<String> quality = ["High", "Medium", "Low", "N/A"];

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
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  // backgroundColor: context.moonColors!.beerus,
                  automaticallyImplyLeading: false,
                  title: Text(
                    t.scan.title,
                    style: context.moonTypography!.heading.text16
                        .copyWith(color: context.moonColors!.bulma),
                  ),
                  actions: [
                    MoonButton(
                        backgroundColor: context.moonColors!.beerus,
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
                        LocalStorage.getStringValue(
                                    SharedPreferenceKeys.theme) ==
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
                              content: Container(
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
                                              color:
                                                  context.moonColors!.trunks),
                                    ),
                                    kPadding2.gap,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: MoonButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            borderWidth: 1,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  width: 0.5,
                                                  color: AppColor.dangerColor,
                                                )),
                                            buttonSize: MoonButtonSize.sm,
                                            backgroundColor: Colors.transparent,
                                            label: Text(
                                              t.common.back,
                                              style: context
                                                  .moonTypography!.body.text12
                                                  .copyWith(
                                                color: AppColor.dangerColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        kPadding2.gap,
                                        Expanded(
                                          child: MoonButton(
                                            onTap: () {
                                              bloc.add(ClickLogout());
                                            },
                                            buttonSize: MoonButtonSize.sm,
                                            backgroundColor:
                                                AppColor.dangerColor,
                                            label: Text(
                                              t.common.confirm,
                                              style: context
                                                  .moonTypography!.body.text12
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
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
                body: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: state.isLoading && state.asset == null
                              ? const Center(
                                  child: MoonCircularLoader(sizeValue: 20),
                                )
                              : state.isAssetNull
                                  ? Container(
                                      width: double.infinity,
                                      padding:
                                          const EdgeInsets.all(kPadding2 * 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            MoonIcons.other_smile_24_light,
                                            size: 60,
                                          ),
                                          Text(state.assetId),
                                          kPadding.gap,
                                          Text(
                                            t.scan.assetNull,
                                            style: context
                                                .moonTypography!.body.text14,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: Container(
                                          width: double.infinity,
                                          padding:
                                              const EdgeInsets.all(kPadding),
                                          child: Column(
                                            children: [
                                              state.asset != null
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            state.asset!.image!
                                                                    .isNotEmpty
                                                                ? Base64Image(
                                                                    base64String: state
                                                                        .asset!
                                                                        .image!)
                                                                : Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration: BoxDecoration(
                                                                        color: context
                                                                            .moonColors!
                                                                            .beerus,
                                                                        borderRadius: BorderRadius.circular(
                                                                            5)),
                                                                    padding: const EdgeInsets
                                                                        .all(
                                                                        kPadding2 *
                                                                            2),
                                                                    child: Center(
                                                                        child: Text(
                                                                      t.scan
                                                                          .noImage,
                                                                    ))),
                                                            if (state.asset!
                                                                .count_status!)
                                                              Positioned(
                                                                  right: 0,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      bool
                                                                          done =
                                                                          await UnverifyAlert.show(
                                                                              context: context);
                                                                      if (done) {
                                                                        bloc.add(ClickConfrim(
                                                                            state.remark,
                                                                            false));
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          kPadding),
                                                                      color: AppColor
                                                                          .dangerColor,
                                                                      child:
                                                                          Text(
                                                                        t.scan
                                                                            .unVerify,
                                                                        style: context
                                                                            .moonTypography!
                                                                            .body
                                                                            .text14
                                                                            .copyWith(color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  )),
                                                          ],
                                                        ),
                                                        kPadding.gap,
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Column(
                                                            children: [
                                                              CustomTextfield(
                                                                readOnly: true,
                                                                color: AppColor
                                                                    .successColor,
                                                                hintText:
                                                                    t.scan.id,
                                                                controller: TextEditingController(
                                                                    text: state
                                                                        .asset!
                                                                        .asset_number),
                                                              ),
                                                              kPadding2.gap,
                                                              MoonDropdown(
                                                                onTapOutside:
                                                                    () {
                                                                  bloc.add(
                                                                      ClickOutSide());
                                                                },
                                                                constrainWidthToChild:
                                                                    true,
                                                                content:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          kPadding),
                                                                  width: double
                                                                      .infinity, // Set a specific width to avoid overflow
                                                                  child: Column(
                                                                    children: [
                                                                      ...List
                                                                          .generate(
                                                                        campus
                                                                            .length,
                                                                        (index) {
                                                                          return MoonMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              bloc.add(ClickSelectCampus(campus[index]));
                                                                            },
                                                                            width:
                                                                                double.infinity,
                                                                            label:
                                                                                Text(campus[index]),
                                                                          );
                                                                        },
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                show: state
                                                                    .isShowCampus, // Always shows the dropdown for testing
                                                                child:
                                                                    CustomTextfield(
                                                                  readOnly:
                                                                      true,
                                                                  ontap: () {
                                                                    bloc.add(
                                                                        ClickCampus());
                                                                  },
                                                                  hintText: t
                                                                      .scan
                                                                      .campus,
                                                                  controller: TextEditingController(
                                                                      text: state
                                                                          .asset!
                                                                          .campus),
                                                                ),
                                                              ),
                                                              kPadding.gap,
                                                              CustomTextfield(
                                                                ontap: () {
                                                                  bloc.add(
                                                                      TabTextfile());
                                                                },
                                                                onChanged:
                                                                    (value) {
                                                                  bloc.add(
                                                                      RoomChanged(
                                                                          value));
                                                                },
                                                                hintText:
                                                                    t.scan.room,
                                                                controller: state
                                                                    .roomController,
                                                              ),
                                                              kPadding.gap,
                                                              CustomTextfield(
                                                                controller: state
                                                                    .descEnController,
                                                                hintText: t
                                                                    .scan.desEn,
                                                                onChanged:
                                                                    (value) {
                                                                  bloc.add(
                                                                      DescEnChanged(
                                                                          value));
                                                                },
                                                              ),
                                                              kPadding.gap,
                                                              CustomTextfield(
                                                                hintText: t
                                                                    .scan.desKh,
                                                                controller: state
                                                                    .descKhController,
                                                                onChanged:
                                                                    (value) {
                                                                  bloc.add(
                                                                      DescKhChanged(
                                                                          value));
                                                                },
                                                              ),
                                                              kPadding2.gap,
                                                              MoonDropdown(
                                                                onTapOutside:
                                                                    () {
                                                                  bloc.add(
                                                                      ClickOutSide());
                                                                },
                                                                constrainWidthToChild:
                                                                    true,
                                                                content:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          kPadding),
                                                                  width: double
                                                                      .infinity, // Set a specific width to avoid overflow
                                                                  child: Column(
                                                                    children: [
                                                                      ...List
                                                                          .generate(
                                                                        quality
                                                                            .length,
                                                                        (index) {
                                                                          return MoonMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              bloc.add(ClickSelectQuality(quality[index]));
                                                                            },
                                                                            width:
                                                                                double.infinity,
                                                                            label:
                                                                                Text(quality[index]),
                                                                          );
                                                                        },
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                show: state
                                                                    .isShowQuality, // Always shows the dropdown for testing
                                                                child:
                                                                    CustomTextfield(
                                                                  ontap: () {
                                                                    bloc.add(
                                                                        ClickQuality());
                                                                  },
                                                                  readOnly:
                                                                      true,
                                                                  hintText: t
                                                                      .scan
                                                                      .quality,
                                                                  controller: TextEditingController(
                                                                      text: state
                                                                          .asset!
                                                                          .quality),
                                                                ),
                                                              ),
                                                              kPadding2.gap,
                                                              CustomTextfield(
                                                                readOnly: true,
                                                                color: AppColor
                                                                    .successColor,
                                                                hintText: t.scan
                                                                    .updateBy,
                                                                controller: TextEditingController(
                                                                    text: state
                                                                            .asset!
                                                                            .updated_by
                                                                            .isEmpty
                                                                        ? " "
                                                                        : state
                                                                            .asset!
                                                                            .updated_by),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        kPadding.gap,
                                                        Text(
                                                          t.scan.remark,
                                                          style: context
                                                              .moonTypography!
                                                              .body
                                                              .text12,
                                                        ),
                                                        kPadding.gap,

                                                        // if(state.asset!.remark!.isNotEmpty&& state.asset!.remark!=" ")
                                                        GestureDetector(
                                                          onTap: () async {
                                                            RemarkHH rr = await RemarkButtomSheet
                                                                .showBottomSheet(
                                                                    context,
                                                                    state.asset!
                                                                        .remark
                                                                        .trim());
                                                            debugPrint(rr
                                                                .isRemark
                                                                .toString());
                                                            debugPrint(rr.remark
                                                                .toString());
                                                            if (rr.isRemark) {
                                                              bloc.add(
                                                                  RemarkChangedEvent(
                                                                      rr.remark));
                                                            }
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(
                                                                    kPadding2),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: context
                                                                        .moonColors!
                                                                        .beerus),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            kPadding)),
                                                            child: Text(state
                                                                        .asset!
                                                                        .remark
                                                                        .isEmpty ||
                                                                    state.asset!
                                                                            .remark ==
                                                                        ' '
                                                                ? t.scan
                                                                    .remarkDes
                                                                : state.asset!
                                                                    .remark),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : const SizedBox.shrink(),
                                            ],
                                          )))),
                    ],
                  ),
                ),
                bottomNavigationBar: SafeArea(
                  top: false,
                  minimum: const EdgeInsets.all(kPadding),
                  child: SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(kPadding),
                      child: Row(
                        children: [
                          if (state.asset != null)
                            Expanded(
                              child: MoonButton(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: state.asset!.hasEmptyFields()
                                            ? AppColor.dangerColor
                                            : AppColor.primaryColor)),
                                isFullWidth: true,
                                onTap: () async {
                                  if (!state.asset!.hasEmptyFields()) {
                                    bloc.add(ClickConfrim(state.remark, true));
                                  }
                                },
                                label: Text(
                                  t.scan.verify,
                                  style: context.moonTypography!.heading.text16
                                      .copyWith(
                                          color: state.asset!.hasEmptyFields()
                                              ? AppColor.dangerColor
                                              : AppColor.primaryColor),
                                ),
                              ),
                            ),
                          kPadding.gap,
                          Expanded(
                            child: MoonButton(
                              onTap: () async {
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AiBarcodeScanner(
                                      sheetTitle: t.scan.scantitle,
                                      onDispose: () {
                                        debugPrint("Barcode scanner disposed!");
                                      },
                                      hideGalleryButton: false,
                                      controller: MobileScannerController(
                                        detectionSpeed: DetectionSpeed.normal,
                                      ),
                                      onDetect: (BarcodeCapture capture) {},
                                      validator: (value) {
                                        if (value.barcodes.isEmpty) {
                                          return false;
                                        }
                                        if (!(value.barcodes.first.rawValue
                                                ?.contains('flutter.dev') ??
                                            false)) {
                                          debugPrint(
                                              "---------false ${value.barcodes.first.rawValue}");
                                          bloc.add(GetAssets(
                                              '${value.barcodes.first.rawValue}'));
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
                              height: 50,
                              label: const Icon(
                                MoonIcons
                                    .security_qr_code_alternative_24_regular,
                                color: AppColor.primaryColor,
                              ),
                              backgroundColor:
                                  AppColor.primaryColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state.isLoadingRemark)
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: context.moonColors!.beerus.withOpacity(0.4),
                  child: const Center(
                    child: MoonCircularLoader(sizeValue: 20),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
