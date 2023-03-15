import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskmanager1/utility/utility.dart';

import '../style/style.dart';


var BaseURL = "https://task.teamrabbil.com/api/v1";
var RequestHeader = {"Content-Type":"applicatio/json"};

Future<bool> LoginRequest(FormValues) async{
  var URL=Uri.parse("${BaseURL}/login");
  var PostBody=json.encode(FormValues);
  var response= await http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    await WriteUserData(ResultBody);
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> RegistrationRequest(FormValues) async{
  var URL=Uri.parse("${BaseURL}/registration");
  var PostBody=json.encode(FormValues);
  var response= await  http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}


Future<bool> VerifyEmailRequest(Email) async{
  var URL=Uri.parse("${BaseURL}/RecoverVerifyEmail/${Email}");
  var response= await http.get(URL,headers:RequestHeader);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    await WriteEmailVerification(Email);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> VerifyOTpRequest(Email,OTP)async {
  var URL = Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");

  var Response = await http.get(URL,headers: RequestHeader);

  var ResultCode = Response.statusCode;
  var ResultBody= json.decode(Response.body);
    await  WriteOtpVerification(OTP);
  if(ResultCode==200 && ResultBody['status']=='success')
  {
    WriteOtpVerification(OTP);
    SuccessToast('Request success');

    return true;
  }
  else
  {
    ErrorToast("Request fail ! Try again");
    return false;
  }

}

Future<bool> SetPasswordRequest(FormValues)async {
  var URL = Uri.parse("${BaseURL}/RecoverResetPass");
  var PostBody = json.encode(FormValues);
  var Response = await http.post(URL,headers: RequestHeader,body: PostBody);

  var ResultCode = Response.statusCode;
  var ResultBody= json.decode(Response.body);
  if(ResultCode==200 && ResultBody['status']=='success')
  {
    SuccessToast('Request success');
    return true;
  }
  else
  {
    ErrorToast("Request fail ! Try again");
    return false;
  }

}


Future<List>TaskListRequest(Status)async
{
  var URL = Uri.parse("${BaseURL}/ListTaskByStatus/${Status}");
  
  String? token = await ReadUserData("token");
  var RequestHeaderWithToken = {"Content-Type":"application/json","token":'$token'};
        var response = await  http.get(URL,headers: RequestHeaderWithToken);
        var ResultCode = response.statusCode;
        var ResultBody = json.decode(response.body);

        if(ResultCode==200 && ResultBody['status']=='success')
          {
              SuccessToast("Requst Success");
              return ResultBody['data'];
          }
        else
          {
            ErrorToast("Request fail! Try again #");
            return [];
          }

}