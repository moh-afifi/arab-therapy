import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class NetImage extends CachedNetworkImage {
  NetImage({
    Key? key,
    required String url,
    double? height,
    double? width,
    double? errorHeight,
    double? errorWidth,
    BoxFit? fit,
    Color? color,
    BoxFit? errorImageFit,
    ImageWidgetBuilder? imageBuilder,
  }) : super(
          key: key,
          imageUrl: url,
          width: width,
          imageBuilder: imageBuilder,
          height: height,
          fit: fit ?? BoxFit.cover,
          color: color,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
          errorWidget: (context, url, error) => SvgPicture.asset(
            'assets/svg/logo.svg',
            height: errorHeight ?? 30.0,
            width: errorWidth ?? 30.0,
            fit: BoxFit.contain,
          ),
        );
}
