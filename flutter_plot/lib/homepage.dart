import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plot/coordinate.model.dart';
import 'package:flutter_plot/annotations.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final AnnotationsController annotationsController =
      Get.put(AnnotationsController());

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
    widget.annotationsController.fetchCoordinates();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width / 3 * 4;

    return FutureBuilder(
        future: loadImage('assets/samples/1.jpg', width, height),
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
                                controller: widget.annotationsController),
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
  AnnotationsController controller;
  ui.Image? image;
  MasterPainter({this.image, required this.controller});

  @override
  void paint(Canvas canvas, Size size) {
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
        paint.color = const Color.fromRGBO(118, 224, 194, 1);
        paint.style = PaintingStyle.stroke;
        final boundary = inflammations[inflammationsIndex].boundary;
        final moveToCoordinate = boundary[0];

        // NOTES: rotation 90 deg
        // List<double> firstCoordinate = [
        //   (1 - moveToCoordinate[1]) * size.width,
        //   moveToCoordinate[0] * size.height,
        // ];
        // NOTES: no rotation
        List<double> firstCoordinate = [
          moveToCoordinate[0] * size.width,
          moveToCoordinate[1] * size.height,
        ];

        Path path = Path();
        if (boundary.isNotEmpty) {
          path.moveTo(firstCoordinate[0], firstCoordinate[1]);
          for (var boundaryIndex = 1;
              boundaryIndex < boundary.length;
              boundaryIndex++) {
            // NOTES: rotation 90 deg
            // final nextCoordinate = [
            //   (1 - boundary[boundaryIndex][1]) * size.width,
            //   boundary[boundaryIndex][0] * size.height,
            // ];
            // NOTES: no rotation
            final nextCoordinate = [
              boundary[boundaryIndex][0] * size.width,
              boundary[boundaryIndex][1] * size.height,
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
        paint.color = const Color.fromRGBO(198, 0, 0, 1);
        paint.style = PaintingStyle.stroke;
        final boundary = pigmentations[pigmentationIndex].boundary;
        final moveToCoordinate = boundary[0];

        // NOTES: rotation 90 deg
        // List<double> firstCoordinate = [
        //   (1 - moveToCoordinate[1]) * size.width,
        //   moveToCoordinate[0] * size.height,
        // ];
        // NOTES: no rotation
        List<double> firstCoordinate = [
          moveToCoordinate[0] * size.width,
          moveToCoordinate[1] * size.height,
        ];
        Path path = Path();
        if (boundary.isNotEmpty) {
          path.moveTo(firstCoordinate[0], firstCoordinate[1]);
          for (var boundaryIndex = 1;
              boundaryIndex < boundary.length;
              boundaryIndex++) {
            // NOTES: rotation 90 deg
            // final nextCoordinate = [
            //   (1 - boundary[boundaryIndex][1]) * size.width,
            //   boundary[boundaryIndex][0] * size.height,
            // ];
            // NOTES: no rotation
            final nextCoordinate = [
              boundary[boundaryIndex][0] * size.width,
              boundary[boundaryIndex][1] * size.height,
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
        paint.color = const Color.fromRGBO(167, 207, 255, 1);
        paint.style = PaintingStyle.stroke;
        paint.strokeJoin = StrokeJoin.round;
        final boundary = sebums[sebumIndex].boundary;
        final moveToCoordinate = boundary[0];

        // NOTES: rotation 90 deg
        // List<double> firstCoordinate = [
        //   (1 - moveToCoordinate[1]) * size.width,
        //   moveToCoordinate[0] * size.height,
        // ];
        // NOTES: no rotation
        List<double> firstCoordinate = [
          moveToCoordinate[0] * size.width,
          moveToCoordinate[1] * size.height,
        ];

        if (boundary.isNotEmpty) {
          Path path = Path();
          path.moveTo(firstCoordinate[0], firstCoordinate[1]);
          for (var boundaryIndex = 1;
              boundaryIndex < boundary.length;
              boundaryIndex++) {
            // NOTES: rotation 90 deg
            // final nextCoordinate = [
            //   (1 - boundary[boundaryIndex][1]) * size.width,
            //   boundary[boundaryIndex][0] * size.height,
            // ];
            // NOTES: no rotation
            final nextCoordinate = [
              boundary[boundaryIndex][0] * size.width,
              boundary[boundaryIndex][1] * size.height,
            ];
            path.lineTo(nextCoordinate[0], nextCoordinate[1]);

            // Get.log(
            //     '$sebumIndex ${nextCoordinate[0]} ${nextCoordinate[1]} ini boundary index');
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
        paint.color = const Color.fromRGBO(239, 215, 0, 1);
        paint.style = PaintingStyle.stroke;
        paint.strokeJoin = StrokeJoin.round;
        paint.strokeCap = StrokeCap.round;
        final boundary = wrinkles[wrinklesIndex].boundary;
        final moveToCoordinate = boundary[0];

        // NOTES: rotation 90 deg
        // List<double> firstCoordinate = [
        //   (1 - moveToCoordinate[1]) * size.width,
        //   moveToCoordinate[0] * size.height,
        // ];
        // NOTES: no rotation
        List<double> firstCoordinate = [
          moveToCoordinate[0] * size.width,
          moveToCoordinate[1] * size.height,
        ];
        if (boundary.isNotEmpty) {
          Path path = Path();
          path.moveTo(firstCoordinate[0], firstCoordinate[1]);
          for (var boundaryIndex = 1;
              boundaryIndex < boundary.length;
              boundaryIndex++) {
            // NOTES: rotation 90 deg
            // final nextCoordinate = [
            //   (1 - boundary[boundaryIndex][1]) * size.width,
            //   boundary[boundaryIndex][0] * size.height,
            // ];
            // NOTES: no rotation
            final nextCoordinate = [
              boundary[boundaryIndex][0] * size.width,
              boundary[boundaryIndex][1] * size.height,
            ];
            path.lineTo(nextCoordinate[0], nextCoordinate[1]);

            // Get.log(
            //     '$wrinklesIndex ${nextCoordinate[0]} ${nextCoordinate[1]} ini boundary index');
          }
          canvas.drawPath(path, paint);
        }
      }

      // pores
      final pores = annotationsData[0].pores;
      for (var poresIndex = 0; poresIndex < pores.length; poresIndex++) {
        Paint paint = Paint();
        paint.strokeWidth = 1;
        paint.color = const Color.fromRGBO(0, 220, 128, 1);
        paint.style = PaintingStyle.stroke;
        paint.strokeJoin = StrokeJoin.round;
        paint.strokeCap = StrokeCap.round;

        final width = size.width;
        final height = size.height;

        List<double> xCoordinates =
            pores[poresIndex].boundary.map((pore) => pore[0] * width).toList();
        List<double> yCoordinates =
            pores[poresIndex].boundary.map((pore) => pore[1] * height).toList();
        double xMin = xCoordinates.reduce(min);
        double xMax = xCoordinates.reduce(max);
        double yMin = yCoordinates.reduce(min);
        double yMax = yCoordinates.reduce(max);
        double poreWidth = xMax - xMin;
        double poreHeight = yMax - yMin;

        final Offset center = Offset((xMin + xMax) / 2, (yMin + yMax) / 2);
        double radius = [poreWidth, poreHeight].reduce(min) / 2;
        canvas.drawCircle(center, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
