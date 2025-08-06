import 'dart:convert';

SearchQueryRequestModel searchQueryRequestModelFromJson(String str) => SearchQueryRequestModel.fromJson(json.decode(str));

String searchQueryRequestModelToJson(SearchQueryRequestModel data) => json.encode(data.toJson());

class SearchQueryRequestModel {
  final int pages;
  final String query;

  SearchQueryRequestModel({
    required this.pages,
    required this.query,
  });

  factory SearchQueryRequestModel.fromJson(Map<String, dynamic> json) => SearchQueryRequestModel(
    pages: json["pages"],
    query: json["query"],
  );

  Map<String, dynamic> toJson() => {
    "pages": pages,
    "query": query,
  };
}
