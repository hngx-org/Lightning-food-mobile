import "package:dio/dio.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersRepoProvider = Provider((ref)=> UserRepository());
const _getUserUrl = "https://team-lightning.onrender.com//api/users";
class UserRepository {
  final _dio = Dio();

  Future<Map<String, dynamic>> getUsers({
    required String token})async{
    try{
      final response = await _dio.get(
        _getUserUrl,
        options: Options(headers: {"Authorization": token})
      );
      return(response.data);

    }on Exception{
      rethrow;
    }

  }




}


