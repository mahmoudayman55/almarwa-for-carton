import 'package:alsafwa/constants/database_constants.dart';
import 'package:flutter/cupertino.dart';

class MaterialModel{
double? price,weight,factor=1;
String? name;
int?id;
var factorController=TextEditingController();
MaterialModel({required this.name,required this.price,required this.weight, this.factor=1,required this.factorController});


toJson(){
return{

materialNameColumn:name,
materialPriceColumn:price,
materialWeightColumn:weight,

};
  }


MaterialModel.fromJson(Map<String,dynamic>map)
{
name=map[materialNameColumn];
price=map[materialPriceColumn];
weight=map[materialWeightColumn];
id=map[materialIdColumn];
}

}