import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Widget to display a cached network image
class CachedNetworkImageComponent extends StatelessWidget {
  final String imageUrl; // URL of the image to be displayed
  final double height; // Height of the image container
  final double width; // Width of the image container

  // Constructor with named parameters
  const CachedNetworkImageComponent({
    super.key,
    required this.imageUrl, // Required parameter for the image URL
    this.height = 128, // Default height if not provided
    this.width = double.infinity, // Default width if not provided
  });

  @override
  Widget build(BuildContext context) {
    // Return CachedNetworkImage widget to display the image
    return CachedNetworkImage(
      imageUrl: imageUrl, // Set the URL of the image to be fetched
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
            value: downloadProgress
                .progress), // Display progress indicator while image is loading
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error), // Display error icon if image loading fails
      height: height, // Set the height of the image container
      width: width, // Set the width of the image container
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider, // Set the image provider for the container
            fit: BoxFit.cover, // Adjust the image to cover the container
          ),
        ),
      ),
    );
  }
}
