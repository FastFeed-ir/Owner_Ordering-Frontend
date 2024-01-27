class Subscription {
  int? id;
  int? business_owner;
  int? store;
  int? period;
  double? amount;
  String? url;
  String? created_at;
  Subscription({
    this.id,
    required this.business_owner,
    required this.store,
    required this.period,
    required this.amount,
    this.url,
    this.created_at,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'],
      business_owner: json['business_owner'],
      store: json['store'],
      period: json['period'],
      amount: double.parse(json['amount']),
      url: json['url'],
      created_at: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'store': store,
        'period': period,
        'amount': amount,
      };
}
