import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime getDateFromString(String dateString, {String? formatter}) {
  const String kMainSourceFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
  if (formatter == null) {
    formatter = kMainSourceFormat;
  }
  return DateFormat(formatter).parse(dateString);
}

class CommonNetworkImageView extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final BoxFit fit;
  final String placeHolder;

  CommonNetworkImageView({
    required this.url,
    this.height = 200,
    this.width = 200,
    this.fit = BoxFit.contain,
    this.placeHolder = 'assets/user_image.png',
  });

  @override
  Widget build(BuildContext context) {
    return url.isEmpty
        ? Image.asset(
            placeHolder,
            height: height,
            width: width,
            fit: fit,
          )
        : CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: url,
            placeholder: (context, url) => Container(
              height: 30,
              width: 30,
              child: LinearProgressIndicator(
                color: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade100,
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              placeHolder,
              height: height,
              width: width,
              fit: fit,
            ),
          );
  }
}
