class SubscriptionModel {
  int? id;
  int? business_owner;
  int? store;
  int? period;
  double? amount;
  String? url;
  String? startDate;
  SubscriptionModel({
    this.id,
    required this.business_owner,
    required this.store,
    required this.period,
    required this.amount,
    this.url,
    this.startDate,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      business_owner: json['business_owner'],
      store: json['store'],
      period: json['period'],
      amount: double.parse(json['amount']),
      url: json['url'],
      startDate: json['start_date'],
    );
  }

  Map<String, dynamic> toJson() => {
    'business_owner' : business_owner,
    'store': store,
    'period': period,
    'amount':amount,
    'url': url,
    'start_date':startDate,
  };
}