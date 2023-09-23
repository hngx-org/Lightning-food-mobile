class WithdrawalHistoryRequest {
  // No request body needed for this endpoint
}

class WithdrawalHistoryResponse {
  final String message;
  final int statusCode;
  final List<WithdrawalHistoryData> data;

  WithdrawalHistoryResponse({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory WithdrawalHistoryResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> withdrawalHistoryData = json['data'];
    final List<WithdrawalHistoryData> withdrawalHistoryList =
        withdrawalHistoryData.map((historyData) => WithdrawalHistoryData.fromJson(historyData)).toList();

    return WithdrawalHistoryResponse(
      message: json['message'],
      statusCode: json['statusCode'],
      data: withdrawalHistoryList,
    );
  }
}

class WithdrawalHistoryData {
  final int id;
  final int userId;
  final String status;
  final double amount;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;

  WithdrawalHistoryData({
    required this.id,
    required this.userId,
    required this.status,
    required this.amount,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WithdrawalHistoryData.fromJson(Map<String, dynamic> json) {
    return WithdrawalHistoryData(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      amount: double.parse(json['amount']),
      isDeleted: json['is_deleted'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
