import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:barbershop_app/api_keys/api_constants.dart';
import 'package:barbershop_app/api_keys/user_model.dart';

class ApiLogin {
  createAlbum() async {
    final response = await http.post(Uri.parse(ApiConstants.urlBase + ApiConstants.urlLogin),
        headers: <String, String>{
          'Content-Type': 'application/Json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': 'lucas',
          'password': 'lucas'
        }
      )
    );

    print(response.body);
  }
}

class ApiService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Welcome>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.urlBase + ApiConstants.usersEndpoint);
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
