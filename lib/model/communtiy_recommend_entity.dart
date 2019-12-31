class CommuntiyRecommendEntity {
	bool adExist;
	int total;
	String nextPageUrl;
	int count;
	List<CommuntiyRecommandItemlist> itemList;

	CommuntiyRecommendEntity({this.adExist, this.total, this.nextPageUrl, this.count, this.itemList});

	CommuntiyRecommendEntity.fromJson(Map<String, dynamic> json) {
		adExist = json['adExist'];
		total = json['total'];
		nextPageUrl = json['nextPageUrl'];
		count = json['count'];
		if (json['itemList'] != null) {
			itemList = new List<CommuntiyRecommandItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new CommuntiyRecommandItemlist.fromJson(v)); });
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

class CommuntiyRecommandItemlist {
	CommuntiyRecommendItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	CommuntiyRecommandItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	CommuntiyRecommandItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new CommuntiyRecommendItemlistData.fromJson(json['data']) : null;
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

class CommuntiyRecommendItemlistData {
	dynamic footer;
	String dataType;
	int count;
	CommuntiyRecommendItemlistDataHeader header;
	List<CommuntiyRecommandItemlistDataItemlist> itemList;
	dynamic adTrack;

	CommuntiyRecommendItemlistData({this.footer, this.dataType, this.count, this.header, this.itemList, this.adTrack});

	CommuntiyRecommendItemlistData.fromJson(Map<String, dynamic> json) {
		footer = json['footer'];
		dataType = json['dataType'];
		count = json['count'];
		header = json['header'] != null ? new CommuntiyRecommendItemlistDataHeader.fromJson(json['header']) : null;
		if (json['itemList'] != null) {
			itemList = new List<CommuntiyRecommandItemlistDataItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new CommuntiyRecommandItemlistDataItemlist.fromJson(v)); });
		}
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['footer'] = this.footer;
		data['dataType'] = this.dataType;
		data['count'] = this.count;
		if (this.header != null) {
      data['header'] = this.header.toJson();
    }
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		data['adTrack'] = this.adTrack;
		return data;
	}
}

class CommuntiyRecommendItemlistDataHeader {
	dynamic cover;
	dynamic rightText;
	dynamic labelList;
	dynamic subTitle;
	String textAlign;
	dynamic subTitleFont;
	String actionUrl;
	int id;
	dynamic label;
	String title;
	String font;

	CommuntiyRecommendItemlistDataHeader({this.cover, this.rightText, this.labelList, this.subTitle, this.textAlign, this.subTitleFont, this.actionUrl, this.id, this.label, this.title, this.font});

	CommuntiyRecommendItemlistDataHeader.fromJson(Map<String, dynamic> json) {
		cover = json['cover'];
		rightText = json['rightText'];
		labelList = json['labelList'];
		subTitle = json['subTitle'];
		textAlign = json['textAlign'];
		subTitleFont = json['subTitleFont'];
		actionUrl = json['actionUrl'];
		id = json['id'];
		label = json['label'];
		title = json['title'];
		font = json['font'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cover'] = this.cover;
		data['rightText'] = this.rightText;
		data['labelList'] = this.labelList;
		data['subTitle'] = this.subTitle;
		data['textAlign'] = this.textAlign;
		data['subTitleFont'] = this.subTitleFont;
		data['actionUrl'] = this.actionUrl;
		data['id'] = this.id;
		data['label'] = this.label;
		data['title'] = this.title;
		data['font'] = this.font;
		return data;
	}
}

class CommuntiyRecommandItemlistDataItemlist {
	CommuntiyRecommendItemlistDataItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	CommuntiyRecommandItemlistDataItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	CommuntiyRecommandItemlistDataItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new CommuntiyRecommendItemlistDataItemlistData.fromJson(json['data']) : null;
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

class CommuntiyRecommendItemlistDataItemlistData {
	String image;
	List<Null> labelList;
	String dataType;
	String actionUrl;
	bool shade;
	String description;
	CommuntiyRecommendItemlistDataItemlistDataHeader header;
	int id;
	CommuntiyRecommendItemlistDataItemlistDataLabel label;
	String title;
	bool autoPlay;
	List<Null> adTrack;

