import 'dart:io';

import 'package:alsafwa/models/material_model.dart';
import 'package:alsafwa/view_model/corrugated_carton_View_model.dart';
import 'package:alsafwa/view_model/sheet_carton_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';
import '../componants.dart';

class InsertMaterialSheetView
    extends GetWidget<SheetCartonViewModel> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<SheetCartonViewModel>(builder: (controller) {

      return Container(
          width: screenWidth,
          height: screenHeight,
          child: LayoutBuilder(
            builder: (context, constrains) {
              double height = constrains.maxHeight;
              double width = constrains.maxWidth;
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: SafeArea(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                searchBar(
                                    width: width * 0.8,
                                    radius: 20,
                                    formField: TextFormField(
                                      onChanged: (value) {
                                        controller.getMaterials(value);
                                      },
                                      decoration: searchFormFieldDecoration(),
                                    ),
                                    height: height * 0.06),
                                SizedBox(
                                  height: height * 0.025,
                                ),
                                DataTable(
                                  showCheckboxColumn: false,
                                  dividerThickness: 1,
                                  dataRowHeight: height * 0.07,
                                  headingRowHeight: height * 0.04,
                                  columnSpacing: width * 0.2,
                                  headingRowColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.orangeAccent),
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                          'الاسم',
                                          style: rowItemTextStyle(),
                                        )),
                                    DataColumn(
                                        label: Text(
                                          'الوزن',
                                          style: rowItemTextStyle(),
                                        )),
                                    DataColumn(
                                        label: Text(
                                          'السعر',
                                          style: rowItemTextStyle(),
                                        )),
                                  ],
                                  rows: List<DataRow>.generate(
                                      controller.materials.length,
                                          (index) => DataRow(
                                          onSelectChanged: (e) {
                                            controller.insertMaterials(
                                                MaterialModel(
                                                    name: controller
                                                        .materials[index].name,
                                                    price: controller
                                                        .materials[index].price,
                                                    weight: controller
                                                        .materials[index]
                                                        .weight, factorController: TextEditingController(text: '1')));
                                            Get.back();
                                          },
                                          color: MaterialStateProperty
                                              .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                                // Even rows will have a grey color.
                                                if (index % 2 == 0)
                                                  return Colors.grey.shade50;
                                                return Colors.grey
                                                    .shade300; // Use default value for other states and odd rows.
                                              }),
                                          cells: [
                                            DataCell(Text(
                                                controller.materials[index].name
                                                    .toString(),
                                                style:
                                                rowItemElementTextStyle())),
                                            DataCell(Text(
                                                controller
                                                    .materials[index].weight
                                                    .toString(),
                                                style:
                                                rowItemElementTextStyle())),
                                            DataCell(Text(
                                                controller
                                                    .materials[index].price
                                                    .toString(),
                                                style:
                                                rowItemElementTextStyle())),
                                          ])),
                                )
                              ],
                            ),
                          ),
                        ),
                      )));
            },
          ));
    });
  }
}
