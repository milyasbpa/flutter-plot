import 'package:flutter_plot/homepage.dart';
import 'package:flutter_plot/profilepage.dart';
import 'package:get/route_manager.dart';

routes() => [
      GetPage(
        name: '/',
        page: () => MyHomePage(title: 'test'),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/profile',
        page: () => const ProfilePage(title: 'profile'),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
