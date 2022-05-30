import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:barbershop_app/api_keys/api_constants.dart';
import 'package:barbershop_app/api_keys/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  createAlbum(String user, String pass) async {
    var Url = Uri.parse(ApiConstants.urlBase + ApiConstants.urlLogin);
    var jsonData;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      'username': user,
      'password': pass
    };

    final response = await http.post(
      Url,
      headers: <String, String>{
        'Content-Type': 'application/Json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if(response.statusCode == 200){
      print(response.headers.entries);
    }
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
