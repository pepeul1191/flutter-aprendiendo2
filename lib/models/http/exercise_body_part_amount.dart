import 'dart:convert';

ExerciseBodyPartAmount exerciseBodyPartAmountFromJson(String str) => ExerciseBodyPartAmount.fromJson(json.decode(str));

String exerciseBodyPartAmountToJson(ExerciseBodyPartAmount data) => json.encode(data.toJson());

class ExerciseBodyPartAmount {
    int exercises;
    int bodyParts;

    ExerciseBodyPartAmount({
        required this.exercises,
        required this.bodyParts,
    });

    factory ExerciseBodyPartAmount.fromJson(Map<String, dynamic> json) => ExerciseBodyPartAmount(
        exercises: json["exercises"],
        bodyParts: json["body_parts"],
    );

    Map<String, dynamic> toJson() => {
        "exercises": exercises,
        "body_parts": bodyParts,
    };

    @override
  String toString() {
    return 'ExerciseBodyPartAmount{exercises: $exercises, bodyParts: $bodyParts}';
  }
}
