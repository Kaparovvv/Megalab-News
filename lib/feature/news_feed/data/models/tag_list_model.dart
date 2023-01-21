import 'package:megalab_news_app/feature/news_feed/domain/entities/tag_list_entity.dart';

class TagListModel extends TagListEntity {
  TagListModel({
    required id,
    required name,
  }) : super(id: id, name: name);

  factory TagListModel.fromJson(Map<String, dynamic> json) => TagListModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
