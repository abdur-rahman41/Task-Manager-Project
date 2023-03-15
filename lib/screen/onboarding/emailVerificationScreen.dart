import 'package:flutter/material.dart';
import 'package:taskmanager1/api/apiClient.dart';

import '../../style/style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  Map<String,String>FormValues={"email":""};
  bool Loading = false;
  InputOnChange(MapKey,Textvalue)
  {
     setState(() {
       FormValues.update(MapKey, (value) =>Textvalue);
     });
  }

  FormOnSubmit()async
  {
    if(FormValues['email']!.length==0)
      {
        ErrorToast('Email Required');
      }
    else
      {
        setState(() {
          Loading = true;
        });

        bool res = await VerifyEmailRequest(FormValues['email']);

        setState(() {
          if(res==true)
            {
              Navigator.pushNamed(context, '/pinVerification');
            }
            else
              {
                setState(() {
                   Loading = false;
                });
              }
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            ScreenBackground(context),
            Container(
              child: Loading?(Center(child:CircularProgressIndicator())):(SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Email Address",style: Head1Text(Colors.grey),),
                    SizedBox(height: 1,),
                    Text("A six digit verification pin will send to your email address",style:Head6Text(Colors.grey) ,),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: AppInputDecoration("Email Address"),
                      onChanged: (Textvalue){
                        InputOnChange('email', Textvalue);
                      },
                    ),
                    SizedBox(height: 20,),
                    Container(child: ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed:(){
                          FormOnSubmit();
                        },
                        child: SuccessButtonChild("Next")
                    ))


                  ],
                ),
              ))
            )
          ],
        )
    );
  }
}
