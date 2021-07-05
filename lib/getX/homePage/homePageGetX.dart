import 'package:client_manager/container/homePage/model/campData.dart';
import 'package:client_manager/container/homePage/model/myInfo.dart';
import 'package:client_manager/function/env.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homePageGetX extends GetxController {
  final token = FlutterSecureStorage();
  List<dynamic> campList = [];

  @override
  onInit() {
    super.onInit();
    apiCampList();
    me();
  }

  Future<MyInfo> me() async {
    var url = Env.url + '/api/auth/me';
    String value = await token.read(key: 'token');
    String myToken = ("Bearer " + value);

    final response = await http.post(Uri.parse(url), headers: {
      'Authorization': myToken,
    });

    Map<String, dynamic> list = jsonDecode(response.body);

    return MyInfo(
      nick: list['nick_name'],
      point: list['point'].toString(),
      img_url: list['profile_img'].toString(),
    );
  }

  Future<List<CampData>> apiCampList() async {
    var url = Env.url + '/api/campsite/manager/list';
    String value = await token.read(key: 'token');
    String myToken = ("Bearer " + value.toString());

    var response = await http.post(Uri.parse(url), headers: {
      'Authorization': myToken,
    });

    var d = utf8.decode(response.bodyBytes);
    campList = jsonDecode(d) as List<CampData>;

    return campList;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
