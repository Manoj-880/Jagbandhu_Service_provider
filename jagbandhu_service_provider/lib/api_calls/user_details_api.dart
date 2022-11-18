// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/Constants/api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';

Future<String> userdetailsapi(
  firstName,
  lastname,
  dob,
  gender,
  email,
  PhoneNumber,
  address,
  city,
  state,
  country,
) async {
  final userresponse = await http.get(Uri.parse(
      '${Apilink.ipAddress}/appaddprovider?firstname=${newUser.firstName}&lastname=${newUser.lastname}&dob=${newUser.dob}&gender=${newUser.gender}&email=${newUser.email}&address=${newUser.address}&mobile=$number&district=${newUser.city}&state=${newUser.state}&country=${newUser.country}'));
  print(userresponse);
  print(number);
  return userresponse.body;
}
