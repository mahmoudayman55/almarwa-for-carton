import 'dart:io';
import 'package:alsafwa/view/add_material_view.dart';
import 'package:get/get.dart';
import 'package:alsafwa/componants.dart';
import 'package:alsafwa/view_model/home_view_model.dart';
import 'package:alsafwa/view_model/materials_report_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class MaterialsReportView extends GetWidget<MaterialsReportViewModel> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<MaterialsReportViewModel>(
        builder: (controller) => Container(
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
                    child:Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        searchBar(
                            width: width * 0.8,

                            radius: 20,
                            formField: TextFormField(
                              style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(18)),
                              onChanged: (value) {
                                controller.getMaterials(value);
                              },
                              decoration: searchFormFieldDecoration(),
                            ),
                            height: height * 0.08),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        controller.materials.length == 0
                            ? Column(
                              children: [
                                Align(
                          alignment: Alignment.center,
                                  child: Column(
                          children: [
                                  Text('لا يوجد خامات',style: homeTextStyle(color: Colors.black),),
                                  SizedBox(height: height*0.03,),
                                  ElevatedButton(onPressed: (){Get.off(AddMaterialView());}, child: Text('اضافة خامه',style: new TextStyle(
                                      fontSize: ScreenUtil().setSp(20)),),style: ElevatedButton.styleFrom(primary: Colors.green),)                          ],
                        ),
                                ),
                              ],
                            )
                            : Align(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                          showCheckboxColumn: false,
                                          dividerThickness: 1,
                                          dataRowHeight: height * 0.07,
                                          headingRowHeight: height * 0.04,
                                          columnSpacing: width * 0.12,
                                          headingRowColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.orangeAccent),
                                          columns: [
                                            DataColumn(
                                                label: Text(
                                              'الاسم'
                                                  , textAlign: TextAlign.center,
                                              style: rowItemTextStyle(),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              'الوزن'                                                  , textAlign: TextAlign.center,

                                                style: rowItemTextStyle(),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              'السعر'                                                  , textAlign: TextAlign.center,

                                                  style: rowItemTextStyle(),
                                            )),
                                            DataColumn(
                                                label: Text('')),
                                          ],
                                          rows: List<DataRow>.generate(
                                              controller.materials.length,
                                              (index) => DataRow(
                                                      color: MaterialStateProperty
                                                          .resolveWith<Color>(
                                                              (Set<MaterialState>
                                                                  states) {
                                                        // Even rows will have a grey color.
                                                        if (index % 2 == 0)
                                                          return Colors.grey.shade50;
                                                        return Colors.grey
                                                            .shade300; // Use default value for other states and odd rows.
                                                      }),
                                                      cells: [
                                                        DataCell(Text(
                                                            controller
                                                                .materials[index].name
                                                                .toString(),
                                                            style:
                                                                rowItemElementTextStyle())),
                                                        DataCell(Text(
                                                            controller
                                                                .materials[index]
                                                                .weight
                                                                .toString(),
                                                            style:
                                                                rowItemElementTextStyle())),
                                                        DataCell(Text(
                                                            controller
                                                                .materials[index]
                                                                .price
                                                                .toString(),
                                                            style:
                                                                rowItemElementTextStyle())),        DataCell(
                                                          Icon(
                                                            Icons
                                                                .delete,
                                                            size: ScreenUtil()
                                                                .setWidth(25),
                                                            color: Colors
                                                                .red,
                                                          ),
                                                          onTap:
                                                              () {
                                                            controller
                                                                .deleteMaterial((controller.materials[index].id as int));
                                                            controller
                                                                .update();
                                                          },
                                                        ),
                                                      ])),
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                );
              },
            )));
  }
}
