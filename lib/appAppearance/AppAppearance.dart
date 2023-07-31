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
  late Color primaryDarkYellow = const Color.fromARGB(255, 133, 124, 45);
  late Color secondlyLightYellow = const Color.fromARGB(255, 160, 145, 7);
  late Color secondlyDarkYellow = const Color.fromARGB(255, 184, 171, 53);
  late Color tertiaryLightYellow = const Color.fromARGB(255, 255, 253, 197);
  late Color tertiaryDarkYellow = const Color.fromARGB(255, 156, 158, 57);

  late Color primaryLightRed = const Color.fromARGB(255, 218, 91, 82);
  late Color primaryDarkRed = const Color.fromARGB(255, 99, 43, 38);
  late Color secondlyLightRed = Colors.red;
  late Color secondlyDarkRed = const Color.fromARGB(255, 114, 39, 33);
  late Color tertiaryLightRed = const Color.fromARGB(255, 235, 187, 175);
  late Color tertiaryDarkRed = const Color.fromARGB(255, 141, 65, 54);

  late Color primaryLightOrange = const Color.fromARGB(255, 214, 141, 32);
  late Color primaryDarkOrange = const Color.fromARGB(255, 126, 88, 32);
  late Color secondlyLightOrange = Colors.orange;
  late Color secondlyDarkOrange = const Color.fromARGB(255, 124, 79, 11);
  late Color tertiaryLightOrange = const Color.fromARGB(255, 253, 232, 203);
  late Color tertiaryDarkOrange = const Color.fromARGB(255, 133, 118, 35);

  late Color primaryLightPinck = const Color.fromARGB(255, 218, 80, 126);
  late Color primaryDarkPinck = const Color.fromARGB(255, 105, 25, 52);
  late Color secondlyLightPinck = Colors.pink;
  late Color secondlyDarkPinck = const Color.fromARGB(255, 99, 18, 45);
  late Color tertiaryLightPink = const Color.fromARGB(255, 228, 204, 218);
  late Color tertiaryDarkPink = const Color.fromARGB(255, 143, 31, 68);

  late Color primaryLightBlue = const Color.fromARGB(255, 57, 153, 231);
  late Color primaryDarkBlue = const Color.fromARGB(255, 32, 77, 114);
  late Color secondlyLightBlue = Colors.blue;
  late Color secondlyDarkBlue = const Color.fromARGB(255, 9, 113, 197);
  late Color tertiaryLightBlue = const Color.fromARGB(255, 173, 218, 255);
  late Color tertiaryDarkBlue = const Color.fromARGB(255, 28, 82, 126);

  late Color primaryLightViolet = const Color.fromARGB(255, 171, 68, 189);
  late Color primaryDarkViolet = const Color.fromARGB(255, 80, 26, 90);
  late Color secondlyLightViolet = Colors.purple;
  late Color secondlyDarkViolet = const Color.fromARGB(255, 120, 3, 141);
  late Color tertiaryLightViolet = const Color.fromARGB(255, 243, 213, 248);
  late Color tertiaryDarkViolet = const Color.fromARGB(255, 90, 22, 104);

  late Color primaryLightGrey = const Color.fromARGB(255, 153, 145, 145);
  late Color primaryDarkGrey = const Color.fromARGB(255, 82, 81, 81);
  late Color secondlyLightGrey = Colors.grey;
  late Color secondlyDarkGrey = const Color.fromARGB(255, 189, 189, 189);
  late Color tertiaryLightGrey = const Color.fromARGB(255, 233, 230, 230);
  late Color tertiaryDarkGrey = const Color.fromARGB(255, 116, 114, 114);

  AppearanceContainer appearance(bool light, String themes) {
    if (light) {
      switch (themes) {
        case 'Vert':
          return AppearanceContainer(
              primaryColor: primaryLightGreen,
              secondlyColor: secondlyLightGreen,
              tertiaryColor: tertiaryLightGreen);
        case 'Jaune':
          return AppearanceContainer(
              primaryColor: primaryLightYellow,
              secondlyColor: secondlyLightYellow,
              tertiaryColor: tertiaryLightGreen);
        case 'Rouge':
          return AppearanceContainer(
              primaryColor: primaryLightRed,
              secondlyColor: secondlyLightRed,
              tertiaryColor: tertiaryLightRed);
        case 'Orange':
          return AppearanceContainer(
              primaryColor: primaryLightOrange,
              secondlyColor: secondlyLightOrange,
              tertiaryColor: tertiaryLightOrange);
        case 'Rose':
          return AppearanceContainer(
              primaryColor: primaryLightPinck,
              secondlyColor: secondlyLightPinck,
              tertiaryColor: tertiaryLightPink);
        case 'Bleu':
          return AppearanceContainer(
              primaryColor: primaryLightBlue,
              secondlyColor: secondlyLightBlue,
              tertiaryColor: tertiaryLightBlue);
        case 'Violet':
          return AppearanceContainer(
              primaryColor: primaryLightViolet,
              secondlyColor: secondlyLightViolet,
              tertiaryColor: tertiaryLightViolet);
        case 'Gris':
          return AppearanceContainer(
              primaryColor: primaryLightGrey,
              secondlyColor: secondlyLightGrey,
              tertiaryColor: tertiaryLightGrey);
        default:
          return AppearanceContainer(
              primaryColor: primaryLightGreen,
              secondlyColor: secondlyLightGreen,
              tertiaryColor: tertiaryLightGreen);
      }
    } else {
      switch (themes) {
        case 'Vert':
          return AppearanceContainer(
              primaryColor: primaryDarkGreen,
              secondlyColor: secondlyDarkGreen,
              tertiaryColor: tertiaryDarkGreen);
        case 'Jaune':
          return AppearanceContainer(
              primaryColor: primaryDarkYellow,
              secondlyColor: secondlyDarkYellow,
              tertiaryColor: tertiaryDarkYellow);
        case 'Rouge':
          return AppearanceContainer(
              primaryColor: primaryDarkRed,
              secondlyColor: secondlyDarkRed,
              tertiaryColor: tertiaryDarkRed);
        case 'Orange':
          return AppearanceContainer(
              primaryColor: primaryDarkOrange,
              secondlyColor: secondlyDarkOrange,
              tertiaryColor: tertiaryDarkOrange);
        case 'Rose':
          return AppearanceContainer(
              primaryColor: primaryDarkPinck,
              secondlyColor: secondlyDarkPinck,
              tertiaryColor: tertiaryDarkPink);
        case 'Bleu':
          return AppearanceContainer(
              primaryColor: primaryDarkBlue,
              secondlyColor: secondlyDarkBlue,
              tertiaryColor: tertiaryDarkBlue);
        case 'Violet':
          return AppearanceContainer(
              primaryColor: primaryDarkViolet,
              secondlyColor: secondlyDarkViolet,
              tertiaryColor: tertiaryDarkViolet);
        case 'Gris':
          return AppearanceContainer(
              primaryColor: primaryDarkGrey,
              secondlyColor: secondlyDarkGrey,
              tertiaryColor: tertiaryDarkGrey);
        default:
          return AppearanceContainer(
              primaryColor: primaryDarkGreen,
              secondlyColor: secondlyDarkGreen,
              tertiaryColor: tertiaryDarkGreen);
      }
    }
  }
}
