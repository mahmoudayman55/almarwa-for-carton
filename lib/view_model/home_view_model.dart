import 'package:alsafwa/helper/database_helper.dart';
import 'package:alsafwa/models/material_model.dart';
import 'package:alsafwa/view/home_view.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
@override
  void onInit() {
    // TODO: implement onInit
    DatabaseHelper.db.database;
  }
}