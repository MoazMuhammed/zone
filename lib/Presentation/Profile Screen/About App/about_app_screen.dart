import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zone/Core/navigators/navigators.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/FAQS/faqs_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/Privacy%20and%20Policy/privacy_policy_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/Terms/terms_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/rate_app_screen.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {

  void launchInstagram() async {
    if (!await launchUrl(Uri.parse("https://www.instagram.com/kamula010/"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }
  }

  void launchFacebook() async {
    if (!await launchUrl(Uri.parse("https://www.facebook.com/profile.php?id=100002234768572&mibextid=ZbWKwL"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }
  }


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
          title: const Text('About app',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back,color: Colors.black,)
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.12,
            ),
            getAboutElement(
                context: context,
                title: 'FAQs',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        push(context, FAQs());
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
                title: 'Terms of use',
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
                title: 'Privacy Policy',
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
                title: 'Rate app',
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
              color: AppColors.productElement1,
            ),
            getAboutElement(
                context: context,
                title: 'Facebook',
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: (){
                        launchFacebook();
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
                        launchInstagram();
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColors.zoneColor1)),
                )
            ),
            Expanded(
              child:Container(
                width: double.infinity,
                color: AppColors.productElement1,
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
              style: const TextStyle(
                  color: Colors.black,
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
