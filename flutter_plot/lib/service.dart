import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<Response<dynamic>> fetchData() async {
    return await get('https://jsonplaceholder.typicode.com/todos/1');
  }

  Future<dynamic> readJson() async {
    return await rootBundle.loadString('assets/annotations/6.json');
  }
}
