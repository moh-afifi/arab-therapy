class SubscriptionModel {
  SubscriptionModel({
    required this.bundleName,
    required this.bundlePrice,
    required this.bundleSavings,
    required this.bundleDuration,
    required this.icon,
    required this.benefitsList,
    this.isPopular = false,
  });

  final String bundleName, bundlePrice, bundleSavings, bundleDuration, icon;
  final bool isPopular;
  final List<String> benefitsList;
}
