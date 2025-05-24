import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'gen/login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? token;
  final UserModel? user;

  const LoginResponse({
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
