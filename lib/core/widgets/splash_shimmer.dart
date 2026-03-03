import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double spacing;
  final int lines;

  const SplashShimmer({
    super.key,
    this.width = 200,
    this.height = 20,
    this.spacing = 12,
    this.lines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(lines, (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == lines - 1 ? 0 : spacing,
              ),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (_, __) {
        return const SplashShimmer(
          width: double.infinity,
          height: 200,
          lines: 1,
        );
      },
    );
  }
}
