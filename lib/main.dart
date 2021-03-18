// ignore: avoid_web_libraries_in_flutter
import "dart:html";

import "package:blogr/controllers/phone_menu_controller.dart";
import "package:blogr/core/colors.dart";
import "package:blogr/pages/home_page.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _initControllers();

  if (kDebugMode) {
    Get.find<PhoneMenuController>().toggleMenu();
  }

  runApp(const Main());
}

void _initControllers() {
  Get.put(PhoneMenuController(), permanent: true);
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
        textTheme: const TextTheme().copyWith(
          headline1: GoogleFonts.overpass().copyWith(
            fontSize: 44,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          headline2: GoogleFonts.overpass().copyWith(
            fontSize: 36,
            color: PrimaryColors.darkBlue,
            fontWeight: FontWeight.bold,
          ),
          headline3: GoogleFonts.ubuntu().copyWith(
            fontSize: 22,
            color: Colors.white,
          ),
          subtitle1: subtitle1TextTheme,
          subtitle2: subtitle1TextTheme.copyWith(
            fontSize: 16,
            color: NeutralColors.veryDarkGrayishBlue,
            letterSpacing: 1,
          ),
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
      initialRoute: "/",
      defaultTransition: Transition.cupertino,
      getPages: [
        GetPage(
          name: "/",
          title: "Blogr",
          page: () {
            document.title = "Blogr";
            return const HomePage();
          },
        ),
      ],
      unknownRoute: GetPage(
        name: "/404",
        page: () {
          SchedulerBinding.instance?.addPostFrameCallback((_) {
            Get.toNamed("/");
          });
          return const Scaffold();
        },
      ),
    );
  }
}
