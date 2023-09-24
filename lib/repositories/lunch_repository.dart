import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lunchRepoProvider = Provider((ref) => LunchRepository());

const _sendLunchUrl = "https://team-lightning.onrender.com//api/lunch/send";
const _withdrawLunchUrl = "https://team-lightning.onrender.com/api/withdrawal/request";

class LunchRepository {
  final _dio = Dio();

  Future<Map<String, dynamic>> sendLunch({
    required String receiverId,
    required String quantity,
    required accessToken,
    String? note,
  }) async {
    try {
      final response = await _dio.post(_sendLunchUrl,
          options: Options(headers: {"Authorization": accessToken}),
          data: {
        "receiver_id": receiverId,
        "note": note,
        "quantity": quantity,
      });
      return (response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> withdrawLunch({
    required String bankNumber,
    required String bankCode,
    required String amount,
    required String bankName,
}) async{
    try{
      final response = await _dio.post(_withdrawLunchUrl,data: {
        "bank_number": bankNumber,
        "bank_code": bankCode,
        "amount": amount,
        "bank_name": bankName
      });
      return (response.data);
    } on Exception{
      rethrow;
    }
  }

}
