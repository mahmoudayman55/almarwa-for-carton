

import 'package:alsafwa/helper/database_helper.dart';
import 'package:alsafwa/models/material_model.dart';
import 'package:alsafwa/view_model/materials_report_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CorrugatedCartonViewModel extends  GetxController{

  ///key
var _formKey =GlobalKey<FormState>();

  get formKey => _formKey;

  set setFormKey(value) {
    _formKey = value;
  }

  ///end key


///Icon padding
Padding iconPadding = Padding(
    padding: EdgeInsets.all(5),
    child: Image.asset(
      'assets/cm.png',
      width: .2,
      height: .2,
      fit: BoxFit.fill,
    ));



  ///end Icon padding

            /// variables
double? _length,_width,_verticalAdditionalArea,_horizontalAdditionalArea,_height,_area;
  get area => _area;

  set setArea(value) {
    _area = value;
  }

  get height => _height;

  set setHeight(value) {
    _height = value;
  }

  get verticalAdditionalArea => _verticalAdditionalArea;

  set setVerticalAdditionalArea(value) {
    _verticalAdditionalArea = value;
  }

  get width => _width;

  set setWidth(value) {
    _width = value;
  }

double? get length => _length;

set setLength(double value) {
  _length = value;
}

  get horizontalAdditionalArea => _horizontalAdditionalArea;

  set setHorizontalAdditionalArea(value) {
    _horizontalAdditionalArea = value;
  }
  ///end Variables


///functions
//calculate area
calculateArea(){
    _formKey.currentState!.save();
    if(_formKey.currentState!.validate()) {
      setArea = (2 * (length! / 100) + (width / 100)) +
          (verticalAdditionalArea / 100) * (height / 100) +
          (width / 100) +
          (horizontalAdditionalArea / 100);
      update();
    }
    update();
  }

////////////////////////////////////////////////////////////// Area


///variables
int _materialsCount=0;
  double _totalCostOfMaterials=0;

  double get totalCostOfMaterials => _totalCostOfMaterials;

  set serTotalCostOfMaterials(double value) {
    _totalCostOfMaterials = value;
  }

  int get materialsCount => _materialsCount;

  // set setMaterialsCount(int value) {
  //   _materialsCount = value;
  //   insertMaterials();
  // }

  var _formKey2=GlobalKey<FormState>();

  get formKey2 => _formKey2;

  set setFormKey2(value) {
    _formKey2 = value;
  }

///variables

List<MaterialModel> materials=[];
List<MaterialModel> selectedMaterials=[];

insertMaterials(MaterialModel materialModel){
    selectedMaterials.add(materialModel);
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
calculateTotalCostOfMaterials(){
  serTotalCostOfMaterials=0;
  if(selectedMaterials.length==0){
    return;
  }

_formKey2.currentState!.save();
if(_formKey2.currentState!.validate()){
  selectedMaterials.forEach((material) {
    if(material.weight!=null&&material.price!=null&&material.factor!=null)  {
      _totalCostOfMaterials +=
          (double.parse(material.weight.toString())/ 1000) *
             double.parse( material.price.toString()) *
              double.parse( material.factor.toString()) *
              area;  }});
    }
update();
}


////////////////////////////////////////////////////////materials

///variables
double  _printing   =0,
         _cellophane=0 ,
         _pins      =0  ,
         _silicate  =0    ,
         _other     =0    ,
         _totalEndCost     =0    ,
         _runFactor =1    ;
var printingController=TextEditingController(text: '0');
var cellophaneController=TextEditingController(text: '0');
var pinsController=TextEditingController(text: '0');
var silicateController=TextEditingController(text: '0');
var otherController=TextEditingController(text: '0');
var runFactorController=TextEditingController(text: '1');
  get totalEndCost => _totalEndCost;

  set setTotalEndCost(value) {
    _totalEndCost = value;
  }

  double get printing => _printing;

  set setPrinting(double value) {
    _printing = value;
  }

  get cellophane => _cellophane;

  set setCellophane(value) {
    _cellophane = value;
  }

  get pins => _pins;

  set setPins(value) {
    _pins = value;
  }

  get silicate => _silicate;

  set setSilicate(value) {
    _silicate = value;
  }

  get other => _other;

  set setOther(value) {
    _other = value;
  }

  get runFactor => _runFactor;

  set setRunFactor(value) {
    _runFactor = value;
  }

  var _formKey3=GlobalKey<FormState>();

  get formKey3 => _formKey3;

  set formKey3(value) {
    _formKey3 = value;
  }

  calculateEndTotalCost()
  {
    _formKey3.currentState!.save();
    if(_formKey3.currentState!.validate()) {
      setTotalEndCost = (totalCostOfMaterials +
              printing +
              cellophane +
              pins +
              silicate +
              other) *
          runFactor;
      update();
    }
  }

  @override
  void onInit() {
    getMaterials('');
  }
}