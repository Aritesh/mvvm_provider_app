import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../utils/routes/routes_name.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  HomeViewModel homeViewViewModel = HomeViewModel();
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

  @override
  void initState() {
    //  homeViewViewModel.fetchMoviewListApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefrnces = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Color(0xff50B8E7),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "Hi, Sophia",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ]),
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffF4F4FD),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Center(
                          child:
                              SvgPicture.asset("assets/images/Vector10.svg"))),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.red,
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/Group 1299820.png"),
                      fit: BoxFit.fill,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invest in',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Top Stocks',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'View More',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff50B8E7),
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SvgPicture.asset("assets/images/Group 1305710.svg")
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.freeTip);
                    },
                    child: Container(
                      height: 130.0,
                      width: 100.0,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 10,
                            //   top: 50,
                            child: Container(
                              alignment: Alignment.center,
                              height: 90,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xff3D3989), width: 0.7),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20),
                                    top: Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text("Free\nTips",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800)),
                              ),
                              // color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.7,
                              decoration: const BoxDecoration(
                                color: Color(0xff50B8E7),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20),
                                    top: Radius.circular(20)),
                              ),
                              height: MediaQuery.of(context).size.height / 12,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SvgPicture.asset(
                                    "assets/images/Vector5.svg",
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 130.0,
                    width: 100.0,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 10,
                          //   top: 50,
                          child: Container(
                            alignment: Alignment.center,
                            height: 90,
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff3D3989), width: 0.7),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20),
                                  top: Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text("Whats App\nchat",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800)),
                            ),
                            // color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5.7,
                            decoration: const BoxDecoration(
                              color: Color(0xff50B8E7),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20),
                                  top: Radius.circular(20)),
                            ),
                            height: MediaQuery.of(context).size.height / 12,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                  "assets/images/whatapp.svg",
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130.0,
                    width: 100.0,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 10,
                          //   top: 50,
                          child: Container(
                            alignment: Alignment.center,
                            height: 90,
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff3D3989), width: 0.7),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20),
                                  top: Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text("Share\nApp",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800)),
                            ),
                            // color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5.7,
                            decoration: const BoxDecoration(
                              color: Color(0xff50B8E7),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20),
                                  top: Radius.circular(20)),
                            ),
                            height: MediaQuery.of(context).size.height / 12,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(Icons.share_outlined,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4FD),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 5, bottom: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 7,
                              decoration: const BoxDecoration(
                                color: Color(0xff50B8E7),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10),
                                    top: Radius.circular(10)),
                              ),
                              height: MediaQuery.of(context).size.height / 12,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:
                                    Icon(Icons.graphic_eq, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Past Performance',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0, color: Colors.white),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xff1C1244),
                          weight: 0.2,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4FD),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 5, bottom: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 7,
                              decoration: const BoxDecoration(
                                color: Color(0xff50B8E7),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10),
                                    top: Radius.circular(10)),
                              ),
                              height: MediaQuery.of(context).size.height / 12,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:
                                    Icon(Icons.graphic_eq, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Get premium Calls',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.0, color: Colors.white),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xff1C1244),
                          weight: 0.2,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBarWithSheet(
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
            color: Color(0xff50B8E7),
            //  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          itemIconColor: Colors.white,
          itemTextStyle: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
          ),
          selectedItemTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 10.0,
          ),
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 50,
          color: Colors.red,
          splash: Colors.orange[800],
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        onSelectItem: (index) => debugPrint('$index'),
        sheetChild: Center(
          child: Text(
            "Another content",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.people),
          BottomBarWithSheetItem(icon: Icons.settings_backup_restore),
          BottomBarWithSheetItem(icon: Icons.settings_outlined),
          BottomBarWithSheetItem(icon: Icons.message_outlined),
        ],
      ),
    );
  }
}
