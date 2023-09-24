class CreateOrgAndUserRequest {
  final String orgName;
  final String email;
  final double lunchPrice;
  final String currencyCode;
  final String password;

  CreateOrgAndUserRequest({
    required this.orgName,
    required this.email,
    required this.lunchPrice,
    required this.currencyCode,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'org_name': orgName,
      'email': email,
      'lunch_price': lunchPrice,
      'currency_code': currencyCode,
      'password': password,
    };
  }
}

class CreateOrgAndUserResponse {
  final bool success;
  final String message;
  final CreateOrgAndUserData data;

  CreateOrgAndUserResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CreateOrgAndUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateOrgAndUserResponse(
      success: json['success'],
      message: json['message'],
      data: CreateOrgAndUserData.fromJson(json['data']),
    );
  }
}

class CreateOrgAndUserData {
  final CreateUser user;
  final Organization organization;
  final LunchWallet lunchWallet;

  CreateOrgAndUserData({
    required this.user,
    required this.organization,
    required this.lunchWallet,
  });

  factory CreateOrgAndUserData.fromJson(Map<String, dynamic> json) {
    return CreateOrgAndUserData(
      user: CreateUser.fromJson(json['user']),
      organization: Organization.fromJson(json['organization']),
      lunchWallet: LunchWallet.fromJson(json['lunchWallet']),
    );
  }
}

class CreateUser {
  final String? currencyCode;
  final String? currency;
  final bool? isDeleted;
  final int id;
  final String email;
  final bool isAdmin;
  final int orgId;
  final String lunchCreditBalance;
  final String? updatedAt;
  final String? createdAt;

  CreateUser({
    this.currencyCode,
    this.currency,
    this.isDeleted,
    required this.id,
    required this.email,
    required this.isAdmin,
    required this.orgId,
    required this.lunchCreditBalance,
    this.updatedAt,
    this.createdAt,
  });

  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
      currencyCode: json['currency_code'],
      currency: json['currency'],
      isDeleted: json['is_deleted'],
      id: json['id'],
      email: json['email'],
      isAdmin: json['is_admin'],
      orgId: json['org_id'],
      lunchCreditBalance: json['lunch_credit_balance'].toString(),
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }
}

class Organization {
  final int id;
  final String name;
  final String lunchPrice;
  final String currencyCode;
  final String updatedAt;
  final String createdAt;

  Organization({
    required this.id,
    required this.name,
    required this.lunchPrice,
    required this.currencyCode,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'],
      name: json['name'],
      lunchPrice: json['lunch_price'],
      currencyCode: json['currency_code'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }
}

class LunchWallet {
  final int id;
  final int orgId;
  final double balance;
  final String updatedAt;
  final String createdAt;

  LunchWallet({
    required this.id,
    required this.orgId,
    required this.balance,
    required this.updatedAt,
    required this.createdAt,
  });

  factory LunchWallet.fromJson(Map<String, dynamic> json) {
    return LunchWallet(
      id: json['id'],
      orgId: json['org_id'],
      balance: json['balance'].toDouble(),
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }
}
