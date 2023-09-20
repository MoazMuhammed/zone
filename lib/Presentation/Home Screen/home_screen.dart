import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zone/Core/Widget/getting_soon_widget.dart';
import 'package:zone/Core/navigators/navigators.dart';
import 'package:zone/Core/shared_preferences/my_shared.dart';
import 'package:zone/Core/shared_preferences/my_shared_keys.dart';
import 'package:zone/Core/style/color.dart';
import 'package:zone/Data/Ads%20Cubit/ads_cubit.dart';
import 'package:zone/Models/ads/ads.dart';
import 'package:zone/Presentation/Home%20Screen/component/categories_widget.dart';
import 'package:zone/Presentation/Home%20Screen/component/home_product_widget.dart';
import 'package:zone/Presentation/Home%20Screen/component/home_slider_widget.dart';
import 'package:zone/Presentation/Home%20Screen/component/permision_location_dialog.dart';
import 'package:zone/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? position;
  List<Placemark>? placeMark;
  TextEditingController addressEditingController = TextEditingController();
  final cubit = AdsCubit();

  // void _determinePosition() async {
  //   bool serviceEnable;
  //   LocationPermission permission;
  //
  //   serviceEnable = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnable) {
  //     return Future.error("Location services are disable");
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //
  //   position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   placeMark =
  //       await placemarkFromCoordinates(position!.latitude, position!.longitude);
  //   addressEditingController.text =
  //       "${placeMark?[0].street.toString()}-${placeMark?[0].country.toString()}";
  // }

  Future<void> _checkPermission() async {
    PermissionStatus status = await Permission.location.status;
    if (status.isDenied) {
      _showPermissionDialog();
    } else if (status.isGranted) {
      _onPermissionGranted();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => LocationPermissionDialog(
        onPermissionGranted: _onPermissionGranted,
      ),
    );
  }

  void _onPermissionGranted() async {
    Position? currentPosition;
    try {
      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      placeMark = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );
    } catch (e) {
      print("Error getting location: $e");
      return;
    }

    setState(() {
      position = currentPosition;
      addressEditingController.text =
      "${placeMark?[0].street.toString()}-${placeMark?[0].country.toString()}";
      MyShared.putString(key: MySharedKeys.position, value: placeMark?[0].street.toString());
    });

    print("Location permission granted");
  }

  @override
  void initState() {
    setState(() {
      _checkPermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getPost(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16),
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: AppColors.productElement1,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              _checkPermission();
                            });
                          },
                          icon: const Icon(
                            Icons.location_on,
                            color: AppColors.zoneColor2,
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S().sendTo,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey
                                    : Colors.white38,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          placeMark != null
                              ? MyShared.getString(key: MySharedKeys.position)
                              : S().gettingLocation,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      push(context, const GettingSoon());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        color: AppColors.productElement1,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      )),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.productElement1,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                child: TextFormField(
                  cursorColor: AppColors.zoneColor1,
                  style: const TextStyle(color: AppColors.zoneColor2),
                  decoration: InputDecoration(
                    hintText: S().searchProducts,
                    hintStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.withOpacity(0.8)
                          : Colors.grey,
                    ),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              BlocBuilder<AdsCubit, AdsState>(
                builder: (context, state) {
                  return GestureDetector(
                      onTap: () => push(context, const GettingSoon()),
                      child: CarouselSlider.builder(
                        itemCount: cubit.ads.length,
                        itemBuilder: (context, index, realIndex) {
                          if (index >= 0 && index < cubit.ads.length) {
                            Ads ads = cubit.ads[index];
                            return
                              cubit.state is AdsLoading ? const CircularProgressIndicator(color: AppColors.zoneColor1):
                              HomeSliderWidget(
                              image: "${ads.image}",
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.25,
                          viewportFraction: 0.86,
                          initialPage: 0,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                      ));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => push(context, const GettingSoon()),
                child: const CategoriesWidget(),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      S().featuredProducts,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                        onPressed: () {
                          push(context, const GettingSoon());
                        },
                        child: Text(
                          S().viewAll,
                          style: const TextStyle(
                            color: AppColors.zoneColor2,
                            fontSize: 16,
                          ),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: const HomeProductWidget()),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<AdsCubit, AdsState>(
                builder: (context, state) {
                  return GestureDetector(
                      onTap: () => push(context, const GettingSoon()),
                      child: CarouselSlider.builder(
                        itemCount: cubit.ads.length,
                        itemBuilder: (context, index, realIndex) {
                          if (index >= 0 && index < cubit.ads.length) {
                            Ads ads = cubit.ads[index];
                            return
                              cubit.state is AdsLoading ? const CircularProgressIndicator(color: AppColors.zoneColor1):
                              HomeSliderWidget(
                              image: "${ads.image}",
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.25,
                          viewportFraction: 0.95,
                          initialPage: 1,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
