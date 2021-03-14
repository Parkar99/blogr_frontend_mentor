// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:blogr/core/colors.dart';
import 'package:blogr/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main();

  TextStyle get subtitle1TextTheme => GoogleFonts.ubuntu().copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: PrimaryColors.lightRed,
        textTheme: GoogleFonts.overpassTextTheme().copyWith(
          headline1: GoogleFonts.overpass().copyWith(
            fontSize: 44,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          headline2: GoogleFonts.ubuntu().copyWith(
            fontSize: 22,
            color: Colors.white,
          ),
          subtitle1: subtitle1TextTheme,
          bodyText1: GoogleFonts.ubuntu(),
          bodyText2: GoogleFonts.ubuntu(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 35,
              ),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(subtitle1TextTheme),
            foregroundColor: MaterialStateProperty.all<Color>(PrimaryColors.red),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return PrimaryColors.lightRed;
                }
                return Colors.white;
              },
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
            side: MaterialStateProperty.resolveWith<BorderSide>((states) {
              if (states.contains(MaterialState.hovered)) {
                return const BorderSide(color: PrimaryColors.lightRed);
              }
              return const BorderSide(color: Colors.white);
            }),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 35,
              ),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(subtitle1TextTheme),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      initialRoute: '/',
      defaultTransition: Transition.cupertino,
      getPages: [
        GetPage(
          name: '/',
          title: 'Blogr',
          page: () {
            document.title = 'Blogr';
            return const HomePage();
          },
        ),
      ],
      unknownRoute: GetPage(
        name: '/404',
        page: () {
          SchedulerBinding.instance?.addPostFrameCallback((_) {
            Get.toNamed('/');
          });
          return const Scaffold();
        },
      ),
    );
  }
}
