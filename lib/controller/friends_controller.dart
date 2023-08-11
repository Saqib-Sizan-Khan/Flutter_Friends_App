import 'package:friends_app/model/friends_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FriendsController extends GetxController {
  UserModel? friends;

  @override
  void onInit() async {
    friends = await fetchUserData();
    super.onInit();
  }

  Future<UserModel> fetchUserData() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=50'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(jsonResponse);
      print(userModel.results[0].location.street.name);
      return userModel;
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}
