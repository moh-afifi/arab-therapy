import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy/core/widgets/error_view.dart';
import 'package:therapy/core/widgets/loading.dart';

import '../../../../core/widgets/global_app_bar.dart';
import '../../../../core/widgets/global_scaffold.dart';
import '../providers/items_provider.dart';
import '../widgets/item_card.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemsProvider(),
      child: Builder(
        builder: (context) {
          return GlobalScaffold(
            appBar: GlobalAppBar(
              context,
              title: 'Items',
              enableBack: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Consumer<ItemsProvider>(
                builder: (_, provider, __) {
                  final itemsList = provider.items?.itemsList ?? [];
                  if (provider.loading) return const AppLoader();
                  if (provider.error != null) {
                    return ErrorView(
                      error: provider.error!,
                      onPressed: () => provider.getItems(),
                    );
                  }
                  return ListView.builder(

                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        item: itemsList[index],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
