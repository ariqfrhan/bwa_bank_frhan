import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeTipsItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String url;

  const HomeTipsItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () async {
        if (await canLaunchUrlString(url)) {
          launchUrlString(url);
        }
      },
      child: Container(
        width: 155,
        height: 178,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Column(
            children: [
              Image.asset(
                imgUrl,
                width: 155,
                height: 110,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  title,
                  style: blackText.copyWith(fontWeight: medium, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
