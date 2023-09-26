import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider((ref) => AuthRepository());

const _signUpAdminUrl =
    "https://team-lightning.onrender.com/api/auth/signup/org-user";
    // "https://team-lightning.onrender.com/api/auth/signup/org-user";
const _signUpUserUrl = "https://team-lightning.onrender.com/api/auth/signup";
const _loginUrl = "https://team-lightning.onrender.com/api/auth/login";
const _sendInviteUrl =
    "https://team-lightning.onrender.com/api/organization/send-invite";
const _confirmInviteUrl =
    "https://team-lightning.onrender.com/api/organization/confirm-invite";
const _forgotPasswordUrl =
    "https://team-lightning.onrender.com/api/auth/forgot-password";
const _resetPasswordUrl =
    "https://team-lightning.onrender.com/api/auth/reset-password";

final signUpViewModelProvider = Provider((ref) => SignUpViewModel());

class SignUpViewModel {
  final _dio = Dio();
  Future<Map<String, dynamic>> signUpUser({
    required String orgName,
    required String email,
    required String lunchPrice,
    // required String password,
  }) async {
    try {
      final response = await _dio.post(
        _signUpAdminUrl,
        data: {
          "org_name": orgName,
          "email": email,
          "lunch_price": lunchPrice,
          "currency_code": "NGN",
          // "password": password
        },
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }
}

class AuthRepository {
  final _dio = Dio();

  Future<Map<String, dynamic>> signUpAdmin({
    required String orgName,
    required String email,
    required String lunchPrice,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        _signUpAdminUrl,
        data: {
          "org_name": orgName,
          "email": email,
          "lunch_price": lunchPrice,
          "currency_code": "NGN",
          "password": password
        },
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> signUpUser({
    required String email,
    required String orgId,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        _signUpUserUrl,
        data: {
          "email": email,
          "password": password,
          "org_id": orgId,
        },
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loginAdminORUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        _loginUrl,
        data: {"email": email, "password": password},
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendInvite({
    required String accessToken,
    required String email,
  }) async {
    try {
      final response = await _dio.post(
        _sendInviteUrl,
        options: Options(headers: {"Authorization": accessToken}),
        data: {'email': email},
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> confirmInvite(
      {required String verificationCode}) async {
    try {
      final response = await _dio.post(
        _confirmInviteUrl,
        data: {'verificationCode': verificationCode},
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await _dio.post(
        _forgotPasswordUrl,
        data: {'email': email},
      );
    } on Exception {
      rethrow;
    }
  }

  Future<void> resetPassword({
    required String token,
    required String password,
  }) async {
    try {
      await _dio.post(
        _resetPasswordUrl,
        data: {
          'token': token,
          'password': password,
        },
      );
    } on Exception {
      rethrow;
    }
  }
}
