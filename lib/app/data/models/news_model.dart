class News {
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? source;
  dynamic image;
  String? category;
  String? language;
  String? country;
  String? publishedAt;

  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.source,
      this.image,
      this.category,
      this.language,
      this.country,
      this.publishedAt});

  News.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    source = json['source'];
    image = json['image'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
    publishedAt = json['published_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['source'] = source;
    data['image'] = image;
    data['category'] = category;
    data['language'] = language;
    data['country'] = country;
    data['published_at'] = publishedAt;
    return data;
  }
}
