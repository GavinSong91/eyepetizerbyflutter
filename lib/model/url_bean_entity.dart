class UrlBeanEntity {
	List<UrlBeanResult> result;

	UrlBeanEntity({this.result});

	UrlBeanEntity.fromJson(Map<String, dynamic> json) {
		if (json['result'] != null) {
			result = new List<UrlBeanResult>();(json['result'] as List).forEach((v) { result.add(new UrlBeanResult.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.result != null) {
      data['result'] =  this.result.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class UrlBeanResult {
	int nameType;
	String apiUrl;
	String name;
	int tabType;
	int id;
	dynamic adTrack;

	UrlBeanResult({this.nameType, this.apiUrl, this.name, this.tabType, this.id, this.adTrack});

	UrlBeanResult.fromJson(Map<String, dynamic> json) {
		nameType = json['nameType'];
		apiUrl = json['apiUrl'];
		name = json['name'];
		tabType = json['tabType'];
		id = json['id'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nameType'] = this.nameType;
		data['apiUrl'] = this.apiUrl;
		data['name'] = this.name;
		data['tabType'] = this.tabType;
		data['id'] = this.id;
		data['adTrack'] = this.adTrack;
		return data;
	}
}
