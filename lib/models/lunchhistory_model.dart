class LunchHistoryResponse {
  final bool success;
  final String message;
  final List<LunchHistoryData> data;

  LunchHistoryResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LunchHistoryResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> lunchesData = json['data'];
    final List<LunchHistoryData> lunchHistoryList =
        lunchesData.map((lunchData) => LunchHistoryData.fromJson(lunchData)).toList();

    return LunchHistoryResponse(
      success: json['success'],
      message: json['message'],
      data: lunchHistoryList,
    );
  }
}

class LunchHistoryData {
  final int id;
  final int orgId;
  final int senderId;
  final int receiverId;
  final int quantity;
  final bool redeemed;
  final String note;
  final String createdAt;

  LunchHistoryData({
    required this.id,
    required this.orgId,
    required this.senderId,
    required this.receiverId,
    required this.quantity,
    required this.redeemed,
    required this.note,
    required this.createdAt,
  });

  factory LunchHistoryData.fromJson(Map<String, dynamic> json) {
    return LunchHistoryData(
      id: json['id'],
      orgId: json['org_id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      quantity: json['quantity'],
      redeemed: json['redeemed'],
      note: json['note'],
      createdAt: json['created_at'],
    );
  }
}
