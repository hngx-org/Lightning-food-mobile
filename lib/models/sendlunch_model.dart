class SendLunchRequest {
  final String receiverId;
  final String note;
  final String quantity;

  SendLunchRequest({
    required this.receiverId,
    required this.note,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'receiver_id': receiverId,
      'note': note,
      'quantity': quantity,
    };
  }
}

class SendLunchResponse {
  final bool success;
  final String message;
  final SendLunchData data;

  SendLunchResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SendLunchResponse.fromJson(Map<String, dynamic> json) {
    return SendLunchResponse(
      success: json['success'],
      message: json['message'],
      data: SendLunchData.fromJson(json['data']),
    );
  }
}

class SendLunchData {
  final int id;
  final int senderId;
  final String receiverId;
  final int orgId;
  final String quantity;
  final String note;
  final String createdAt;

  SendLunchData({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.orgId,
    required this.quantity,
    required this.note,
    required this.createdAt,
  });

  factory SendLunchData.fromJson(Map<String, dynamic> json) {
    return SendLunchData(
      id: json['id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      orgId: json['org_id'],
      quantity: json['quantity'],
      note: json['note'],
      createdAt: json['created_at'],
    );
  }
}
