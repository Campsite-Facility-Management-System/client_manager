import 'package:client_manager/container/homePage/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPageScreen extends StatelessWidget {
  TextEditingController charge_Point;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.grey,
        ),
        centerTitle: true,
        title: Text(
          '마이페이지',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileScreen(),
                    InkWell(
                      onTap: () {
                        personal_Term_Dialog(context);
                      },
                      child: Text('포인트 충전'),
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

  Future<void> personal_Term_Dialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: Container(
            child: Stack(
              children: [
                Center(
                  child: Text(
                    '포인트 충전',
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xff2D2E33),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: charge_Point,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: ' 충전할 포인트를 입력해주세요',
                          ),
                        ),
                      ),
                      Text('원'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text('충전하기'),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
