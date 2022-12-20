import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/Constants/api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';

// ignore: non_constant_identifier_names
Future<String> addtemplateapi(
  pId,
  category,
  title,
  description,
  price,
) async {
  // ignore: non_constant_identifier_names, unused_local_variable

  final response = await http.get(Uri.parse(
      '${Apilink.ipAddress}/appaddtemplate?pId=$pId&category=$category&title=$title&price=$price&description=$description&count=1'));
  print('The TID is ${response.body}');

  return response.body;
}
