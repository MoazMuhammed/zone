import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/generated/l10n.dart';

class LeaveComment extends StatefulWidget {
  const LeaveComment({Key? key}) : super(key: key);

  @override
  State<LeaveComment> createState() => _LeaveCommentState();
}

class _LeaveCommentState extends State<LeaveComment> {
  bool isChanged = false;

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(S().leaveComment,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(S().yourFeedback,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
            child: TextField(
              controller: commentController,
              onChanged: (val){
                setState(() {
                  if(val.isEmpty){
                    isChanged = false;
                  }else{
                    isChanged = true;
                  }
                });
              },
              cursorColor: AppColors.zoneColor1,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.zoneColor1),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (isChanged)?(){
              commentController.clear();
              setState(() {
                isChanged = false;
              });
              Fluttertoast.showToast(
                  msg: 'Feedback sent successfully',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }:(){},
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.07,
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: (isChanged)?AppColors.zoneColor1:Colors.grey
              ),
              child: Center(
                child: Text(S().sendFeedBack,
                  style: const TextStyle(
                      color: Colors.white,
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
