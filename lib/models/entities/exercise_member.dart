class ExerciseMember {
  int id;
  String name;
  String imageUrl;
  String videoUrl;
  String description;
  int bodyPartId;
  int sets;
  int reps;

  ExerciseMember({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.videoUrl,
    required this.description,
    required this.bodyPartId,
    required this.sets,
    required this.reps
  });

  factory ExerciseMember.fromJson(Map<String, dynamic> json) => ExerciseMember(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        videoUrl: json["video_url"],
        description: json["description"],
        bodyPartId: json["body_part_id"],
        sets: json["sets"],
        reps: json["reps"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "video_url": videoUrl,
        "description": description,
        "body_part_id": bodyPartId,
        "sets": sets,
        "reps": reps,
      };

  @override
  String toString() {
    return 'Exercise{id: $id,name: $name,image_url: $imageUrl,video_url: $videoUrl,description: $description,body_part_id: $bodyPartId, sets: $sets, reps: $reps}';
  }
}
