import 'dart:convert';

import 'package:client_manager/function/env.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CampDetailGetX extends GetxController {
  final token = FlutterSecureStorage();
  var selectedCategoryId;
  var selectedCampId;
  List ciList = new List();
  List cnList = new List();
  Map<String, int> cMap = new Map();
  Map<String, int> campIndex = new Map();
  var categoryList;
  var detailData;

  setCategoryId(id) {
    this.selectedCategoryId = id;
  }

  setCampId(id) {
    this.selectedCampId = id;
  }

  setCIList(list) {
    this.ciList = list;
  }

  setCNList(list) {
    this.cnList = list;
  }

  setSelectedCampId(campId) {
    this.selectedCampId = campId;
  }

  setCMap(index, name) {
    this.cMap[name] = index;
  }

  setCampIndex(index, name) {
    this.campIndex[name] = index;
  }

  setDetailData(data) {
    this.detailData = data;
    update();
  }

  @override
  onInit() {
    super.onInit();
  }

  apiCampDetail() async {
    var url = Env.url + '/api/campsite/manager/detail/list';
    String value = await token.read(key: 'token');
    String myToken = ("Bearer " + value);

    var response = await http.post(Uri.parse(url), headers: {
      'Authorization': myToken,
    }, body: {
      'campsite_id': selectedCampId.toString(),
    });

    await setDetailData(jsonDecode(utf8.decode(response.bodyBytes)));

    cMap.clear();
    for (var i = 0; i < detailData.length; i++) {
      setCMap(detailData[i]['id'], detailData[i]['name']);
    }
  }
}
