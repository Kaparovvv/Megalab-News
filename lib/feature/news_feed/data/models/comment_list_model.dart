// import 'package:megalab_news_app/feature/news_feed/domain/entities/post_list_entity.dart';

// class CommentListModel extends Comment {
//   CommentListModel({
//     required id,
//     required user,
//     required text,
//     required child,
//   }) : super(
//           id: id,
//           user: user,
//           text: text,
//           child: child,
//         );

//   factory CommentListModel.fromJson(Map<String, dynamic> json) =>
//       CommentListModel(
//         id: json["id"],
//         user: json["user"],
//         text: json["text"],
//         child: json["child"] == null
//             ? []
//             : json["child"] == null
//                 ? []
//                 : List<Comment?>.from(
//                     json["child"]!.map((x) => CommentListModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user": user,
//         "text": text,
//         "child": child == null
//             ? []
//             : child == null
//                 ? []
//                 : List<dynamic>.from(child!.map((x) => x!)),
//       };
// }
