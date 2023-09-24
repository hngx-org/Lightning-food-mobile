import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lightning_food_mobile/repositories/lunch_repository.dart';
import '../models/sendlunch_model.dart';
import '../models/withdrawal_model.dart';

class AuthRepoViewModel {
  final Ref ref;

  AuthRepoViewModel(this.ref);

  sendLunch(
      {required receiverId,
      required quantity,
      required accessToken,
      note}) async {
    final res = await ref.read(lunchRepoProvider).sendLunch(
          receiverId: receiverId,
          quantity: quantity,
          accessToken: accessToken,
        );
    return SendLunchData.fromJson(res);
  }

  withdrawLunch(
      {required bankNumber,
      required bankCode,
      required amount,
      required bankName}) async {
    final res = await ref.watch(lunchRepoProvider).withdrawLunch(
        bankNumber: bankNumber,
        bankCode: bankCode,
        amount: amount,
        bankName: bankName);
    return WithdrawalData.fromJson(res);
  }
}
