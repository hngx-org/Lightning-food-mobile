import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lightning_food_mobile/models/getallusers_model.dart' as gt;
import 'package:lightning_food_mobile/models/login_model.dart';
import 'package:lightning_food_mobile/repositories/all_user_repository.dart';

import 'auth_view_model.dart';

final userDataProvider = ChangeNotifierProvider((ref) => UserDataViewModel());

class UserDataViewModel extends ChangeNotifier {
  List<gt.UserData> _allUsers = [];
  late LoginData _loginData;

  LoginData get loginData => _loginData;

  createUserDetails({
    required LoginResponse response}){
    _loginData = LoginData(accessToken: response.data.accessToken, user: response.data.user);
    notifyListeners();
  }

  getAllUsers() async{
    UserRepository userRepository = UserRepository();


    final response = await userRepository.getUsers(token: _loginData.accessToken);
    gt.GetAllUsersResponse getAllUsersResponse = gt.GetAllUsersResponse.fromJson(response);
    for(int i=0; 1<getAllUsersResponse.users.length;i++){
      _allUsers.add(getAllUsersResponse.users[i]);


    }
    notifyListeners();



  }

}