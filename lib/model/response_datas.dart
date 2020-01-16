class ResponseDatas {
  bool adExist;
  int total;
  String nextPageUrl;
  int count;
  List<ItemList> itemList;

  ResponseDatas(
      {this.adExist, this.total, this.nextPageUrl, this.count, this.itemList});

  ResponseDatas.fromJson(Map<String, dynamic> json) {
    adExist = json['adExist'];
    total = json['total'];
    nextPageUrl = json['nextPageUrl'];
    count = json['count'];
    if (json['itemList'] != null) {
      itemList = new List<ItemList>();
      (json['itemList'] as List).forEach((v) {
        itemList.add(new ItemList.fromJson(v));
      });
    }
  }
}

class ItemList {
  String type;
  dynamic data;
  dynamic tag;
  int id;
  int adIndex;

  ItemList({this.type, this.data, this.tag, this.id, this.adIndex});

  ItemList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'];
    tag = json['tag'];
    id = json['id'];
    adIndex = json['adIndex'];
  }
}
