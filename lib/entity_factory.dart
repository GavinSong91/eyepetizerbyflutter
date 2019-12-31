import 'package:eyepetizer/model/communtiy_recommend_entity.dart';
import 'package:eyepetizer/model/content_bean_entity.dart';
import 'package:eyepetizer/model/url_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CommuntiyRecommendEntity") {
      return CommuntiyRecommendEntity.fromJson(json) as T;
    } else if (T.toString() == "ContentBeanEntity") {
      return ContentBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "UrlBeanEntity") {
      return UrlBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}