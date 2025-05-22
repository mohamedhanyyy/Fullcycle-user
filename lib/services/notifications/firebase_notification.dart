import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification.dart';

class FirebaseCustomNotification {

  static NotificationSettings? settings;

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {}

  static Future<bool> requestNotificationPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();

    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  static Future<void> setUpFirebase() async {
    bool notificationStatus = await requestNotificationPermission();
    if (notificationStatus) {
      await CustomLocalNotification.setupLocalNotifications();
      FirebaseMessaging.onBackgroundMessage(
          FirebaseCustomNotification.firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessage
          .listen(CustomLocalNotification.showFlutterNotification);
      FirebaseMessaging.onMessageOpenedApp
          .listen((CustomLocalNotification.onMessageOpenedApp));
    }
  }
}
