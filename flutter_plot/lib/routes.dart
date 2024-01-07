import 'package:flutter_plot/homepage.dart';
import 'package:get/route_manager.dart';

routes() => [
      GetPage(
        name: '/',
        page: () => MyHomePage(title: 'test'),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
