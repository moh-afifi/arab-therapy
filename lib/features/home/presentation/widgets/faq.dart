import 'package:flutter/material.dart';
import 'package:therapy/core/theme/app_theme.dart';
import 'package:therapy/core/utils/app_colors.dart';
import 'package:therapy/features/home/data/models/faq_model.dart';
import 'package:therapy/features/home/presentation/widgets/resuable_title.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 15),
      child: Column(
        children: [
          const ReusableTitle(title: "أسئلة شائعة"),
          Column(
            children: List.generate(
              _faqList.length,
              (index) => _FaqCard(
                model: _faqList[index],
              ),
            ),
          )
        ],
      ),
    );
  }

  static final _faqList = [
    FaqModel(
      question: "كم مدة الجلسات؟",
      answer:
          "مدة الجلسة سواء كانت مع أخصائي نفسي أو طبيب نفسي هي 45 دقيقة، قد تمتد في بعض الأحيان إلى ساعة كحد أقصى",
    ),
    FaqModel(
      question: " هل يمكنني إلغاء الاشتراك بعد الجلسة الأولى؟",
      answer:
          "يمكنك إلغاء الاشتراك في أي وقت ترغب به وبعد أي عدد من الجلسات بدون إبداء أي سبب.",
    ),
    FaqModel(
      question: "كم سعر الجلسات في الاشتراك الأسبوعي؟",
      answer:
          "في الاشتراك الأسبوعي يبلغ سعر الاشتراك للاسبوع الأول (الجلسة الأولى) 29,99 دولار، أما سعر الاشتراك لباقي الأسابيع 59,99 دولار.",
    ),
    FaqModel(
      question: "هل المعالج الخاص بي هو أخصائي نفسي أم طبيب نفسي؟",
      answer:
          "يتم تحديد المختص الخاص بك سواء كان طبيباً أو معالجاً بناء على المعلومات التي تدخلها أثناء التسجيل، حيث نقوم بتعيين أفضل مختص لحالتك بناءً على المعلومات التي تقوم بإدخالها، في كافة الأحوال يكون المعالج الخاص بك إما أخصائي نفسي عربي أو طبيب نفسي عربي وكلاهما ذو كفاءة عالية.",
    ),
  ];
}

class _FaqCard extends StatelessWidget {
  const _FaqCard({
    required this.model,
  });

  final FaqModel model;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: AppTheme.fontFamily
      ).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.bluee8edf5,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ExpansionTile(
          iconColor: AppColors.green4e7e76,
          collapsedIconColor: AppColors.green4e7e76,
          childrenPadding: const EdgeInsets.all(10),
          title: Text(model.question,style: const TextStyle(fontSize: 12),),
          children: [Text(model.answer,style: const TextStyle(fontSize: 12),)],
        ),
      ),
    );
  }
}
