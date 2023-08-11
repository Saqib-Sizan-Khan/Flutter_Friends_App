import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friends_app/controller/friends_controller.dart';
import 'package:friends_app/views/widgets/info_container.dart';
import 'package:friends_app/views/widgets/orientation_containers.dart';
import 'package:get/get.dart';
import '../../controller/email_launcher.dart';
import '../widgets/gradient_container.dart';

class FriendDetails extends StatelessWidget {
  FriendDetails({super.key, required this.index});

  int index;
  FriendsController controller =
      Get.put(FriendsController()); // dependency injection

  @override
  Widget build(BuildContext context) {
    //defining variables for fetched data from API
    String first = controller.friends?.results[index].name.first ?? '';
    String last = controller.friends?.results[index].name.last ?? '';
    String portrait = controller.friends?.results[index].picture.large ?? '';
    var sNum = controller.friends?.results[index].location.street.number ?? '';
    var postcode = controller.friends?.results[index].location.postcode ?? '';
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
                //back button
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white))),
        body: OrientationBuilder(builder: (context, orientation) {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: GradientContainer( //custom widget
                  child: orientation == Orientation.portrait // check orientation
                      ? PortraitContainer(name: '$first $last', image: portrait)
                      : LandScapeContainer(
                          name: '$first $last', image: portrait),
                ),
              ),
              Expanded( //
                flex: 2,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        // InfoCon custom widget for carry users info
                        InfoCon(
                            title: "Address",
                            contents:
                                'Street: $sNum, $sName\nPostCode: $postcode',
                            image: 'assets/images/address.png'),
                        InfoCon(
                            title: "City and State",
                            contents: "$city, $state",
                            image: 'assets/images/city.png'),
                        InfoCon(
                            title: "Country",
                            contents: country,
                            image: 'assets/images/country.png'),
                        InkWell(
                            onTap: () {
                              emailUrlLauncher(email); // launching email app
                            },
                            child: InfoCon(
                                title: "Email",
                                contents: email,
                                image: 'assets/images/email.png')),
                        InfoCon(
                            title: "Cell Phone",
                            contents: cellPhone,
                            image: 'assets/images/phone.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
