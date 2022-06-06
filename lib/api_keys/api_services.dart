import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:barbershop_app/api_keys/api_constants.dart';
import 'package:barbershop_app/api_keys/user_model.dart';
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
    if(response.statusCode == 200 || response.statusCode == 201){
      await prefs.setString('Access_token', "${jsonDecode(response.body)['access_token']}");
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

class ApiService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Welcome>?> getUsers() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      if (response.statusCode == 201) {
        List<Welcome> _model = welcomeFromJson(response.body);
        return _model;
      }
    } catch (event) {
      log(event.toString());
    }
  }
}
