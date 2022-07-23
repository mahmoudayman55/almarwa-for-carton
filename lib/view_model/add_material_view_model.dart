import 'package:alsafwa/helper/database_helper.dart';
import 'package:alsafwa/models/material_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddMaterialViewModel extends GetxController{
  String _materialName='';

  String get materialName => _materialName;

  set setMaterialName(String value) {
    _materialName = value;
    update();
  }

  double _materialPrice=0,_materialWeight=0;

  double get materialPrice => _materialPrice;

  set setMaterialPrice(double value) {
    _materialPrice = value;
  }

  get materialWeight => _materialWeight;

  set setMaterialWeight(value) {
    _materialWeight = value;
  }

  var formKey=GlobalKey<FormState>();
  insertMaterial() async {
    formKey.currentState!.save();
    if(formKey.currentState!.validate()){
      await DatabaseHelper.db.insertMaterial(MaterialModel(
        factorController: TextEditingController(),
          name: materialName, price: materialPrice, weight: materialWeight));
      Get.snackbar('تم', 'تم اضافة  الخامه $materialName  بنجاح');
    }
  }

}