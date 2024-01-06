import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plot/coordinate.model.dart';
import 'package:flutter_plot/counter.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final CounterController counterController = Get.put(CounterController());

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<ui.Image?> imageNotifier = ValueNotifier<ui.Image?>(null);
  ui.Image? imageCanvas;

  Future<ui.Image> loadImage(
      String imageAssetPath, double width, double height) async {
    final ByteData data = await rootBundle.load(imageAssetPath);

    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: 573,
      targetWidth: 430,
    );

    var frame = await codec.getNextFrame();

    return frame.image;
  }

  String text = 'You have pushed the button this many times:';

  @override
  void initState() {
    super.initState();
    widget.counterController.fetchData();
    widget.counterController.readJson();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width / 3 * 4;

    return FutureBuilder(
        future: loadImage('assets/photo.jpg', width, height),
        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Image loading...');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                  ),
                  body: Center(
                      child: Container(
                          color: Colors.grey.shade300,
                          child: CustomPaint(
                            painter: MasterPainter(
                                image: snapshot.data!,
                                controller: widget.counterController),
                            size: Size(width, height),
                          ))),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => Get.toNamed('/profile'),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                );
              }
          }
        });
  }
}

class MasterPainter extends CustomPainter {
  CounterController controller;
  ui.Image? image;
  MasterPainter({this.image, required this.controller});

  @override
  void paint(Canvas canvas, Size size) {
    // final annotationsData = annotations;
    final annotationsData = controller.annotations;
    final imagePlot = image;
    if (imagePlot != null) {
      Paint paint = Paint();
      canvas.drawImage(imagePlot, Offset.zero, paint);
    }

    if (annotationsData.isNotEmpty) {
      // inflammations
      final inflammations = annotationsData[0].inflammations;
      for (var inflammationsIndex = 0;
          inflammationsIndex < inflammations.length;
          inflammationsIndex++) {
        Paint paint = Paint();
        paint.strokeWidth = 1;
        paint.color = Colors.red;
        paint.style = PaintingStyle.stroke;
        final boundary = inflammations[inflammationsIndex].boundary;
        final moveToCoordinate = boundary[0];

        List<double> firstCoordinate = [
          (1 - moveToCoordinate[1]) * size.width,
          moveToCoordinate[0] * size.height,
        ];
        Path path = Path();
        if (boundary.isNotEmpty) {
          for (var boundaryIndex = 1;
              boundaryIndex < boundary.length;
              boundaryIndex++) {
            path.moveTo(firstCoordinate[0], firstCoordinate[1]);

            final nextCoordinate = [
              (1 - boundary[boundaryIndex][1]) * size.width,
              boundary[boundaryIndex][0] * size.height,
            ];
            path.lineTo(nextCoordinate[0], nextCoordinate[1]);

            // Get.log('${nextCoordinate[0]} ${nextCoordinate[1]} ini boundary index');
          }
        }
        canvas.drawPath(path, paint);
      }

      // pigmentations
      final pigmentations = annotationsData[0].pigmentations;
      for (var pigmentationIndex = 0;
          pigmentationIndex < pigmentations.length;
          pigmentationIndex++) {
        Paint paint = Paint();
        paint.strokeWidth = 1;
        paint.color = Colors.red;
        paint.style = PaintingStyle.stroke;
        final boundary = pigmentations[pigmentationIndex].boundary;
        final moveToCoordinate = boundary[0];

        List<double> firstCoordinate = [
          (1 - moveToCoordinate[1]) * size.width,
          moveToCoordinate[0] * size.height,
        ];
        Path path = Path();
        if (boundary.isNotEmpty) {
          for (var boundaryIndex = 1;
              boundaryIndex < boundary.length;
              boundaryIndex++) {
            path.moveTo(firstCoordinate[0], firstCoordinate[1]);

            final nextCoordinate = [
              (1 - boundary[boundaryIndex][1]) * size.width,
              boundary[boundaryIndex][0] * size.height,
            ];
            path.lineTo(nextCoordinate[0], nextCoordinate[1]);

            // Get.log('${nextCoordinate[0]} ${nextCoordinate[1]} ini boundary index');
          }
        }
        canvas.drawPath(path, paint);
      }

      // sebums
      final sebums = annotationsData[0].sebums;
      for (var sebumIndex = 0; sebumIndex < sebums.length; sebumIndex++) {
        Paint paint = Paint();
        paint.strokeWidth = 1;
        paint.color = Colors.yellow;
        paint.style = PaintingStyle.stroke;
        paint.strokeJoin = StrokeJoin.round;
        final boundary = sebums[sebumIndex].boundary;
        final moveToCoordinate = boundary[0];

        final width = size.width;
        final height = size.height;

        List<double> firstCoordinate = [
          (1 - moveToCoordinate[1]) * width,
          moveToCoordinate[0] * height,
        ];

        if (boundary.isNotEmpty) {
          Path path = Path();
          for (var boundaryIndex = 1;
              boundaryIndex < boundary.length;
              boundaryIndex++) {
            path.moveTo(firstCoordinate[0], firstCoordinate[1]);

            final nextCoordinate = [
              (1 - boundary[boundaryIndex][1]) * width,
              boundary[boundaryIndex][0] * height,
            ];
            path.lineTo(nextCoordinate[0], nextCoordinate[1]);

            Get.log(
                '$sebumIndex ${nextCoordinate[0]} ${nextCoordinate[1]} ini boundary index');
          }
          canvas.drawPath(path, paint);
        }
      }

      // wrinkles
      final wrinkles = annotationsData[0].wrinkles;
      for (var wrinklesIndex = 0;
          wrinklesIndex < wrinkles.length;
          wrinklesIndex++) {
        Paint paint = Paint();
        paint.strokeWidth = 1;
        paint.color = Colors.black;
        paint.style = PaintingStyle.stroke;
        paint.strokeJoin = StrokeJoin.round;
        final boundary = wrinkles[wrinklesIndex].boundary;
        final moveToCoordinate = boundary[0];

        final width = size.width;
        final height = size.height;

        List<double> firstCoordinate = [
          (1 - moveToCoordinate[1]) * width,
          moveToCoordinate[0] * height,
        ];

        if (boundary.isNotEmpty) {
          Path path = Path();
          for (var boundaryIndex = 1;
              boundaryIndex < boundary.length;
              boundaryIndex++) {
            path.moveTo(firstCoordinate[0], firstCoordinate[1]);

            final nextCoordinate = [
              (1 - boundary[boundaryIndex][1]) * width,
              boundary[boundaryIndex][0] * height,
            ];
            path.lineTo(nextCoordinate[0], nextCoordinate[1]);

            Get.log(
                '$wrinklesIndex ${nextCoordinate[0]} ${nextCoordinate[1]} ini boundary index');
          }
          canvas.drawPath(path, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
