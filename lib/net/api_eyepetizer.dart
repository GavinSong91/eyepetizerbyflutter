import 'package:eyepetizer/model/content_bean_entity.dart';
import 'package:eyepetizer/model/datas.dart';
import 'package:eyepetizer/model/http_datas.dart';
import 'package:eyepetizer/model/response_datas.dart';
import 'package:eyepetizer/model/search_entity.dart';
import 'http_manager.dart';

class EyepetizerApi {
  static const String BaseUrl =
      "https://api.apiopen.top/videoHomeTab/videoCategory/videoHomeTab";

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
      "http://baobab.kaiyanapp.com/api/v1/search/?query="; //?num=10&query=xxx&start=10

  //获取推荐
  void fetchRecommendDatas(RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(RecommendUrl, null, null, null);
    if (response != null) {
      var result = response.result;
      ResponseDatas entity = ResponseDatas.fromJson(result);
      requestCallBack({'entity': entity.itemList});
    }
  }

  //获取发现
  void fetchDiscoveryDatas(RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(DiscoveryUrl, null, null, null);
    if (response != null) {
      var result = response.result;
      ResponseDatas entity = ResponseDatas.fromJson(result);
      requestCallBack({'entity': entity.itemList});
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
      Datas entity = Datas.fromJson(result);
      requestCallBack(
          {'entity': entity.itemList, 'nextPageUrl': entity.nextPageUrl});
    }
  }

  void fetchMoreCommuntiyRecommend(
      String nextPageUrl, RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(nextPageUrl, null, null, null);
    if (response != null) {
      var result = response.result;
      Datas entity = Datas.fromJson(result);
      requestCallBack(
          {'entity': entity.itemList, 'nextPageUrl': entity.nextPageUrl});
    }
  }

  //搜索
  void doSearchByKeyWord(
      String searchUrl, RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(searchUrl, null, null, null);
    if (response != null) {
      var result = response.result;
      Datas entity = Datas.fromJson(result);
      requestCallBack(
          {'entity': entity.itemList, 'nextPageUrl': entity.nextPageUrl});
    }
  }

  //获取关注默认
  void fetchFollowDatas(RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(
        'http://baobab.kaiyanapp.com/api/v1/search/?query=搞笑',
        null,
        null,
        null);
    List<SearchEntity> itemList;
    if (response != null) {
      var result = response.result;
      HttpDatas entity = HttpDatas.fromJson(result);
      if (entity.itemList != null) {
        itemList = new List<SearchEntity>();
        (entity.itemList as List).forEach((v) {
          itemList.add(new SearchEntity.fromJson(v));
        });
      }
      requestCallBack({'entity': itemList, 'nextPageUrl': entity.nextPageUrl});
    }
  }

  void fetchMoreFollowDatas(
      String nextPageUrl, RequestCallBack requestCallBack) async {
    var response = await httpManager.fetchNet(nextPageUrl, null, null, null);
    List<SearchEntity> itemList;
    if (response != null) {
      var result = response.result;
      HttpDatas entity = HttpDatas.fromJson(result);
      if (entity.itemList != null) {
        itemList = new List<SearchEntity>();
        (entity.itemList as List).forEach((v) {
          itemList.add(new SearchEntity.fromJson(v));
        });
      }
      requestCallBack({'entity': itemList, 'nextPageUrl': entity.nextPageUrl});
    }
  }
}

typedef RequestCallBack<T> = void Function(T value);
