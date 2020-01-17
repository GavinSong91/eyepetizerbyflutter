class SearchVideoCardEntity {
	int date;
	dynamic shareAdTrack;
	int releaseTime;
	dynamic brandWebsiteInfo;
	String description;
	dynamic remark;
	bool collected;
	String title;
	String type;
	dynamic favoriteAdTrack;
	dynamic waterMarks;
	String playUrl;
	SearchVideoCardDataCover cover;
	int duration;
	String xLibrary;
	String descriptionEditor;
	SearchVideoCardDataProvider provider;
	int id;
	String descriptionPgc;
	String titlePgc;
	dynamic adTrack;
	List<Null> subtitles;
	bool ad;
	dynamic src;
	SearchVideoCardDataAuthor author;
	String dataType;
	int searchWeight;
	dynamic playlists;
	SearchVideoCardDataConsumption consumption;
	bool reallyCollected;
	dynamic label;
	bool played;
	List<SearchVideoCardDataTag> tags;
	dynamic webAdTrack;
	List<Null> labelList;
	dynamic lastViewTime;
	List<SearchVideoCardDataPlayinfo> playInfo;
	bool ifLimitVideo;
	SearchVideoCardDataWeburl webUrl;
	dynamic campaign;
	String category;
	int idx;
	dynamic slogan;
	dynamic thumbPlayUrl;
	String resourceType;
	dynamic promotion;

	SearchVideoCardEntity({this.date, this.shareAdTrack, this.releaseTime, this.brandWebsiteInfo, this.description, this.remark, this.collected, this.title, this.type, this.favoriteAdTrack, this.waterMarks, this.playUrl, this.cover, this.duration, this.xLibrary, this.descriptionEditor, this.provider, this.id, this.descriptionPgc, this.titlePgc, this.adTrack, this.subtitles, this.ad, this.src, this.author, this.dataType, this.searchWeight, this.playlists, this.consumption, this.reallyCollected, this.label, this.played, this.tags, this.webAdTrack, this.labelList, this.lastViewTime, this.playInfo, this.ifLimitVideo, this.webUrl, this.campaign, this.category, this.idx, this.slogan, this.thumbPlayUrl, this.resourceType, this.promotion});

	SearchVideoCardEntity.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		shareAdTrack = json['shareAdTrack'];
		releaseTime = json['releaseTime'];
		brandWebsiteInfo = json['brandWebsiteInfo'];
		description = json['description'];
		remark = json['remark'];
		collected = json['collected'];
		title = json['title'];
		type = json['type'];
		favoriteAdTrack = json['favoriteAdTrack'];
		waterMarks = json['waterMarks'];
		playUrl = json['playUrl'];
		cover = json['cover'] != null ? new SearchVideoCardDataCover.fromJson(json['cover']) : null;
		duration = json['duration'];
		xLibrary = json['library'];
		descriptionEditor = json['descriptionEditor'];
		provider = json['provider'] != null ? new SearchVideoCardDataProvider.fromJson(json['provider']) : null;
		id = json['id'];
		descriptionPgc = json['descriptionPgc'];
		titlePgc = json['titlePgc'];
		adTrack = json['adTrack'];
		if (json['subtitles'] != null) {
			subtitles = new List<Null>();
		}
		ad = json['ad'];
		src = json['src'];
		author = json['author'] != null ? new SearchVideoCardDataAuthor.fromJson(json['author']) : null;
		dataType = json['dataType'];
		searchWeight = json['searchWeight'];
		playlists = json['playlists'];
		consumption = json['consumption'] != null ? new SearchVideoCardDataConsumption.fromJson(json['consumption']) : null;
		reallyCollected = json['reallyCollected'];
		label = json['label'];
		played = json['played'];
		if (json['tags'] != null) {
			tags = new List<SearchVideoCardDataTag>();(json['tags'] as List).forEach((v) { tags.add(new SearchVideoCardDataTag.fromJson(v)); });
		}
		webAdTrack = json['webAdTrack'];
		if (json['labelList'] != null) {
			labelList = new List<Null>();
		}
		lastViewTime = json['lastViewTime'];
		if (json['playInfo'] != null) {
			playInfo = new List<SearchVideoCardDataPlayinfo>();(json['playInfo'] as List).forEach((v) { playInfo.add(new SearchVideoCardDataPlayinfo.fromJson(v)); });
		}
		ifLimitVideo = json['ifLimitVideo'];
		webUrl = json['webUrl'] != null ? new SearchVideoCardDataWeburl.fromJson(json['webUrl']) : null;
		campaign = json['campaign'];
		category = json['category'];
		idx = json['idx'];
		slogan = json['slogan'];
		thumbPlayUrl = json['thumbPlayUrl'];
		resourceType = json['resourceType'];
		promotion = json['promotion'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['shareAdTrack'] = this.shareAdTrack;
		data['releaseTime'] = this.releaseTime;
		data['brandWebsiteInfo'] = this.brandWebsiteInfo;
		data['description'] = this.description;
		data['remark'] = this.remark;
		data['collected'] = this.collected;
		data['title'] = this.title;
		data['type'] = this.type;
		data['favoriteAdTrack'] = this.favoriteAdTrack;
		data['waterMarks'] = this.waterMarks;
		data['playUrl'] = this.playUrl;
		if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
		data['duration'] = this.duration;
		data['library'] = this.xLibrary;
		data['descriptionEditor'] = this.descriptionEditor;
		if (this.provider != null) {
      data['provider'] = this.provider.toJson();
    }
		data['id'] = this.id;
		data['descriptionPgc'] = this.descriptionPgc;
		data['titlePgc'] = this.titlePgc;
		data['adTrack'] = this.adTrack;
		if (this.subtitles != null) {
      data['subtitles'] =  [];
    }
		data['ad'] = this.ad;
		data['src'] = this.src;
		if (this.author != null) {
      data['author'] = this.author.toJson();
    }
		data['dataType'] = this.dataType;
		data['searchWeight'] = this.searchWeight;
		data['playlists'] = this.playlists;
		if (this.consumption != null) {
      data['consumption'] = this.consumption.toJson();
    }
		data['reallyCollected'] = this.reallyCollected;
		data['label'] = this.label;
		data['played'] = this.played;
		if (this.tags != null) {
      data['tags'] =  this.tags.map((v) => v.toJson()).toList();
    }
		data['webAdTrack'] = this.webAdTrack;
		if (this.labelList != null) {
      data['labelList'] =  [];
    }
		data['lastViewTime'] = this.lastViewTime;
		if (this.playInfo != null) {
      data['playInfo'] =  this.playInfo.map((v) => v.toJson()).toList();
    }
		data['ifLimitVideo'] = this.ifLimitVideo;
		if (this.webUrl != null) {
      data['webUrl'] = this.webUrl.toJson();
    }
		data['campaign'] = this.campaign;
		data['category'] = this.category;
		data['idx'] = this.idx;
		data['slogan'] = this.slogan;
		data['thumbPlayUrl'] = this.thumbPlayUrl;
		data['resourceType'] = this.resourceType;
		data['promotion'] = this.promotion;
		return data;
	}
}

