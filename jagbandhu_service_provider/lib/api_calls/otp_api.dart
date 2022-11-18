// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/Constants/api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';

Future otpvalidation(otp) async {
  print(Apilink.ipAddress);
  print('Entered OTP is $otp');
  final otpres = await http.get(
      Uri.parse('${Apilink.ipAddress}/otpvalidation?mobile=$number&otp=$otp'));

  res = otpres.body;
  // print(res);
  if (res == 'Otp Invalid' || res == 'New Provider!') {
    // print(res);
    return otpres.body.toString();
  } else {
    // print(res);
    List<dynamic> maps = json.decode(res);
    // print(maps);

    List<UserProfileData> user = List.generate(maps.length, (index) {
      return UserProfileData(
        id: maps[index]['pdId'].toString(),
        firstName: (maps[index]['firstName']).toString(),
        lastname: (maps[index]['lastName']).toString(),
        dob: (maps[index]['dob']).toString(),
        gender: (maps[index]['gender']).toString(),
        email: (maps[index]['email']).toString(),
        phonenumber: (maps[index]['mobile']).toString(),
        // address: (maps[index]['address']).toString(),
        country: (maps[index]['country']).toString(),
        state: (maps[index]['state']).toString(),
        city: (maps[index]['district']).toString(),
        status: (maps[index]['status']).toString(),
      );
    });

    userdata = user;

    return user;
  }
}
