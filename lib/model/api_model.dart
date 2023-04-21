//https://tiendung01023.github.io/json_to_dart/

class ApiModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  ApiModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  ApiModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] as int?,
        id = json['id'] as int?,
        title = json['title'] as String?,
        body = json['body'] as String?;

  Map<String, dynamic> toJson() => {'userId': userId, 'id': id, 'title': title, 'body': body};
}
