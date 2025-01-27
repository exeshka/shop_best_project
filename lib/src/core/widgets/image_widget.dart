import 'package:flutter/material.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
import 'package:shop_best_project/src/core/models/image_model.dart';

class ImageWidget extends StatefulWidget {
  final ImageModel image;

  final BoxFit? fit;

  const ImageWidget({super.key, required this.image, this.fit = BoxFit.cover});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HashCachedImage(
      fit: widget.fit,
      imageUrl: widget.image.url,
      hash: widget.image.hash,
    );
  }
}
