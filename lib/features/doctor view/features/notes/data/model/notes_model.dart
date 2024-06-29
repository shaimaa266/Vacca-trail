import '../../../../../display view/cow_data/data/model/cows_model.dart';

class NoteModel {
  final int  id;

  final String  ?noteId;
  final int ?cowId;
  final String ?createdAt;
  final String? updatedAt;
  final int  ?isStarred;
  final String ?title;
  final String ?body;
  final String? image;
  final List<CowModel>? cow;
  NoteModel(
      {required this.title,
      required this.body,
      required this.image,
      required this.id,
      required this.cow,
      required this.cowId,
      required this.updatedAt,
      required this.createdAt,
      required this.isStarred,
      required this.noteId});
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    var cowsList = json['cows'] as List? ?? [];
    List<CowModel>? cows = cowsList.map((i) => CowModel.fromJson(i)).toList();
    return NoteModel(
        title: json['title'],
        body: json['body'],
        image: json['image'],
        id: json['id'],
        cow: cows,
        cowId: json['cow_id'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
        isStarred: json['is_starred'],
        noteId: json['note_id']);
  }
  NoteModel copyWith({
    int? isStarred,
  }) {
    return NoteModel(
      id: id,
      noteId: noteId,
      cowId: cowId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isStarred: isStarred??this.isStarred,
      title: title,
      body: body,
      image: image,
      cow: cow,
    );
  }
}
