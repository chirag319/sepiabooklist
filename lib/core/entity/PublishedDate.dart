class PublishedDate {
  PublishedDate({
      this.date,});

  PublishedDate.fromJson(dynamic json) {
    date = json['$date'];
  }
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$date'] = date;
    return map;
  }

}