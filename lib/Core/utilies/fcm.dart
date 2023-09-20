
import 'package:firebase_messaging/firebase_messaging.dart';
class PushNotificationService {
  final _fcm = FirebaseMessaging.instance;
  String? fCMToken;
  Future<void> initialize() async {
    await _fcm.requestPermission();
     fCMToken = await _fcm.getToken();
    print("Token: $fCMToken");
  }

}