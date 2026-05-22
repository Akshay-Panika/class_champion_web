import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';

class TrustUsScreen extends StatelessWidget {
  const TrustUsScreen({super.key});

  // Mock Review Data Structuring
  final List<Map<String, dynamic>> _reviews = const [
    {
      "name": "Carlos Mendoza",
      "rating": 5,
      "comment": "CLPIP.com made a huge difference for me. The speaking practice and instant feedback gave me confidence. I passed with 9 in all sections!"
    },
    {
      "name": "Li Wei",
      "rating": 5,
      "comment": "The speaking section on this website is amazing. I recorded my answers and compared with high-score samples. It helped a lot."
    },
    {
      "name": "Tatiana Volkov",
      "rating": 5,
      "comment": "Simple and powerful. I used it for a month and improved in all 4 sections. The dashboard tracking my progress was a nice bonus."
    },
    {
      "name": "Ahmed El-Sayed",
      "rating": 5,
      "comment": "I finally got CLB 9 in writing after using CLPIP.com for two weeks. The AI feedback was exactly what I needed to improve structure and coherence. Highly recommend it!"
    },
    {
      "name": "Dalia Haddad",
      "rating": 5,
      "comment": "So many useful strategies I learned from the reading section. The mock tests are challenging but realistic. Helped calm my anxiety."
    }
  ];

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ScreenHelper.isDesktop(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80.0 : 20.0,
        vertical: 60.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Main Heading Title Text
          Text(
            "Join 20,000+ Graduates Who Trust Us",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1E293B), // Premium dark text slate-color
              fontWeight: FontWeight.bold,
              fontSize: RFont.size(context, 18, tablet: 20, desktop: 30),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 50),

          // Responsive Layout Condition block
          isDesktop
              ? _buildDesktopLayout()
              : _buildMobileAndTabletLayout(context),
        ],
      ),
    );
  }

  /// ================= DESKTOP TILTED VIEW =================
  Widget _buildDesktopLayout() {
    return Column(
      children: [
        // Top Row: 3 straight linear aligned review blocks
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _ReviewCard(review: _reviews[0])),
            const SizedBox(width: 25),
            Expanded(child: _ReviewCard(review: _reviews[1])),
            const SizedBox(width: 25),
            Expanded(child: _ReviewCard(review: _reviews[2])),
          ],
        ),
        const SizedBox(height: 40),

        // Bottom Row: 2 slanted (rotated) artistic offsets cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Slanted Card (-6 Degrees Counter-Clockwise)
              Expanded(
                child: Transform.rotate(
                  angle: -6 * (math.pi / 180),
                  child: _ReviewCard(review: _reviews[3]),
                ),
              ),
              const SizedBox(width: 80),
              // Right Slanted Card (5 Degrees Clockwise)
              Expanded(
                child: Transform.rotate(
                  angle: 5 * (math.pi / 180),
                  child: _ReviewCard(review: _reviews[4]),
                ),
              ),
            ],
          ),
        ),
        // Adding artificial structural space down below for rotation overhang overflow
        const SizedBox(height: 50),
      ],
    );
  }

  /// ================= MOBILE & TABLET COLUMN VIEW =================
  Widget _buildMobileAndTabletLayout(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _reviews.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: _ReviewCard(review: _reviews[index]),
        );
      },
    );
  }
}

/// ================= REVIEW CARD REUSABLE WIDGET =================
class _ReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;

  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Soft card corners matching mockup
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 12), // Subtle elegant web depth drop shadow
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row: Avatar Profile + Metadata details
          Row(
            children: [
              // Circular placeholder mockup profile
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey.shade100,
                child: const Icon(Icons.person, color: Colors.blueGrey, size: 22),
              ),
              const SizedBox(width: 14),

              // Name & Golden Stars container block
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review['name'],
                      style: const TextStyle(
                        color: Color(0xFF1E293B),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: List.generate(
                        review['rating'],
                            (index) => const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFC107), // Golden Accent Stars color
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),

          // Review Feedback comment body text paragraph
          Text(
            review['comment'],
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: RFont.size(context, 13.5, desktop: 14),
              height: 1.5, // Line height rendering for better readability
            ),
          ),
        ],
      ),
    );
  }
}