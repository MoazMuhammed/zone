// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enter Your Location`
  String get enterLocation {
    return Intl.message(
      'Enter Your Location',
      name: 'enterLocation',
      desc: '',
      args: [],
    );
  }

  /// `Send to:`
  String get sendTo {
    return Intl.message(
      'Send to:',
      name: 'sendTo',
      desc: '',
      args: [],
    );
  }

  /// `Search products ..`
  String get searchProducts {
    return Intl.message(
      'Search products ..',
      name: 'searchProducts',
      desc: '',
      args: [],
    );
  }

  /// `Featured Products`
  String get featuredProducts {
    return Intl.message(
      'Featured Products',
      name: 'featuredProducts',
      desc: '',
      args: [],
    );
  }

  /// `view all`
  String get viewAll {
    return Intl.message(
      'view all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `WE 'Re Still`
  String get weStill {
    return Intl.message(
      'WE \'Re Still',
      name: 'weStill',
      desc: '',
      args: [],
    );
  }

  /// `Cooking Our App`
  String get cookingOurApp {
    return Intl.message(
      'Cooking Our App',
      name: 'cookingOurApp',
      desc: '',
      args: [],
    );
  }

  /// `Time remaining for release :`
  String get timeRemaining {
    return Intl.message(
      'Time remaining for release :',
      name: 'timeRemaining',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeScreen {
    return Intl.message(
      'Home Screen',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get aboutApp {
    return Intl.message(
      'About App',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `ThemeMode`
  String get themeMode {
    return Intl.message(
      'ThemeMode',
      name: 'themeMode',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get logOut {
    return Intl.message(
      'LogOut',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Vouchers`
  String get voucher {
    return Intl.message(
      'Vouchers',
      name: 'voucher',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Past Order`
  String get pastOrder {
    return Intl.message(
      'Past Order',
      name: 'pastOrder',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get haveAccount {
    return Intl.message(
      'Don\'t have account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userNAme {
    return Intl.message(
      'Username',
      name: 'userNAme',
      desc: '',
      args: [],
    );
  }

  /// `Already have account!`
  String get alreadyHave {
    return Intl.message(
      'Already have account!',
      name: 'alreadyHave',
      desc: '',
      args: [],
    );
  }

  /// `Everything you desire`
  String get secondTitle {
    return Intl.message(
      'Everything you desire',
      name: 'secondTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to your ZONE`
  String get title {
    return Intl.message(
      'Welcome to your ZONE',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Getting Location`
  String get gettingLocation {
    return Intl.message(
      'Getting Location',
      name: 'gettingLocation',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Current Order`
  String get currentOrder {
    return Intl.message(
      'Current Order',
      name: 'currentOrder',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete {
    return Intl.message(
      'Delete Account',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Rate App`
  String get rateApp {
    return Intl.message(
      'Rate App',
      name: 'rateApp',
      desc: '',
      args: [],
    );
  }

  /// `Account Info`
  String get accountInfo {
    return Intl.message(
      'Account Info',
      name: 'accountInfo',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'About app' key

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `App FeedBack`
  String get appFeedBack {
    return Intl.message(
      'App FeedBack',
      name: 'appFeedBack',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate your zone ?`
  String get howYouRate {
    return Intl.message(
      'How would you rate your zone ?',
      name: 'howYouRate',
      desc: '',
      args: [],
    );
  }

  /// `Poor`
  String get poor {
    return Intl.message(
      'Poor',
      name: 'poor',
      desc: '',
      args: [],
    );
  }

  /// `Excellent`
  String get excellent {
    return Intl.message(
      'Excellent',
      name: 'excellent',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback is important. Let us know your thoughts, suggestions or if you have spotted an issue or a bug`
  String get yourFeedback {
    return Intl.message(
      'Your feedback is important. Let us know your thoughts, suggestions or if you have spotted an issue or a bug',
      name: 'yourFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Leave Comment`
  String get leaveComment {
    return Intl.message(
      'Leave Comment',
      name: 'leaveComment',
      desc: '',
      args: [],
    );
  }

  /// `Send FeedBack`
  String get sendFeedBack {
    return Intl.message(
      'Send FeedBack',
      name: 'sendFeedBack',
      desc: '',
      args: [],
    );
  }

  /// `Press the button below and help center will get a request from you and contact you soon`
  String get pressTheButton {
    return Intl.message(
      'Press the button below and help center will get a request from you and contact you soon',
      name: 'pressTheButton',
      desc: '',
      args: [],
    );
  }

  /// `Need Help`
  String get needHelp {
    return Intl.message(
      'Need Help',
      name: 'needHelp',
      desc: '',
      args: [],
    );
  }

  /// `Get Help`
  String get getHelp {
    return Intl.message(
      'Get Help',
      name: 'getHelp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get pleaseEnterName {
    return Intl.message(
      'Please enter your name',
      name: 'pleaseEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid e-mail!`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter a valid e-mail!',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number!`
  String get pleaseEnterPhone {
    return Intl.message(
      'Please enter a valid phone number!',
      name: 'pleaseEnterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter your Password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get pleaseEnterConfirmPassword {
    return Intl.message(
      'Password does not match',
      name: 'pleaseEnterConfirmPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
