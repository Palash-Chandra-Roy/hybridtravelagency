import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget flightsShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(height: 30, width: 30, color: Colors.grey), // image
              const SizedBox(width: 8),
              Container(
                  height: 12, width: 80, color: Colors.grey), // airline name
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (i) {
              return Column(
                children: [
                  Container(height: 14, width: 50, color: Colors.grey),
                  const SizedBox(height: 6),
                  Container(height: 10, width: 40, color: Colors.grey),
                ],
              );
            }),
          ),
          const SizedBox(height: 15),
          Container(
            height: 20,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget airportsShimmer() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      title: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 16,
          width: 120,
          color: Colors.white,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 12,
            width: 200,
            color: Colors.white,
          ),
        ),
      ),
      trailing: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 16,
          width: 40,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget holidaysShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header Section (FLEXI PACKAGE)
          Padding(
            padding: const EdgeInsets.all(12.0).copyWith(bottom: 0),
            child: Row(
              children: [
                _shimmerBlock(
                    width: 20,
                    height: 20,
                    borderRadius: BorderRadius.circular(10)), // Icon
                const SizedBox(width: 8),
                _shimmerBlock(width: 80, height: 14), // Text
              ],
            ),
          ),

          // 2. Title Section (Two lines of text)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _shimmerBlock(width: double.infinity, height: 18),
                const SizedBox(height: 4),
                _shimmerBlock(width: 50, height: 18),
              ],
            ),
          ),

          // 3. Image Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: _shimmerBlock(
              height: 40,
              width: double.infinity,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),

          // 4. Icons and Counts Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Flight Icon/Text Block
                _buildShimmerIconText(),
                // Hotel Icon/Text Block
                _buildShimmerIconText(),
                // Activities Icon/Text Block
                // _buildShimmerIconText(),
                // // Transfer Icon/Text Block
                // _buildShimmerIconText(),
              ],
            ),
          ),

          const Divider(indent: 12, endIndent: 12, height: 24),

          // 5. City and Price Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // City Details / Inclusions
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _shimmerBlock(
                          width: 100, height: 16), // City (Krabi | Phuket)
                      const SizedBox(height: 12),
                      _shimmerBlock(width: 120, height: 14), // Inclusion 1
                      const SizedBox(height: 8),
                      _shimmerBlock(width: 90, height: 14), // Inclusion 2
                    ],
                  ),
                ),

                // Price Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _shimmerBlock(width: 60, height: 14), // Strikethrough price
                    const SizedBox(height: 4),
                    _shimmerBlock(width: 90, height: 22), // Main price
                    const SizedBox(height: 4),
                    _shimmerBlock(width: 70, height: 12), // Per Person
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    ),
  );
}

Widget _shimmerBlock(
    {double width = double.infinity,
    required double height,
    BorderRadius? borderRadius}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(4.0),
    ),
  );
}

Widget _buildShimmerIconText() {
  return Column(
    children: [
      _shimmerBlock(width: 24, height: 24), // Icon
      const SizedBox(height: 4),
      _shimmerBlock(width: 60, height: 12), // Text
    ],
  );
}

Widget bookingShimmer() {
  return ListView.builder(
    padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
    itemCount: 4,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 14,
                        width: 150,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 12,
                        width: 100,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 12,
                        width: 80,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 12,
                        width: 120,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget activityDetailsShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Gallery Shimmer
          Container(
            height: 300,
            width: Get.width,
            color: Colors.white,
          ),

          // Title Section Shimmer
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24,
                  width: Get.width * 0.8,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 24,
                  width: Get.width * 0.5,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Container(
                  height: 20,
                  width: 150,
                  color: Colors.white,
                ),
              ],
            ),
          ),

          // Activity Info Section Shimmer
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 150,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                ...List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 12,
                                      width: 80,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      height: 14,
                                      width: 120,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
              ],
            ),
          ),

          // Overview Section Shimmer
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 180,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Container(
                  height: 16,
                  width: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                ...List.generate(
                    4,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Container(
                            height: 14,
                            width: Get.width,
                            color: Colors.white,
                          ),
                        )),
                Container(
                  height: 14,
                  width: Get.width * 0.6,
                  color: Colors.white,
                ),
              ],
            ),
          ),

          // Expandable Sections Shimmer
          ...List.generate(
              4,
              (index) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 16,
                            width: 150,
                            color: Colors.white,
                          ),
                          Container(
                            height: 24,
                            width: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )),

          // Reviews Section Shimmer
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      color: Colors.white,
                    ),
                    Container(
                      height: 14,
                      width: 80,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: 18,
                  width: 60,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                ...List.generate(
                    2,
                    (index) => Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 14,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    height: 14,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 12,
                                width: Get.width * 0.7,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 12,
                                width: Get.width * 0.5,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
