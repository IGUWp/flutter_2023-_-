import 'dart:ffi';

import 'package:dio/dio.dart';

String baseurl = "http://127.0.0.1:80/api";
Dio dio = new Dio();

Future<Response> UserLogin(data) {
  return dio.post(baseurl + "/UserEntity/Login", data: data);
}

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



