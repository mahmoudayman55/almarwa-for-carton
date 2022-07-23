import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BoxDecoration homeBoxDecoration(Color boxColor){
  return  BoxDecoration(
      boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 6,spreadRadius: 1)],
      borderRadius: BorderRadius.circular(20),
      color: boxColor);
}


TextInputDecoration(String label,Padding? iconPadding){
  

  return  InputDecoration(

      suffixIcon: iconPadding
// Padding(padding: EdgeInsets.all(3),child: Image.asset('assets/cm.png'),),
     , labelText: label,

      alignLabelWithHint: true,
      labelStyle: new TextStyle(
          fontFamily:'Tajawal',
          fontSize: ScreenUtil().setSp(18),
          fontWeight: FontWeight.bold),
      hintTextDirection: TextDirection.rtl,
      border: OutlineInputBorder());


}


Widget defaultField(bool end,
    var node, {Padding iconPadding=const Padding(padding: EdgeInsets.all(0),),

      String emptyErrorMessage = 'empty',
      @required String title = '',
    }) {

  return TextFormField(
    onEditingComplete: () => end? node.unfocus(): node.nextFocus(),
    textInputAction: !end? TextInputAction.next:TextInputAction.none,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return emptyErrorMessage;
      }
    },
    keyboardType: TextInputType.number,
    style: TextStyle(fontSize: ScreenUtil().setSp(12)),
    decoration: InputDecoration(

      border:OutlineInputBorder(),
      suffixIcon: iconPadding,

      labelText: title,
      labelStyle: TextStyle(

          fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
    ),
    textDirection: TextDirection.rtl,
    textAlign: TextAlign.center,
  );
}


TextStyle homeTextStyle(
    {Color color = Colors.limeAccent, double fontSize=30}){
  return TextStyle(color: color,fontSize: ScreenUtil().setSp(fontSize),fontWeight: FontWeight.bold,fontFamily: 'Tajawal',);
}

TextStyle titleTextStyle(
    {Color color = Colors.black, double fontSize=18}){
  return TextStyle(color: color,fontSize: ScreenUtil().setSp(fontSize),fontWeight: FontWeight.bold,fontFamily: 'Tajawal',);
}

Widget defaultButton({
  double width = double.infinity,
  double height = double.infinity,
  required Function function,
  Color background = Colors.orangeAccent,
  String text = 'تأكيد',
  double fontSize = 25,
  double radius = 0,
})

{
  return ConstrainedBox(
    constraints: BoxConstraints(minWidth: width, maxWidth: width
        ,minHeight:height ,maxHeight:height ),
    child: ElevatedButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: new TextStyle(
            fontSize: ScreenUtil().setSp(fontSize)),
      ),
      style: ElevatedButton.styleFrom(
          primary: background,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)))),
    ),
  );



}


TextFormField defaultTextForm(String label,Padding icon , void function,){
  return  TextFormField(
    decoration: TextInputDecoration(
        label, icon),
    keyboardType: TextInputType.number,
    onChanged: (value){function;},
    validator: (value){
      if(value!.isEmpty){
        return 'يجب ادخال الطول';
      }
    },
  );
}




BoxDecoration myDecoration(){
  return  BoxDecoration(
      boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 6,spreadRadius: 1)],
      borderRadius: BorderRadius.circular(20),
      color: Colors.white);
}
TextStyle rowItemElementTextStyle()=>TextStyle(fontSize: ScreenUtil().setSp(20),);

TextStyle rowItemTextStyle()=>TextStyle(fontSize: ScreenUtil().setSp(20),color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Tajawal');

Container searchBar({required double width,required double height,required double radius,required TextFormField formField}){
  return
    Container(
    alignment: Alignment.center,
    width: width,
    height: height,
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.blueGrey.shade400),
    child:formField ,
  );

}


InputDecoration searchFormFieldDecoration(){
  return InputDecoration(
        hintStyle: TextStyle(

          fontSize: ScreenUtil().setSp(20),
            fontFamily: 'Tajawal',
            color: Colors.white,
            fontWeight: FontWeight.bold),
        hintText: "بحث",
        
        prefixIcon: Icon(

          Icons.search,
          color: Colors.white,
        ),
        border: InputBorder.none);

}