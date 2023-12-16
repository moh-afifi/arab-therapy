import 'package:flutter/material.dart';
import 'package:therapy/core/widgets/global_scaffold.dart';
import '../widgets/faq.dart';
import '../widgets/home_header.dart';
import '../widgets/home_services.dart';
import '../widgets/subscriptions.dart';
import '../widgets/why_us.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverVisibility(
            sliver: SliverAppBar(
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                background: HomeHeader(),
              ),
            ),
          ),
          SliverList.list(
            children: const <Widget>[
              WhyUs(),
              HomeSubscriptions(),
              HomeServices(),
              FaqSection(),
            ],
          )
        ],
      ),
    );
  }
}