class SearchVideoCardDataCover {
	String feed;
	String detail;
	dynamic sharing;
	String blurred;
	dynamic homepage;

	SearchVideoCardDataCover({this.feed, this.detail, this.sharing, this.blurred, this.homepage});

	SearchVideoCardDataCover.fromJson(Map<String, dynamic> json) {
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

class SearchVideoCardDataProvider {
	String name;
	String icon;
	String alias;

	SearchVideoCardDataProvider({this.name, this.icon, this.alias});

	SearchVideoCardDataProvider.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		icon = json['icon'];
		alias = json['alias'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['icon'] = this.icon;
		data['alias'] = this.alias;
		return data;
	}
}

class SearchVideoCardDataAuthor {
	SearchVideoCardDataAuthorShield shield;
	bool expert;
	int approvedNotReadyVideoCount;
	String icon;
	String link;
	String description;
	int videoNum;
	SearchVideoCardDataAuthorFollow follow;
	int recSort;
	String name;
	bool ifPgc;
	int latestReleaseTime;
	int id;
	dynamic adTrack;

	SearchVideoCardDataAuthor({this.shield, this.expert, this.approvedNotReadyVideoCount, this.icon, this.link, this.description, this.videoNum, this.follow, this.recSort, this.name, this.ifPgc, this.latestReleaseTime, this.id, this.adTrack});

	SearchVideoCardDataAuthor.fromJson(Map<String, dynamic> json) {
		shield = json['shield'] != null ? new SearchVideoCardDataAuthorShield.fromJson(json['shield']) : null;
		expert = json['expert'];
		approvedNotReadyVideoCount = json['approvedNotReadyVideoCount'];
		icon = json['icon'];
		link = json['link'];
		description = json['description'];
		videoNum = json['videoNum'];
		follow = json['follow'] != null ? new SearchVideoCardDataAuthorFollow.fromJson(json['follow']) : null;
		recSort = json['recSort'];
		name = json['name'];
		ifPgc = json['ifPgc'];
		latestReleaseTime = json['latestReleaseTime'];
		id = json['id'];
		adTrack = json['adTrack'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.shield != null) {
      data['shield'] = this.shield.toJson();
    }
		data['expert'] = this.expert;
		data['approvedNotReadyVideoCount'] = this.approvedNotReadyVideoCount;
		data['icon'] = this.icon;
		data['link'] = this.link;
		data['description'] = this.description;
		data['videoNum'] = this.videoNum;
		if (this.follow != null) {
      data['follow'] = this.follow.toJson();
    }
		data['recSort'] = this.recSort;
		data['name'] = this.name;
		data['ifPgc'] = this.ifPgc;
		data['latestReleaseTime'] = this.latestReleaseTime;
		data['id'] = this.id;
		data['adTrack'] = this.adTrack;
		return data;
	}
}

class SearchVideoCardDataAuthorShield {
	int itemId;
	String itemType;
	bool shielded;

	SearchVideoCardDataAuthorShield({this.itemId, this.itemType, this.shielded});

	SearchVideoCardDataAuthorShield.fromJson(Map<String, dynamic> json) {
		itemId = json['itemId'];
		itemType = json['itemType'];
		shielded = json['shielded'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['itemId'] = this.itemId;
		data['itemType'] = this.itemType;
		data['shielded'] = this.shielded;
		return data;
	}
}

class SearchVideoCardDataAuthorFollow {
	int itemId;
	String itemType;
	bool followed;

	SearchVideoCardDataAuthorFollow({this.itemId, this.itemType, this.followed});

	SearchVideoCardDataAuthorFollow.fromJson(Map<String, dynamic> json) {
		itemId = json['itemId'];
		itemType = json['itemType'];
		followed = json['followed'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['itemId'] = this.itemId;
		data['itemType'] = this.itemType;
		data['followed'] = this.followed;
		return data;
	}
}

class SearchVideoCardDataConsumption {
	int shareCount;
	int replyCount;
	int realCollectionCount;
	int collectionCount;

	SearchVideoCardDataConsumption({this.shareCount, this.replyCount, this.realCollectionCount, this.collectionCount});

	SearchVideoCardDataConsumption.fromJson(Map<String, dynamic> json) {
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

class SearchVideoCardDataTag {
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

	SearchVideoCardDataTag({this.actionUrl, this.childTagList, this.bgPicture, this.haveReward, this.childTagIdList, this.tagRecType, this.ifNewest, this.headerImage, this.name, this.communityIndex, this.id, this.adTrack, this.desc, this.newestEndTime});

	SearchVideoCardDataTag.fromJson(Map<String, dynamic> json) {
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

class SearchVideoCardDataPlayinfo {
	int width;
	String name;
	List<SearchVideoCardDataPlayinfoUrllist> urlList;
	String type;
	String url;
	int height;

	SearchVideoCardDataPlayinfo({this.width, this.name, this.urlList, this.type, this.url, this.height});

	SearchVideoCardDataPlayinfo.fromJson(Map<String, dynamic> json) {
		width = json['width'];
		name = json['name'];
		if (json['urlList'] != null) {
			urlList = new List<SearchVideoCardDataPlayinfoUrllist>();(json['urlList'] as List).forEach((v) { urlList.add(new SearchVideoCardDataPlayinfoUrllist.fromJson(v)); });
		}
		type = json['type'];
		url = json['url'];
		height = json['height'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['width'] = this.width;
		data['name'] = this.name;
		if (this.urlList != null) {
      data['urlList'] =  this.urlList.map((v) => v.toJson()).toList();
    }
		data['type'] = this.type;
		data['url'] = this.url;
		data['height'] = this.height;
		return data;
	}
}

class SearchVideoCardDataPlayinfoUrllist {
	int size;
	String name;
	String url;

	SearchVideoCardDataPlayinfoUrllist({this.size, this.name, this.url});

	SearchVideoCardDataPlayinfoUrllist.fromJson(Map<String, dynamic> json) {
		size = json['size'];
		name = json['name'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['size'] = this.size;
		data['name'] = this.name;
		data['url'] = this.url;
		return data;
	}
}

class SearchVideoCardDataWeburl {
	String forWeibo;
	String raw;

	SearchVideoCardDataWeburl({this.forWeibo, this.raw});

	SearchVideoCardDataWeburl.fromJson(Map<String, dynamic> json) {
		forWeibo = json['forWeibo'];
		raw = json['raw'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['forWeibo'] = this.forWeibo;
		data['raw'] = this.raw;
		return data;
	}
}
