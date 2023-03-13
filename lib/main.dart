import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/service_locator.dart';
import 'features/business/agents/agents_cubit.dart';
import 'features/business/home/home_cubit.dart';
import 'features/presentation/screens/logo_screen.dart';
import 'features/presentation/screens/main_screen.dart';
import 'core/global/theme/theme_data/light.dart';

void main() {
  DependencyInjectionServices.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: false,
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(
              create: (context) => sl<HomeCubit>(),
            ),
            BlocProvider(
              create: (context) => sl<AgentsCubit>()..getAgentsInfo(),
            ),
          ],
          child: BlocBuilder<AgentsCubit, AgentsState>(
            builder: (context, state) {
              final agents = context.read<AgentsCubit>();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: getThemeDataLight,
                home: agents.agents.isNotEmpty
                    ? const MainScreen()
                    : const LogoScreen(),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1,
                    ),
                    child: child!,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
