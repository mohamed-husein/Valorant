import 'package:equatable/equatable.dart';

class VoiceLine extends Equatable {
  final String voiceLine;
  final double minDuration;

  const VoiceLine({required this.voiceLine, required this.minDuration});

  factory VoiceLine.fromJson(Map<String, dynamic> json) {
    return VoiceLine(
      voiceLine: json['mediaList'][0]['wave'],
      minDuration: json['maxDuration'] ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [voiceLine];
}
