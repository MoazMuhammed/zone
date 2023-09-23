import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/generated/l10n.dart';

class GetHelpScreen extends StatefulWidget {
  const GetHelpScreen({super.key});

  @override
  State<GetHelpScreen> createState() => _GetHelpScreenState();
}

class _GetHelpScreenState extends State<GetHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(S().needHelp,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(S().pressTheButton,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Fluttertoast.showToast(
                  msg: 'Request sent to help center',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.07,
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: AppColors.zoneColor1,
                      width: 2
                  )
              ),
              child:   Center(
                child: Text(S().getHelp,
                  style: const TextStyle(
                      color: AppColors.zoneColor1,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
