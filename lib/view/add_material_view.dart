import 'dart:io';

import 'package:alsafwa/componants.dart';
import 'package:alsafwa/view_model/add_material_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AddMaterialView extends GetWidget<AddMaterialViewModel> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<AddMaterialViewModel>(
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
                      child: Padding(
                    padding: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: [
                              Text('اضافة خامه جديده',style: homeTextStyle(color: Colors.black54),),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'جيب ادخال الاسم';
                                  }
                                },
                                decoration: TextInputDecoration('الاسم', null),
                                onChanged: (value) {
                                  controller.setMaterialName = value;
                                },
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'جيب ادخال السعر';
                                  }
                                },
                                decoration: TextInputDecoration('السعر بالجنيه', null),
                                onChanged: (value) {
                                  controller.setMaterialPrice =
                                      double.parse(value);
                                },
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'جيب ادخال الوزن';
                                  }
                                },
                                decoration: TextInputDecoration(' الوزن بالجرام', null),
                                onChanged: (value) {
                                  controller.setMaterialWeight =
                                      double.parse(value);
                                },
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              defaultButton(
                                background: Colors.orangeAccent,
                                  function: () {
                                    controller.insertMaterial();
                                  },
                                  width: width * 0.9,
                                  height: height * 0.06)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
                );
              },
            )));
  }
}
