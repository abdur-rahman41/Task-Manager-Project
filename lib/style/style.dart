



import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


const colorRed = Color.fromRGBO(255, 0, 0, 1);
const coloGreen = Color.fromRGBO(0, 255, 0, 1);

TextStyle Head1Text (textcolor){

  return TextStyle(
      color: textcolor,
      fontSize: 28,
      fontFamily: 'poppins',
    fontWeight: FontWeight.w600



  );
}



TextStyle Head6Text (textcolor) {
  return TextStyle(
      color: textcolor,
      fontSize: 16,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400


  );
}


TextStyle Head7Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 13,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}

InputDecoration AppInputDecoration (label)
{
  return InputDecoration(

    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green,width: 1)
    ),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none
    ),
    contentPadding: EdgeInsets.fromLTRB(20,10,10, 20,),
   // enabledBorder:OutlineInputBorder(
       // borderSide: BorderSide(color: Colors.green,width: 1)
   // ) ,

    hintText: label,
  );
}

SvgPicture ScreenBackground(context)
{
    return SvgPicture.asset(
      'assets/images/background.svg',
      alignment:Alignment.center,
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      fit:BoxFit.cover

    );

}


ButtonStyle AppButtonStyle()
{
    return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
    );
}

TextStyle ButtonTextStyle()
{
  return TextStyle(
    fontSize: 14,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w600,
  );
}





Ink SuccessButtonChild(ButtonText)
{
  return Ink(
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(6),

    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText,style:TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15

      )),
    ),
  );
}


void ErrorToast(msg)
{
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

void SuccessToast(msg)
{
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


PinTheme AppOtpStyle (){
  return PinTheme(
    inactiveColor: Colors.cyan
  );
}