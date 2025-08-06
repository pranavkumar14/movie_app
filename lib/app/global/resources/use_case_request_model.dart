class UseCaseRequestModel<Type> {
  Map<String, String>? query;
  Type? body;
  String apiUrl;
  String token;
  UseCaseRequestModel(
      {this.query = const {},
      this.body,
      this.token = '',
      this.apiUrl = ''});
}

