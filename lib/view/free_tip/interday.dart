import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/user_view_model.dart';
import 'commodity.dart';
import 'equity.dart';

class Interday extends StatefulWidget {
  const Interday({Key? key}) : super(key: key);

  @override
  State<Interday> createState() => _InterdayState();
}

class _InterdayState extends State<Interday>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(vsync: this, length: 3);
    // homeViewViewModel.fetchMoviewListApi();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefrnces = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff3D3989), width: 0.7),
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: DefaultTabController(
              length: 3,
              child: Container(
                // backgroundColor: Colors.white,
                //  title: Text('Flutter Tabs Demo'),
                child: TabBar(
                  controller: _controller,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Color(0xff50B8E7),
                  labelColor: Color(0xff50B8E7),
                  dividerColor: Colors.red,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: "Equity",
                    ),
                    Tab(text: "Commodity"),
                    Tab(text: "Index")
                  ],
                ),
              ),
            ),
          ),
          //    Container()
          Container(
            child: Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  Equity(),
                  Commodity(),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
