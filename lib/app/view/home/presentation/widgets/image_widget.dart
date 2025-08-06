import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key,required this.path,required this.name,this.height,this.width});
  final String path;
  final String name;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {

    return path.isNotEmpty
        ? CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/w500${path}',
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorWidget: (context, error, stackTrace) {
        return placeHolderImage(context);
      },
    )
        : placeHolderImage(context);
  }

  Container placeHolderImage(BuildContext context) => Container(color:Theme.of(context).colorScheme.primary, child: Text(name.toUpperCase(),style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),);
}
