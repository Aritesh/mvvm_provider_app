import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../view_model/home_view_model.dart';

class Equity extends StatefulWidget {
  const Equity({Key? key}) : super(key: key);

  @override
  State<Equity> createState() => _EquityState();
}

class _EquityState extends State<Equity> {
  HomeViewModel homeViewViewModel = HomeViewModel();

  @override
  void initState() {
    var map = {"user_id": "502"};
    homeViewViewModel.fetchMoviewListApi(map);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final userPrefrnces = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, _) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Text(value.moviesList.message.toString());
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data?.data?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4.2,
                        decoration: BoxDecoration(
                          color: value.moviesList.data?.data?[index].buySell ==
                                  "Buy"
                              ? Color(0xff50B8E7)
                              : Color(0xffF45F44),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    //value.moviesList.data?.data?[index].buySell.toString(),
                                    "Equity ${value.moviesList.data?.data?[index].buySell ?? ""}",
                                    // 'Equity Buy',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_outlined,
                                          color: Colors.white, size: 12),
                                      Text(
                                        //   "${value.moviesList.data?.data?[index].tipDate.toString()}",
                                        " " +
                                            getDate(value.moviesList.data
                                                ?.data?[index].tipDate),
                                        // ' 18-Jun-21',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_outlined,
                                          color: Colors.white, size: 12),
                                      Text(
                                        //' 9-15-05',
                                        " " +
                                            "${value.moviesList.data?.data?[index].tipTime}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.7, right: 0.7),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 7.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${value.moviesList.data?.data?[index].title.toString()}",
                                          //     "Titan Buy 1440 1442",
                                          style: TextStyle(
                                              color: Color(0xff50B8E7),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          // "Stop Loss 1446",
                                          "Stop Loss ${value.moviesList.data?.data?[index].stopLoss ?? ""}",
                                          style: TextStyle(
                                              color: Color(0xffF45F44),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0, left: 15.0),
                                    child: Divider(
                                      height: 1,
                                      color: Color(0xff3D3989),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Target 1\n${value.moviesList.data?.data?[index].target1 ?? ""}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1C1244)),
                                        ),
                                        Text(
                                          "Target 2\n${value.moviesList.data?.data?[index].target2 ?? ""}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1C1244)),
                                        ),
                                        Text(
                                          "Target 3\n${value.moviesList.data?.data?[index].target3 ?? ""}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1C1244)),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            Container(
                              //   alignment: Alignment.bottomCenter,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 18,
                              decoration: BoxDecoration(
                                color: Color(0xffF4F4FD),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: new TextSpan(
                                    text: 'Remark - ',
                                    style: TextStyle(
                                        color: Color(0xff1C1244),
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      new TextSpan(
                                          text: value.moviesList.data
                                              ?.data?[index].remark
                                              .toString(),
                                          style: new TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   height: MediaQuery.of(context).size.height / 5,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.all(
                            //       Radius.circular(15),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  });
          }
          return Container();
        }),
      ),
    );
  }

//   dateFormat(date) {
//     // DateTime now = DateTime.now();
// //      print("${data}");
// // print(data.toString());
//     // String formattedDate = DateFormat('yyyy-MM-dd').format(date);
//     //  print(formattedDate);
//     String formattedDate = DateFormat.yMMMEd().format(date);
//     print(formattedDate);
//     return 'dd'.toString();

  getDate(newDate) {
    var now = DateTime.parse(newDate);
    var formatterDate = DateFormat('yyyy-MMM-dd');
    String actualDate = formatterDate.format(now);
    return actualDate;
  }
  //  print(formattedDate);
  // }
}
