import 'dart:convert';

LocalUser localUserFromJson(String str) => LocalUser.fromJson(json.decode(str));

String localUserToJson(LocalUser data) => json.encode(data.toJson());

class LocalUser {
    String? user;
    int? userId;
    int? memberId;
    String? email;
    String? imageUrl;

    LocalUser({
        this.user,
        this.userId,
        this.memberId,
        this.email,
        this.imageUrl,
    });

    factory LocalUser.fromJson(Map<String, dynamic> json) => LocalUser(
        user: json["user"],
        userId: json["user_id"],
        memberId: json["member_id"],
        email: json["email"],
        imageUrl: json["image_url"],
    );

   Map<String, dynamic> toJson() {
    Map<String, dynamic> json = { };
    if (userId != null) {
      json["user_id"] = userId;
    }
    if (memberId != null) {
      json["member_id"] = memberId;
    }
    if (email != null) {
      json["email"] = email;
    }
    if (imageUrl != null) {
      json["image_url"] = imageUrl;
    }
    return json;
  }

  @override
  String toString() {
    return 'LocalUser{user: $user, userId: $userId, memberId: $memberId, email: $email, imageUrl: $imageUrl}';
  }
}

