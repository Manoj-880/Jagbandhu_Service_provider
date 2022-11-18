import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/Constants/api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';

// ignore: non_constant_identifier_names
Future<String> userlogin(PhoneNumber) async {
  // ignore: non_constant_identifier_names, unused_local_variable
  print(Apilink.ipAddress);
  print('Login number is $PhoneNumber');
  final response = await http
      .get(Uri.parse('${Apilink.ipAddress}/providerlogin?mobile=$PhoneNumber'));

  if (response.statusCode == 200) {
    onetime = response.body;
    number = PhoneNumber;
    print(onetime);
  }
  return response.body;
}
