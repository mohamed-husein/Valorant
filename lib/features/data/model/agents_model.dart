import 'package:equatable/equatable.dart';
import 'abilities_model.dart';
import 'roles_model.dart';
import 'voice_model.dart';

class Agents extends Equatable {
  final String displayName;
  final String description;
  final String fullPortrait;
  final String background;
  final VoiceLine voiceLine;
  final List<Abilities> abilities;
  final Roles roles;

  const Agents({
    required this.displayName,
    required this.description,
    required this.fullPortrait,
    required this.background,
    required this.voiceLine,
    required this.abilities,
    required this.roles,
  });

  factory Agents.fromJson(Map<String, dynamic> json) {
    return Agents(
      displayName: json['displayName'],
      description: json['description'],
      fullPortrait: json['fullPortrait'] ?? '',
      background: json['background'] ?? '',
      voiceLine: VoiceLine.fromJson(json['voiceLine']),
      abilities: List.from(
        (json['abilities'] as List).map(
          (e) => Abilities.fromJson(e),
        ),
      ),
      roles: Roles.fromJson(json['role'] ?? {}),
    );
  }
  @override
  List<Object?> get props => [
        displayName,
        description,
        fullPortrait,
        background,
        voiceLine,
        abilities,
        roles,
      ];
}
