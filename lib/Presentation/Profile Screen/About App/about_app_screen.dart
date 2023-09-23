import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zone/Core/navigators/navigators.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/FAQS/faqs_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/Privacy%20and%20Policy/privacy_policy_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/Terms/terms_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/rate_app_screen.dart';
import 'package:zone/generated/l10n.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title:  Text(S().aboutApp,
            style:  TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon:  Icon(Icons.arrow_back,color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,)
          )
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.12,
            ),
            getAboutElement(
                context: context,
                title: S().faqs,
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        push(context, const FAQs());
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColors.zoneColor1)),
                )
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getAboutElement(
                context: context,
                title: S().termsOfUse,
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        push(context, const Terms());
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColors.zoneColor1)),
                )
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getAboutElement(
                context: context,
                title: S().privacyPolicy,
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        push(context, const PrivacyPolicy());
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColors.zoneColor1)),
                )
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getAboutElement(
                context: context,
                title: S().rateApp,
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        push(context, const RateAppScreen());
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColors.zoneColor1)),
                )
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.08,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.productElement1
                  : const Color(0x0ff2e2e2),
            ),
            getAboutElement(
                context: context,
                title: 'Facebook',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        launchUrlString("https://web.facebook.com/");
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColors.zoneColor1)),
                )
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
            ),
            getAboutElement(
                context: context,
                title: 'Instagram',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        launchUrlString("https://web.facebook.com/");
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColors.zoneColor1)),
                )
            ),
            Expanded(
              child:Container(
                width: double.infinity,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.productElement1
                    : const Color(0x0ff2e2e2),
              ),
            ),
          ],
        )
    );
  }
}

Widget getAboutElement({required BuildContext context,required String title,required Widget trailing}){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style:  TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
          trailing,
        ],
      ),

    ],
  );
}
