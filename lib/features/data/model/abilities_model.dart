import 'package:equatable/equatable.dart';

class Abilities extends Equatable {
  final String slot, displayName, description, displayIcon;

  const Abilities({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return Abilities(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "slot":slot,
      "displayName":displayName,
      "description":description,
      "displayIcon":displayIcon,
    };
  }

  @override
  List<Object?> get props => [slot, displayIcon, description, displayName];
}
