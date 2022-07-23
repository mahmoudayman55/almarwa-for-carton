import 'dart:io';
import 'package:alsafwa/view/insert_material_corrugated_view.dart';
import 'package:get/get.dart';
import 'package:alsafwa/view_model/corrugated_carton_View_model.dart';
import 'package:alsafwa/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../componants.dart';

class CorrugatedCartonView extends GetWidget<CorrugatedCartonViewModel> {
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return GetBuilder<CorrugatedCartonViewModel>(
        builder: (controller) =>
            Container(
                width: screenWidth,
                height: screenHeight,
                child: LayoutBuilder(
                  builder: (context, constrains) {
                    double height = constrains.maxHeight;
                    double width = constrains.maxWidth;
                    return Scaffold(
                      backgroundColor: Colors.white,
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: TextStyle(fontSize: ScreenUtil().setSp(18)),

                                      decoration: TextInputDecoration(
                                          'الطول', controller.iconPadding),
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        if (value!.isNotEmpty) {
                                          controller.setLength =
                                              double.parse(value);
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'يجب ادخال الطول';
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    TextFormField(
                                      style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                                      decoration: TextInputDecoration(
                                          'العرض', controller.iconPadding),
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        if (value!.isNotEmpty) {
                                          controller.setWidth =
                                              double.parse(value);
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'يجب ادخال العرض';
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    TextFormField(
                                      style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                                      decoration: TextInputDecoration(
                                          'الارتفاع', controller.iconPadding),
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        if (value!.isNotEmpty) {
                                          controller.setHeight =
                                              double.parse(value);
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'يجب ادخال الارتفاع';
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    TextFormField(  style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                                      decoration: TextInputDecoration(
                                          'اللسان', controller.iconPadding),
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        if (value!.isNotEmpty) {
                                          controller.setVerticalAdditionalArea =
                                              double.parse(value);
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'يجب ادخال طول اللسان';
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    TextFormField(  style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                                      decoration: TextInputDecoration(
                                          'الرايش الرأسي',
                                          controller.iconPadding),
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        if (value!.isNotEmpty) {
                                          controller
                                              .setHorizontalAdditionalArea =
                                              double.parse(value);
                                        }
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'يجب ادخال العرض';
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    defaultButton(
                                        function: () {
                                          controller.calculateArea();
                                        },
                                        width: width * 0.6,
                                        height: height * 0.06,
                                        text: 'حساب المساحة'),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    controller.area == null
                                        ? SizedBox()
                                        : Container(
                                      width: width * .40,
                                      height: width * .3,
                                      decoration: myDecoration(),
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text("مساحة الكرتونة",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: ScreenUtil()
                                                        .setSp(18))),
                                            Text(
                                              controller.area == null
                                                  ? ""
                                                  : '${controller.area
                                                  .toStringAsFixed(
                                                  3)} م\u{00B2}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                  ScreenUtil().setSp(20)),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    controller.area == null
                                        ? SizedBox()
                                        : Form(
                                      key: controller.formKey2,
                                      child: Column(
                                        children: [
                                          // TextFormField(
                                          //
                                          //   maxLength: 2,
                                          //   decoration: TextInputDecoration(
                                          //       'عدد الخامات',
                                          //      null),
                                          //   keyboardType:
                                          //       TextInputType.number,
                                          //   onChanged: (value) {
                                          //     if (value.isNotEmpty) {
                                          //       controller
                                          //               .setMaterialsCount =
                                          //           int.parse(value);
                                          //       controller
                                          //           .insertMaterials();
                                          //     } else if (value.isEmpty) {
                                          //       controller
                                          //           .setMaterialsCount = 0;
                                          //       controller
                                          //           .insertMaterials();
                                          //     }
                                          //   },
                                          //   validator: (value) {
                                          //     if (value!.isEmpty) {
                                          //       return 'يجب ادخال عدد الخامات';
                                          //     }
                                          //   },
                                          // ),
                                          // SizedBox(
                                          //   height: height * 0.03,
                                          //   ),
                                          SingleChildScrollView(
                                            child: SingleChildScrollView(
                                              scrollDirection:
                                              Axis.horizontal,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  DataTable(
                                                    showCheckboxColumn: false,
                                                    dividerThickness: 1,
                                                    dataRowHeight:
                                                    height * 0.07,
                                                    headingRowHeight:
                                                    height * 0.04,
                                                    columnSpacing:
                                                    width * 0.06,
                                                    headingRowColor:
                                                    MaterialStateColor
                                                        .resolveWith(
                                                            (states) =>
                                                        Colors
                                                            .orangeAccent
),
                                                    columns: [
                                                      DataColumn(
                                                          label: Text(
                                                            'الاسم',
                                                            style:
                                                            rowItemTextStyle(),
                                                          )),
                                                      DataColumn(
                                                          label: Text(
                                                            'الوزن',
                                                            style:
                                                            rowItemTextStyle(),
                                                          )),
                                                      DataColumn(
                                                          label: Text(
                                                            'السعر',
                                                            style:
                                                            rowItemTextStyle(),
                                                          )),
                                                      DataColumn(
                                                          label: Text(
                                                            'المعامل',
                                                            style:
                                                            rowItemTextStyle(),
                                                          )),
                                                      DataColumn(
                                                          label: Text('')),
                                                    ],
                                                    rows: List<
                                                        DataRow>.generate(
                                                        controller
                                                            .selectedMaterials
                                                            .length,
                                                            (index) =>
                                                            DataRow(
                                                                color: MaterialStateProperty
                                                                    .resolveWith<
                                                                    Color>((Set<
                                                                    MaterialState>
                                                                states) {
                                                                  // Even rows will have a grey color.
                                                                  if (index %
                                                                      2 ==
                                                                      0)
                                                                    return Colors
                                                                        .grey
                                                                        .shade50;
                                                                  return Colors
                                                                      .grey
                                                                      .shade300; // Use default value for other states and odd rows.
                                                                }),
                                                                cells: [
                                                                  DataCell(Text(
                                                                      controller
                                                                          .selectedMaterials[
                                                                      index]
                                                                          .name
                                                                          .toString(),
                                                                      style:
                                                                      rowItemElementTextStyle())),
                                                                  DataCell(Text(
                                                                      controller
                                                                          .selectedMaterials[
                                                                      index]
                                                                          .weight
                                                                          .toString(),
                                                                      style:
                                                                      rowItemElementTextStyle())),
                                                                  DataCell(Text(
                                                                      controller
                                                                          .selectedMaterials[
                                                                      index]
                                                                          .price
                                                                          .toString(),
                                                                      style:
                                                                      rowItemElementTextStyle())),
                                                                  DataCell(
                                                                      TextFormField(                                        style: TextStyle(fontSize: ScreenUtil().setSp(18)),


                                                                        validator:
                                                                            (
                                                                            value) {
                                                                          if (value!
                                                                              .isEmpty) {
                                                                            return 'المعامل';
                                                                          }
                                                                        },
                                                                        controller: controller
                                                                            .selectedMaterials[index]
                                                                            .factorController,
                                                                        onTap: () =>
                                                                        controller
                                                                            .selectedMaterials[
                                                                        index]
                                                                            .factorController
                                                                            .selection =
                                                                            TextSelection(
                                                                                baseOffset: 0,
                                                                                extentOffset: controller
                                                                                    .selectedMaterials[
                                                                                index]
                                                                                    .factorController
                                                                                    .value
                                                                                    .text
                                                                                    .length),
                                                                        // initialValue: controller
                                                                        //     .selectedMaterials[
                                                                        //         index]
                                                                        //     .factor
                                                                        //     .toString(),
                                                                        keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                        onChanged:
                                                                            (
                                                                            value) {
                                                                          controller
                                                                              .selectedMaterials[index]
                                                                              .factor =
                                                                              double
                                                                                  .parse(
                                                                                  value);
                                                                        },
                                                                      )),
                                                                  DataCell(
                                                                    Icon(
                                                                      Icons
                                                                          .delete,
                                                                      size: ScreenUtil()
                                                                          .setWidth(
                                                                          25),
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                    onTap:
                                                                        () {
                                                                      controller
                                                                          .selectedMaterials
                                                                          .removeAt(
                                                                          index);
                                                                      controller
                                                                          .update();
                                                                    },
                                                                  ),
                                                                ])),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            height: height * 0.03,
                                          ),
                                          controller.selectedMaterials
                                              .length ==
                                              0
                                              ? SizedBox()
                                              : ConstrainedBox(
                                            constraints: BoxConstraints(
                                                minWidth: width * 0.6,
                                                maxWidth: width * 0.6,
                                                minHeight:
                                                height * 0.06),
                                            child: ElevatedButton(
                                              onPressed: () =>
                                                  controller
                                                      .calculateTotalCostOfMaterials(),
                                              child: Text(
                                                'حساب التكلفة',
                                                style: new TextStyle(
                                                    fontSize:
                                                    ScreenUtil()
                                                        .setSp(25)),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                  Colors.orangeAccent
,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          0)))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.03,
                                          ),
                                          controller.totalCostOfMaterials == 0
                                              ? SizedBox()
                                              : Container(
                                            width: width * .40,
                                            height: width * .3,
                                            decoration: myDecoration(),
                                            child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text("تكلفة الخامات",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          color: Colors
                                                              .black,
                                                          fontSize:
                                                          ScreenUtil()
                                                              .setSp(
                                                              18))),
                                                  Text(
                                                    '${controller
                                                        .totalCostOfMaterials
                                                        .toStringAsFixed(
                                                        3)} جنيه',
                                                    textAlign: TextAlign
                                                        .center,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontSize:
                                                        ScreenUtil()
                                                            .setSp(
                                                            20)),
                                                  ),
                                                ]),
                                          ),
                                          SizedBox(
                                            height: height * 0.03,
                                          ),
                                        ],
                                      ),
                                    ),
                                    controller.totalCostOfMaterials == 0
                                        ? SizedBox()
                                        : Form(
                                        key: controller.formKey3,
                                        child: Column(
                                          children: [
                                            Text(
                                              'المصروفات بالجنيه',
                                              style: titleTextStyle(),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            TextFormField(  style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                                              controller: controller.printingController,
                                                onTap: () =>
                                                controller
                                               .printingController
                                                    .selection =
                                                    TextSelection(
                                                        baseOffset: 0,
                                                        extentOffset:   controller
                                                            .printingController
                                                            .value
                                                            .text
                                                            .length),
                                              decoration: TextInputDecoration(
                                                'الطباعة', null),
                                              keyboardType:
                                              TextInputType.number,
                                              onSaved: (value) {
                                                if (value!.isNotEmpty) {
                                                  controller.setPrinting =
                                                      double.parse(value);
                                                }
                                              },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'يجب ادخال مصروفات الطباعة';
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            TextFormField(  style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                                              controller: controller.cellophaneController,
                                              onTap: () =>
                                              controller
                                                  .cellophaneController
                                                  .selection =
                                                  TextSelection(
                                                      baseOffset: 0,
                                                      extentOffset:   controller
                                                          .cellophaneController
                                                          .value
                                                          .text
                                                          .length),                                              decoration: TextInputDecoration(
                                                  'سلوفان', null),
                                              keyboardType:
                                              TextInputType.number,
                                              onSaved: (value) {
                                                if (value!.isNotEmpty) {
                                                  controller.setCellophane =
                                                      double.parse(value);
                                                }
                                              },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'يجب ادخال الطول';
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            TextFormField(
                                              controller: controller.pinsController,
                                              onTap: () =>
                                              controller
                                                  .pinsController
                                                  .selection =
                                                  TextSelection(
                                                      baseOffset: 0,
                                                      extentOffset:   controller
                                                          .pinsController
                                                          .value
                                                          .text
                                                          .length),                                              decoration: TextInputDecoration(
                                                  'الدبابيس', null),
                                              keyboardType:
                                              TextInputType.number,
                                              onSaved: (value) {
                                                if (value!.isNotEmpty) {
                                                  controller.setLength =
                                                      double.parse(value);
                                                }
                                              },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'يجب ادخال مصروفات الدبابيس';
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            TextFormField(
                                              controller: controller.silicateController,
                                              onTap: () =>
                                              controller
                                                  .silicateController
                                                  .selection =
                                                  TextSelection(
                                                      baseOffset: 0,
                                                      extentOffset:   controller
                                                          .silicateController
                                                          .value
                                                          .text
                                                          .length),                                              decoration: TextInputDecoration(
                                                  'السليكات', null),
                                              keyboardType:
                                              TextInputType.number,
                                              onSaved: (value) {
                                                if (value!.isNotEmpty) {
                                                  controller.setSilicate =
                                                      double.parse(value);
                                                }
                                              },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'يجب ادخال مصروفات السليكات';
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            TextFormField(
                                              controller: controller.otherController,
                                              onTap: () =>
                                              controller
                                                  .otherController
                                                  .selection =
                                                  TextSelection(
                                                      baseOffset: 0,
                                                      extentOffset:   controller
                                                          .otherController
                                                          .value
                                                          .text
                                                          .length),                                              decoration: TextInputDecoration(
                                                  'اخرى', null),
                                              keyboardType:
                                              TextInputType.number,
                                              onSaved: (value) {
                                                if (value!.isNotEmpty) {
                                                  controller.setOther =
                                                      double.parse(value);
                                                }
                                              },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'يجب ادخال الطول';
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            TextFormField(
                                              controller: controller.runFactorController,
                                              onTap: () =>
                                              controller
                                                  .runFactorController
                                                  .selection =
                                                  TextSelection(
                                                      baseOffset: 0,
                                                      extentOffset:   controller
                                                          .runFactorController
                                                          .value
                                                          .text
                                                          .length),                                              decoration: TextInputDecoration(
                                                  'معامل التشغيل', null),
                                              keyboardType:
                                              TextInputType.number,
                                              onSaved: (value) {
                                                if (value!.isNotEmpty) {
                                                  controller.setRunFactor =
                                                      double.parse(value);
                                                }
                                              },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'يجب ادخال الطول';
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  minWidth: width * 0.6,
                                                  maxWidth: width * 0.6,
                                                  minHeight: height * 0.06),
                                              child: ElevatedButton(
                                                onPressed: () =>
                                                    controller
                                                        .calculateEndTotalCost(),
                                                child: Text(
                                                  'حساب التكلفة النهائية',
                                                  style: new TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(22)),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.orangeAccent
,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            controller.totalEndCost == 0
                                                ? SizedBox()
                                                : Container(
                                              width: width * .40,
                                              height: width * .3,
                                              decoration: myDecoration(),
                                              child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                        "التكلفة النهائية",
                                                        textAlign:
                                                        TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            color: Colors
                                                                .black,
                                                            fontSize:
                                                            ScreenUtil()
                                                                .setSp(
                                                                18))),
                                                    Text(
                                                      controller.area ==
                                                          null
                                                          ? ""
                                                          : '${controller
                                                          .totalEndCost
                                                          .toStringAsFixed(
                                                          3)} جنيه',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .black,
                                                          fontSize:
                                                          ScreenUtil()
                                                              .setSp(
                                                              20)),
                                                    ),
                                                  ]),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      floatingActionButton: controller.area == null
                          ? SizedBox()
                          : Container(
                        // width: ScreenUtil().setWidth(30),
                        // height: ScreenUtil().setHeight(30),
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent
,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,                            //  size:ScreenUtil().setWidth(width*0.1),

                            color: Colors.white,
                            ),
                            onPressed: () =>
                                Get.to(InsertMaterialCorrugatedView()),
                          )),
                    );
                  },
                )));
  }
}
// ListView.separated(
// physics:
// NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return Container(
// padding:
// EdgeInsets.symmetric(
// horizontal: 20,
// vertical: 10),
// decoration:
// homeBoxDecoration(
// Colors.white),
// child: Column(
// children: [
// Text(
// 'الخامه ${index + 1}',
// style:
// titleTextStyle(),
// ),
// TextFormField(
//
// decoration: TextInputDecoration(
// 'وزن الخامه بالجرام',
// null),
// keyboardType:
// TextInputType
//     .number,
// onSaved: (value) {
// if (value!.isNotEmpty) {
// controller
//     .materials[
// index]
//     .weight =
// double.parse(
// value);
//
// }
// },
// validator: (value) {
// if (value!
//     .isEmpty) {
// return 'يجب ادخال وزن الخامه بالجرام';
// }
// },
// ),
// SizedBox(
// height: height * 0.03,
// ),
// TextFormField(
// decoration:
// TextInputDecoration(
// 'سعر الخامه',
// null),
// keyboardType:
// TextInputType
//     .number,
// onSaved: (value) {
// if (value!.isNotEmpty) {
// controller
//     .materials[
// index]
//     .price =
// double.parse(
// value);
// }
// },
// validator: (value) {
// if (value!
//     .isEmpty) {
// return 'يجب ادخال سعر الخامه';
// }
// },
// ),
// SizedBox(
// height: height * 0.03,
// ),
// TextFormField(
//
// decoration:
// TextInputDecoration(
// 'المعامل',
// null),
// keyboardType:
// TextInputType
//     .number,
// onSaved: (value) {
// if (value!.isNotEmpty) {
// controller
//     .materials[
// index]
//     .factor =
// double.parse(
// value);}
// },
// validator: (value) {
// if (value!
//     .isEmpty) {
// return 'يجب ادخال المعامل';
// }
// },
// ),
// ],
// ),
// );
// },
// itemCount:
// controller.materials.length,
// separatorBuilder:
// (BuildContext context,
//     int index) {
// return SizedBox(
// height: height * 0.03,
// );
// },
// )
