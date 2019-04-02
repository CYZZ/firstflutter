import 'dart:convert' show json;

class ZhiHuNews {
  String date;
  List<Stories> stories;
  List<TopStories> top_stories;

  ZhiHuNews.fromParams({this.date, this.stories, this.top_stories});

  factory ZhiHuNews(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ZhiHuNews.fromJson(json.decode(jsonStr))
          : new ZhiHuNews.fromJson(jsonStr);

  ZhiHuNews.fromJson(jsonRes) {
    date = jsonRes['date'];
    stories = jsonRes['stories'] == null ? null : [];

    for (var storiesItem in stories == null ? [] : jsonRes['stories']) {
      stories
          .add(storiesItem == null ? null : new Stories.fromJson(storiesItem));
    }

    top_stories = jsonRes['top_stories'] == null ? null : [];

    for (var top_storiesItem
        in top_stories == null ? [] : jsonRes['top_stories']) {
      top_stories.add(top_storiesItem == null
          ? null
          : new TopStories.fromJson(top_storiesItem));
    }
  }

  @override
  String toString() {
    return '{"date": ${date != null ? '${json.encode(date)}' : 'null'},"stories": $stories,"top_stories": $top_stories}';
  }
}

class TopStories {
  int id;
  int type;
  String ga_prefix;
  String image;
  String title;

  TopStories.fromParams(
      {this.id, this.type, this.ga_prefix, this.image, this.title});

  TopStories.fromJson(jsonRes) {
    id = jsonRes['id'];
    type = jsonRes['type'];
    ga_prefix = jsonRes['ga_prefix'];
    image = jsonRes['image'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"id": $id,"type": $type,"ga_prefix": ${ga_prefix != null ? '${json.encode(ga_prefix)}' : 'null'},"image": ${image != null ? '${json.encode(image)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}

class Stories {
  int id;
  int type;
  String ga_prefix;
  String title;
  List<String> images;

  Stories.fromParams(
      {this.id, this.type, this.ga_prefix, this.title, this.images});

  Stories.fromJson(jsonRes) {
    id = jsonRes['id'];
    type = jsonRes['type'];
    ga_prefix = jsonRes['ga_prefix'];
    title = jsonRes['title'];
    images = jsonRes['images'] == null ? null : [];

    for (var imagesItem in images == null ? [] : jsonRes['images']) {
      if (imagesItem != null) {
        images.add(imagesItem);
      }
    }
  }

  @override
  String toString() {
    return '{"id": $id,"type": $type,"ga_prefix": ${ga_prefix != null ? '${json.encode(ga_prefix)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"images": $images}';
  }
}
