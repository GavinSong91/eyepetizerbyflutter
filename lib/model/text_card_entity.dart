class TextCardEntity {
	dynamic subTitle;
	String dataType;
	dynamic actionUrl;
	int id;
	String text;
	String type;
	dynamic follow;
	dynamic adTrack;

	TextCardEntity({this.subTitle, this.dataType, this.actionUrl, this.id, this.text, this.type, this.follow, this.adTrack});

	TextCardEntity.fromJson(Map<String, dynamic> json) {
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
