import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Core/service/shared_perferences_key.dart';

import '../../model/notification_model.dart';
import '../../model/user_model.dart';
import '../const/const_data.dart';

class MyServices extends GetxService {
  static late SharedPreferences shared;

  Future<MyServices> initialize() async {
    shared = await SharedPreferences.getInstance();

    return this;
  }

  static Future<void> saveValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static getValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  setConstToken() async {
    ConstData.token = await getValue(SharedPreferencesKey.tokenkey) ?? '';
    print('your token is ......');
    print(ConstData.token);
    return ConstData.token;
  }

  /*
  setConstBoarding() async {
    ConstData.isBoarding =
        await getValue(SharedPreferencesKey.isBoarding) ?? '';
    print('your isBoarding is ......');
    print(ConstData.isBoarding);
    return ConstData.isBoarding;
  }
  */

  Future<UserModel?> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null && userJson.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(userJson));
    }

    return null;
  }

  Future<void> saveNotificationList(
      List<NotificationModel> notifications) async {
    List<String> notificationJsonList = notifications.map((notification) =>
        jsonEncode(notification.toJson())).toList();
    await shared.setStringList(
        SharedPreferencesKey.notifications, notificationJsonList);
  }

  Future<List<NotificationModel>> getNotificationList() async {
    List<String>? notificationJsonList = shared.getStringList(
        SharedPreferencesKey.notifications);

    if (notificationJsonList != null) {
      return notificationJsonList.map((json) =>
          NotificationModel.fromJson(jsonDecode(json))).toList();
    }

    return [];
  }

  Future<void> saveUserInfo(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());

    await prefs.setString('user', userJson);
    print(' user is ......');
    print(user);
  }
}

Future<void> intialService() async {
  //FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //print('Got a message whilst in the foreground!');
  // print('Message data: ${message.data}');

  /*
   if (message.notification != null) {
      print('Message also contained a notification: ${message.notification!.title}');
      Get.find<NotificationController>().addNotifications(
        message.notification!.title ?? 'No Title',
        message.notification!.body ?? 'No Body',
      );
      // Get.snackbar(
      //   '${message.notification!.title}', '${message.notification!.body}',
      //   snackPosition: SnackPosition.TOP,
      // );
   }
   */

  await Get.putAsync(() => MyServices().initialize());
}
