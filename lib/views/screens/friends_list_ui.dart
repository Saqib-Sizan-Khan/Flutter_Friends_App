import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friends_app/controller/friends_controller.dart';
import 'package:get/get.dart';

class FriendsList extends StatelessWidget {
  FriendsList({super.key});

  FriendsController controller = Get.put(FriendsController());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF6B415F), Color(0xFFD99181)])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text("Friends List",
                  style: TextStyle(fontSize: 22.spMax, color: Colors.white)),
              centerTitle: true,
              leading: Image.asset('assets/images/menu.png', scale: 17.spMin),
              leadingWidth: 60.w,
              actions: [
                Image.asset('assets/images/settings.png', scale: 20.spMin),
                SizedBox(width: 10.w)
              ],
            ),
            body: ListView.builder(
                itemCount: controller.friends?.results.length,
                itemBuilder: (context, index) {
                  String first = controller.friends?.results[index].name.first ?? 'Name';
                  String last = controller.friends?.results[index].name.last ?? '';
                  String portrait = controller.friends?.results[index].picture.large ?? '';
                  String country = controller.friends?.results[index].location.country ?? 'Country';
                  return Card(
                    color: const Color(0xFFD7D2D1),
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: ListTile(

                      title: Text('$first $last',
                          style: TextStyle(fontSize: 20.spMax)),
                      leading: CircleAvatar(
                        radius: 30.spMax,
                        backgroundImage: NetworkImage(portrait),
                      ),
                      subtitle: Text(country,
                          style: TextStyle(fontSize: 16.spMax)),
                    ),
                  );
                })));
  }
}
