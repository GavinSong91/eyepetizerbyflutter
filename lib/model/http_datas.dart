
class HttpDatas {
  bool adExist;
  int total;
  String nextPageUrl;
  int count;
  dynamic itemList;

  HttpDatas(
      {this.adExist, this.total, this.nextPageUrl, this.count, this.itemList});

  HttpDatas.fromJson(Map<String, dynamic> json) {
    adExist = json['adExist'];
    total = json['total'];
    nextPageUrl = json['nextPageUrl'];
    count = json['count'];
    itemList = json['itemList'];
  }
}
