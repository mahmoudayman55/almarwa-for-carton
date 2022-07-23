import 'package:alsafwa/view_model/add_material_view_model.dart';
import 'package:alsafwa/view_model/corrugated_carton_View_model.dart';
import 'package:alsafwa/view_model/home_view_model.dart';
import 'package:alsafwa/view_model/materials_report_view_model.dart';
import 'package:alsafwa/view_model/sheet_carton_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel(),fenix: true,);
    Get.lazyPut(() => CorrugatedCartonViewModel(),fenix: true,);
    Get.lazyPut(() => SheetCartonViewModel(),fenix: true,);
    Get.lazyPut(() => MaterialsReportViewModel(),fenix: true,);
    Get.lazyPut(() => AddMaterialViewModel(),fenix: true,);



  }
}