import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapy/core/utils/app_colors.dart';
import 'package:therapy/features/home/data/models/subscription_model.dart';
import 'package:therapy/features/home/presentation/widgets/resuable_title.dart';

class HomeSubscriptions extends StatelessWidget {
  const HomeSubscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReusableTitle(title: 'اختر الاشتراك المناسب لك'),
          Column(
            children: List.generate(
              _subscriptionsList.length,
              (index) => _SubscriptionCard(
                model: _subscriptionsList[index],
              ),
            ),
          )
        ],
      ),
    );
  }

  static final _subscriptionsList = [
    SubscriptionModel(
        icon: "bird.svg",
        bundleName: "حزمة الأمان",
        bundleDuration: "لأول أسبوع ثم 59.99\$ أسبوعياً",
        bundlePrice: "29.99",
        bundleSavings: "وفر 50% لأول جلسة",
        benefitsList: [
          "1 جلسة صوتية أو فيديو أسبوعيًا",
          "مدة الجلسة 45 دقيقة",
          "يمكنك إلغاء اشتراكك في أي وقت تريد"
        ]),
    SubscriptionModel(
      icon: "hope.svg",
      bundleName: "حزمة الأمل",
      bundleDuration: "تدفع شهرياًً",
      bundlePrice: "220",
      bundleSavings: "وفر 20\$",
      isPopular: true,
      benefitsList: [
        "4 جلسات صوتية أو فيديو خلال شهر (45 دقيقة لكل جلسة)",
        "رسائل لا محدودة مع الأخصائي النفسي طيلة فترة الاشتراك",
        "يمكنك إلغاء اشتراكك في أي وقت تريد"
      ],
    ),
    SubscriptionModel(
        icon: "satisfaction.svg",
        bundleName: "حزمة الرضا",
        bundleDuration: "تدفع كل 3 أشهرً",
        bundlePrice: "559.99",
        bundleSavings: "وفر 160\$",
        benefitsList: [
          "12 جلسة صوتية أو فيديو خلال 3 أشهر (45 دقيقة لكل جلسة)",
          "رسائل لا محدودة مع الأخصائي النفسي طيلة فترة الاشتراك",
          "يمكنك إلغاء اشتراكك في أي وقت تريد"
        ]),
  ];
}

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard({required this.model});

  final SubscriptionModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/${model.icon}',
                colorFilter: const ColorFilter.mode(
                    AppColors.blue154f9c, BlendMode.srcIn),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.bundleName,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    model.bundleSavings,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        model.bundlePrice,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: AppColors.green4e7e76),
                      ),
                      const Text(
                        " \$ ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: AppColors.green4e7e76),
                      ),
                    ],
                  ),
                  Text(
                    model.bundleDuration,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 0.5,
          ),
          Column(
            children: List.generate(
              model.benefitsList.length,
              (index) => _BenefitItem(
                benefit: model.benefitsList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({
    required this.benefit,
  });

  final String benefit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.bluee8edf5,
            ),
            padding: const EdgeInsets.all(3),
            child: const Icon(
              Icons.check,
              color: AppColors.blue154f9c,
              size: 15,
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(benefit),
          ),
        ],
      ),
    );
  }
}
