import 'package:ecommerce/module/bag/screen/bag.dart';
import 'package:ecommerce/module/favourites/screen/favourites.dart';
import 'package:ecommerce/module/profile/screen/profile.dart';
import 'package:ecommerce/module/shop/screen/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ecommerce/module/global_screen/cubit/global_screen_cubit.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/module/home/screen/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'widgets/landing_icons.dart';

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

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BottomNavCubit>(context);

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
            body: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: context.width,
            child: PersistentTabView(
              context,
              onItemSelected: (value) {
                cubit.changeiconIndex(value);
              },
              controller: state.controller,
              navBarHeight: 80,
              padding: const NavBarPadding.symmetric(vertical: 15),
              screens: _buildScreens(),
              items: [
                presistentBottomNavBar(
                  state.index == 0
                      ? LandingIcons(
                          icons: Icons.home_sharp,
                          title: 'Home',
                          iconcolor: AppColors.primary,
                          textcolor: AppColors.primary,
                        )
                      : LandingIcons(
                          icons: Icons.home_outlined,
                          title: 'Home',
                          iconcolor: AppColors.grey,
                          textcolor: AppColors.grey,
                        ),
                ),
                presistentBottomNavBar(
                  state.index == 1
                      ? LandingIcons(
                          icons: Icons.shopping_cart,
                          title: 'Shop',
                          iconcolor: AppColors.primary,
                          textcolor: AppColors.primary,
                        )
                      : LandingIcons(
                          icons: Icons.shopping_cart_outlined,
                          title: 'Shop',
                          iconcolor: AppColors.grey,
                          textcolor: AppColors.grey,
                        ),
                ),
                presistentBottomNavBar(
                  state.index == 2
                      ? LandingIcons(
                          icons: Icons.shopping_bag,
                          title: 'Bag',
                          iconcolor: AppColors.primary,
                          textcolor: AppColors.primary,
                        )
                      : LandingIcons(
                          icons: Icons.shopping_bag_outlined,
                          title: 'Bag',
                          iconcolor: AppColors.grey,
                          textcolor: AppColors.grey,
                        ),
                ),
                presistentBottomNavBar(
                  state.index == 3
                      ? LandingIcons(
                          icons: Icons.favorite,
                          title: 'Favourites',
                          iconcolor: AppColors.primary,
                          textcolor: AppColors.primary,
                        )
                      : LandingIcons(
                          icons: Icons.favorite_outline,
                          title: 'Favourites',
                          iconcolor: AppColors.grey,
                          textcolor: AppColors.grey,
                        ),
                ),
                presistentBottomNavBar(
                  state.index == 4
                      ? LandingIcons(
                          icons: Icons.person,
                          title: 'Account',
                          iconcolor: AppColors.primary,
                          textcolor: AppColors.primary,
                        )
                      : LandingIcons(
                          icons: Icons.person_outlined,
                          title: 'Account',
                          iconcolor: AppColors.grey,
                          textcolor: AppColors.grey,
                        ),
                ),
              ],
              confineInSafeArea: true,
              backgroundColor: AppColors.bgColor,
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
              stateManagement: true,
              hideNavigationBarWhenKeyboardShows: true,
              decoration: NavBarDecoration(
                border: Border.all(
                  color: Colors.transparent.withOpacity(0.1),
                ),
                boxShadow: [
                  const BoxShadow(color: Colors.transparent),
                ],
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: false,
                curve: Curves.ease,
                duration: Duration(milliseconds: 100),
              ),
              navBarStyle: NavBarStyle.style6,
            ),
          ),
        ));
      },
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ShopScreen(),
      const BagScreen(),
      const FavouriteScreen(),
      const ProfileScreen()
    ];
  }

  PersistentBottomNavBarItem presistentBottomNavBar(dynamic icon) {
    return PersistentBottomNavBarItem(
      icon: icon,
    );
  }
}
