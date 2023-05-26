import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';

// 枚举类型 - 请求类型
enum HttpType { HttpTypeGet, HttpTypePost, HttpTypeDelete }

class http {
  static String baseurl = "http://27.129.129.247:6025/api";
  static String? token;
  // 单例方法
  static Dio? _dioInstance;
  static Dio getDio() {
    _dioInstance ??= Dio();
    return _dioInstance!;
  }

  // 对外抛出方法 - get请求
  static Future<Response> get(String requestUrl,
      {Map<String, dynamic>? queryParameters}) async {
    return await _sendHttpRequest(HttpType.HttpTypeGet, baseurl + requestUrl,
        queryParameters: queryParameters);
  }

  // 对外抛出方法 - post请求
  static Future<Response> post(String requestUrl,
      {Map<String, dynamic>? data}) async {
    var res = await _sendHttpRequest(
        HttpType.HttpTypePost, baseurl + requestUrl,
        data: data!);
    return res;
  }

  // 对外抛出方法 - delete请求
  static Future<Response> delete(String requestUrl,
      {Map<String, dynamic>? data}) async {
    var res = await _sendHttpRequest(
        HttpType.HttpTypeDelete, baseurl + requestUrl,
        data: data!);
    return res;
  }

  // 私有方法 - 处理get请求、post请求
  static Future _sendHttpRequest(HttpType type, String requestUrl,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    try {
      //get、post请求的前置
      Options options =
          Options(headers: {HttpHeaders.authorizationHeader: token});
      switch (type) {
        case HttpType.HttpTypeGet:
          var res = await getDio().get(requestUrl,
              options: options, queryParameters: queryParameters, data: data);
          //get方法的后置操作
          print(res);
          return res;
        case HttpType.HttpTypePost:
          var res =
              await getDio().post(requestUrl, options: options, data: data);
          //post方法的后置操作
          print(res);
          return res;
        case HttpType.HttpTypeDelete:
          var res =
              await getDio().delete(requestUrl, options: options, data: data);
          //post方法的后置操作
          print(res);
          return res;
        default:
          throw Exception('报错了：请求只支持get和post');
      }
    } on DioError catch (e) {
      print("报错:$e");
    }
  }

  // 对外抛出方法 - 下载文件
  static void downloadFile(String downLoadUrl, String savePath,
      void Function(bool result) func) async {
    DateTime timeStart = DateTime.now();
    print('开始下载～当前时间：$timeStart');
    try {
      Dio dio = getDio();
      var response = await dio.download(downLoadUrl, savePath,
          onReceiveProgress: (int count, int total) {
        String progressValue = (count / total * 100).toStringAsFixed(1);
        print('当前下载进度:$progressValue%');
      }).whenComplete(() {
        DateTime timeEnd = DateTime.now();
        //用时多少秒
        int second_use = timeEnd.difference(timeStart).inSeconds;
        print('下载文件耗时$second_use秒');
        func(true);
      });
    } catch (e) {
      print("downloadFile报错：$e");
    }
  }
}

// Future<Response> Flowadd(data) {
//   return dio.post(baseurl + "/UserEntity/Login", data: {
//     "ProjectId": 123,
//     "SerialNumber": 123,
//     "DocumentNumber": 123,
//     "FlowTypeId": 123,
//     "InAmount": 123,
//     "OutAmount": 123,
//     "FinanceManager": 123,
//     "Remark": 123,
//   });
// }

// Future<Response> UserLogin(data) {
//   return dio.post(baseurl + "/UserEntity/Login", data: data);
// }

// Future<Response> UserLogin(data) {
//   return dio.post(baseurl + "/UserEntity/Login", data: data);
// }

// Future<Response> UserLogin(data) {
//   return dio.post(baseurl + "/UserEntity/Login", data: data);
// }

// Future<Response> UserLogin(data) {
//   return dio.post(baseurl + "/UserEntity/Login", data: data);
// }    

// Future<Response> UserLogin(data) {
//   return dio.post(baseurl + "/UserEntity/Login", data: data);
// }

// Future<Response> UserLogin(data) {
//   return dio.post(baseurl + "/UserEntity/Login", data: data);
// }

// Future<Response>  AddUser(data) {
//   return   dio.post(baseurl + "/UserEntity/Login",data:data);
// }



