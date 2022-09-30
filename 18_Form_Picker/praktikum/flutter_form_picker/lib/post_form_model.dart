import 'package:flutter_form_picker/dbhelper.dart';

class PostFormModel {
  int? id;
  String? coverImagePath;
  String? publishDate;
  int? colorThemeValue;
  String? caption;

  PostFormModel(this.id, this.coverImagePath, this.publishDate,
      this.colorThemeValue, this.caption);

  PostFormModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    coverImagePath = map['coverImagePath'];
    publishDate = map['publishDate'];
    colorThemeValue = map['colorThemeValue'];
    caption = map['caption'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnCoverImagePath: coverImagePath,
      DatabaseHelper.columnPublishDate: publishDate,
      DatabaseHelper.columnColorThemeValue: colorThemeValue,
      DatabaseHelper.columnCaption: caption
    };
  }
}
