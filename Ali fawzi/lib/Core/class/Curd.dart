
import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../model/user_model.dart';
import '../service/my_service.dart';
import '../service/shared_perferences_key.dart';
import 'check_internet.dart';
import 'status_request.dart';

class Crud {
  // تابع getData لجلب البيانات من الـ API
  Future<Either<StatusRequest, String>> getData(String url, Map<String, String> headers) async {
    try {
      if (await CheckInternet()) {
        var response = await http.get(
          Uri.parse(url),
          headers: headers,
        );

        print('Response: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(response.body); // في حالة النجاح، إرجاع البيانات
        } else {
          var decodeResponse = json.decode(response.body);
          var message = decodeResponse['message'] ?? 'Unknown error occurred';
          return Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (error) {
      print('Error: $error');
      return const Left(StatusRequest.failure);
    }
  }

  // تابع postData لإرسال البيانات إلى الـ API
  Future<Either<StatusRequest, String>> postData(
      String url,
      Map<String, dynamic> data,
      Map<String, String> headers,
      bool saveToken,
      ) async {
    try {
      if (await CheckInternet()) {
        var response = await http.post(
          Uri.parse(url),
          body: json.encode(data), // تحويل البيانات إلى JSON
          headers: headers,
        );

        print('Response: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          var decodeResponse = json.decode(response.body);

          if (saveToken) {
            var token = decodeResponse['data']['access_token'];
            var user = UserModel.fromRawJson(response.body);
            await MyServices().saveUserInfo(user);
            await MyServices.saveValue(SharedPreferencesKey.tokenkey, token);
            await MyServices().setConstToken();
          }

          return Right(response.body); // إرجاع البيانات في حال النجاح
        } else {
          var decodeResponse = json.decode(response.body);
          var message = decodeResponse['message'] ?? 'Unknown error occurred';
          return Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (error) {
      print('Error: $error');
      return const Left(StatusRequest.failure);
    }
  }
}
