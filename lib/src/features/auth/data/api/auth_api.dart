// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';

// part 'gen/auth_api.g.dart';

// @RestApi()
// abstract class AuthApi {
//   factory AuthApi(Dio dio) = _AuthApi;

//   @POST('/auth/login')
//   Future<ApiResponse<LoginResponse>> login(@Field() String email, @Field() String password);

//   @POST('/auth/verify-otp')
//   Future<ApiResponse<LoginResponse>> verifyOTP({
//     @Field() String? email,
//     @Field() String? country_code,
//     @Field() String? phone_number,
//     @Field() required String otp,
//     @Field() required String type,
//   });

//   @POST('/auth/email')
//   Future<ApiResponse> sendEmailLink(@Field() String email);

//   @POST('/auth/phone')
//   Future<ApiResponse> sendPhoneOTP(@Field() String country_code, @Field() String phone_number);

//   @POST('/auth/logout')
//   Future<void> logout(@Header('Authorization') String token);

//   @POST('/auth/password/send-reset-email')
//   Future<void> sendPasswordResetEmail(@Field() String email);

//   @GET('/auth/user')
//   Future<ApiResponse<UserModel>> getAuthenticatedUser(@Header('Authorization') String token);
// }
