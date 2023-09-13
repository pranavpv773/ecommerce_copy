import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromRGBO(4, 9, 35, 1),
//                 Color.fromRGBO(39, 105, 171, 1),
//               ],
//               begin: FractionalOffset.bottomCenter,
//               end: FractionalOffset.topCenter,
//             ),
//           ),
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Icon(
//                         Icons.arrow_circle_left_rounded,
//                         color: Colors.white,
//                       ),
//                       Icon(
//                         Icons.logout,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     'My\nProfile',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 34,
//                       fontFamily: 'Nisebuschgardens',
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 22,
//                   ),
//                   SizedBox(
//                     height: height * 0.43,
//                     child: LayoutBuilder(
//                       builder: (context, constraints) {
//                         double innerHeight = constraints.maxHeight;
//                         double innerWidth = constraints.maxWidth;
//                         return Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             Positioned(
//                               bottom: 0,
//                               left: 0,
//                               right: 0,
//                               child: Container(
//                                 height: innerHeight * 0.72,
//                                 width: innerWidth,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   color: Colors.white,
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(
//                                       height: 80,
//                                     ),
//                                     const Text(
//                                       'Jhone Doe',
//                                       style: TextStyle(
//                                         color: Color.fromRGBO(39, 105, 171, 1),
//                                         fontFamily: 'Nunito',
//                                         fontSize: 37,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Text(
//                                               'Orders',
//                                               style: TextStyle(
//                                                 color: Colors.grey[700],
//                                                 fontFamily: 'Nunito',
//                                                 fontSize: 25,
//                                               ),
//                                             ),
//                                             const Text(
//                                               '10',
//                                               style: TextStyle(
//                                                 color: Color.fromRGBO(
//                                                     39, 105, 171, 1),
//                                                 fontFamily: 'Nunito',
//                                                 fontSize: 25,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 25,
//                                             vertical: 8,
//                                           ),
//                                           child: Container(
//                                             height: 50,
//                                             width: 3,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(100),
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ),
//                                         Column(
//                                           children: [
//                                             Text(
//                                               'Pending',
//                                               style: TextStyle(
//                                                 color: Colors.grey[700],
//                                                 fontFamily: 'Nunito',
//                                                 fontSize: 25,
//                                               ),
//                                             ),
//                                             const Text(
//                                               '1',
//                                               style: TextStyle(
//                                                 color: Color.fromRGBO(
//                                                     39, 105, 171, 1),
//                                                 fontFamily: 'Nunito',
//                                                 fontSize: 25,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 110,
//                               right: 20,
//                               child: Icon(
//                                 Icons.settings,
//                                 color: Colors.grey[700],
//                                 size: 30,
//                               ),
//                             ),
//                             Positioned(
//                               top: 0,
//                               left: 0,
//                               right: 0,
//                               child: Center(
//                                 child: Container(
//                                   child: Image.asset(
//                                     'asset/profile.png',
//                                     width: innerWidth * 0.45,
//                                     fit: BoxFit.fitWidth,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     height: height * 0.5,
//                     width: width,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.white,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             'My Orders',
//                             style: TextStyle(
//                               color: Color.fromRGBO(39, 105, 171, 1),
//                               fontSize: 27,
//                               fontFamily: 'Nunito',
//                             ),
//                           ),
//                           const Divider(
//                             thickness: 2.5,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: height * 0.15,
//                             decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: height * 0.15,
//                             decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var iconColor = AppColors.black;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title,
          style: context.textTheme.bodyMedium!
              .copyWith(color: textColor, letterSpacing: 0.25)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(Icons.arrow_forward_ios_outlined,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// -- IMAGE
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                              image: AssetImage(
                            'asset/profile.png',
                          ))),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("PRANAV PV",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text("tProfileSubHeading",
                    style: Theme.of(context).textTheme.bodyMedium),

                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),

                /// -- MENU

                ProfileMenuWidget(
                    title: "Become a vendor",
                    icon: Icons.business_rounded,
                    onPress: () {}),
                ProfileMenuWidget(
                    title: "Orders",
                    icon: Icons.delivery_dining,
                    onPress: () {}),
                ProfileMenuWidget(
                    title: "Address",
                    icon: Icons.home_outlined,
                    onPress: () {}),
                ProfileMenuWidget(
                    title: "My Products",
                    icon: Icons.dashboard,
                    onPress: () {}),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                    title: "Terms & Conditions",
                    icon: Icons.file_present_rounded,
                    onPress: () {}),
                ProfileMenuWidget(
                    title: "Privacy Policy",
                    icon: Icons.privacy_tip_outlined,
                    onPress: () {}),
                ProfileMenuWidget(
                    title: "Logout",
                    icon: Icons.logout_outlined,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {
                      Get.defaultDialog(
                        title: "LOGOUT",
                        titleStyle: const TextStyle(fontSize: 20),
                        content: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text("Are you sure, you want to Logout?"),
                        ),
                        confirm: Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                side: BorderSide.none),
                            child: const Text("Yes"),
                          ),
                        ),
                        cancel: OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text("No")),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
