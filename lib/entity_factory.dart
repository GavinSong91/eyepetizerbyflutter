import 'package:eyepetizer/model/banner_ad_entity.dart';
import 'package:eyepetizer/model/communtiy_recommend_entity.dart';
import 'package:eyepetizer/model/content_bean_entity.dart';
import 'package:eyepetizer/model/horizontalcard_data_entity.dart';
import 'package:eyepetizer/model/itemlist_entity.dart';
import 'package:eyepetizer/model/search_entity.dart';
import 'package:eyepetizer/model/square_collection_entity.dart';
import 'package:eyepetizer/model/thematic_planning_entity.dart';
import 'package:eyepetizer/model/url_bean_entity.dart';
import 'package:eyepetizer/model/video_card_entity.dart';
import 'package:eyepetizer/model/video_collection_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerAdEntity") {
      return BannerAdEntity.fromJson(json) as T;
    } else if (T.toString() == "CommuntiyRecommendEntity") {
      return CommuntiyRecommendEntity.fromJson(json) as T;
    } else if (T.toString() == "ContentBeanEntity") {
      return ContentBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "HorizontalcardDataEntity") {
      return HorizontalcardDataEntity.fromJson(json) as T;
    } else if (T.toString() == "ItemlistEntity") {
      return ItemlistEntity.fromJson(json) as T;
    } else if (T.toString() == "SearchEntity") {
      return SearchEntity.fromJson(json) as T;
    } else if (T.toString() == "SquareCollectionEntity") {
      return SquareCollectionEntity.fromJson(json) as T;
    } else if (T.toString() == "ThematicPlanningEntity") {
      return ThematicPlanningEntity.fromJson(json) as T;
    } else if (T.toString() == "UrlBeanEntity") {
      return UrlBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "VideoCardEntity") {
      return VideoCardEntity.fromJson(json) as T;
    } else if (T.toString() == "VideoCollectionEntity") {
      return VideoCollectionEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}