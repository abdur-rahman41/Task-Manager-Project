import 'package:flutter/material.dart';
import 'package:taskmanager1/api/apiClient.dart';
import 'package:taskmanager1/utility/utility.dart';

import '../../style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({Key? key}) : super(key: key);

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  Map<String,String>FormValues={"email":"","otp":"","password":"","cpassword":""};
  bool Loading = false;

  @override
  void initState() {
    CallStoreData();
    // TODO: implement initState
    super.initState();
  }

  CallStoreData()async
  {
       String? Email =   await ReadUserData('EmailVerification');
       String?  OTP = await ReadUserData('OTPVerification');
       InputOnChange('email',Email);
       InputOnChange('otp', OTP);
  }

  InputOnChange(MapKey,Textvalue)
  {
    setState(() {
       FormValues.update(MapKey, (value) => Textvalue);
    });

  }
  FormOnSubmit()async
  {
    if(FormValues['password']!.length==0)
    {
        ErrorToast('email required');
    }
    else
      {
        setState(() {
            Loading=true;
        });
        bool res = await SetPasswordRequest(FormValues);
        if(res==true)
          {
            Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
          }
        else
          {
            setState(() {
                Loading = false;
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
                  Text("Set Password",style: Head1Text(Colors.grey),),
                  SizedBox(height: 1,),
                  Text("Minimum length password 8 charcter with letter and number combination",style:Head6Text(Colors.grey) ,),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: AppInputDecoration("Password"),
                    onChanged: (Textvalue)
                    {
                      InputOnChange('password', Textvalue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: AppInputDecoration("Confirm Password"),
                    onChanged: (Textvalue)
                    {
                      InputOnChange('cpassword', Textvalue);
                    },
                  ),
                  SizedBox(height: 20,),

                  Container(child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed:(){
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild("Confirm")
                  ))


                ],
              ),
            )
          ],
        )
    );
  }
}
