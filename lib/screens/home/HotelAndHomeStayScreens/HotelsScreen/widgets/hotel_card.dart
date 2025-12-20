import 'package:flutter/material.dart';
import 'package:hybridtravelagency/data/responses/search_hotels_response.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';

class HotelCard extends StatelessWidget {
  final HotelData hotel;

  const HotelCard({super.key, required this.hotel});

  // Helper method to build the star rating row
  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.yellow, size: 18);
        } else {
          return const Icon(Icons.star_border, color: Colors.yellow, size: 18);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double taxesAndFees = 0;

    return Container(
      // The outer container for the entire card (image + details)
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ------------------------------------
          // 1. TOP IMAGE/THUMBNAIL SECTION (STACK)
          // ------------------------------------
          Stack(
            children: <Widget>[
              // Main Image/Thumbnail
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  hotel.thumbnail ?? '', // Use your photo URL
                  height: 150, // Fixed height for thumbnail
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Simple placeholder for image loading errors
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.image)),
                  ),
                ),
              ),

              // Rating Overlay (Bottom-Left)
              Positioned(
                bottom: 12,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    '${hotel.rating!.toStringAsFixed(1)}/5 (${hotel.reviewCount} verified Ratings)',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              // Heart Icon (Top-Right)
              const Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  backgroundColor:
                      Colors.black45, // Transparent/dark background
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),

          // ------------------------------------
          // 2. BOTTOM DETAILS SECTION
          // ------------------------------------
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // --- HOTEL NAME, RATING, and PRICE ROW ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            hotel.name ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            hotel.address ?? '',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                          ),
                          _buildStarRating(hotel.rating!),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '${SharedPrefUtil.user!.currency} ${hotel.price!.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withValues(alpha: 0.85),
                          ),
                        ),
                        Text(
                          '+ ${SharedPrefUtil.user!.currency} ${taxesAndFees.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text('taxes & fees',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54)),
                        const Text('Per Night',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54)),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // --- LOCATION/DISTANCE TEXT ---

                const Divider(height: 2, thickness: 1),

                // --- INCLUDED FEATURES (Breakfast) ---
                // if (hotel.isBreakfastIncluded)
                const Padding(
                  padding: EdgeInsets.only(bottom: 4.0,top: 4),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.check_circle, color: Colors.red, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Breakfast Included',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // --- BOOKING STATS (Great Choice!) ---
                Row(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(Icons.flash_on,
                          color: Colors.white, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Great Choice! Booked ${hotel.reviewCount}+ times in last 15 Days',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
