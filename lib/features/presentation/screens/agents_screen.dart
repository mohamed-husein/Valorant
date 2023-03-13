import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/global/theme/theme_color/theme_color_light.dart';
import '../../../core/utils/app_constants.dart';
import '../../business/agents/agents_cubit.dart';
import '../widgets/agent_widget.dart';
import '../../../core/utils/app_fonsts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
      width: AppSizes.widthFullScreen,
      child: ListView(
        children: [
          CustomText(
            AppConstance.valoAgents,
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontFamily: AppFonts.fontFamilyValorant,
              fontSize: AppSizes.fs20,
              color: ThemeColorLight.white,
            ),
            context: context,
          ),
          BlocBuilder<AgentsCubit, AgentsState>(
            builder: (context, state) {
              final agentsList =
                  BlocProvider.of<AgentsCubit>(context, listen: false).agents;
              return GridView.builder(
                shrinkWrap: true,
                itemCount: agentsList.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return AgentWidget(agents: agentsList[index]);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
