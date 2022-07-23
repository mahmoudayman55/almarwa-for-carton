import 'package:alsafwa/helper/database_helper.dart';
import 'package:alsafwa/models/material_model.dart';
import 'package:get/get.dart';

class MaterialsReportViewModel extends GetxController{


@override
  void onInit() {
  getMaterials('');
  }

  List<MaterialModel> materials=[];
deleteMaterial(int id){
  DatabaseHelper.db.deleteMaterial(id);
  getMaterials('');
  update();
}

getMaterials(String searchWord) async {
 if(searchWord==''){
    materials= await DatabaseHelper.db.getAllMaterials();
    print(materials.length);
  }
  else {
    materials= await DatabaseHelper.db.findMaterial(searchWord);
  }
  update();
}

}