import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friends_app/controller/friends_controller.dart';
import 'package:friends_app/views/screens/friend_details_ui.dart';
import 'package:friends_app/views/widgets/card.dart';
import 'package:get/get.dart';

import '../widgets/gradient_container.dart';

class FriendsList extends StatelessWidget {
  FriendsList({super.key});

  FriendsController controller = Get.put(FriendsController());

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
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
            body: OrientationBuilder(builder: (context, orientation) {
              return GridView.builder(
                  itemCount: controller.friends?.results.length ?? 10,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio:
                          orientation == Orientation.portrait ? 0.7 : 1),
                  itemBuilder: (context, index) {
                    String first =
                        controller.friends?.results[index].name.first ?? 'Name';
                    String last =
                        controller.friends?.results[index].name.last ?? '';
                    String portrait =
                        controller.friends?.results[index].picture.large ?? '';
                    String country =
                        controller.friends?.results[index].location.country ??
                            'Country';
                    return InkWell(
                      onTap: () {
                        Get.to(FriendDetails(index: index));
                      },
                      child: FriendsCard(
                          portrait: portrait,
                          name: '$first $last',
                          country: country),
                    );
                  });
            })));
  }
}
