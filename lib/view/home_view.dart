import 'dart:io';

import 'package:alsafwa/componants.dart';
import 'package:alsafwa/view/corrugated_carton_view.dart';
import 'package:alsafwa/view/materials_report_view.dart';
import 'package:alsafwa/view/sheet_carton_view.dart';
import 'package:alsafwa/view_model/add_material_view_model.dart';
import 'package:alsafwa/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'add_material_view.dart';

class HomeView extends GetWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
            width: screenWidth,
            height: screenHeight,
            child: LayoutBuilder(
              builder: (context, constrains) {
                double height = constrains.maxHeight;
                double width = constrains.maxWidth;
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  drawer: Drawer(
                    child: SafeArea(
                      child: Column(
                        children: [
                          ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.orangeAccent,fixedSize: Size(width, height*0.08)),onPressed: (){Get.to(MaterialsReportView());}, child:
                          Text('الخامات',style: homeTextStyle(color: Colors.white,fontSize: 26),textAlign: TextAlign.center,)),
                        //  defaultButton(function: (){Get.to(MaterialsReportView());},width: width*0.74,height: height*0.06,radius: 0,text: 'الخامات',background: Colors.grey),
                          Container(color: Colors.white,height: 1,),

                         // defaultButton(function: (){Get.to(AddMaterialView());},width: width*0.74,height: height*0.06,radius: 0,text: 'اضافة خامات',background: Colors.grey),
                         //  TextButton(onPressed: (){Get.to(AddMaterialView());}, child:
                         //  Text('اضافة خامه',style: homeTextStyle(color: Colors.black54),)),
                    ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.orangeAccent,fixedSize: Size(width, height*0.08)),onPressed: (){Get.to(AddMaterialView());}, child:
                    Text('اضافة خامة',style: homeTextStyle(color: Colors.white,fontSize: 26),textAlign: TextAlign.center,)),


                      ],
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        height: height,
                        padding: EdgeInsets.all(10),
                        child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(CorrugatedCartonView()),
                                child: Container(
                                  height: height * 0.45,
                                  width: width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/carton.png',
                                        width: width * 0.7,
                                        height: height * 0.3,
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      Text(
                                        'كرتونة مضلعة',
                                        style:
                                            homeTextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  decoration:
                                      homeBoxDecoration(Colors.blueGrey),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              GestureDetector(
                                onTap: () => Get.to(SheetCartonView()),
                                child: Container(
                                  decoration: homeBoxDecoration(Colors.cyan),
                                  height: height * 0.45,
                                  width: width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/cartonSheet.png',
                                          width: width * 0.7,
                                          height: height * 0.3),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      Text(
                                        'كرتونة شيت',
                                        style:
                                            homeTextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
