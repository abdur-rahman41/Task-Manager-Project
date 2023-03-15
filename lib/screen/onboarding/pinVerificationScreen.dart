
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager1/api/apiClient.dart';
import 'package:taskmanager1/utility/utility.dart';

import '../../style/style.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
  Map<String,String>FormValues={"otp":""};
  bool Loading = false;
  InputOnchange(MapKey,Textvalue)
  {
    setState(() {
        FormValues.update(MapKey, (value) => Textvalue);
    });
  }
  FormOnSubmit()async
  {
    if(FormValues['otp']!.length==null)
      {
        ErrorToast("Pin Required");
      }
      else
        {
          setState(() {
            Loading=true;
          });
          String? emailAddress = await ReadUserData('EmailVerification');
          bool res=await  VerifyOTpRequest(emailAddress,['otp']);

          if(res==true)
            {
              setState(() {
                  Navigator.pushNamed(context,'/setPassword');
              });
            }
          else
            {
              setState(() {
                 Loading =false;
              });
            }

        }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Stack(
          children: [
            ScreenBackground(context),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pin Verification",style: Head1Text(Colors.grey),),
                  SizedBox(height: 1,),
                  Text("A 6 digit pin has been send in your mobile phone",style:Head6Text(Colors.grey) ,),
                  SizedBox(height: 20,),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.blue,
                      inactiveFillColor: Colors.white
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.white,
                    enableActiveFill: true,

                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                          InputOnchange(FormValues['otp'], value);
                      setState(() {

                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    }, appContext: context,
                  ),
                  SizedBox(height: 20,),

                  Container(child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed:(){
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild("Verify")
                  ))


                ],
              ),
            )
          ],
        )
    );
  }
}
