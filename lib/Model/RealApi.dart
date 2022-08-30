import 'dart:convert';

/// keywords : [{"keyword":"smiling","score":0.9802313043062179},{"keyword":"one person","score":0.9437528090188385},{"keyword":"adult","score":0.9183790406789157},{"keyword":"looking at camera","score":0.9157995617012508},{"keyword":"women","score":0.9066460992519846},{"keyword":"happiness","score":0.8519973023363183},{"keyword":"cheerful","score":0.8085621681699985},{"keyword":"indoors","score":0.7973170703388618},{"keyword":"portrait","score":0.7885780113719939},{"keyword":"young adult","score":0.7728750566011156}]
/// status : "ok"

RealApi realApiFromJson(String str) => RealApi.fromJson(json.decode(str));
String realApiToJson(RealApi data) => json.encode(data.toJson());

class RealApi {
  RealApi({
    List<Keywords>? keywords,
    String? status,
  }) {
    _keywords = keywords;
    _status = status;
  }

  RealApi.fromJson(dynamic json) {
    if (json['keywords'] != null) {
      _keywords = [];
      json['keywords'].forEach((v) {
        _keywords?.add(Keywords.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Keywords>? _keywords;
  String? _status;
  RealApi copyWith({
    List<Keywords>? keywords,
    String? status,
  }) =>
      RealApi(
        keywords: keywords ?? _keywords,
        status: status ?? _status,
      );
  List<Keywords>? get keywords => _keywords;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_keywords != null) {
      map['keywords'] = _keywords?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

/// keyword : "smiling"
/// score : 0.9802313043062179

Keywords keywordsFromJson(String str) => Keywords.fromJson(json.decode(str));
String keywordsToJson(Keywords data) => json.encode(data.toJson());

class Keywords {
  Keywords({
    String? keyword,
    num? score,
  }) {
    _keyword = keyword;
    _score = score;
  }

  Keywords.fromJson(dynamic json) {
    _keyword = json['keyword'];
    _score = json['score'];
  }
  String? _keyword;
  num? _score;
  Keywords copyWith({
    String? keyword,
    num? score,
  }) =>
      Keywords(
        keyword: keyword ?? _keyword,
        score: score ?? _score,
      );
  String? get keyword => _keyword;
  num? get score => _score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['keyword'] = _keyword;
    map['score'] = _score;
    return map;
  }
}
