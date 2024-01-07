import 'package:flutter_plot/coordinate.model.dart';
import 'package:flutter_plot/service.dart';
import 'package:get/get.dart';

class AnnotationsController extends GetxController {
  final ApiService apiService = ApiService();

  RxList<Coordinates> annotations = <Coordinates>[].obs;

  Future<void> fetchCoordinates() async {
    try {
      final response = await apiService.readJson();

      List<Coordinates> coordinates = coordinatesFromJson(response);
      for (var i = 0; i < coordinates.length; i++) {
        annotations.add(coordinates[i]);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
