// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jagbandhu_service_provider/Constants/api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';
import 'package:jagbandhu_service_provider/models/user_details_model.dart';

import '../local_database.dart';

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
      '${Apilink.ipAddress}/appaddprovider?firstname=$firstName&lastname=$lastname&dob=$dob&gender=$gender&email=$email&address=$address&mobile=$number&district=$city&state=$state&country=$country'));
  print(userresponse.body);
  print(number);

  return userresponse.body;
}

Future<String> updateuserdetailsapi(
  id,
  firstName,
  lastname,
  email,
  address,
  city,
  state,
  country,
  phonenumber,
) async {
  final userresponse = await http.post(Uri.parse(
      '${Apilink.ipAddress}/appupdateprovidersdetails?firstname=$firstName&pid=$id&lastname=$lastname&mobile=$phonenumber&email=$email&address=$address&district=$city&state=$state&country=$country'));
  print(userresponse.body);

  return userresponse.body;
}

Future getuserDetails(mobile) async {
  final detailsresponse = await http.get(
      Uri.parse("${Apilink.ipAddress}/appgetprovidersdetails?mobile=$mobile"));
  debugPrint(detailsresponse.body);
  List<dynamic> maps = json.decode(detailsresponse.body);

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
