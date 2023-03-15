


   import 'package:shared_preferences/shared_preferences.dart';

Future<void> WriteUserData(UserData)async{

     final prefs = await SharedPreferences.getInstance();
     await prefs.setString('token', UserData['token']);
     await prefs.setString('action', UserData['data']['email']);
     await prefs.setString('firstName', UserData['data']['firstName']);
     await prefs.setString('lastName', UserData['data']['lastName']);
     await prefs.setString('mobile', UserData['data']['mobile']);
     await prefs.setString('photo', UserData['data']['photo']);


    }

  Future<void>  WriteEmailVerification(Email)async
    {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('EmailVerification', Email);


    }

      Future<void>  WriteOtpVerification(OTP)async
        {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('OTPVerification', OTP);


        }






  Future<String?>  ReadUserData(Key)async{
    final prefs = await SharedPreferences.getInstance();
    final String? action = await prefs.getString(Key);
      return action;
    }