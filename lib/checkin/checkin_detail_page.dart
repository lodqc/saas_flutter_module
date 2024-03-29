import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_flutter_module/checkin/checkin_provider_demo.dart';
import 'package:saas_flutter_module/res/resources.dart';
import 'package:saas_flutter_module/widgets/my_app_bar.dart';
import 'package:saas_flutter_module/widgets/my_refresh_list.dart';

class CheckInDetailPage extends ConsumerStatefulWidget {
  CheckInDetailPage({Key? key}) : super(key: key);

  @override
  _CheckInDetailPageState createState() => _CheckInDetailPageState();
}

class _CheckInDetailPageState extends ConsumerState<CheckInDetailPage> {
  @override
  void initState() {
    super.initState();
    ref.read(batteryAlarmProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        child: RefreshIndicator(
          onRefresh: () => ref.read(batteryAlarmProvider.notifier).refresh(),
          child: Container(
            child: CustomScrollView(
              slivers: <Widget>[_buildSliverAppBar(), _buildSliverList(ref)],
            ),
            color: Colours.color_FFF7F7F7,
          ),
        ),
        onNotification: (ScrollNotification note) {
          if (note.metrics.pixels == note.metrics.maxScrollExtent) {
            ref.read(batteryAlarmProvider.notifier).loadMore();
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

  Widget _buildSliverList(WidgetRef ref){
    var list = ref.watch(batteryAlarmProvider);
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return index < (list?.length??0)
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
            : MoreWidget((list?.length??0), ref.read(batteryAlarmProvider.notifier).hasMore());
      }, childCount: (list?.length??0) + 1),
    );
  }

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
