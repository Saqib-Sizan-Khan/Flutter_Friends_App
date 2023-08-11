import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friends_app/controller/friends_controller.dart';
import 'package:friends_app/views/widgets/info_container.dart';
import 'package:get/get.dart';
import '../../controller/email_launcher.dart';
import '../widgets/gradient_container.dart';

class FriendDetails extends StatelessWidget {
  FriendDetails({super.key, required this.index});

  int index;
  FriendsController controller = Get.put(FriendsController());

  @override
  Widget build(BuildContext context) {
    String first = controller.friends?.results[index].name.first ?? '';
    String last = controller.friends?.results[index].name.last ?? '';
    String portrait = controller.friends?.results[index].picture.large ?? '';
    var sNum = controller.friends?.results[index].location.street.number ?? '';
    String sName =
        controller.friends?.results[index].location.street.name ?? '';
    String city = controller.friends?.results[index].location.city ?? '';
    String state = controller.friends?.results[index].location.state ?? '';
    String country = controller.friends?.results[index].location.country ?? '';
    String email = controller.friends?.results[index].email ?? '';
    String cellPhone = controller.friends?.results[index].cell ?? '';
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF542F76),
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white))),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: GradientContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 75.spMin,
                      child: CircleAvatar(
                        radius: 70.spMin,
                        backgroundImage: NetworkImage(portrait),
                      ),
                    ),
                    Text('$first $last',
                        style:
                            TextStyle(fontSize: 28.spMax, color: Colors.white))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      InfoCon(title: "Address", contents: '$sNum, $sName'),
                      InfoCon(
                          title: "City and State", contents: "$city, $state"),
                      InfoCon(title: "Country", contents: country),
                      InkWell(
                          onTap: () {
                            emailUrlLauncher(email);
                          },
                          child: InfoCon(title: "Email", contents: email)),
                      InfoCon(title: "Cell Phone", contents: cellPhone),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
