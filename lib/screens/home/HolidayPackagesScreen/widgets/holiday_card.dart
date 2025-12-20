import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/search_holidays_response.dart';
import 'package:hybridtravelagency/navigators/app_pages.dart';
import 'package:hybridtravelagency/utils/utils.dart';

class HolidayCard extends StatelessWidget {
  final HolidayData data;

  const HolidayCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the original price for the strikethrough effect
    final int oldPrice =
        (data.price! + 150); // Placeholder calculation if oldPrice is null

    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.holidayDetailsScreen,
          arguments: data,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Title Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                data.title ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // 3. Image Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      data.packageImage ?? '',
                      fit: BoxFit.cover,
                      height: 120,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 120,
                        color: Colors.grey[200],
                        child: const Center(child: Text('Image Unavailable')),
                      ),
                    ),
                  ),

                  // Days/Nights Badge
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        data.daysnight ?? 'N/D',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 4. Icons and Counts Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconText(Icons.flight, data.flight ?? 0, 'Flights'),
                  _buildIconText(Icons.apartment, data.hotels ?? 0, 'Hotels'),
                  _buildIconText(Icons.self_improvement, data.activities ?? 0,
                      'Activities'),
                  _buildIconText(
                      Icons.car_rental, data.transfer ?? 0, 'Transfer'),
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
                  // City Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.city!.join(' | '),
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Inclusions
                        // if (data.pkginclusion != null)
                        //   ...data.pkginclusion!.split(',').map((inclusion) => _buildInclusionBullet(inclusion.trim())).toList(),

                        // Html(
                        //         data: data.pkginclusion??''),
                      ],
                    ),
                  ),

                  // Price Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${currency()} ${oldPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '${currency()} ${data.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Per Person',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
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

  // Helper widget for the icons row
  Widget _buildIconText(IconData icon, int count, String label) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.black),
        const SizedBox(height: 4),
        Text(
          '$count $label',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
