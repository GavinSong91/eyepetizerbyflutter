class ThematicPlanningEntity {
	dynamic footer;
	String dataType;
	int count;
	ThematicPlanningDataHeader header;
	List<ThematicPlanningDataItemlist> itemList;
	dynamic adTrack;

	ThematicPlanningEntity({this.footer, this.dataType, this.count, this.header, this.itemList, this.adTrack});

	ThematicPlanningEntity.fromJson(Map<String, dynamic> json) {
		footer = json['footer'];
		dataType = json['dataType'];
		count = json['count'];
		header = json['header'] != null ? new ThematicPlanningDataHeader.fromJson(json['header']) : null;
		if (json['itemList'] != null) {
			itemList = new List<ThematicPlanningDataItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new ThematicPlanningDataItemlist.fromJson(v)); });
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

class ThematicPlanningDataHeader {
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

	ThematicPlanningDataHeader({this.cover, this.rightText, this.labelList, this.subTitle, this.textAlign, this.subTitleFont, this.actionUrl, this.id, this.label, this.title, this.font});

	ThematicPlanningDataHeader.fromJson(Map<String, dynamic> json) {
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

class ThematicPlanningDataItemlist {
	ThematicPlanningDataItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	ThematicPlanningDataItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	ThematicPlanningDataItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ThematicPlanningDataItemlistData.fromJson(json['data']) : null;
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

class ThematicPlanningDataItemlistData {
	String image;
	List<Null> labelList;
	String dataType;
	String actionUrl;
	bool shade;
	String description;
	dynamic header;
	int id;
	ThematicPlanningDataItemlistDataLabel label;
	String title;
	bool autoPlay;
	List<Null> adTrack;

	ThematicPlanningDataItemlistData({this.image, this.labelList, this.dataType, this.actionUrl, this.shade, this.description, this.header, this.id, this.label, this.title, this.autoPlay, this.adTrack});

	ThematicPlanningDataItemlistData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		if (json['labelList'] != null) {
			labelList = new List<Null>();
		}
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		shade = json['shade'];
		description = json['description'];
		header = json['header'];
		id = json['id'];
		label = json['label'] != null ? new ThematicPlanningDataItemlistDataLabel.fromJson(json['label']) : null;
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
		data['header'] = this.header;
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

class ThematicPlanningDataItemlistDataLabel {
	String text;
	dynamic detail;
	String card;

	ThematicPlanningDataItemlistDataLabel({this.text, this.detail, this.card});

	ThematicPlanningDataItemlistDataLabel.fromJson(Map<String, dynamic> json) {
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
