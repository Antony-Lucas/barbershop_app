import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:barbershop_app/api_keys/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  Future<bool> autoLogin(login, pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(ApiConstants.urlBase + ApiConstants.urlLogin);
    var response = await http.post(
      url,
      body: {
        'username': login,
        'password': pass,
      }
    );
    print(response.statusCode);
    if(response.statusCode == 200 || response.statusCode == 201){
      await prefs.setString('access_token', "${jsonDecode(response.body)['access_token']}");
      print(jsonDecode(response.body)['access_token']);
      return true;
    }else{
      print(jsonDecode(response.body));
      return false;
    }
  }
}

class ApiLogout {
  Future<bool> logout() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    return true;
  }
}