// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'AppearanceContainer.dart';

class AppAppearance {
  late Color primaryLightGreen = const Color.fromARGB(255, 89, 172, 90);
  late Color primaryDarkGreen = const Color.fromARGB(255, 33, 68, 35);
  late Color secondlyLightGreen = Colors.green;
  late Color secondlyDarkGreen = const Color.fromARGB(255, 101, 133, 102);
  late Color tertiaryLightGreen = const Color.fromARGB(255, 214, 230, 214);
  late Color tertiaryDarkGreen = const Color.fromARGB(255, 82, 99, 82);

  late Color primaryLightYellow = const Color.fromARGB(255, 230, 217, 100);
  late Color primaryDarkYellow = const Color.fromARGB(255, 175, 163, 58);
  late Color secondlyLightYellow = Colors.yellow;
  late Color secondlyDarkYellow = const Color.fromARGB(255, 194, 180, 54);

  late Color primaryLightRed = const Color.fromARGB(255, 218, 91, 82);
  late Color primaryDarkRed = const Color.fromARGB(255, 124, 54, 49);
  late Color secondlyLightRed = Colors.red;
  late Color secondlyDarkRed = const Color.fromARGB(255, 133, 34, 27);

  late Color primaryLightOrange = const Color.fromARGB(255, 214, 141, 32);
  late Color primaryDarkOrange = const Color.fromARGB(255, 136, 95, 33);
  late Color secondlyLightOrange = Colors.orange;
  late Color secondlyDarkOrange = const Color.fromARGB(255, 155, 101, 21);

  late Color primaryLightPinck = const Color.fromARGB(255, 218, 80, 126);
  late Color primaryDarkPinck = const Color.fromARGB(255, 131, 29, 63);
  late Color secondlyLightPinck = Colors.pink;
  late Color secondlyDarkPinck = const Color.fromARGB(255, 155, 29, 71);

  late Color primaryLightBlue = const Color.fromARGB(255, 57, 153, 231);
  late Color primaryDarkBlue = const Color.fromARGB(255, 35, 85, 126);
  late Color secondlyLightBlue = Colors.blue;
  late Color secondlyDarkBlue = const Color.fromARGB(255, 27, 112, 182);

  late Color primaryLightViolet = const Color.fromARGB(255, 171, 68, 189);
  late Color primaryDarkViolet = const Color.fromARGB(255, 93, 30, 104);
  late Color secondlyLightViolet = Colors.purple;
  late Color secondlyDarkViolet = const Color.fromARGB(255, 124, 25, 141);

  late Color primaryLightGrey = const Color.fromARGB(255, 153, 145, 145);
  late Color primaryDarkGrey = const Color.fromARGB(255, 95, 94, 94);
  late Color secondlyLightGrey = Colors.grey;
  late Color secondlyDarkGrey = const Color.fromARGB(255, 131, 125, 125);

  AppearanceContainer appearance(String mode, String theme) {
    if (mode == 'light') {
      switch (theme) {
        case 'green':
          return AppearanceContainer(
              primaryColor: primaryLightGreen,
              secondlyColor: secondlyLightGreen);
        case 'yellow':
          return AppearanceContainer(
              primaryColor: primaryLightYellow,
              secondlyColor: secondlyLightYellow);
        case 'red':
          return AppearanceContainer(
              primaryColor: primaryLightRed, secondlyColor: secondlyLightRed);
        case 'orange':
          return AppearanceContainer(
              primaryColor: primaryLightOrange,
              secondlyColor: secondlyLightOrange);
        case 'pink':
          return AppearanceContainer(
              primaryColor: primaryLightPinck,
              secondlyColor: secondlyLightPinck);
        case 'blue':
          return AppearanceContainer(
              primaryColor: primaryLightBlue, secondlyColor: secondlyLightBlue);
        case 'violet':
          return AppearanceContainer(
              primaryColor: primaryLightViolet,
              secondlyColor: secondlyLightViolet);
        case 'grey':
          return AppearanceContainer(
              primaryColor: primaryLightGrey, secondlyColor: secondlyLightGrey);
        default:
          return AppearanceContainer(
              primaryColor: primaryLightGreen,
              secondlyColor: secondlyLightGreen);
      }
    } else {
      switch (theme) {
        case 'green':
          return AppearanceContainer(
              primaryColor: primaryDarkGreen, secondlyColor: secondlyDarkGreen);
        case 'yellow':
          return AppearanceContainer(
              primaryColor: primaryDarkYellow,
              secondlyColor: secondlyDarkYellow);
        case 'red':
          return AppearanceContainer(
              primaryColor: primaryDarkRed, secondlyColor: secondlyDarkRed);
        case 'orange':
          return AppearanceContainer(
              primaryColor: primaryDarkOrange,
              secondlyColor: secondlyDarkOrange);
        case 'pink':
          return AppearanceContainer(
              primaryColor: primaryDarkPinck, secondlyColor: secondlyDarkPinck);
        case 'blue':
          return AppearanceContainer(
              primaryColor: primaryDarkBlue, secondlyColor: secondlyDarkBlue);
        case 'violet':
          return AppearanceContainer(
              primaryColor: primaryDarkViolet,
              secondlyColor: secondlyDarkViolet);
        case 'grey':
          return AppearanceContainer(
              primaryColor: primaryDarkGrey, secondlyColor: secondlyDarkGrey);
        default:
          return AppearanceContainer(
              primaryColor: primaryLightGreen,
              secondlyColor: secondlyLightGreen);
      }
    }
  }
}
