// ignore_for_file: deprecated_member_use

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valorant/core/global/theme/theme_color/theme_color_light.dart';
import 'package:valorant/core/utils/app_assets.dart';
import 'package:valorant/core/utils/custom_text.dart';
import 'package:valorant/features/business/home/home_cubit.dart';

import '../../../core/utils/app_fonsts.dart';
import '../../../core/utils/app_sizes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = BlocProvider.of<HomeCubit>(context, listen: false);
        return Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(
              AppAssets.valorantLogo,
   
              color: ThemeColorLight.white,
            ),
          ),
          body: IndexedStack(index: homeCubit.currentTabSelect, children: homeCubit.screens),
          bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final homeCubit = BlocProvider.of<HomeCubit>(
                context,
              );
              return BottomNavyBar(
                itemCornerRadius: AppSizes.br10,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                onItemSelected: (value) {
                  homeCubit.changeTab(value);
                },
                backgroundColor: const Color(0xFF53212B),
                selectedIndex: homeCubit.currentTabSelect,
                items: [
                  BottomNavyBarItem(
                    activeColor: ThemeColorLight.primaryColor,
                    icon: SvgPicture.asset(
                      AppAssets.rolesSvg,
                  
                      width: 20,

                     
                      color: ThemeColorLight.white,
                    ),
                    title: Padding(
                      padding: EdgeInsetsDirectional.only(start: AppSizes.pW2),
                      child: CustomText(
                        'Roles',
                        textAlign: TextAlign.start,
                        textStyle: TextStyle(
                          fontFamily: AppFonts.fontFamilyValorant,
                          fontSize: AppSizes.fs11,
                          color: ThemeColorLight.white,
                        ),
                        context: context,
                      ),
                    ),
                  ),
                  BottomNavyBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.agentSvg,
                      width: 20,

        
                      color: ThemeColorLight.white,
                    ),
                    title: Padding(
                      padding: EdgeInsetsDirectional.only(start: AppSizes.pW1),
                      child: CustomText(
                        'Agents',
                        textAlign: TextAlign.start,
                        textStyle: TextStyle(
                          fontFamily: AppFonts.fontFamilyValorant,
                          fontSize: AppSizes.fs11,
                          color: ThemeColorLight.white,
                        ),
                        context: context,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
