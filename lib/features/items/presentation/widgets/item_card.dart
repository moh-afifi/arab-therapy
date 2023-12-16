import 'package:flutter/material.dart';
import 'package:therapy/core/widgets/net_image.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/items_entity.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final ItemEntity? item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      color: AppColors.bluee8edf5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            NetImage(url: item?.url ?? '',height: 70,width: 60,),
            const SizedBox(width: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item?.description ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
