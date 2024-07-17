class ApiResponse<T> {
  final T? data;
  final String message;
  final bool isSuccess;

  ApiResponse({
    this.data,
    required this.message,
    required this.isSuccess,
  });
}
