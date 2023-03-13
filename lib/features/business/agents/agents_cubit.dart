import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/errors/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../data/model/agents_model.dart';
import '../../data/repository/repository.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  AgentsCubit({required this.repository}) : super(AgentsInitial());

  final Repository repository;

  List<Agents> _agents = [];
  List<Agents> controllersAgentsList = [];
  List<Agents> sentinelsAgentsList = [];
  List<Agents> initiatorsAgentsList = [];
  List<Agents> duelistsAgentsList = [];
  List<RoleObject> rolesList = [
    RoleObject(
        name: 'Controllers',
        icon:
            'https://media.valorant-api.com/agents/roles/4ee40330-ecdd-4f2f-98a8-eb1243428373/displayicon.png'),
    RoleObject(
        name: 'Sentinels',
        icon:
            'https://media.valorant-api.com/agents/roles/5fc02f99-4091-4486-a531-98459a3e95e9/displayicon.png'),
    RoleObject(
        name: 'Initiators',
        icon:
            'https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png'),
    RoleObject(
        name: 'Duelists',
        icon:
            'https://media.valorant-api.com/agents/roles/dbe8757e-9e92-4ed4-b39f-9dfc589691d4/displayicon.png'),
  ];
  List<Agents> get agents => _agents;
  Future<void> getAgentsInfo() async {
    final result = await repository.getAgentsInfo();
    result.fold(
      (l) => emit(
        AgentsErrorLoadState(
          _errorHandler(l),
        ),
      ),
      (r) {
        _agents = r;

        emit(
          AgentsSuccessLoadState(agents: r),
        );
      },
    );
  }

  List<Agents> controllersAgents(List<Agents> controlles) {
    final controllesList = controlles
        .where((element) => element.roles.id == AppConstance.controllersRoleId)
        .toList();
    return controllesList;
  }

  List<Agents> sentinelsAgents(List<Agents> controlles) {
    final sentinelsList = controlles
        .where((element) => element.roles.id == AppConstance.sentinelsRoleId)
        .toList();
    return sentinelsList;
  }

  List<Agents> duelistsAgents(List<Agents> controlles) {
    final duelistsList = controlles
        .where((element) => element.roles.id == AppConstance.duelistsRoleId)
        .toList();
    return duelistsList;
  }

  List<Agents> initiatorsAgents(List<Agents> controlles) {
    final initiatorsList = controlles
        .where((element) => element.roles.id == AppConstance.initiatorsRoleId)
        .toList();
    return initiatorsList;
  }

  List<Agents> agentOfEveryRole(int idex, List<Agents> agents) {
    switch (idex) {
      case 0:
        return controllersAgents(agents);
      case 1:
        return sentinelsAgents(agents);
      case 2:
        return initiatorsAgents(agents);
      case 3:
        return duelistsAgents(agents);
      default:
        return [];
    }
  }

  String _errorHandler(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'unExpected Failure';
    }
  }
}

class RoleObject {
  final String name, icon;

  RoleObject({
    required this.name,
    required this.icon,
  });
}