	CommuntiyRecommendItemlistDataItemlistData({this.image, this.labelList, this.dataType, this.actionUrl, this.shade, this.description, this.header, this.id, this.label, this.title, this.autoPlay, this.adTrack});

	CommuntiyRecommendItemlistDataItemlistData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		if (json['labelList'] != null) {
			labelList = new List<Null>();
		}
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		shade = json['shade'];
		description = json['description'];
		header = json['header'] != null ? new CommuntiyRecommendItemlistDataItemlistDataHeader.fromJson(json['header']) : null;
		id = json['id'];
		label = json['label'] != null ? new CommuntiyRecommendItemlistDataItemlistDataLabel.fromJson(json['label']) : null;
		title = json['title'];
		autoPlay = json['autoPlay'];
		if (json['adTrack'] != null) {
			adTrack = new List<Null>();
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		if (this.labelList != null) {
      data['labelList'] =  [];
    }
		data['dataType'] = this.dataType;
		data['actionUrl'] = this.actionUrl;
		data['shade'] = this.shade;
		data['description'] = this.description;
		if (this.header != null) {
      data['header'] = this.header.toJson();
    }
		data['id'] = this.id;
		if (this.label != null) {
      data['label'] = this.label.toJson();
    }
		data['title'] = this.title;
		data['autoPlay'] = this.autoPlay;
		if (this.adTrack != null) {
      data['adTrack'] =  [];
    }
		return data;
	}
}

class CommuntiyRecommendItemlistDataItemlistDataHeader {
	String textAlign;
	dynamic subTitleFont;
	dynamic actionUrl;
	dynamic icon;
	dynamic description;
	dynamic label;
	dynamic title;
	dynamic cover;
	dynamic rightText;
	dynamic labelList;
	dynamic subTitle;
	int id;
	dynamic font;

	CommuntiyRecommendItemlistDataItemlistDataHeader({this.textAlign, this.subTitleFont, this.actionUrl, this.icon, this.description, this.label, this.title, this.cover, this.rightText, this.labelList, this.subTitle, this.id, this.font});

	CommuntiyRecommendItemlistDataItemlistDataHeader.fromJson(Map<String, dynamic> json) {
		textAlign = json['textAlign'];
		subTitleFont = json['subTitleFont'];
		actionUrl = json['actionUrl'];
		icon = json['icon'];
		description = json['description'];
		label = json['label'];
		title = json['title'];
		cover = json['cover'];
		rightText = json['rightText'];
		labelList = json['labelList'];
		subTitle = json['subTitle'];
		id = json['id'];
		font = json['font'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['textAlign'] = this.textAlign;
		data['subTitleFont'] = this.subTitleFont;
		data['actionUrl'] = this.actionUrl;
		data['icon'] = this.icon;
		data['description'] = this.description;
		data['label'] = this.label;
		data['title'] = this.title;
		data['cover'] = this.cover;
		data['rightText'] = this.rightText;
		data['labelList'] = this.labelList;
		data['subTitle'] = this.subTitle;
		data['id'] = this.id;
		data['font'] = this.font;
		return data;
	}
}

class CommuntiyRecommendItemlistDataItemlistDataLabel {
	String text;
	dynamic detail;
	String card;

	CommuntiyRecommendItemlistDataItemlistDataLabel({this.text, this.detail, this.card});

	CommuntiyRecommendItemlistDataItemlistDataLabel.fromJson(Map<String, dynamic> json) {
		text = json['text'];
		detail = json['detail'];
		card = json['card'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['text'] = this.text;
		data['detail'] = this.detail;
		data['card'] = this.card;
		return data;
	}
}
