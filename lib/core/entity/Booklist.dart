import 'PublishedDate.dart';

class Booklist {
  Booklist({
      this.title,
      this.isbn, 
      this.pageCount, 
      this.publishedDate, 
      this.thumbnailUrl, 
      this.shortDescription, 
      this.longDescription, 
      this.status, 
      this.authors, 
      this.categories,});

  Booklist.fromJson(dynamic json) {
    title = json['title'];
    isbn = json['isbn'];
    pageCount = json['pageCount'];
    publishedDate = json['publishedDate'] != null ? PublishedDate.fromJson(json['publishedDate']) : null;
    thumbnailUrl = json['thumbnailUrl'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    status = json['status'];
    authors = json['authors'] != null ? json['authors'].cast<String>() : [];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
  }
  String? title;
  String? isbn;
  int? pageCount;
  PublishedDate? publishedDate;
  String? thumbnailUrl;
  String? shortDescription;
  String? longDescription;
  String? status;
  List<String>? authors;
  List<String>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['isbn'] = isbn;
    map['pageCount'] = pageCount;
    if (publishedDate != null) {
      map['publishedDate'] = publishedDate!.toJson();
    }
    map['thumbnailUrl'] = thumbnailUrl;
    map['shortDescription'] = shortDescription;
    map['longDescription'] = longDescription;
    map['status'] = status;
    map['authors'] = authors;
    map['categories'] = categories;
    return map;
  }

}