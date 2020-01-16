class BannerAdEntity {
	String image;
	List<BannerAdDataLabellist> labelList;
	String dataType;
	String actionUrl;
	bool shade;
	String description;
	BannerAdDataHeader header;
	int id;
	BannerAdDataLabel label;
	String title;
	bool autoPlay;
	List<Null> adTrack;

	BannerAdEntity({this.image, this.labelList, this.dataType, this.actionUrl, this.shade, this.description, this.header, this.id, this.label, this.title, this.autoPlay, this.adTrack});

	BannerAdEntity.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		if (json['labelList'] != null) {
			labelList = new List<BannerAdDataLabellist>();(json['labelList'] as List).forEach((v) { labelList.add(new BannerAdDataLabellist.fromJson(v)); });
		}
		dataType = json['dataType'];
		actionUrl = json['actionUrl'];
		shade = json['shade'];
		description = json['description'];
		header = json['header'] != null ? new BannerAdDataHeader.fromJson(json['header']) : null;
		id = json['id'];
		label = json['label'] != null ? new BannerAdDataLabel.fromJson(json['label']) : null;
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
      data['labelList'] =  this.labelList.map((v) => v.toJson()).toList();
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

class BannerAdDataLabellist {
	dynamic actionUrl;
	String text;

	BannerAdDataLabellist({this.actionUrl, this.text});

	BannerAdDataLabellist.fromJson(Map<String, dynamic> json) {
		actionUrl = json['actionUrl'];
		text = json['text'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['actionUrl'] = this.actionUrl;
		data['text'] = this.text;
		return data;
	}
}

class BannerAdDataHeader {
	String textAlign;
	dynamic subTitleFont;
	dynamic actionUrl;
	String icon;
	String description;
	dynamic label;
	String title;
	dynamic cover;
	dynamic rightText;
	dynamic labelList;
	dynamic subTitle;
	int id;
	dynamic font;

	BannerAdDataHeader({this.textAlign, this.subTitleFont, this.actionUrl, this.icon, this.description, this.label, this.title, this.cover, this.rightText, this.labelList, this.subTitle, this.id, this.font});

	BannerAdDataHeader.fromJson(Map<String, dynamic> json) {
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

class BannerAdDataLabel {
	String text;
	dynamic detail;
	String card;

	BannerAdDataLabel({this.text, this.detail, this.card});

	BannerAdDataLabel.fromJson(Map<String, dynamic> json) {
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
