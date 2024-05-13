CommonData commonDataFromJson(Map<String, dynamic> json) =>
    CommonData.fromJson(json);

class CommonData {
  CommonData({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  late final int statusCode;
  late final String statusMessage;
  late final Map<String, dynamic> data;

  CommonData.fromJson(Map<String, dynamic> jsonData) {
    statusCode = jsonData['status_code'];
    statusMessage = jsonData['status_message'];
    data = jsonData["data"] ?? {};
  }

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status_message": statusMessage,
    "data": data,
  };
}
