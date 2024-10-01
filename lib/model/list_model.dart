class ListModel {
  final String? title;
  final DateTime? date;
  final String? description;

  ListModel(
      {this.title,
      this.date,
      this.description,
      });


  // factory ListModel.fromJson(Map<String, dynamic> json) {
  //   return ListModel(
  //     title: json['title'] as String?,
  //     date: json['date'] as String?,
  //     description: json['description'] as String?
  //   );
  // }
}