import 'package:cosysta_mt/utils/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  final TextStyle heading = TextStyle(
    fontFamily: 'Space Grotesk',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppTheme.colors.primaryColor,
  );

  final TextStyle subHeading = TextStyle(
    fontFamily: 'Space Grotesk',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color:AppTheme.colors.primaryColor,
  );

  final TextStyle body = TextStyle(
    fontFamily: 'Space Grotesk',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Colors.black,
  );
  final TextStyle bodyClickable = TextStyle(
    fontFamily: 'Space Grotesk',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppTheme.colors.secondary,
  );
  final TextStyle message = TextStyle(
    fontFamily: 'Space Grotesk',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Color(0xFF000000),
  );

  final TextStyle subHeading2 = TextStyle(
    fontFamily: 'Space Grotesk',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppTheme.colors.primaryColor,
  );


  final TextStyle profileTitle = TextStyle(
    fontFamily: 'Space Grotesk',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Color(0xFFFFFFFF),
  );
  // static const TextStyle status = TextStyle(
  //   fontFamily: 'Space Grotesk',
  //   fontWeight: FontWeight.w400,
  //   fontSize: 14,
  //    color: AppTheme.colors.hintTextColor,

  // );
  final TextStyle textFieldHintText = TextStyle(
    fontFamily: 'Questrial',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.grey,
  );

  final TextStyle checkListStyle = TextStyle(
    fontFamily: 'Questrial',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppTheme.colors.primaryColor,
  );

  static  TextStyle subText = TextStyle(
    fontFamily: 'Questrial',
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppTheme.colors.hintTextColor,
  );

  final TextStyle subText2 = TextStyle(
    fontFamily: 'Questrial',
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: Colors.black,
  );

  final TextStyle buttonText = TextStyle(
    fontFamily: 'Questrial',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.white,
  );

  final TextStyle customContainer = TextStyle(
      fontFamily: 'Questrial',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppTheme.colors.primaryColor);

  final  TextStyle status = TextStyle(
      fontFamily: 'Questrial',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppTheme.colors.hintTextColor);

  //----list tile

  final TextStyle listTileTitle = TextStyle(
    fontFamily: 'Space Grotesk',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppTheme.colors.primaryColor,
  );

  final  TextStyle listTileSubTitle = TextStyle(
    fontFamily: 'Questrial',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppTheme.colors.hintTextColor,
  );

  //--------------

  final TextStyle proximaNova1 = TextStyle(
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppTheme.colors.primaryColor,
  );

  final TextStyle proximaNova2 = TextStyle(
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppTheme.colors.primaryColor,
  );

  final TextStyle proximaNova3 = TextStyle(
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppTheme.colors.primaryColor,
  );
}
