class WithdrawalRequest {
  final String bankNumber;
  final String bankCode;
  final double amount;
  final String bankName;

  WithdrawalRequest({
    required this.bankNumber,
    required this.bankCode,
    required this.amount,
    required this.bankName,
  });

  Map<String, dynamic> toJson() {
    return {
      'bank_number': bankNumber,
      'bank_code': bankCode,
      'amount': amount,
      'bank_name': bankName,
    };
  }
}

class WithdrawalResponse {
  final String message;
  final int statusCode;
  final WithdrawalData data;

  WithdrawalResponse({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory WithdrawalResponse.fromJson(Map<String, dynamic> json) {
    return WithdrawalResponse(
      message: json['message'],
      statusCode: json['statusCode'],
      data: WithdrawalData.fromJson(json['data']),
    );
  }
}

class WithdrawalData {
  final bool isDeleted;
  final int id;
  final int userId;
  final String status;
  final double amount;
  final String updatedAt;
  final String createdAt;

  WithdrawalData({
    required this.isDeleted,
    required this.id,
    required this.userId,
    required this.status,
    required this.amount,
    required this.updatedAt,
    required this.createdAt,
  });

  factory WithdrawalData.fromJson(Map<String, dynamic> json) {
    return WithdrawalData(
      isDeleted: json['is_deleted'],
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      amount: json['amount'].toDouble(),
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }
}
