class GetAllUsersResponse {
  final bool success;
  final String message;
  final List<UserData> users;

  GetAllUsersResponse({
    required this.success,
    required this.message,
    required this.users,
  });

  factory GetAllUsersResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> usersData = json['data']['users'];
    final List<UserData> userList =
        usersData.map((userData) => UserData.fromJson(userData)).toList();

    return GetAllUsersResponse(
      success: json['success'],
      message: json['message'],
      users: userList,
    );
  }
}

class UserData {
  final int id;
  final String? firstName;
  final String? lastName;
  final String email;
  final String? phone;
  final bool isAdmin;
  final String? profilePic;
  final int? orgId;
  final double lunchCreditBalance;
  final String? refreshToken;
  final String? bankCode;
  final String? bankName;
  final String? bankNumber;
  final String? bankRegion;
  final String currencyCode;
  final String currency;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    this.phone,
    required this.isAdmin,
    this.profilePic,
    required this.orgId,
    required this.lunchCreditBalance,
    this.refreshToken,
    this.bankCode,
    this.bankName,
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
