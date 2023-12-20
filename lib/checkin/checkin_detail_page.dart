import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_flutter_module/checkin/checkin_provider.dart';
import 'package:saas_flutter_module/res/resources.dart';
import 'package:saas_flutter_module/widgets/my_app_bar.dart';
import 'package:saas_flutter_module/widgets/my_refresh_list.dart';

class CheckInDetailPage extends ConsumerStatefulWidget {
  CheckInDetailPage({Key? key}) : super(key: key);

  @override
  _CheckInDetailPageState createState() => _CheckInDetailPageState();
}

class _CheckInDetailPageState extends ConsumerState<CheckInDetailPage> {
  int _page = 1;
  List<String> _list = <String>[];
  final int _maxPage = 3;

  @override
  void initState() {
    super.initState();
    _onRefresh();
    ref.read(myProvider);
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _page = 1;
        _list = List.generate(30, (i) => 'newItem：$i');
      });
    });
  }

  bool _hasMore() {
    return _page < _maxPage;
  }

  bool _isLoading = false;

  Future<void> _loadMore() async {
    if (_isLoading) {
      return;
    }
    if (!_hasMore()) {
      return;
    }
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _list.addAll(List.generate(30, (i) => 'newItem：$i'));
        _page++;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = ref.watch(myProvider);
    LogUtil.e(value);
    return Scaffold(
      body: NotificationListener(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: Container(
            child: CustomScrollView(
              slivers: <Widget>[_buildSliverAppBar(), _buildSliverList()],
            ),
            color: Colours.color_FFF7F7F7,
          ),
        ),
        onNotification: (ScrollNotification note) {
          if (note.metrics.pixels == note.metrics.maxScrollExtent) {
            _loadMore();
          }
          return true;
        },
      ),
      appBar: MyAppBar(
        title: "打卡明细",
        backgroundColor: Colours.color_FFC2E4FF,
      ),
    );
  }

  Widget _buildSliverList() => SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return index < _list.length
              ? Container(
                  height: 90,
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Text(
                          "S0200BT22900002",
                          style: TextStyles.color_FF222222_16M,
                        ),
                        top: 12,
                        left: 16,
                      ),
                      Positioned(
                        child: Text(
                          "本月巡检次数：1",
                          style: TextStyles.color_FF888888_14N,
                        ),
                        bottom: 16,
                        left: 16,
                      ),
                      Positioned(
                        child: Text(
                          "巡检人：叶大钊",
                          style: TextStyles.color_FF888888_14N,
                        ),
                        bottom: 16,
                        left: 140,
                      ),
                      Positioned(
                        child: Images.icItem0,
                        top: 15,
                        right: 90,
                      ),
                      Positioned(
                        child: Text(
                          "本月已巡检",
                          style: TextStyles.text14N,
                        ),
                        top: 14,
                        right: 16,
                      ),
                    ],
                  ),
                )
              : MoreWidget(_list.length, _hasMore(), 10);
        }, childCount: _list.length + 1),
      );

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 232,
      bottom: MyBottom(),
      backgroundColor: Colours.color_FFC2E4FF,
      toolbarHeight: 0,
      pinned: true,
      flexibleSpace: Container(
        height: 178,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colours.color_FFF0F0F0))),
        child: Stack(
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Images.imgHead,
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "叶大钊",
                      style: TextStyles.color_FF222222_20M,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "深圳市",
                      style: TextStyles.text12N,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 98,
              margin: EdgeInsets.only(top: 80),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Row(
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Stack(
                        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                        children: <Widget>[
                          Positioned(
                            top: 24,
                            child: Text(
                              "48",
                              style: TextStyles.color_FF222222_20M,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            child: Text("本月打卡电柜",
                                style: TextStyles.color_FF484848_14N),
                          )
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Stack(
                        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                        children: <Widget>[
                          Positioned(
                            top: 24,
                            child: Text(
                              "7",
                              style: TextStyles.color_FF222222_20M,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            child: Text("今日打卡电柜",
                                style: TextStyles.color_FF484848_14N),
                          )
                        ],
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBottom extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            height: 30,
            width: 74,
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
                color: Colours.color_FF222222,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "全部 60",
                style: TextStyles.color_FFFFFFFF_14N,
              ),
            ),
          ),
          Container(
            height: 30,
            width: 74,
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                color: Colours.color_FFF6F6F6,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "未巡检 12",
                style: TextStyles.color_FF333333_14N,
              ),
            ),
          ),
          Container(
            height: 30,
            width: 74,
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                color: Colours.color_FFF6F6F6,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "已巡检 48",
                style: TextStyles.color_FF333333_14N,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
