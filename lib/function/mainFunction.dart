import 'package:client_manager/getX/token/tokenGetX.dart';
import 'package:client_manager/screen/electric/electricListScreen.dart';
import 'package:client_manager/screen/homePage/homePageScreen.dart';
import 'package:client_manager/screen/morePage/morePageScreen.dart';
import 'package:client_manager/screen/notificationPage/notiPageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MainFunction extends StatefulWidget {
  final int pageNum;
  const MainFunction(this.pageNum);
  @override
  _MainFunctionState createState() => _MainFunctionState();
}

class _MainFunctionState extends State<MainFunction> {
  int currentPage = 0;
  // final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final token = new FlutterSecureStorage();
  List<String> campNameList = [];
  List<String> campIdList = [];
  var selected;

  @override
  Widget build(BuildContext context) {
    final tokenController = Get.put(TokenGetX());

    return WillPopScope(
      onWillPop: () async {
        bool result = tokenController.end();
        return await Future.value(result);
      },
      child: Scaffold(
        key: tokenController.globalKey,
        body: IndexedStack(
          index: currentPage,
          children: [
            HomePageScreen(),
            ElectricListScreen(),
            NotiPageScreen(),
            MorePageScreen(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 0;
                  });
                },
              ),
              IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.control_camera,
                  color: Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 1;
                  });
                },
              ),
              IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.notification_important,
                  color: Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 2;
                  });
                },
              ),
              IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.more,
                  color: Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    currentPage = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
