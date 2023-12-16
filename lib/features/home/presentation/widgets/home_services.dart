import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapy/core/utils/app_colors.dart';
import 'package:therapy/features/home/presentation/widgets/resuable_title.dart';
import 'package:therapy/features/home/presentation/widgets/start_now_button.dart';

import '../../../../core/utils/app_navigator.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../items/presentation/screens/items_screen.dart';
import '../../data/models/service_model.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: AppColors.bluee8edf5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const ReusableTitle(title: "أنت تستحق أن تكون سعيداً!"),
            Column(
              children: List.generate(
                _servicesList.length,
                (index) => _ServiceItem(
                  serviceModel: _servicesList[index],
                ),
              ),
            ),
            const StartNowButton(
              padding: EdgeInsets.symmetric(horizontal: 50),
            ),
          ],
        ),
      ),
    );
  }

  static final _servicesList = [
    ServiceModel(
        icon: "doc.svg",
        title: " أدخل معلوماتك",
        description: "لمساعدتنا في اختيار الاخصائي المناسب لك"),
    ServiceModel(
        icon: "add.svg",
        title: "اختر الاشتراك المناسب",
        description: " أسبوعي ، شهري ،كل 3 أشهر"),
    ServiceModel(
        icon: "shield.svg", title: "ادفع بأمان", description: "طرق دفع آمنة"),
    ServiceModel(
        icon: "support.svg",
        title: "نحن بخدمتك 24 ساعة",
        description:
            "سيتواصل فريق خدمة العملاء معك  لتحديد المختص الأنسب لحالتك"),
    ServiceModel(
        icon: "calendar.svg",
        title: "ابدأ العلاج",
        description: "حدد موعد مع المختص الخاص بك"),
  ];
}

class _ServiceItem extends StatelessWidget {
  const _ServiceItem({required this.serviceModel});

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svg/${serviceModel.icon}',
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceModel.title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  serviceModel.description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
