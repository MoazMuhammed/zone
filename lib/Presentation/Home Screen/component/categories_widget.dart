import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Data/Categories%20Cubit/categories_cubit.dart';
import 'package:zone/Models/categories/categories_model.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key,});



  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final cubit = CategoriesCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit..getCategories(),
  child: BlocBuilder<CategoriesCubit, CategoriesState>(
  builder: (context, state) {
    return
      cubit.state is CategoriesLoading ? const CircularProgressIndicator(color: AppColors.zoneColor1):

      SizedBox(
      width: MediaQuery.of(context).size.width* 0.94,
      height: MediaQuery.of(context).size.height* 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:cubit.categoriesModel.length,
        itemBuilder: (context, index) {
          CategoriesModel categoriesModel = cubit.categoriesModel[index];
          return Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 16),
        width: MediaQuery.of(context).size.width* 0.3,
        height: MediaQuery.of(context).size.height* 0.15,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white24
              : Colors.white10,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width* 0.25,
              height: MediaQuery.of(context).size.height* 0.1,
              child:
              Image.network(categoriesModel.image,fit: BoxFit.fill,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                categoriesModel.name,
                textAlign: TextAlign.center,
                style:  TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 12
                ),
              ),
            ),
          ],
        ),
      );
        },),
    );
  },
),
);
  }
}
