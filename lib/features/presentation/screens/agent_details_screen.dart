import 'package:flutter/material.dart';
import '../../data/model/agents_model.dart';
import '../widgets/voice_widget.dart';

import '../../../core/global/theme/theme_color/theme_color_light.dart';
import '../../../core/utils/app_fonsts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';

class AgentDetails extends StatelessWidget {
  const AgentDetails({super.key, required this.agents});
  final Agents agents;

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
              agents.displayName,
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
              agents.roles.displayIcon,
              width: AppSizes.pW16,
              height: AppSizes.pH15,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                agents.background,
                fit: BoxFit.fill,
              ),
              Image.network(agents.fullPortrait),
            ],
          ),
          VoiceWidget(url: agents.voiceLine.voiceLine),
          SizedBox(
            height: AppSizes.pH12,
          ),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              spacing: AppSizes.pW32,
              direction: Axis.horizontal,
              children: List.generate(
                agents.abilities.length,
                (index) => GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: ThemeColorLight.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.br20),
                          ),
                          title: CustomText(
                            agents.displayName,
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                              fontFamily: AppFonts.fontFamilyValorant,
                              fontSize: AppSizes.fs18,
                              color: ThemeColorLight.white,
                            ),
                            context: context,
                          ),
                          content: CustomText(
                            agents.abilities[0].description,
                            textAlign: TextAlign.start,
                            textStyle: TextStyle(
                              fontFamily: AppFonts.fontFamilyValorant,
                              fontSize: AppSizes.fs13,
                              color: ThemeColorLight.white,
                            ),
                            context: context,
                          ),
                        );
                      },
                    );
                  },
                  child: Image.network(
                    agents.abilities[index].displayIcon,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
