import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:barbershop_app/api_keys/api_constants.dart';
import 'package:barbershop_app/api_keys/user_model.dart';

class ApiService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Welcome>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.urlBase + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Welcome> _model = welcomeFromJson(response.body);
        return _model;
      }
    } catch (event) {
      log(event.toString());
    }
  }
}
