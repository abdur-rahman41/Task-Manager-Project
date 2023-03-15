import 'package:flutter/material.dart';
import 'package:taskmanager1/api/apiClient.dart';

import '../../style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({Key? key}) : super(key: key);

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  Map<String,String>FormValues={"email":"", "firstName":"", "lastName":"", "mobile":"",  "password":"","photo":"","cpassword":""};
  bool Loading = false;
  InputOnChange(MapKey,Textvalue)
  {
    setState(() {
        FormValues.update(MapKey, (value) => Textvalue);
    });
  }
  FormOnSubmit()async
  {
    if(FormValues['email']!.length==0)
    {
      ErrorToast('Email is required!');
    }
   else if(FormValues['firstName']!.length==0)
    {
      ErrorToast('First Name is required');
    }
    else if(FormValues['lastName']!.length==0)
    {
      ErrorToast('Last Name is required');
    }
    else if(FormValues['mobile']!.length==0)
    {
      ErrorToast('Mobile number is required');
    }
    else if(FormValues['password']!.length==0)
    {
      ErrorToast('Password is required');
    }
    else if(FormValues['password']!=FormValues['cpassword'])
    {
      ErrorToast('Confirm password should be same!');
    }
    else
      {
        setState(() {
            Loading=true;
        });
        bool res = await RegistrationRequest(FormValues);
        if(res==true)
          {
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
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
                child: Loading?(Center( child: CircularProgressIndicator())):(SingleChildScrollView(

                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Join With Us",style: Head1Text(Colors.grey),),
                      SizedBox(height: 20,),
                      //Text("Learn With Abdur Rahman",style:HeadText6(Colors.grey) ,),
                      TextFormField(
                        decoration: AppInputDecoration("Email Address"),
                        onChanged: (Textvalue){
                              InputOnChange('email',Textvalue);
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: AppInputDecoration("First Name"),
                        onChanged: (Textvalue){
                          InputOnChange('firstName',Textvalue);
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: AppInputDecoration("Last Name"),
                        onChanged: (Textvalue){
                          InputOnChange('lastName',Textvalue);
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: AppInputDecoration("Mobile"),
                        onChanged: (Textvalue){
                          InputOnChange('mobile',Textvalue);
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: AppInputDecoration("Password"),
                        onChanged: (Textvalue){
                          InputOnChange('password',Textvalue);
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: AppInputDecoration("Confirm Password"),
                        onChanged: (Textvalue){
                          InputOnChange('cpassword',Textvalue);
                        },
                      ),
                      SizedBox(height: 20,),

                      Container(child: ElevatedButton(
                          style: AppButtonStyle(),
                          onPressed:(){
                            FormOnSubmit();
                          },
                          child: SuccessButtonChild("Registration")
                      ))


                    ],
                  ),
                )),



            )
          ],
        )

    );
  }
}
