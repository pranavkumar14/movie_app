class APIResponseStatusModel<T> {
  static const int failure = 0;
  static const int success = 1;
  static const int loading = 2;
  static const int unauthorized = 3;
  static const int invalid = 4;
  static const int noInternet = 5;

  final int status;
  String? message;
  late final T? body;

  APIResponseStatusModel({
    required this.status,
    required this.message,
    required this.body,
  });

  @override
  String toString() {
    String statusStr = _statusToString(status);
    return 'APIResponseStatusModel(status: $statusStr, message: $message, body: $body)';
  }

  String _statusToString(int status) {
    switch (status) {
      case success:
        return "Success";
      case loading:
        return "Loading";
      case unauthorized:
        return "Unauthorized";
      case invalid:
        return "Invalid";
      case noInternet:
        return "No Internet";
      case failure:
      default:
        return "Failure";
    }
  }

  static final somethingWentWrong = APIResponseStatusModel(
    status: failure,
    message: 'Something went wrong',
    body: null,
  );

  static final checkInternetConnection = APIResponseStatusModel(
    status: noInternet,
    message: 'Check internet connection',
    body: null,
  );
}


