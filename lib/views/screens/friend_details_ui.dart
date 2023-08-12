import 'package:flutter/material.dart';
import 'package:friends_app/controller/friends_controller.dart';
import 'package:friends_app/views/widgets/orientation_containers.dart';
import 'package:friends_app/views/widgets/orientation_views.dart';
import 'package:get/get.dart';
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
                child: GradientContainer(
                  //custom widget
                  child: orientation ==
                          Orientation.portrait // check orientation
                      ? PortraitContainer(name: '$first $last', image: portrait)
                      : LandScapeContainer(
                          name: '$first $last', image: portrait),
                ),
              ),
              Expanded(
                  //
                  flex: 2,
                  child: orientation == Orientation.landscape
                      ? LandscapeView(
                          street: '$sNum, $sName',
                          postcode: '$postcode',
                          cityState: '$city, $state',
                          country: country,
                          email: email,
                          phone: cellPhone)
                      : PortraitView(
                          street: '$sNum, $sName',
                          postcode: '$postcode',
                          cityState: '$city, $state',
                          country: country,
                          email: email,
                          phone: cellPhone)),
            ],
          );
        }));
  }
}
