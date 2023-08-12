import 'package:friends_app/model/friends_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FriendsController extends GetxController {
  UserModel? friends; // model initialization

  @override
  void onInit() async {
    friends = await fetchUserData(); // get api data
    super.onInit();
  }

  // fetch data from api
  Future<UserModel> fetchUserData() async {
    int user = 10; // set users
    final response = await http
        .get(Uri.parse('https://randomuser.me/api/?results=$user')); // api link

    if (response.statusCode == 200) {
      // decode json data and inject to user model
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(jsonResponse);
      return userModel;
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}
