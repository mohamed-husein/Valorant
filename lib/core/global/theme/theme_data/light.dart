import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_fonsts.dart';
import '../../../utils/app_sizes.dart';
import '../theme_color/theme_color_light.dart';

ThemeData get getThemeDataLight => ThemeData(
      scaffoldBackgroundColor: ThemeColorLight.primaryColor,
      primaryColor: ThemeColorLight.primaryClr,
      fontFamily: AppFonts.fontFamily,
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
        buttonColor: ThemeColorLight.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizes.br8),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ThemeColorLight.primarylMediumColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: ThemeColorLight.labelMediumColor,
          fontSize: AppSizes.fs13,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColorLight.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        suffixIconColor: ThemeColorLight.labelColor,
        fillColor: ThemeColorLight.fillColorTextFormField,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColorLight.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColorLight.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        errorStyle: TextStyle(
          color: ThemeColorLight.validationTextFieldColor,
          fontSize: AppSizes.fs14,
          fontWeight: AppFonts.regular,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColorLight.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        labelStyle: TextStyle(
          color: ThemeColorLight.black,
          fontSize: AppSizes.fs13,
        ),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColorLight.primaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: ThemeColorLight.black),
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: ThemeColorLight.primaryColor,
            statusBarColor: ThemeColorLight.primaryColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.white,
            //Navigation bar divider color
            systemNavigationBarIconBrightness:
                Brightness.light, //navigation bar icon
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(ThemeColorLight.primaryClr),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
                vertical: AppSizes.pH12, horizontal: AppSizes.pW22),
          ),
          foregroundColor:
              MaterialStateProperty.all<Color>(ThemeColorLight.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.br12),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: ThemeColorLight.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizes.br8),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.br40),
            ),
          ),
          overlayColor:
              MaterialStateProperty.all<Color>(ThemeColorLight.overLayColor),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: ThemeColorLight.labelColor,
              fontSize: AppSizes.fs16,
              fontWeight: AppFonts.regular,
            ),
          ),
        ),
      ),
      hintColor: ThemeColorLight.grayscale,
      textTheme: getTextTheme(),
    );

getTextTheme() => TextTheme(
      /// Primary Color Light
      displaySmall: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Primary Color AppBar
      displayMedium: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      displayLarge: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      headlineLarge: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs48,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineSmall: TextStyle(
        color: ThemeColorLight.overLayColor,
        fontSize: AppSizes.fs11,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Body For Text in Black Color
      bodySmall: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyLarge: TextStyle(
          color: ThemeColorLight.black,
          fontSize: AppSizes.fs32,
          fontWeight: AppFonts.semiBlod,
          fontFamily: AppFonts.fontFamily),

      /// Title
      titleSmall: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs13,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      /// White Text For Button
      titleMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      titleLarge: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Label For Color Grey
      labelSmall: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs11,
        letterSpacing: 0,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      labelMedium: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      labelLarge: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
    );
