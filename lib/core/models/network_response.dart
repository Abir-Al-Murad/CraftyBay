class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? body;
  final bool isSuccess;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    this.body,
    required this.isSuccess,
    this.errorMessage,
  });
}
