class ConfirmInviteRequest {
  final int verificationCode;

  ConfirmInviteRequest({
    required this.verificationCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'verificationCode': verificationCode,
    };
  }
}

class ConfirmInviteResponse {
  final bool success;
  final String message;
  final ConfirmInviteData data;

  ConfirmInviteResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ConfirmInviteResponse.fromJson(Map<String, dynamic> json) {
    return ConfirmInviteResponse(
      success: json['success'],
      message: json['message'],
      data: ConfirmInviteData.fromJson(json['data']),
    );
  }
}

class ConfirmInviteData {
  final int orgId;
  final String email;

  ConfirmInviteData({
    required this.orgId,
    required this.email,
  });

  factory ConfirmInviteData.fromJson(Map<String, dynamic> json) {
    return ConfirmInviteData(
      orgId: json['org_id'],
      email: json['email'],
    );
  }
}
