import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zone/Core/shared_preferences/my_shared.dart';
import 'package:zone/Core/shared_preferences/my_shared_keys.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Data/Feature%20Cubit/feature_cubit.dart';
import 'package:zone/Models/Feature/feature_model.dart';
import 'package:zone/Models/ads/ads.dart';

class HomeProductWidget extends StatefulWidget {
  const HomeProductWidget({
    super.key,
  });

  @override
  State<HomeProductWidget> createState() => _HomeProductWidgetState();
}

class _HomeProductWidgetState extends State<HomeProductWidget> {
  final cubit = FeatureCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getFeature(),
      child: BlocBuilder<FeatureCubit, FeatureState>(
        builder: (context, state) {
          if (cubit.state is FeatureLoading) {
            return CircularProgressIndicator(
              color: AppColors.zoneColor1,
              strokeWidth: 1.w,
            );
          } else if (cubit.state is FeatureSuccess &&
              cubit.featureModel.isEmpty) {
            return Container();
          } else if (cubit.state is FeatureSuccess &&
              cubit.featureModel.isNotEmpty) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.featureModel.length,
              itemBuilder: (context, index) {
                FeatureModel featureModel = cubit.featureModel[index];
                return Stack(
                  alignment:
                      MyShared.getString(key: MySharedKeys.languageKeys) == 'en'
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                  children: [

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          color: AppColors.productElement2.withOpacity(0.1),
                          borderRadius: MyShared.getString(key: MySharedKeys.languageKeys) == 'en' ? const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft:  Radius.circular(
                                   120),
                            bottomRight: Radius.circular(40),
                          ) :const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft:  Radius.circular(
                                40),
                            bottomRight: Radius.circular(120),
                          )  ,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        decoration:
                                            const BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              spreadRadius: -38,
                                              blurRadius: 10,
                                              offset: Offset(0, 48)),
                                        ]),
                                        child:
                                            Image.network(featureModel.image)),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        featureModel.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        featureModel.price.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white38,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ), Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.03,
                        vertical: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.03,
                        backgroundColor: AppColors.zoneColor2,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
