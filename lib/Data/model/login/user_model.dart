class UserModel {
  String? ID;
  String? first_name;
  bool? status;
  String? token;

  UserModel(
      {this.ID,
        this.first_name,
        this.status,
          this.token

      });

  factory UserModel.fromJson(json) {
    return UserModel(
      first_name: json['first_name'] as String,
      status:json['status'] as bool,
       token:json['token'] as String
    );
  }
}
