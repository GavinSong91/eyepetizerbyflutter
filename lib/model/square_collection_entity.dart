

class SquareCollectionEntity {
	dynamic footer;
	String dataType;
	int count;
	SquareCollectionDataHeader header;
	List<SquareCollectionDataItemlist> itemList;
	dynamic adTrack;

	SquareCollectionEntity({this.footer, this.dataType, this.count, this.header, this.itemList, this.adTrack});

	SquareCollectionEntity.fromJson(Map<String, dynamic> json) {
		footer = json['footer'];
		dataType = json['dataType'];
		count = json['count'];
		header = json['header'] != null ? new SquareCollectionDataHeader.fromJson(json['header']) : null;
		if (json['itemList'] != null) {
			itemList = new List<SquareCollectionDataItemlist>();(json['itemList'] as List).forEach((v) { itemList.add(new SquareCollectionDataItemlist.fromJson(v)); });
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

class SquareCollectionDataHeader {
	dynamic cover;
	String rightText;
	dynamic labelList;
	String subTitle;
	String textAlign;
	String subTitleFont;
	String actionUrl;
	int id;
	dynamic label;
	String title;
	String font;

	SquareCollectionDataHeader({this.cover, this.rightText, this.labelList, this.subTitle, this.textAlign, this.subTitleFont, this.actionUrl, this.id, this.label, this.title, this.font});

	SquareCollectionDataHeader.fromJson(Map<String, dynamic> json) {
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

class SquareCollectionDataItemlist {
	SquareCollectionDataItemlistData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	SquareCollectionDataItemlist({this.data, this.adIndex, this.tag, this.id, this.type});

	SquareCollectionDataItemlist.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new SquareCollectionDataItemlistData.fromJson(json['data']) : null;
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

class SquareCollectionDataItemlistData {
	String dataType;
	SquareCollectionDataItemlistDataHeader header;
	SquareCollectionDataItemlistDataContent content;
	List<Null> adTrack;

	SquareCollectionDataItemlistData({this.dataType, this.header, this.content, this.adTrack});

	SquareCollectionDataItemlistData.fromJson(Map<String, dynamic> json) {
		dataType = json['dataType'];
		header = json['header'] != null ? new SquareCollectionDataItemlistDataHeader.fromJson(json['header']) : null;
		content = json['content'] != null ? new SquareCollectionDataItemlistDataContent.fromJson(json['content']) : null;
		if (json['adTrack'] != null) {
			adTrack = new List<Null>();
		}
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
		if (this.adTrack != null) {
      data['adTrack'] =  [];
    }
		return data;
	}
}

class SquareCollectionDataItemlistDataHeader {
	String textAlign;
	dynamic subTitleFont;
	String actionUrl;
	String icon;
	dynamic description;
	bool showHateVideo;
	dynamic label;
	String title;
	dynamic cover;
	dynamic rightText;
	dynamic labelList;
	dynamic subTitle;
	String iconType;
	int id;
	int time;
	dynamic font;

	SquareCollectionDataItemlistDataHeader({this.textAlign, this.subTitleFont, this.actionUrl, this.icon, this.description, this.showHateVideo, this.label, this.title, this.cover, this.rightText, this.labelList, this.subTitle, this.iconType, this.id, this.time, this.font});

	SquareCollectionDataItemlistDataHeader.fromJson(Map<String, dynamic> json) {
		textAlign = json['textAlign'];
		subTitleFont = json['subTitleFont'];
		actionUrl = json['actionUrl'];
		icon = json['icon'];
		description = json['description'];
		showHateVideo = json['showHateVideo'];
		label = json['label'];
		title = json['title'];
		cover = json['cover'];
		rightText = json['rightText'];
		labelList = json['labelList'];
		subTitle = json['subTitle'];
		iconType = json['iconType'];
		id = json['id'];
		time = json['time'];
		font = json['font'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['textAlign'] = this.textAlign;
		data['subTitleFont'] = this.subTitleFont;
		data['actionUrl'] = this.actionUrl;
		data['icon'] = this.icon;
		data['description'] = this.description;
		data['showHateVideo'] = this.showHateVideo;
		data['label'] = this.label;
		data['title'] = this.title;
		data['cover'] = this.cover;
		data['rightText'] = this.rightText;
		data['labelList'] = this.labelList;
		data['subTitle'] = this.subTitle;
		data['iconType'] = this.iconType;
		data['id'] = this.id;
		data['time'] = this.time;
		data['font'] = this.font;
		return data;
	}
}

class SquareCollectionDataItemlistDataContent {
	SquareCollectionDataItemlistDataContentData data;
	int adIndex;
	dynamic tag;
	int id;
	String type;

	SquareCollectionDataItemlistDataContent({this.data, this.adIndex, this.tag, this.id, this.type});

	SquareCollectionDataItemlistDataContent.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new SquareCollectionDataItemlistDataContentData.fromJson(json['data']) : null;
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

class SquareCollectionDataItemlistDataContentData {
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
	SquareCollectionDataItemlistDataContentDataCover cover;
	int duration;
	String xLibrary;
	String descriptionEditor;
	SquareCollectionDataItemlistDataContentDataProvider provider;
	int id;
	dynamic descriptionPgc;
	dynamic titlePgc;
	List<Null> adTrack;
	List<Null> subtitles;
	bool ad;
	dynamic src;
	SquareCollectionDataItemlistDataContentDataAuthor author;
	String dataType;
	int searchWeight;
	dynamic playlists;
	SquareCollectionDataItemlistDataContentDataConsumption consumption;
	bool reallyCollected;
	dynamic label;
	bool played;
	List<SquareCollectionDataItemlistDataContentDataTag> tags;
	dynamic webAdTrack;
	List<Null> labelList;
	dynamic lastViewTime;
	List<SquareCollectionDataItemlistDataContentDataPlayinfo> playInfo;
	bool ifLimitVideo;
	SquareCollectionDataItemlistDataContentDataWeburl webUrl;
	dynamic campaign;
	String category;
	int idx;
	dynamic slogan;
	dynamic thumbPlayUrl;
	String resourceType;
	dynamic promotion;

	SquareCollectionDataItemlistDataContentData({this.date, this.shareAdTrack, this.releaseTime, this.brandWebsiteInfo, this.description, this.remark, this.collected, this.title, this.type, this.favoriteAdTrack, this.waterMarks, this.playUrl, this.cover, this.duration, this.xLibrary, this.descriptionEditor, this.provider, this.id, this.descriptionPgc, this.titlePgc, this.adTrack, this.subtitles, this.ad, this.src, this.author, this.dataType, this.searchWeight, this.playlists, this.consumption, this.reallyCollected, this.label, this.played, this.tags, this.webAdTrack, this.labelList, this.lastViewTime, this.playInfo, this.ifLimitVideo, this.webUrl, this.campaign, this.category, this.idx, this.slogan, this.thumbPlayUrl, this.resourceType, this.promotion});

	SquareCollectionDataItemlistDataContentData.fromJson(Map<String, dynamic> json) {
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
		cover = json['cover'] != null ? new SquareCollectionDataItemlistDataContentDataCover.fromJson(json['cover']) : null;
		duration = json['duration'];
		xLibrary = json['library'];
		descriptionEditor = json['descriptionEditor'];
		provider = json['provider'] != null ? new SquareCollectionDataItemlistDataContentDataProvider.fromJson(json['provider']) : null;
		id = json['id'];
		descriptionPgc = json['descriptionPgc'];
		titlePgc = json['titlePgc'];
		if (json['adTrack'] != null) {
			adTrack = new List<Null>();
		}
		if (json['subtitles'] != null) {
			subtitles = new List<Null>();
		}
		ad = json['ad'];
		src = json['src'];
		author = json['author'] != null ? new SquareCollectionDataItemlistDataContentDataAuthor.fromJson(json['author']) : null;
		dataType = json['dataType'];
		searchWeight = json['searchWeight'];
		playlists = json['playlists'];
		consumption = json['consumption'] != null ? new SquareCollectionDataItemlistDataContentDataConsumption.fromJson(json['consumption']) : null;
		reallyCollected = json['reallyCollected'];
		label = json['label'];
		played = json['played'];
		if (json['tags'] != null) {
			tags = new List<SquareCollectionDataItemlistDataContentDataTag>();(json['tags'] as List).forEach((v) { tags.add(new SquareCollectionDataItemlistDataContentDataTag.fromJson(v)); });
		}
		webAdTrack = json['webAdTrack'];
		if (json['labelList'] != null) {
			labelList = new List<Null>();
		}
		lastViewTime = json['lastViewTime'];
		if (json['playInfo'] != null) {
			playInfo = new List<SquareCollectionDataItemlistDataContentDataPlayinfo>();(json['playInfo'] as List).forEach((v) { playInfo.add(new SquareCollectionDataItemlistDataContentDataPlayinfo.fromJson(v)); });
		}
		ifLimitVideo = json['ifLimitVideo'];
		webUrl = json['webUrl'] != null ? new SquareCollectionDataItemlistDataContentDataWeburl.fromJson(json['webUrl']) : null;
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
		if (this.adTrack != null) {
      data['adTrack'] =  [];
    }
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

class SquareCollectionDataItemlistDataContentDataCover {
	String feed;
	String detail;
	dynamic sharing;
	String blurred;
	String homepage;

	SquareCollectionDataItemlistDataContentDataCover({this.feed, this.detail, this.sharing, this.blurred, this.homepage});

	SquareCollectionDataItemlistDataContentDataCover.fromJson(Map<String, dynamic> json) {
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

class SquareCollectionDataItemlistDataContentDataProvider {
	String name;
	String icon;
	String alias;

	SquareCollectionDataItemlistDataContentDataProvider({this.name, this.icon, this.alias});

	SquareCollectionDataItemlistDataContentDataProvider.fromJson(Map<String, dynamic> json) {
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

class SquareCollectionDataItemlistDataContentDataAuthor {
	SquareCollectionDataItemlistDataContentDataAuthorShield shield;
	bool expert;
	int approvedNotReadyVideoCount;
	String icon;
	String link;
	String description;
	int videoNum;
	SquareCollectionDataItemlistDataContentDataAuthorFollow follow;
	int recSort;
	String name;
	bool ifPgc;
	int latestReleaseTime;
	int id;
	dynamic adTrack;

	SquareCollectionDataItemlistDataContentDataAuthor({this.shield, this.expert, this.approvedNotReadyVideoCount, this.icon, this.link, this.description, this.videoNum, this.follow, this.recSort, this.name, this.ifPgc, this.latestReleaseTime, this.id, this.adTrack});

	SquareCollectionDataItemlistDataContentDataAuthor.fromJson(Map<String, dynamic> json) {
		shield = json['shield'] != null ? new SquareCollectionDataItemlistDataContentDataAuthorShield.fromJson(json['shield']) : null;
		expert = json['expert'];
		approvedNotReadyVideoCount = json['approvedNotReadyVideoCount'];
		icon = json['icon'];
		link = json['link'];
		description = json['description'];
		videoNum = json['videoNum'];
		follow = json['follow'] != null ? new SquareCollectionDataItemlistDataContentDataAuthorFollow.fromJson(json['follow']) : null;
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

class SquareCollectionDataItemlistDataContentDataAuthorShield {
	int itemId;
	String itemType;
	bool shielded;

	SquareCollectionDataItemlistDataContentDataAuthorShield({this.itemId, this.itemType, this.shielded});

	SquareCollectionDataItemlistDataContentDataAuthorShield.fromJson(Map<String, dynamic> json) {
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

class SquareCollectionDataItemlistDataContentDataAuthorFollow {
	int itemId;
	String itemType;
	bool followed;

	SquareCollectionDataItemlistDataContentDataAuthorFollow({this.itemId, this.itemType, this.followed});

	SquareCollectionDataItemlistDataContentDataAuthorFollow.fromJson(Map<String, dynamic> json) {
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

class SquareCollectionDataItemlistDataContentDataConsumption {
	int shareCount;
	int replyCount;
	int realCollectionCount;
	int collectionCount;

	SquareCollectionDataItemlistDataContentDataConsumption({this.shareCount, this.replyCount, this.realCollectionCount, this.collectionCount});

	SquareCollectionDataItemlistDataContentDataConsumption.fromJson(Map<String, dynamic> json) {
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

class SquareCollectionDataItemlistDataContentDataTag {
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

	SquareCollectionDataItemlistDataContentDataTag({this.actionUrl, this.childTagList, this.bgPicture, this.haveReward, this.childTagIdList, this.tagRecType, this.ifNewest, this.headerImage, this.name, this.communityIndex, this.id, this.adTrack, this.desc, this.newestEndTime});

	SquareCollectionDataItemlistDataContentDataTag.fromJson(Map<String, dynamic> json) {
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

class SquareCollectionDataItemlistDataContentDataPlayinfo {
	int width;
	String name;
	List<SquareCollectionDataItemlistDataContentDataPlayinfoUrllist> urlList;
	String type;
	String url;
	int height;

	SquareCollectionDataItemlistDataContentDataPlayinfo({this.width, this.name, this.urlList, this.type, this.url, this.height});

	SquareCollectionDataItemlistDataContentDataPlayinfo.fromJson(Map<String, dynamic> json) {
		width = json['width'];
		name = json['name'];
		if (json['urlList'] != null) {
			urlList = new List<SquareCollectionDataItemlistDataContentDataPlayinfoUrllist>();(json['urlList'] as List).forEach((v) { urlList.add(new SquareCollectionDataItemlistDataContentDataPlayinfoUrllist.fromJson(v)); });
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

class SquareCollectionDataItemlistDataContentDataPlayinfoUrllist {
	int size;
	String name;
	String url;

	SquareCollectionDataItemlistDataContentDataPlayinfoUrllist({this.size, this.name, this.url});

	SquareCollectionDataItemlistDataContentDataPlayinfoUrllist.fromJson(Map<String, dynamic> json) {
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

class SquareCollectionDataItemlistDataContentDataWeburl {
	String forWeibo;
	String raw;

	SquareCollectionDataItemlistDataContentDataWeburl({this.forWeibo, this.raw});

	SquareCollectionDataItemlistDataContentDataWeburl.fromJson(Map<String, dynamic> json) {
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
