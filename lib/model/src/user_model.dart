import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  // @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserModel({
    required int id,
    required String name,
    required String password,
    required String phoneNumber,
    String? address,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
