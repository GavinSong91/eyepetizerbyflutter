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
	String dataType;
	CommuntiyRecommendItemlistDataHeader header;
	CommuntiyRecommendItemlistDataContent content;
	dynamic adTrack;

	CommuntiyRecommendItemlistData({this.dataType, this.header, this.content, this.adTrack});

	CommuntiyRecommendItemlistData.fromJson(Map<String, dynamic> json) {
		dataType = json['dataType'];
		header = json['header'] != null ? new CommuntiyRecommendItemlistDataHeader.fromJson(json['header']) : null;
		content = json['content'] != null ? new CommuntiyRecommendItemlistDataContent.fromJson(json['content']) : null;
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dataType'] = this.dataType;
		if (this.header != null) {
      data['header'] = this.header.toJson();
    }
		if (this.content != null) {
      data['content'] = this.content.toJson();
    }
		data['adTrack'] = this.adTrack;
		return data;
	}
}

class CommuntiyRecommendItemlistDataHeader {
	dynamic labelList;
	int tagId;
	String followType;
	String issuerName;
	String iconType;
	String actionUrl;
	String icon;
	bool showHateVideo;
	int id;
	int time;
	dynamic tagName;
	bool topShow;

	CommuntiyRecommendItemlistDataHeader({this.labelList, this.tagId, this.followType, this.issuerName, this.iconType, this.actionUrl, this.icon, this.showHateVideo, this.id, this.time, this.tagName, this.topShow});

	CommuntiyRecommendItemlistDataHeader.fromJson(Map<String, dynamic> json) {
		labelList = json['labelList'];
		tagId = json['tagId'];
		followType = json['followType'];
		issuerName = json['issuerName'];
		iconType = json['iconType'];
		actionUrl = json['actionUrl'];
		icon = json['icon'];
		showHateVideo = json['showHateVideo'];
		id = json['id'];
		time = json['time'];
		tagName = json['tagName'];
		topShow = json['topShow'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['labelList'] = this.labelList;
		data['tagId'] = this.tagId;
		data['followType'] = this.followType;
		data['issuerName'] = this.issuerName;
		data['iconType'] = this.iconType;
		data['actionUrl'] = this.actionUrl;
		data['icon'] = this.icon;
		data['showHateVideo'] = this.showHateVideo;
		data['id'] = this.id;
		data['time'] = this.time;
		data['tagName'] = this.tagName;
		data['topShow'] = this.topShow;
		return data;
	}
}

class CommuntiyRecommendItemlistDataContent {
	CommuntiyRecommendItemlistDataContentData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	CommuntiyRecommendItemlistDataContent({this.data, this.adIndex, this.tag, this.id, this.type});

	CommuntiyRecommendItemlistDataContent.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new CommuntiyRecommendItemlistDataContentData.fromJson(json['data']) : null;
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

class CommuntiyRecommendItemlistDataContentData {
	int releaseTime;
	String city;
	int latitude;
	String description;
	bool collected;
	String title;
	bool addWatermark;
	CommuntiyRecommendItemlistDataContentDataCover cover;
	int uid;
	String checkStatus;
	List<String> urls;
	String xLibrary;
	int id;
	String validateResult;
	int longitude;
	int height;
	CommuntiyRecommendItemlistDataContentDataOwner owner;
	String area;
	dynamic selectedTime;
	List<String> urlsWithWatermark;
	String validateStatus;
	String dataType;
	bool ifMock;
	CommuntiyRecommendItemlistDataContentDataConsumption consumption;
	int updateTime;
	bool reallyCollected;
	String url;
	List<CommuntiyRecommandItemlistDataContentDataTags> tags;
	int createTime;
	dynamic recentOnceReply;
	dynamic privateMessageActionUrl;
	int width;
	String resourceType;
	int status;

	CommuntiyRecommendItemlistDataContentData({this.releaseTime, this.city, this.latitude, this.description, this.collected, this.title, this.addWatermark, this.cover, this.uid, this.checkStatus, this.urls, this.xLibrary, this.id, this.validateResult, this.longitude, this.height, this.owner, this.area, this.selectedTime, this.urlsWithWatermark, this.validateStatus, this.dataType, this.ifMock, this.consumption, this.updateTime, this.reallyCollected, this.url, this.tags, this.createTime, this.recentOnceReply, this.privateMessageActionUrl, this.width, this.resourceType, this.status});

