import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/model/agents_model.dart';
import '../screens/agent_details_screen.dart';

import '../../../core/global/theme/theme_color/theme_color_light.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_sizes.dart';

class AgentWidget extends StatelessWidget {
  const AgentWidget({super.key, required this.agents});
  final Agents agents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.pW16),
      child: agentWidet(agents,context),
    );
  }

  Widget agentWidet(Agents agents,context) {
    if (agents.background == '' && agents.fullPortrait == '') {
      return SvgPicture.asset(
        AppAssets.valorantLogo,
        // ignore: deprecated_member_use
        color: ThemeColorLight.white,
        width: AppSizes.pW200,
      );
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AgentDetails(agents: agents),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            agents.background,
            fit: BoxFit.fill,
          ),
          Image.network(agents.fullPortrait),
        ],
      ),
    );
  }
}
