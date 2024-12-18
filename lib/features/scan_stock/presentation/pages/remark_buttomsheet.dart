import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_design/moon_design.dart';
import 'package:sos_mobile/app/base/page/base_page_bloc_state.dart';
import 'package:sos_mobile/features/scan_stock/presentation/bloc/remark/bloc/remark_bloc.dart';
import 'package:sos_mobile/gen/i18n/translations.g.dart';

import '../../../../core/constants/constants.dart';

class RemarkButtomSheet extends StatefulWidget {
  final String remark;
  const RemarkButtomSheet({
    super.key,
    required this.remark,
  });

  static Future<RemarkHH> showBottomSheet(
          BuildContext context, String remark) async =>
      await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        useSafeArea: true,
        builder: (_) => RemarkButtomSheet(
          remark: remark,
        ),
        backgroundColor: Colors.transparent,
      );

  @override
  State<RemarkButtomSheet> createState() => _RemarkButtomSheetState();
}

class _RemarkButtomSheetState
    extends BasePageBlocState<RemarkButtomSheet, RemarkBloc> {
  @override
  void initState() {
    bloc.add(InitPage(widget.remark));
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(t.scan.remark),
        centerTitle: true,
        leading: MoonButton.icon(
          icon: const Icon(Icons.close_rounded),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<RemarkBloc, RemarkState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(kPadding2),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: TextFormField(
                    autofocus: true,
                    controller: state.remarkController,
                    maxLines: 20,
                    minLines: 1,
                    style: context.moonTypography!.body.text16
                        .copyWith(fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      isDense: true,
                      hintStyle: context.moonTypography!.body.text16,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: t.scan.remarkDes,
                    ),
                    onChanged: (value) {
                      bloc.add(RemarkChanged(value));
                    },
                  ),
                )),
                MoonButton(
                  isFullWidth: true,
                  onTap: () async {
                    Navigator.pop(context, RemarkHH(true, state.remark));
                  },
                  label: Text(
                    t.scan.remark,
                    style: context.moonTypography!.heading.text16
                        .copyWith(color: Colors.white),
                  ),
                  backgroundColor: state.remark != state.oldRemark
                      ? AppColor.primaryColor
                      : context.moonColors!.beerus,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RemarkHH {
  RemarkHH(this.isRemark, this.remark);
  final bool isRemark;
  final String remark;
}
