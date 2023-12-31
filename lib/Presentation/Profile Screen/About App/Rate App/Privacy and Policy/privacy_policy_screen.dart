import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone/Core/data/all_products_data.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/generated/l10n.dart';


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
        title:  Text(S().privacyPolicy,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white
          ),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon:  Icon(Icons.arrow_back,color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,)
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.12,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: faqs.length,
                  itemBuilder: (context,index)=> PrivacyPolicyElement(element: faqs[index],),
                  separatorBuilder: (BuildContext context, int index)=> const SizedBox(height: 10,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrivacyPolicyElement extends StatefulWidget {
  final Map<String,String> element;
  const PrivacyPolicyElement({Key? key,required this.element}) : super(key: key);

  @override
  State<PrivacyPolicyElement> createState() => _PrivacyPolicyElementState();
}

class _PrivacyPolicyElementState extends State<PrivacyPolicyElement> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: AppColors.productElement1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: AutoSizeText('${widget.element['title']}',
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      isOpened = !isOpened;
                    });
                  },
                  icon: Icon(
                    (isOpened)?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down,
                    color: AppColors.zoneColor1,
                  )
              )
            ],
          ),
        ),
        Visibility(
          visible: isOpened,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: AppColors.productElement2.withOpacity(0.4),
                    width: 2
                ),
                right: BorderSide(
                    color: AppColors.productElement2.withOpacity(0.4),
                    width: 2
                ),
                left: BorderSide(
                    color: AppColors.productElement2.withOpacity(0.4),
                    width: 2
                ),
              ),
            ),
            child: Text(
              '${widget.element['details']}',
              textAlign: TextAlign.left,
              style:  TextStyle(
                letterSpacing: 1,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}

