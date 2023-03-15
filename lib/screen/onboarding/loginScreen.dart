

import'package:flutter/material.dart';

import 'package:taskmanager1/api/apiClient.dart';

import '../../style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Map<String,String>FormValues={"email":"","password":""};
  bool loading =false;
  InputOnchange(MapKey,Textvalue)
  {
        setState(() {
          FormValues.update(MapKey,(value)=>Textvalue);
        });
  }
  FormOnSubmit()async
  {
      if(FormValues['email']!.length==0)
        {
                    ErrorToast('Email is required');
        }
      else if(FormValues['password']!.length==0)
      {
                ErrorToast('Password is required');
      }
      else
        {
            setState(() {
                  loading = true;
            });

         bool res = await  LoginRequest(FormValues);
         if(res==true)
           {
               Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
           }
         else
           {
             setState(() {
               loading = false;
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
                  alignment: Alignment.center,
                  child: loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Get Started With",style: Head1Text(Colors.grey),),
                        SizedBox(height: 1,),
                        Text("Learn With Abdur Rahman",style:Head6Text(Colors.grey) ,),
                        SizedBox(height: 20,),
                        TextFormField(
                          onChanged: (Textvalue)
                          {
                            InputOnchange("email", Textvalue);
                          },
                          decoration: AppInputDecoration("Email Address"),),
                        SizedBox(height: 20,),
                        TextFormField(
                          onChanged: (Textvalue)
                          {
                            InputOnchange("password", Textvalue);
                          },
                          decoration: AppInputDecoration("Password"),),
                        SizedBox(height: 20,),

                        Container(child: ElevatedButton(
                            style: AppButtonStyle(),
                            onPressed:(){ FormOnSubmit(); },
                            child: SuccessButtonChild("Login")
                        )),
                        SizedBox(height: 20,),
                        Container(

                            child:Column (
                                    children: [
                                      SizedBox(height: 20,),
                                      InkWell(
                                          onTap: (){
                                                Navigator.pushNamed(context, '/emailVerification');
                                          },
                                          child: Text('Forgot Password',style: Head6Text(Colors.blueGrey),),
                                      ),
                                      SizedBox(height: 15,),

                                      InkWell(
                                        onTap: (){
                                          Navigator.pushNamed(context, '/registration');
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                  Text("Don't have an account ?",style:Head7Text(Colors.blueGrey),),
                                                  Text("Sign Up",style: Head7Text(Colors.green),)
                                              ],
                                        )
                                      ),
                                    ],
                            ),

                        )



                      ],
                    ),
                  )
                  ),
                  )

          ],
        )
    );
  }
}
