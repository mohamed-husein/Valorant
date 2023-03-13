import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../presentation/screens/agents_screen.dart';
import '../../presentation/screens/roles_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: ''),
  ];

  List<Widget> screens = [const RolesScreen(), const AgentsScreen()];

  int currentTabSelect = 0;

  void changeTab(int index) {
    emit(HomeInitial());
    currentTabSelect = index;
    emit(ChangeCurrentTabState());
  }
}
