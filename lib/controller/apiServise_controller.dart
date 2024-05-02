import 'package:crud1/service/service_crud.dart';
import 'package:flutter/material.dart';

class ApiController extends ChangeNotifier {
  ApiService serc = ApiService();

  Future<void> fetchingContact() async {
    await serc.fetchingData();
    notifyListeners();
  }

  Future<void> deleteData(String id) async {
    await serc.deletById(id);
    notifyListeners();
  }
}
