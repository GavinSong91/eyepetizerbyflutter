
class HorizontalcardDataEntity {
	String dataType;
	int count;
	List<HorizontalcardDataDataItemlist> itemList;

	HorizontalcardDataEntity({this.dataType, this.count, this.itemList});

	HorizontalcardDataEntity.fromJson(Map<String, dynamic> json) {
		dataType = json['dataType'];
		count = json['count'];
		if (json['itemList'] != null) {
			itemList = new List<HorizontalcardDataDataItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new HorizontalcardDataDataItemlist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dataType'] = this.dataType;
		data['count'] = this.count;
		if (this.itemList != null) {
      data['itemList'] =  this.itemList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HorizontalcardDataDataItemlist {
	HorizontalcardDataDataItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	HorizontalcardDataDataItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	HorizontalcardDataDataItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new HorizontalcardDataDataItemlistData.fromJson(json['data']) : null;
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

class HorizontalcardDataDataItemlistData {
	String image;
	List<Null> labelList;
	String dataType;
	String actionUrl;
	bool shade;
	String description;
	HorizontalcardDataDataItemlistDataHeader header;
	int id;
	HorizontalcardDataDataItemlistDataLabel label;
	String title;
	bool autoPlay;
	List<Null> adTrack;

	HorizontalcardDataDataItemlistData({this.image, this.labelList, this.dataType, this.actionUrl, this.shade, this.description, this.header, this.id, this.label, this.title, this.autoPlay, this.adTrack});

	HorizontalcardDataDataItemlistData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		if (json['labelList'] != null) {
			labelList = new List<Null>();
		}
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		shade = json['shade'];
		description = json['description'];
		header = json['header'] != null ? new HorizontalcardDataDataItemlistDataHeader.fromJson(json['header']) : null;
		id = json['id'];
		label = json['label'] != null ? new HorizontalcardDataDataItemlistDataLabel.fromJson(json['label']) : null;
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

class HorizontalcardDataDataItemlistDataHeader {
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

	HorizontalcardDataDataItemlistDataHeader({this.textAlign, this.subTitleFont, this.actionUrl, this.icon, this.description, this.label, this.title, this.cover, this.rightText, this.labelList, this.subTitle, this.id, this.font});

	HorizontalcardDataDataItemlistDataHeader.fromJson(Map<String, dynamic> json) {
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

class HorizontalcardDataDataItemlistDataLabel {
	String text;
	dynamic detail;
	String card;

	HorizontalcardDataDataItemlistDataLabel({this.text, this.detail, this.card});

	HorizontalcardDataDataItemlistDataLabel.fromJson(Map<String, dynamic> json) {
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
