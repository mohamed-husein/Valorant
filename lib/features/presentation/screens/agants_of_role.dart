import 'package:flutter/material.dart';

import '../../../core/global/theme/theme_color/theme_color_light.dart';
import '../../../core/utils/app_fonsts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';
import '../../data/model/agents_model.dart';
import '../widgets/agent_widget.dart';

class AgentsOfRole extends StatelessWidget {
  const AgentsOfRole({super.key, required this.agents});

  final List<Agents> agents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ThemeColorLight.white,
          ),
        ),
        centerTitle: false,
        title: Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            CustomText(
              agents[0].roles.displayName,
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontFamily: AppFonts.fontFamilyValorant,
                fontSize: AppSizes.fs18,
                color: ThemeColorLight.white,
              ),
              context: context,
            ),
            SizedBox(
              width: AppSizes.pW2,
            ),
            Image.network(
              agents[0].roles.displayIcon,
              width: AppSizes.pW16,
              height: AppSizes.pH15,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: agents.length,
        itemBuilder: (context, index) {
          return AgentWidget(agents: agents[index]);
        },
      ),
    );
  }
}
