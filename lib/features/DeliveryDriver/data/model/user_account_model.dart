// models/user_profile_model.dart

import 'package:delivery_driver/features/DeliveryDriver/domain/entity/user_account_entity.dart';

class UserAccount {
  final String name;
  final String phone;
  final String imageUrl;

  UserAccount({
    required this.name,
    required this.phone,
    required this.imageUrl,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      name: json['username'] ?? '',
      phone: json['phone'] ?? '',
      imageUrl: json['profile'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
  UserAccountEntity toEntity() {
    return UserAccountEntity(
      name: name,
      phone: phone,
      imageUrl: imageUrl,
    );
  }
}
