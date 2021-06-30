class Banner {
  int id;
  String imageUrl;
  int priority;

  Banner(this.id, this.imageUrl, this.priority);

  Banner.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['imageUrl'],
        priority = json['priority'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'priority': priority,
      };
}
