part of 'remark_bloc.dart';

@freezed
class RemarkState extends BaseState with _$RemarkState {
  const factory RemarkState.initial({
    @Default('') String remark,
    @Default('') String oldRemark,
    @Default(false) bool isloading,
    TextEditingController? remarkController,
  }) = _Initial;
}