	CommuntiyRecommendItemlistDataContentData.fromJson(Map<String, dynamic> json) {
		releaseTime = json['releaseTime'];
		city = json['city'];
		latitude = json['latitude'];
		description = json['description'];
		collected = json['collected'];
		title = json['title'];
		addWatermark = json['addWatermark'];
		cover = json['cover'] != null ? new CommuntiyRecommendItemlistDataContentDataCover.fromJson(json['cover']) : null;
		uid = json['uid'];
		checkStatus = json['checkStatus'];
		urls = json['urls']?.cast<String>();
		xLibrary = json['library'];
		id = json['id'];
		validateResult = json['validateResult'];
		longitude = json['longitude'];
		height = json['height'];
		owner = json['owner'] != null ? new CommuntiyRecommendItemlistDataContentDataOwner.fromJson(json['owner']) : null;
		area = json['area'];
		selectedTime = json['selectedTime'];
		urlsWithWatermark = json['urlsWithWatermark']?.cast<String>();
		validateStatus = json['validateStatus'];
		dataType = json['dataType'];
		ifMock = json['ifMock'];
		consumption = json['consumption'] != null ? new CommuntiyRecommendItemlistDataContentDataConsumption.fromJson(json['consumption']) : null;
		updateTime = json['updateTime'];
		reallyCollected = json['reallyCollected'];
		url = json['url'];
		if (json['tags'] != null) {
			tags = new List<CommuntiyRecommandItemlistDataContentDataTags>();(json['tags'] as List).forEach((v) { tags.add(new CommuntiyRecommandItemlistDataContentDataTags.fromJson(v)); });
		}
		createTime = json['createTime'];
		recentOnceReply = json['recentOnceReply'];
		privateMessageActionUrl = json['privateMessageActionUrl'];
		width = json['width'];
		resourceType = json['resourceType'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['releaseTime'] = this.releaseTime;
		data['city'] = this.city;
		data['latitude'] = this.latitude;
		data['description'] = this.description;
		data['collected'] = this.collected;
		data['title'] = this.title;
		data['addWatermark'] = this.addWatermark;
		if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
		data['uid'] = this.uid;
		data['checkStatus'] = this.checkStatus;
		data['urls'] = this.urls;
		data['library'] = this.xLibrary;
		data['id'] = this.id;
		data['validateResult'] = this.validateResult;
		data['longitude'] = this.longitude;
		data['height'] = this.height;
		if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
		data['area'] = this.area;
		data['selectedTime'] = this.selectedTime;
		data['urlsWithWatermark'] = this.urlsWithWatermark;
		data['validateStatus'] = this.validateStatus;
		data['dataType'] = this.dataType;
		data['ifMock'] = this.ifMock;
		if (this.consumption != null) {
      data['consumption'] = this.consumption.toJson();
    }
		data['updateTime'] = this.updateTime;
		data['reallyCollected'] = this.reallyCollected;
		data['url'] = this.url;
		if (this.tags != null) {
      data['tags'] =  this.tags.map((v) => v.toJson()).toList();
    }
		data['createTime'] = this.createTime;
		data['recentOnceReply'] = this.recentOnceReply;
		data['privateMessageActionUrl'] = this.privateMessageActionUrl;
		data['width'] = this.width;
		data['resourceType'] = this.resourceType;
		data['status'] = this.status;
		return data;
	}
}

class CommuntiyRecommendItemlistDataContentDataCover {
	String feed;
	String detail;
	dynamic sharing;
	dynamic blurred;
	dynamic homepage;

	CommuntiyRecommendItemlistDataContentDataCover({this.feed, this.detail, this.sharing, this.blurred, this.homepage});

	CommuntiyRecommendItemlistDataContentDataCover.fromJson(Map<String, dynamic> json) {
		feed = json['feed'];
		detail = json['detail'];
		sharing = json['sharing'];
		blurred = json['blurred'];
		homepage = json['homepage'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['feed'] = this.feed;
		data['detail'] = this.detail;
		data['sharing'] = this.sharing;
		data['blurred'] = this.blurred;
		data['homepage'] = this.homepage;
		return data;
	}
}

class CommuntiyRecommendItemlistDataContentDataOwner {
	dynamic area;
	dynamic birthday;
	dynamic country;
	bool expert;
	bool limitVideoOpen;
	String gender;
	int releaseDate;
	dynamic city;
	dynamic university;
	String actionUrl;
	String description;
	String avatar;
	bool followed;
	String cover;
	int uid;
	String xLibrary;
	String nickname;
	bool ifPgc;
	String userType;
	dynamic job;
	int registDate;

