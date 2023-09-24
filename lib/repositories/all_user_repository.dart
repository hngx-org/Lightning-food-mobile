import "package:dio/dio.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lightning_food_mobile/models/getuserbyid_model.dart';

final usersRepoProvider = Provider((ref) => UserRepository());
const _getUserUrl = "https://team-lightning.onrender.com/api/users";
const _sendLunchUrl = 'https://team-lightning.onrender.com/api/lunch/send';
const _lunchHistoryUrl = 'https://team-lightning.onrender.com/api/lunch';
const _withdrawalUrl =
    'https://team-lightning.onrender.com/api/withdrawal/request';
const _withdrawalHistory =
    'https://team-lightning.onrender.com/api/withdrawal/all';

const _getUserByIdUrl = 'https://team-lightning.onrender.com/api/users/';

class UserRepository {
  final _dio = Dio();

  Future<Map<String, dynamic>> getUsers({required String token}) async {
    try {
      final response = await _dio.get(_getUserUrl,
          options: Options(headers: {"Authorization": token}));
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendFreeLunch({
    required String token,
    required String receiverId,
    required String quantity,
    required String note,
  }) async {
    try {
      final response = await _dio.post(_sendLunchUrl,
          data: {"receiver_id": receiverId, "quantity": quantity, "note": note},
          options: Options(headers: {"Authorization": token}));
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUserById({
    required String token,
    required String id,
  }) async {
    try {
      final response = await _dio.post(_getUserByIdUrl+id,
          options: Options(headers: {"Authorization": token}));
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> withdrawLunch({
    required String token,
    required String bankNumber,
    required String bankCode,
    required int amount,
    required String bankName,
  }) async {
    try {
      final response = await _dio.post(
        _withdrawalUrl,
        data: {
          "bank_number": bankNumber,
          "bank_code": bankCode,
          "bank_name": bankName,
          "amount": amount,
        },
        options: Options(
          headers: {
            "Authorization": token,
          },
        ),
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> withdrawalHistory(
      {required String token}) async {
    try {
      final response = await _dio.get(
        _withdrawalHistory,
        options: Options(
          headers: {
            "Authorization": token,
          },
        ),
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> lunchHistory({required String token}) async {
    try {
      final response = await _dio.get(
        _lunchHistoryUrl,
        options: Options(
          headers: {
            "Authorization": token,
          },
        ),
      );
      return (response.data);
    } on Exception {
      rethrow;
    }
  }
}
