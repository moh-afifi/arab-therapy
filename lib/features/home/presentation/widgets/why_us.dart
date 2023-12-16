import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapy/features/home/data/models/why_us_model.dart';
import 'package:therapy/features/home/presentation/widgets/resuable_title.dart';

class WhyUs extends StatelessWidget {
  const WhyUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReusableTitle(title: 'لماذا عرب ثيرابي؟'),
          SizedBox(
            height: 250,
            child: ListView.separated(
              itemCount: _whyUsList.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 15);
              },
              itemBuilder: (context, index) {
                return WhyUsCard(
                  model: _whyUsList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  static final _whyUsList = [
    WhyUsModel(
        icon: "security.svg",
        title: "سرية تامة",
        description: "كافة المعلومات التي تشاركها معنا سواء في مواقع التواصل أو بينك وبين الأخصائي خلال وأثناء الجلسات تخضع لسرية تامة."),
    WhyUsModel(
        icon: "mind.svg",
        title: "أخصائي نفسي",
        description: "نوفر لك جلسات مع أخصائيين وأطباء نفسيين عرب ذوي كفاءة عالية"),
    WhyUsModel(
        icon: "session.svg", title: "جلسات فيديو أسبوعية", description: "احجز جلسة علاجية أسبوعياً عبر مكالمة صوتية/فيديو مع الأخصائي الخاص بك"),
    WhyUsModel(
        icon: "mobile.svg",
        title: "رسائل غير محدودة",
        description:
            "يمكنك إرسال عدد غير محدود من الرسائل للأخصائي المعالج عبر غرفة محادثة داخل التطبيق"),
  ];
}

class WhyUsCard extends StatelessWidget {
  const WhyUsCard({
    super.key,
    required this.model,
  });

  final WhyUsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/${model.icon}',
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              model.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