	CommuntiyRecommendItemlistDataContentDataOwner({this.area, this.birthday, this.country, this.expert, this.limitVideoOpen, this.gender, this.releaseDate, this.city, this.university, this.actionUrl, this.description, this.avatar, this.followed, this.cover, this.uid, this.xLibrary, this.nickname, this.ifPgc, this.userType, this.job, this.registDate});

	CommuntiyRecommendItemlistDataContentDataOwner.fromJson(Map<String, dynamic> json) {
		area = json['area'];
		birthday = json['birthday'];
		country = json['country'];
		expert = json['expert'];
		limitVideoOpen = json['limitVideoOpen'];
		gender = json['gender'];
		releaseDate = json['releaseDate'];
		city = json['city'];
		university = json['university'];
		actionUrl = json['actionUrl'];
		description = json['description'];
		avatar = json['avatar'];
		followed = json['followed'];
		cover = json['cover'];
		uid = json['uid'];
		xLibrary = json['library'];
		nickname = json['nickname'];
		ifPgc = json['ifPgc'];
		userType = json['userType'];
		job = json['job'];
		registDate = json['registDate'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['area'] = this.area;
		data['birthday'] = this.birthday;
		data['country'] = this.country;
		data['expert'] = this.expert;
		data['limitVideoOpen'] = this.limitVideoOpen;
		data['gender'] = this.gender;
		data['releaseDate'] = this.releaseDate;
		data['city'] = this.city;
		data['university'] = this.university;
		data['actionUrl'] = this.actionUrl;
		data['description'] = this.description;
		data['avatar'] = this.avatar;
		data['followed'] = this.followed;
		data['cover'] = this.cover;
		data['uid'] = this.uid;
		data['library'] = this.xLibrary;
		data['nickname'] = this.nickname;
		data['ifPgc'] = this.ifPgc;
		data['userType'] = this.userType;
		data['job'] = this.job;
		data['registDate'] = this.registDate;
		return data;
	}
}

class CommuntiyRecommendItemlistDataContentDataConsumption {
	int shareCount;
	int replyCount;
	int realCollectionCount;
	int collectionCount;

	CommuntiyRecommendItemlistDataContentDataConsumption({this.shareCount, this.replyCount, this.realCollectionCount, this.collectionCount});

	CommuntiyRecommendItemlistDataContentDataConsumption.fromJson(Map<String, dynamic> json) {
		shareCount = json['shareCount'];
		replyCount = json['replyCount'];
		realCollectionCount = json['realCollectionCount'];
		collectionCount = json['collectionCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['shareCount'] = this.shareCount;
		data['replyCount'] = this.replyCount;
		data['realCollectionCount'] = this.realCollectionCount;
		data['collectionCount'] = this.collectionCount;
		return data;
	}
}

class CommuntiyRecommandItemlistDataContentDataTags {
	String actionUrl;
	dynamic childTagList;
	String bgPicture;
	bool haveReward;
	dynamic childTagIdList;
	String tagRecType;
	bool ifNewest;
	String headerImage;
	String name;
	int communityIndex;
	int id;
	dynamic adTrack;
	String desc;
	dynamic newestEndTime;

	CommuntiyRecommandItemlistDataContentDataTags({this.actionUrl, this.childTagList, this.bgPicture, this.haveReward, this.childTagIdList, this.tagRecType, this.ifNewest, this.headerImage, this.name, this.communityIndex, this.id, this.adTrack, this.desc, this.newestEndTime});

	CommuntiyRecommandItemlistDataContentDataTags.fromJson(Map<String, dynamic> json) {
		actionUrl = json['actionUrl'];
		childTagList = json['childTagList'];
		bgPicture = json['bgPicture'];
		haveReward = json['haveReward'];
		childTagIdList = json['childTagIdList'];
		tagRecType = json['tagRecType'];
		ifNewest = json['ifNewest'];
		headerImage = json['headerImage'];
		name = json['name'];
		communityIndex = json['communityIndex'];
		id = json['id'];
		adTrack = json['adTrack'];
		desc = json['desc'];
		newestEndTime = json['newestEndTime'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['actionUrl'] = this.actionUrl;
		data['childTagList'] = this.childTagList;
		data['bgPicture'] = this.bgPicture;
		data['haveReward'] = this.haveReward;
		data['childTagIdList'] = this.childTagIdList;
		data['tagRecType'] = this.tagRecType;
		data['ifNewest'] = this.ifNewest;
		data['headerImage'] = this.headerImage;
		data['name'] = this.name;
		data['communityIndex'] = this.communityIndex;
		data['id'] = this.id;
		data['adTrack'] = this.adTrack;
		data['desc'] = this.desc;
		data['newestEndTime'] = this.newestEndTime;
		return data;
	}
}
