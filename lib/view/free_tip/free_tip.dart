import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';
import '../../view_model/user_view_model.dart';
import 'interday.dart';

class FreeTip extends StatefulWidget {
  const FreeTip({Key? key}) : super(key: key);

  @override
  State<FreeTip> createState() => _FreeTipState();
}

class _FreeTipState extends State<FreeTip> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  HomeViewModel homeViewViewModel = HomeViewModel();
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    //  homeViewViewModel.fetchMoviewListApi();
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
      backgroundColor: Color(0xff50B8E7),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(
          //   bottomRight: Radius.circular(40),
          //   bottomLeft: Radius.circular(40),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 12,
                        decoration: BoxDecoration(
                          //  color: Color(0xff50B8E7),
                          border: Border.all(color: Colors.black, width: 0.7),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                              top: Radius.circular(10)),
                        ),
                        height: MediaQuery.of(context).size.height / 24,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "Free Tips",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ]),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    color: Color(0xff50B8E7),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Interday',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Positional',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    // first tab bar view widget
                    Interday(),

                    // second tab bar view widget
                    Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
