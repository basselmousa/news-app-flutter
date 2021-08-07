import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  String imageUrl;

  CircleImage({imageUrl}) : imageUrl = imageUrl ?? '';

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (iContext, imageProvider) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(18),
            image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
          ),
        );
      },
      placeholder: (contextPlaceholder, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (errorContext, url, error){
        return Icon(Icons.error);
      },
    );
  }
}
