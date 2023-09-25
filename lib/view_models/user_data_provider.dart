import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lightning_food_mobile/models/confirminvite_model.dart';
import 'package:lightning_food_mobile/models/getallusers_model.dart' as gt;
import 'package:lightning_food_mobile/models/getuserbyid_model.dart';
import 'package:lightning_food_mobile/models/login_model.dart';
import 'package:lightning_food_mobile/models/lunchhistory_model.dart';
import 'package:lightning_food_mobile/models/resetpassword_model.dart';
import 'package:lightning_food_mobile/models/sendlunch_model.dart';
import 'package:lightning_food_mobile/models/withdrawal_model.dart';
import 'package:lightning_food_mobile/models/withdrawalhistory_model.dart';
import 'package:lightning_food_mobile/repositories/all_user_repository.dart';
import 'package:lightning_food_mobile/repositories/auth_repository.dart';

final userDataProvider = ChangeNotifierProvider((ref) => UserDataViewModel());

class UserDataViewModel extends ChangeNotifier {
  List<String> tempUserData = [];
  List<gt.UserData> _allUsers = [];
  List<WithdrawalHistoryData> withdrawals = [];
  List<LunchHistoryData> lunchHistory = [];

  late WithdrawalData withdrawalData;
  List<gt.UserData> get allUsers => _allUsers;

  late gt.UserData? selectedUser;

  late LoginData? _loginData;
  LoginData get loginData => _loginData!;

  confirmUser({required int confirmationCode}) async {
    AuthRepository authRepository = AuthRepository();
    final response = await authRepository.confirmInvite(
      verificationCode: confirmationCode,
    );
    ConfirmInviteResponse confirmInviteResponse =
        ConfirmInviteResponse.fromJson(response);
    tempUserData.add(confirmInviteResponse.data.email);
    tempUserData.add(confirmInviteResponse.data.orgId.toString());
  }

  createUserDetails({required LoginResponse response}) {
    _loginData = LoginData(
        accessToken: response.data.accessToken, user: response.data.user);
    print(_loginData!.accessToken);
    getWithdrawalHistory();
    getLunchHistory();

    notifyListeners();
  }

  logoutUser() {
    tempUserData.clear();
    _allUsers.clear();
    selectedUser = null;
    selectedUser = null;
  }

  signUpNormalUser(String password) async {
    AuthRepository authRepository = AuthRepository();
    await authRepository.signUpUser(
        orgId: tempUserData.last,
        email: tempUserData.first,
        password: password);
    final response = await authRepository.loginAdminORUser(
        email: tempUserData.first, password: password);
    createUserDetails(response: LoginResponse.fromJson(response));
  }

  sendFreeLunch({
    required String note,
    required String quantity,
  }) async {
    //TODO: Fit this into the view
    UserRepository userRepository = UserRepository();
    final response = await userRepository.sendFreeLunch(
      token: _loginData!.accessToken,
      note: note,
      quantity: quantity,
      receiverId: selectedUser!.id.toString(),
    );
    SendLunchResponse lunchResponse = SendLunchResponse.fromJson(response);
    return lunchResponse.success;
  }

  resetPassword({required String newPassword}) async {
    //TODO: Implement this
    AuthRepository authRepository = AuthRepository();
    await authRepository.resetPassword(
      token: _loginData!.accessToken,
      password: newPassword,
    );
  }

  forgotPassword({required String email}) async {
    //TODO: Implement this
    AuthRepository authRepository = AuthRepository();
    await authRepository.forgotPassword(
      email: email,
    );
  }

  getAllUsers() async {
    UserRepository userRepository = UserRepository();

    final response =
        await userRepository.getUsers(token: _loginData!.accessToken);
    gt.GetAllUsersResponse getAllUsersResponse =
        gt.GetAllUsersResponse.fromJson(response);
    for (int i = 0; 1 < getAllUsersResponse.users.length; i++) {
      _allUsers.add(getAllUsersResponse.users[i]);
    }
    notifyListeners();
  }

  getWithdrawalHistory() async {
    UserRepository userRepository = UserRepository();

    final response =
        await userRepository.withdrawalHistory(token: _loginData!.accessToken);
    WithdrawalHistoryResponse withdrawalHistoryResponse =
        WithdrawalHistoryResponse.fromJson(response);
    for (int i = 0; i < withdrawalHistoryResponse.data.length; i++) {
      withdrawals.add(withdrawalHistoryResponse.data[i]);
      print(withdrawalHistoryResponse.data[i]);
    }
    notifyListeners();
  }

  getLunchHistory() async {
    UserRepository userRepository = UserRepository();
    lunchHistory = [];
    final response =
        await userRepository.lunchHistory(token: _loginData!.accessToken);
    LunchHistoryResponse lunchHistoryResponse =
        LunchHistoryResponse.fromJson(response);
    for (int i = 0; i < lunchHistoryResponse.data.length; i++) {
      lunchHistory.add(lunchHistoryResponse.data[i]);
      print(lunchHistoryResponse.data[i]);
    }
    notifyListeners();
  }

  getUserById(String id) async {
    UserRepository userRepository = UserRepository();

    final response = await userRepository.getUserById(
        token: _loginData!.accessToken, id: id);
    GetUserResponse userResponse = GetUserResponse.fromJson(response);
    return userResponse.data.firstName;
  }

  //TODO: Still having issues
  withdrawLunch({
    required String bankNumber,
    required String bankCode,
    required int amount,
    required String bankName,
  }) async {
    UserRepository userRepository = UserRepository();

    final response = await userRepository.withdrawLunch(
      token: _loginData!.accessToken,
      bankNumber: bankNumber,
      bankCode: bankCode,
      bankName: bankName,
      amount: amount,
    );
    WithdrawalResponse lunchHistoryResponse =
        WithdrawalResponse.fromJson(response);
    print(lunchHistoryResponse);
  }
}
