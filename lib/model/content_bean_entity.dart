class ContentBeanEntity {
	bool adExist;
	int total;
	String nextPageUrl;
	int count;
	List<ContentBeanItemlist> itemList;

	ContentBeanEntity({this.adExist, this.total, this.nextPageUrl, this.count, this.itemList});

	ContentBeanEntity.fromJson(Map<String, dynamic> json) {
		adExist = json['adExist'];
		total = json['total'];
		nextPageUrl = json['nextPageUrl'];
		count = json['count'];
		if (json['itemList'] != null) {
			itemList = new List<ContentBeanItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new ContentBeanItemlist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['adExist'] = this.adExist;
		data['total'] = this.total;
		data['nextPageUrl'] = this.nextPageUrl;
		data['count'] = this.count;
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ContentBeanItemlist {
	ContentBeanItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	ContentBeanItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	ContentBeanItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ContentBeanItemlistData.fromJson(json['data']) : null;
		adIndex = json['adIndex'];
		tag = json['tag'];
		id = json['id'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['adIndex'] = this.adIndex;
		data['tag'] = this.tag;
		data['id'] = this.id;
		data['type'] = this.type;
		return data;
	}
}

class ContentBeanItemlistData {
	dynamic subTitle;
	String dataType;
	dynamic actionUrl;
	int id;
	String image;
	String text;
	String type;
	dynamic follow;
	dynamic adTrack;
	List<ContentBeanItemlist> itemList;

	ContentBeanItemlistData({this.subTitle, this.dataType, this.actionUrl, this.id, this.text, this.type, this.follow, this.adTrack});

	ContentBeanItemlistData.fromJson(Map<String, dynamic> json) {
		subTitle = json['subTitle'];
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		id = json['id'];
		text = json['text'];
		type = json['type'];
		follow = json['follow'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['subTitle'] = this.subTitle;
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['id'] = this.id;
		data['text'] = this.text;
		data['type'] = this.type;
		data['follow'] = this.follow;
		data['adTrack'] = this.adTrack;
		return data;
	}
}
