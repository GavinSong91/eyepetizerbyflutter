import 'package:eyepetizer/model/content_bean_entity.dart';
import 'package:eyepetizer/model/communtiy_recommend_entity.dart';
import 'http_manager.dart';

class EyepetizerApi {
  static const String BaseUrl = "https://api.apiopen.top/videoHomeTab";

//  static const String DailyUrl = "$BaseUrl/todayVideo";
  static const String HomeTabUrl = "$BaseUrl/videoHomeTab";
  static const String CategoryTabUrl = "$BaseUrl/videoCategory";
  static const String DetailUrl = "$BaseUrl/videoCategoryDetails?id=14";

//  static const String RecommendUrl = "$BaseUrl/videoRecommend?id=127398";

  static const String HostUrl = "https://baobab.kaiyanapp.com/api/v5/index/tab";
  static const String DiscoveryUrl = "$HostUrl/discovery";
  static const String RecommendUrl = "$HostUrl/allRec"; //?page=0
  static const String DailyUrl = "$HostUrl/feed";
  static const String CommunityUrl = "$HostUrl/ugcSelected";
  static const String SearchUrl =
      "http://baobab.kaiyanapp.com/api/v1/search"; //?num=10&query=xxx&start=10

  //获取推荐
  void fetchRecommendDatas(int page, RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(
        "$RecommendUrl?page=$page", null, null, null);
    if (response != null) {
      var result = response.result;
      ContentBeanEntity entity = ContentBeanEntity.fromJson(result);
      requestCallBack({'entity': entity});
    }
  }

  //获取发现
  void fetchDiscoveryDatas(RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(DiscoveryUrl, null, null, null);
    if (response != null) {
      var result = response.result;
      ContentBeanEntity entity = ContentBeanEntity.fromJson(result);
      requestCallBack({'entity': entity});
    }
  }

  //获取日报
  void fetchDailyDatas(RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(DailyUrl, null, null, null);
    if (response != null) {
      var result = response.result;
      ContentBeanEntity entity = ContentBeanEntity.fromJson(result);
      requestCallBack({'entity': entity});
    }
  }

  //获取社区推荐
  void fetchCommuntiyRecommend(RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(CommunityUrl, null, null, null);
    if (response != null) {
      var result = response.result;
      CommuntiyRecommendEntity entity = CommuntiyRecommendEntity.fromJson(result);
      requestCallBack({'entity': entity});
    }
  }
}

typedef RequestCallBack<T> = void Function(T value);