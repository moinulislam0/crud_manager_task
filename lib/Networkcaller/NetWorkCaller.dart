import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:method_practice/model/ResponseModel.dart';
import 'package:method_practice/utility/Utility.dart';

class Networkcaller {
  Networkcaller._();

  static Future<Responsemodel> getRequest({required String url}) async {
    try {
      // ✅ Create custom HttpClient that ignores SSL errors
      HttpClient client = HttpClient()
        ..badCertificateCallback = (cert, host, port) => true;

      IOClient ioClient = IOClient(client);

      // ✅ Use ioClient to make the request
      final Response response = await ioClient.get(
        Uri.parse(Utility.baseUrl + url),
        headers: {"Content-Type": "application/json"},
      );

      print("Status Code: ${response.statusCode}");
      print("Body: ${response.body}");

      if (response.statusCode == 200) {
        return Responsemodel(
          StatusCode: response.statusCode,
          isSuccess: true,
          returnData: jsonDecode(response.body),
        );
      } else {
        return Responsemodel(
          StatusCode: response.statusCode,
          isSuccess: false,
          returnData: jsonDecode(response.body),
        );
      }
    } catch (e) {
      print("Error during GET request: $e");
      return Responsemodel(
        StatusCode: -1,
        isSuccess: false,
        returnData: e.toString(),
      );
    }
  }

  static Future<Responsemodel> postRequest(
      {required Map<String, dynamic>? body, required String url}) async {
    try {
      HttpClient client = HttpClient()
        ..badCertificateCallback = (cert, host, port) => true;

      IOClient ioClient = IOClient(client);
      final Response response = await ioClient.post(
          Uri.parse(Utility.baseUrl + url),
          body: jsonEncode(body),
          headers: {"Content-type": "application/json"});

      if (response.statusCode == 200) {
        return Responsemodel(
            StatusCode: response.statusCode,
            isSuccess: true,
            returnData: jsonDecode(response.body));
      } else {
        return Responsemodel(
            StatusCode: response.statusCode,
            isSuccess: false,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      return Responsemodel(
          StatusCode: -1, isSuccess: false, returnData: e.toString());
    }
  }

  static Future<Responsemodel> updateResquest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      HttpClient client = HttpClient()
        ..badCertificateCallback = (cent, post, cost) => true;

      IOClient ioClient = IOClient(client);
      final Response response = await ioClient.post(
          Uri.parse(Utility.baseUrl + url),
          body: jsonEncode(body),
          headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
        return Responsemodel(
            StatusCode: response.statusCode,
            isSuccess: true,
            returnData: jsonDecode(response.body));
      } else {
        return Responsemodel(
            StatusCode: response.statusCode,
            isSuccess: true,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      return Responsemodel(
          StatusCode: -1, isSuccess: false, returnData: e.toString());
    }
  }

  static Future<Responsemodel> deleteRequest({required String url}) async {
    try {
      HttpClient client = HttpClient()
        ..badCertificateCallback = (cent, post, cost) => true;
      IOClient ioClient = IOClient(client);
      final Response response = await ioClient.get(
          Uri.parse(Utility.baseUrl + url),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        return Responsemodel(
            StatusCode: response.statusCode,
            isSuccess: true,
            returnData: jsonDecode(response.body));
      } else {
        return Responsemodel(
            StatusCode: response.statusCode,
            isSuccess: false,
            returnData: jsonDecode(response.body));
      }
    } catch (e) {
      return Responsemodel(
          StatusCode: -1, isSuccess: false, returnData: e.toString());
    }
  }
}
