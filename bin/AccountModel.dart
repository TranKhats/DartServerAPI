/// This allows the generated code access our class members. 
/// The value for this is the same as the source file name, 
/// in this case, user.dart without the .dart file extension.
library AccountModel;

import 'package:json_annotation/json_annotation.dart';
//https://iirokrankka.com/2018/02/08/json-and-serialization/
/// This allows our `User` class to access private members in 
/// the generated file. The value for this is *.g.dart, where 
/// the star denotes the source file name.
part 'AccountModel.g.dart';

/// An annotation for the code generator to know that this class needs the 
/// JSON serialization logic to be generated.
@JsonSerializable()

/// Every json_serializable class must have the serializer mixin. 
/// It makes the generated toJson() method to be usable for the class. 
/// The mixin's name follows the source class, in this case, User.
class AccountModel{
  AccountModel(this.username, this.password);

  String username;
  String password;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. We pass the map to the generated _$UserFromJson constructor. 
  /// The constructor is named after the source class, in this case User.
  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
   /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}