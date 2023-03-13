import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business/agents/agents_cubit.dart';
import '../../business/home/home_cubit.dart';
import 'agants_of_role.dart';

import '../../../core/global/theme/theme_color/theme_color_light.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_fonsts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';

class RolesScreen extends StatelessWidget {
  const RolesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.widthFullScreen,
      child: ListView(
        children: [
          CustomText(
            AppConstance.valoRoles,
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontFamily: AppFonts.fontFamilyValorant,
              fontSize: AppSizes.fs20,
              color: ThemeColorLight.white,
            ),
            context: context,
          ),
          SizedBox(
            height: AppSizes.pH100,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final agentsList =
                  BlocProvider.of<AgentsCubit>(context, listen: false).agents;

              final roles = context.read<AgentsCubit>().rolesList;
              return GridView.builder(
                shrinkWrap: true,
                itemCount: roles.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final agents =
                      BlocProvider.of<AgentsCubit>(context, listen: false)
                          .agentOfEveryRole(index, agentsList);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AgentsOfRole(agents: agents),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(roles[index].icon),
                        ),
                        SizedBox(
                          height: AppSizes.pH12,
                        ),
                        CustomText(
                          roles[index].name,
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                            fontFamily: AppFonts.fontFamilyValorant,
                            fontSize: AppSizes.fs16,
                            color: ThemeColorLight.white,
                          ),
                          context: context,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
