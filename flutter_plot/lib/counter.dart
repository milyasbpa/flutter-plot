import 'dart:convert';

import 'package:flutter_plot/coordinate.model.dart';
import 'package:flutter_plot/service.dart';
import 'package:flutter_plot/todo.model.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final ApiService apiService = ApiService();
  RxInt counter = 0.obs;
  Map<String, dynamic> testList = {"key": "value", "phone": 23}.obs;
  RxMap<dynamic, dynamic> data = {"key": "1"}.obs;

  RxList<Coordinates> annotations = <Coordinates>[].obs;
  // List<Coordinates> annotations = [];

  void increment() => {
        counter.value++,
        Get.log('${{...testList, "key": "cobain"}} testList'),
        Get.log('$counter ini apasih'),
      };

  Future<void> fetchData() async {
    try {
      final response = await apiService.fetchData();
      if (response.status.hasError) {
        throw Exception('Error fetching data');
      }
      // Get.log('${response.body}');
      final tests = Todo.fromJson(response.body);
      data['key'] = tests.title;
      // Get.log('$data assigned data');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> readJson() async {
    try {
      final response = await apiService.readJson();
      List<Coordinates> coordinates = coordinatesFromJson(response);
      Get.log('$coordinates coordinates');
      for (var i = 0; i < coordinates.length; i++) {
        annotations.add(coordinates[i]);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
