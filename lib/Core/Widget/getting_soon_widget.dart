import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zone/Core/Widget/custom_button.dart';
import 'package:zone/Core/navigators/navigators.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Core/utilies/app_svp.dart';
import 'package:zone/generated/l10n.dart';
import 'package:zone/main_screen.dart';

class GettingSoon extends StatelessWidget {
  const GettingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             AppSVG(assetName: "getSoon",height: 30.h,),
                 SizedBox(height: 2.h,),
                 Text("${S().weStill}",style:
                 GoogleFonts.adventPro(fontWeight: FontWeight.bold,color: Theme.of(context).brightness == Brightness.light ?Colors.black38:Colors.white,fontSize: 19.sp)
                   ,),
                 Text("${S().cookingOurApp}",style:
                 GoogleFonts.alata(fontWeight: FontWeight.bold,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,fontSize: 19.sp)
                   ,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 22.sp,vertical: 16.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${S().timeRemaining}",style: GoogleFonts.akatab(fontWeight: FontWeight.bold,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,fontSize: 16.sp),),
                 SizedBox(width: 2.w,),
                  Center(
                    child: CountDownText(
                      due: DateTime.parse("2023-10-08 00:00:00"),
                      finishedText: "Done",
                      collapsing: true,
                      showLabel: true,
                      daysTextLong: " DAYS ",
                      hoursTextLong: " HOURS ",
                      minutesTextLong: " MINUTES ",
                      secondsTextLong: " SECONDS ",
                      style: GoogleFonts.akatab(color: AppColors.zoneColor1,fontWeight: FontWeight.bold,fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(text: "${S().homeScreen}", onPressed: () {
              push(context, MainScreen());

            },)


       ] ),

      ),
    );
  }
}
