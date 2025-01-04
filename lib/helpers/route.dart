import 'package:get/get.dart';
import 'package:project_template/views/base/calender_widget.dart';
import 'package:project_template/views/base/reservations_screen.dart';
import 'package:project_template/views/base/revervation_detail_screen.dart';
import 'package:project_template/views/screen/Home/home_screen.dart';
import 'package:project_template/views/screen/Profile/profile_screen.dart';
import 'package:project_template/views/screen/Wallet/wallet_screen.dart';

import '../views/screen/Splash/splash_screen.dart';

class AppRoutes {
  static String splashScreen = "/splash_screen";
  static String homeScreen = "/home_screen";
  static String profileScreen = "/profile_screen";
  static String walletScreen = "/wallet_screen";
  static String calenderWidget = "/calender_widget";
  static String reservationScreen = "/reservation_screen";
  static String reservationDetailScreen = "/reservation_detail_screen";

  static List<GetPage> page = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: walletScreen,
        page: () => const WalletScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: profileScreen,
        page: () => const ProfileScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: calenderWidget,
        page: () => const CalenderWidget(),
        transition: Transition.noTransition),
    GetPage(
        name: reservationScreen,
        page: () => const ReservationsScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: reservationDetailScreen,
        page: () => const RevervationDetailScreen(),
        transition: Transition.noTransition),
  ];
}
