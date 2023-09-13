// ignore_for_file: avoid_print

import 'dart:async';
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';

class HomeController extends GetxController {
  late Timer _timer;
  RxInt days = 0.obs;
  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  late tz.Location dubai;
  late tz.TZDateTime nextSunday8PM;
}
