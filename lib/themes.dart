// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme(
      {required this.kMainHeader,
      required this.kShowAppBar,
      required this.kStatusBarHeader,
      required this.kSubHeader,
      required this.kGradientStyle,
      required this.primaryColor,
      required this.scaffoldBackgroundColor,
      required this.fontFamily});

  late String kStatusBarHeader;
  late String kMainHeader;
  late String kSubHeader;
  late bool kShowAppBar;
  late BoxDecoration kGradientStyle;
  late Color primaryColor;
  late Color scaffoldBackgroundColor;
  late String fontFamily;
}

// Dev theme
final themeDev = AppTheme(
    kMainHeader: "Codemagic Dev",
    kShowAppBar: true,
    kStatusBarHeader: "Development",
    kSubHeader: "This is the Dev build",
    kGradientStyle: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color(0xFF2588F1),
          Color(0xFF0040E7),
        ],
      ),
    ),
    primaryColor: Color(0xFF2588F1),
    scaffoldBackgroundColor: Color(0xFF0040E7),
    fontFamily: 'Montserrat');

// QA theme
final themeQA = AppTheme(
    kMainHeader: "Codemagic QA",
    kShowAppBar: true,
    kStatusBarHeader: "QA",
    kSubHeader: "This is the QA build",
    kGradientStyle: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color.fromARGB(255, 241, 153, 255),
          Color.fromARGB(255, 177, 32, 201),
        ],
      ),
    ),
    primaryColor: Color(0xFF033b15),
    scaffoldBackgroundColor: Color(0xFF033b15),
    fontFamily: 'Montserrat');

final theme_001 = AppTheme(
    kMainHeader: "Client 001",
    kShowAppBar: false,
    kStatusBarHeader: "001",
    kSubHeader: "This is theme 001",
    kGradientStyle: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color.fromARGB(255, 254, 219, 89),
          Color.fromARGB(255, 198, 162, 1),
        ],
      ),
    ),
    primaryColor: Color(0xFF033b15),
    scaffoldBackgroundColor: Color(0xFF033b15),
    fontFamily: 'Montserrat');

final theme_002 = AppTheme(
    kMainHeader: "Client 002",
    kShowAppBar: false,
    kStatusBarHeader: "002",
    kSubHeader: "This is theme 002",
    kGradientStyle: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color.fromARGB(255, 115, 250, 247),
          Color.fromARGB(255, 0, 161, 153),
        ],
      ),
    ),
    primaryColor: Color.fromARGB(255, 50, 199, 222),
    scaffoldBackgroundColor: Color.fromARGB(255, 4, 139, 139),
    fontFamily: 'Montserrat');

final theme_003 = AppTheme(
    kMainHeader: "Client 003",
    kShowAppBar: false,
    kStatusBarHeader: "003",
    kSubHeader: "This is theme 003",
    kGradientStyle: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color.fromARGB(255, 208, 87, 87),
          Color.fromARGB(255, 128, 2, 2),
        ],
      ),
    ),
    primaryColor: Color.fromARGB(255, 208, 87, 87),
    scaffoldBackgroundColor: Color.fromARGB(255, 128, 2, 2),
    fontFamily: 'Montserrat');

final theme_004 = AppTheme(
    kMainHeader: "Client 004",
    kShowAppBar: false,
    kStatusBarHeader: "004",
    kSubHeader: "This is theme 004",
    kGradientStyle: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color.fromARGB(255, 242, 96, 181),
          Color.fromARGB(255, 153, 1, 130),
        ],
      ),
    ),
    primaryColor: Color.fromARGB(255, 242, 96, 181),
    scaffoldBackgroundColor: Color.fromARGB(255, 153, 1, 130),
    fontFamily: 'Montserrat');
