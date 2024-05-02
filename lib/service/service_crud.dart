import 'dart:developer';

import 'package:crud1/model/crud_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<ContactModel>> fetchingData() async {
    try {
      final response = await dio
          .get('https://contacts-management-server.onrender.com/api/contacts');
      if (response.statusCode == 200) {
        log('fetching..........');
        final List<dynamic> jsonData = response.data;
        return jsonData.map((json) => ContactModel.fromjson(json)).toList();
      } else {
        throw Exception('load data ........');
      }
    } catch (e) {
      throw Exception('erorr....$e.');
    }
  }

  Future<bool> deletById(String id) async {
    final responce = await dio.delete(
        'https://contacts-management-server.onrender.com/api/contacts/$id');
    return responce.statusCode == 200;
  }

  Future<bool> postData(
    String name,
    String email,
    String address,
    String phone,
  ) async {
    final response = await dio.post(
      'https://contacts-management-server.onrender.com/api/contacts',
      data: {"name": name, "email": email, "address": address, "phone": phone},
    );
    return response.statusCode == 201;
  }

  Future<bool> putData(
    String name,
    String email,
    String address,
    String phone,
    String id,
  ) async {
    final response = await dio.put(
        'https://contacts-management-server.onrender.com/api/contacts/$id',
        data: {
          "name": name,
          "email": email,
          "address": address,
          "phone": phone
        });
    return response.statusCode == 200;
  }
  
}
