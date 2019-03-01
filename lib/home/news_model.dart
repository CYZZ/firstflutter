class NewsModel {
  final String date;
  final List stories;
  final List topStories;
  const NewsModel({this.date, this.stories, this.topStories});
}

class NewsStoriesModel {
//  {
//  images: [
//  "https://pic2.zhimg.com/v2-49d091d1f4613a94e028fdc31b0fd7dd.jpg"
//  ],
//  type: 0,
//  id: 9708120,
//  ga_prefix: "022809",
//  title: "在职场不吃回头草，那回头草莓味冰淇淋呢？"
//},
  static const int itemTypeNormal = 0;
  static const int itemTypeBanner = 1;
  static const int itemTypeDate = 2;
  static const int itemTypeEditor = 3;

  final List images;
  final int type;
  final int id;
  final String title;

  int itemType = itemTypeNormal;
  String curDate;
  NewsStoriesModel({this.images, this.type, this.id, this.title});

  setItemType(int type) {
    itemType = type;
  }

  setCurDate(DateTime dt){

  }
  NewsStoriesModel.fromJson(Map<String, dynamic> json)
      : images = json['images'],
        type = json['type'],
        id = json['id'],
        title = json['title'];

}

class NewsTopStoriesModel {
//  {
//  image: "https://pic1.zhimg.com/v2-8b4ed8b534a72d16aad77b1e4d6db040.jpg",
//  type: 0,
//  id: 9708256,
//  ga_prefix: "022807",
//  title: "星巴克的「圣杯战争」"
//},
  final String image;
  final int type;
  final int id;
  final String title;

  const NewsTopStoriesModel({this.image, this.type, this.id, this.title});

  NewsTopStoriesModel.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        type = json['type'],
        id = json['id'],
        title = json['title'];
}


class BaseModel<T>{

  final int code;

  final String errorMsg;

  final  T data;

  const BaseModel({this.code, this.errorMsg, this.data});

}
