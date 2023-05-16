class Owner{
  int? id;
  String? phone_number;
  String? first_name;
  String? last_name;

  Owner({
    this.id,
    required this.phone_number,
    required this.first_name,
    required this.last_name
  });
  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json["id"],
      phone_number: json["phone_number"],
      first_name: json["first_name"],
      last_name: json["last_name"]
    );
  }
  Map<String, dynamic> toJson()=> {
    'phone_number':phone_number,
    'first_name' : first_name,
    'last_name' : last_name,
  };
}