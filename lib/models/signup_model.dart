class SignupRequest {
  final String email;
  final String password;
  final String orgId;

  SignupRequest({
    required this.email,
    required this.password,
    required this.orgId,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'org_id': orgId,
    };
  }
}

class SignupResponse {
  final bool success;
  final String message;
  final UserData data;

  SignupResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      success: json['success'],
      message: json['message'],
      data: UserData.fromJson(json['data']['user']),
    );
  }
}

class UserData {
  final String currencyCode;
  final String currency;
  final bool isDeleted;
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isAdmin;
  final String profilePic;
  final String orgId;
  final double lunchCreditBalance;
  final String updatedAt;
  final String createdAt;

  UserData({
    required this.currencyCode,
    required this.currency,
    required this.isDeleted,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isAdmin,
    required this.profilePic,
    required this.orgId,
    required this.lunchCreditBalance,
    required this.updatedAt,
    required this.createdAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      currencyCode: json['currency_code'],
      currency: json['currency'],
      isDeleted: json['is_deleted'],
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isAdmin: json['is_admin'],
      profilePic: json['profile_pic'],
      orgId: json['org_id'],
      lunchCreditBalance: json['lunch_credit_balance'].toDouble(),
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }
}
