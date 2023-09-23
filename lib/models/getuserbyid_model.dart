class GetUserResponse {
  final bool success;
  final String message;
  final UserData data;

  GetUserResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      success: json['success'],
      message: json['message'],
      data: UserData.fromJson(json['data']['user']),
    );
  }
}

class UserData {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final bool isAdmin;
  final String profilePic;
  final int orgId;
  final double lunchCreditBalance;
  final String? refreshToken;
  final String bankCode;
  final String bankName;
  final String? bankNumber;
  final String? bankRegion;
  final String currencyCode;
  final String currency;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.isAdmin,
    required this.profilePic,
    required this.orgId,
    required this.lunchCreditBalance,
    this.refreshToken,
    required this.bankCode,
    required this.bankName,
    this.bankNumber,
    this.bankRegion,
    required this.currencyCode,
    required this.currency,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      isAdmin: json['is_admin'],
      profilePic: json['profile_pic'],
      orgId: json['org_id'],
      lunchCreditBalance: json['lunch_credit_balance'].toDouble(),
      refreshToken: json['refresh_token'],
      bankCode: json['bank_code'],
      bankName: json['bank_name'],
      bankNumber: json['bank_number'],
      bankRegion: json['bank_region'],
      currencyCode: json['currency_code'],
      currency: json['currency'],
      isDeleted: json['is_deleted'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
