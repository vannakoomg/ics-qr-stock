import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sos_mobile/core/utils/widgets/custom_loading.dart';

class AppSmartRefreshScrollView extends StatefulWidget {
  const AppSmartRefreshScrollView({
    super.key,
    required this.child,
    this.onRefresh,
  });

  final Future<void> Function()? onRefresh;

  final Widget child;

  @override
  State<AppSmartRefreshScrollView> createState() =>
      _AppSmartRefreshScrollViewState();
}

class _AppSmartRefreshScrollViewState extends State<AppSmartRefreshScrollView> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    widget.onRefresh?.call();
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: CustomHeader(
        builder: (_, mode) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CustomLoading()),
        ),
      ),
      footer: CustomFooter(
        // height: 0,
        builder: (context, mode) {
          Widget? body;
          // if (mode == LoadStatus.idle) {
          //   body = const Text("pull up load");
          // } else
          if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("Release to load more contents");
          }
          // else {
          //   body = const Text("No more Data");
          // }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: widget.child,
    );
  }
}
