import 'package:ecommerce/module/bag/screen/bag.dart';
import 'package:ecommerce/module/favourites/screen/favourites.dart';
import 'package:ecommerce/module/profile/screen/profile.dart';
import 'package:ecommerce/module/shop/screen/shop_screen.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/module/global_screen/cubit/global_screen_cubit.dart';
import 'package:ecommerce/module/home/screen/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  void initState() {
    super.initState();
  }

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BottomNavCubit>(context);

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 60.0,
              items: const <Widget>[
                Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.favorite_outline_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.person_outline_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ],
              color: AppColors.primary,
              buttonBackgroundColor: AppColors.primary,
              backgroundColor: AppColors.white,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              letIndexChange: (index) => true,
            ),
            body: buildScreens[_page]
            // body: Container(
            //   alignment: Alignment.center,
            //   child: SizedBox(
            //     width: context.width,
            //     child: PersistentTabView(
            //       context,
            //       onItemSelected: (value) {
            //         cubit.changeiconIndex(value);
            //       },
            //       controller: state.controller,
            //       navBarHeight: 80,
            //       padding: const NavBarPadding.symmetric(vertical: 15),
            //       screens: _buildScreens(),
            //       items: [
            //         presistentBottomNavBar(
            //           state.index == 0
            //               ? LandingIcons(
            //                   icons: Icons.home_sharp,
            //                   title: 'Home',
            //                   iconcolor: AppColors.primary,
            //                   textcolor: AppColors.primary,
            //                 )
            //               : LandingIcons(
            //                   icons: Icons.home_outlined,
            //                   title: 'Home',
            //                   iconcolor: AppColors.grey,
            //                   textcolor: AppColors.grey,
            //                 ),
            //         ),
            //         presistentBottomNavBar(
            //           state.index == 1
            //               ? LandingIcons(
            //                   icons: Icons.shopping_cart,
            //                   title: 'Shop',
            //                   iconcolor: AppColors.primary,
            //                   textcolor: AppColors.primary,
            //                 )
            //               : LandingIcons(
            //                   icons: Icons.shopping_cart_outlined,
            //                   title: 'Shop',
            //                   iconcolor: AppColors.grey,
            //                   textcolor: AppColors.grey,
            //                 ),
            //         ),
            //         presistentBottomNavBar(
            //           state.index == 2
            //               ? LandingIcons(
            //                   icons: Icons.shopping_bag,
            //                   title: 'Bag',
            //                   iconcolor: AppColors.primary,
            //                   textcolor: AppColors.primary,
            //                 )
            //               : LandingIcons(
            //                   icons: Icons.shopping_bag_outlined,
            //                   title: 'Bag',
            //                   iconcolor: AppColors.grey,
            //                   textcolor: AppColors.grey,
            //                 ),
            //         ),
            //         presistentBottomNavBar(
            //           state.index == 3
            //               ? LandingIcons(
            //                   icons: Icons.favorite,
            //                   title: 'Favourites',
            //                   iconcolor: AppColors.primary,
            //                   textcolor: AppColors.primary,
            //                 )
            //               : LandingIcons(
            //                   icons: Icons.favorite_outline,
            //                   title: 'Favourites',
            //                   iconcolor: AppColors.grey,
            //                   textcolor: AppColors.grey,
            //                 ),
            //         ),
            //         presistentBottomNavBar(
            //           state.index == 4
            //               ? LandingIcons(
            //                   icons: Icons.person,
            //                   title: 'Account',
            //                   iconcolor: AppColors.primary,
            //                   textcolor: AppColors.primary,
            //                 )
            //               : LandingIcons(
            //                   icons: Icons.person_outlined,
            //                   title: 'Account',
            //                   iconcolor: AppColors.grey,
            //                   textcolor: AppColors.grey,
            //                 ),
            //         ),
            //       ],
            //       confineInSafeArea: true,
            //       backgroundColor: AppColors.bgColor,
            //       handleAndroidBackButtonPress: true,
            //       resizeToAvoidBottomInset: true,
            //       stateManagement: true,
            //       hideNavigationBarWhenKeyboardShows: true,
            //       decoration: NavBarDecoration(
            //         border: Border.all(
            //           color: Colors.transparent.withOpacity(0.1),
            //         ),
            //         boxShadow: [
            //           const BoxShadow(color: Colors.transparent),
            //         ],
            //       ),
            //       popAllScreensOnTapOfSelectedTab: true,
            //       popActionScreens: PopActionScreensType.all,
            //       itemAnimationProperties: const ItemAnimationProperties(
            //         duration: Duration(milliseconds: 200),
            //         curve: Curves.ease,
            //       ),
            //       screenTransitionAnimation: const ScreenTransitionAnimation(
            //         animateTabTransition: false,
            //         curve: Curves.ease,
            //         duration: Duration(milliseconds: 100),
            //       ),
            //       navBarStyle: NavBarStyle.style6,
            //     ),
            //   ),
            // )
            );
      },
    );
  }

  List<Widget> buildScreens = [
    const HomeScreen(),
    const ShopScreen(),
    const BagScreen(),
    const FavouriteScreen(),
    const ProfileScreen()
  ];
}
//   PersistentBottomNavBarItem presistentBottomNavBar(dynamic icon) {
//     return PersistentBottomNavBarItem(
//       icon: icon,
//     );
//   }
// }
