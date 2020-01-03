import 'itemlist_entity.dart';

class Datas {
  bool adExist;
  int total;
  String nextPageUrl;
  int count;
  List<ItemlistEntity> itemList;

  Datas(
      {this.adExist, this.total, this.nextPageUrl, this.count, this.itemList});

  Datas.fromJson(Map<String, dynamic> json) {
    adExist = json['adExist'];
    total = json['total'];
    nextPageUrl = json['nextPageUrl'];
    count = json['count'];
    if (json['itemList'] != null) {
      itemList = new List<ItemlistEntity>();
      (json['itemList'] as List).forEach((v) {
        itemList.add(new ItemlistEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adExist'] = this.adExist;
    data['total'] = this.total;
    data['nextPageUrl'] = this.nextPageUrl;
    data['count'] = this.count;
    if (this.itemList != null) {
      data['itemList'] = this.itemList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
