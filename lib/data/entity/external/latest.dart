import 'package:json_annotation/json_annotation.dart';

part 'latest.g.dart';

@JsonSerializable(createToJson: false)
class Latest {
  Map<String, double> rates;
  String base;

  Latest(this.rates, this.base);

  factory Latest.fromJson(Map<String, dynamic> json) => _$LatestFromJson(json);


}