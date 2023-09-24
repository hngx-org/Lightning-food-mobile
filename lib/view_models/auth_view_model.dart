import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lightning_food_mobile/models/confirminvite_model.dart';
import 'package:lightning_food_mobile/models/createorg_and_user_model.dart';
import 'package:lightning_food_mobile/models/login_model.dart';
import 'package:lightning_food_mobile/models/sendinvite_model.dart';
import 'package:lightning_food_mobile/repositories/auth_repository.dart';

class AuthRepoViewModel {
  final Ref ref;

  AuthRepoViewModel(this.ref);

  signUpAdmin(
      {required orgName,
      required email,
      required lunchPrice,
      required password}) async {
    final res = await ref.read(authRepoProvider).signUpAdmin(
        orgName: orgName,
        email: email,
        lunchPrice: lunchPrice,
        password: password);
    return CreateOrgAndUserData.fromJson(res);
  }

  signUpUser({required email ,required password}) async {
    final res = await ref
        .read(authRepoProvider)
        .signUpUser(email: email, orgId: "", password: password);
    return UserData.fromJson(res);
  }

  loginAdminOrUser({required email, required password}) async {
    final res = await ref
        .read(authRepoProvider)
        .loginAdminORUser(email: email, password: password);
    return LoginData.fromJson(res);
  }

  sendInvite({required accessToken, required email}) async {
    final res = await ref
        .read(authRepoProvider)
        .sendInvite(accessToken: accessToken, email: email);
    return SendInviteResponse.fromJson(res);
  }

  confirmInvite({required verificationCode}) async {
    final res = await ref
        .read(authRepoProvider)
        .confirmInvite(verificationCode: verificationCode);
    return ConfirmInviteData.fromJson(res);
  }

  forgotPassword({required email}) async {
    final res = await ref.read(authRepoProvider).forgotPassword(email: email);
    return res;
  }

  resetPassword({required token, required password}) async {
    final res = await ref
        .read(authRepoProvider)
        .resetPassword(token: token, password: password);
    return res;
  }
}
