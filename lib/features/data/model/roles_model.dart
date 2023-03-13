import 'package:equatable/equatable.dart';

class Roles extends Equatable {
  final String id, displayName, description, displayIcon;

  const Roles({
    required this.id,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Roles.fromJson(Map<String, dynamic> json) {
    return Roles(
      id: json['uuid'] ??'',
      displayName: json['displayName']??'',
      description: json['description']??'',
      displayIcon: json['displayIcon']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uuid":id,
      "displayName":displayName,
      "description":description,
      "displayIcon":displayIcon,
    };
  }

  @override
  List<Object?> get props => [id, displayIcon, description, displayName];
}
