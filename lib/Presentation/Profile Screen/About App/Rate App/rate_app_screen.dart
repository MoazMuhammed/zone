import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/Get%20Help/get_help_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/Leave%20Comment/leave_comment_screen.dart';
import 'package:zone/Presentation/Profile%20Screen/About%20App/Rate%20App/Rate%20Bar/rate_bar.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('App feedback',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.14,
              ),
              const AutoSizeText(
                'How would you rate your zone ?',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: AppColors.zoneColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              const RateBar(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
              const LeaveComment(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 2,
                color: AppColors.productElement2,
              ),
              const GetHelpScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
