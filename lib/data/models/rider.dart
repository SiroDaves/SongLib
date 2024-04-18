import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/constants/app_constants.dart';

part 'rider.g.dart';

@Entity(tableName: AppConstants.ridersTable)
@JsonSerializable()

class Rider {
  @PrimaryKey(autoGenerate: true)
  int? rid;
  String? id;
  int? benfno;
  String? description;
  int? benefitOrder;
  double? amount;
  bool? mandatory;
  String? createAt;
  String? updateAt;

  Rider({
    this.id,
    this.benfno,
    this.description,
    this.benefitOrder,
    this.amount,
    this.mandatory,
    this.createAt,
    this.updateAt,
  });

  factory Rider.fromJson(Map<String, dynamic> json) => _$RiderFromJson(json);

  Map<String, dynamic> toJson() => _$RiderToJson(this);
}
