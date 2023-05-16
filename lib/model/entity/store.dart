import 'dart:html';

import 'package:image_picker/image_picker.dart';

class Store{
  int? id;
  int? business_owner;
  String? title;
  String? logo;
  int? business_type;
  int? state;
  String? city ;
  String? address ;
  String? owner_phone_number;
  String? telephone_number;
  int? tables_count;
  String? instagram_page_link;

  Store({
    this.id,
    required this.business_owner,
    required this.title,
    required this.logo,
    required this.business_type,
    required this.state,
    required this.city,
    required this.address,
    required this.owner_phone_number,
    required this.telephone_number,
    required this.tables_count,
    required this.instagram_page_link,
});
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      business_owner: json['business_owner'],
      title: json['title'],
      logo: json['logo'],
      business_type: json['business_type'],
      state: json['state'],
      city: json['city'],
      address: json['address'],
      owner_phone_number: json['owner_phone_number'],
      telephone_number: json['telephone_number'],
      tables_count: json['tables_count'],
      instagram_page_link: json['instagram_page_link'],
    );
  }
  Map<String, dynamic> toJson() => {
    'business_owner' : business_owner,
    'title': title,
    'logo': logo,
    'business_type': business_type,
    'state': state,
    'city': city,
    'address': address,
    'owner_phone_number': owner_phone_number,
    'telephone_number': telephone_number,
    'tables_count': tables_count,
    'instagram_page_link': instagram_page_link,
  };
}
