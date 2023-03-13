part of 'agents_cubit.dart';

abstract class AgentsState extends Equatable {
  const AgentsState();

  @override
  List<Object> get props => [];
}

class AgentsInitial extends AgentsState {}

class AgentsLoadingState extends AgentsState {}
class GetControllersListSuccess extends AgentsState {}

class AgentsSuccessLoadState extends AgentsState {
  final List<Agents> agents;

  const AgentsSuccessLoadState({required this.agents});
  @override
  List<Object> get props => [agents];
}

class AgentsErrorLoadState extends AgentsState {
  final String error;

  const AgentsErrorLoadState(this.error);
    @override
  List<Object> get props => [error];
}
