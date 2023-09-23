class SendInviteRequest {
  final String email;

  SendInviteRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

class SendInviteResponse {
  final bool success;
  final String message;
  final dynamic data; // Change the type based on the actual response data if it's not always null

  SendInviteResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory SendInviteResponse.fromJson(Map<String, dynamic> json) {
    return SendInviteResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
