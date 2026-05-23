import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FAFF),

      child: Column(
        children: [

          /// TOP SECTION
          LayoutBuilder(
            builder: (context, constraints) {

              if (ScreenHelper.isDesktop(context) || ScreenHelper.isTablet(context)) {
                return const _DesktopView();
              }

              return const _MobileView();
            },
          ),

          /// BOTTOM STATS SECTION
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),

            child: Column(
              children: [

                Text(
                  "Trusted By Thousands Of Students",

                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,

                    fontSize: RFont.size(
                      context,
                      22,
                      tablet: 28,
                      desktop: 34,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  "Learn smarter with live tests, rankings and scholarship opportunities.",

                  textAlign: TextAlign.center,

                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    height: 1.7,

                    fontSize: RFont.size(
                      context,
                      13,
                      tablet: 14,
                      desktop: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                ScreenHelper.isDesktop(context)
                    ? Row(
                  children: [

                    Expanded(
                      child: _buildInfoCard(
                        context,
                        "15K+",
                        "Active Students",
                        Icons.groups_rounded,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: _buildInfoCard(
                        context,
                        "120+",
                        "Mock Tests",
                        Icons.menu_book_rounded,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: _buildInfoCard(
                        context,
                        "98%",
                        "Success Rate",
                        Icons.emoji_events_rounded,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: _buildInfoCard(
                        context,
                        "24/7",
                        "Learning Support",
                        Icons.support_agent_rounded,
                      ),
                    ),
                  ],
                )
                    : GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.2,
                  children: [

                    _buildInfoCard(
                      context,
                      "15K+",
                      "Active Students",
                      Icons.groups_rounded,
                    ),

                    _buildInfoCard(
                      context,
                      "120+",
                      "Mock Tests",
                      Icons.menu_book_rounded,
                    ),

                    _buildInfoCard(
                      context,
                      "98%",
                      "Success Rate",
                      Icons.emoji_events_rounded,
                    ),

                    _buildInfoCard(
                      context,
                      "24/7",
                      "Learning Support",
                      Icons.support_agent_rounded,
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }
}


Widget _buildInfoCard(
    BuildContext context,
    String value,
    String title,
    IconData icon,
    ) {
  return Container(
    padding: const EdgeInsets.all(10),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),

      border: Border.all(
        color: Colors.black12,
      ),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          padding: const EdgeInsets.all(14),

          decoration: BoxDecoration(
            color: const Color(0xFF3B66F5).withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),

          child: Icon(
            icon,
            color: const Color(0xFF3B66F5),
            size: 28,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          value,

          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,

            fontSize: RFont.size(
              context,
              16,
              tablet: 16,
              desktop: 18,
            ),
          ),
        ),


        Text(
          title,

          style: GoogleFonts.poppins(
            color: Colors.black54,
            fontWeight: FontWeight.w500,

            fontSize: RFont.size(
              context,
              12,
              tablet: 14,
              desktop: 14,
            ),
          ),
        ),
      ],
    ),
  );
}
/// ===============================

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 70,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// IMAGE
          Expanded(
            child: Container(
              height: 520,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                image: const DecorationImage(
                  image: AssetImage(
                    "assets/image/shoolboy.jpg",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          const SizedBox(width: 70),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF07E3F),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Text(
                    "About Us",

                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,

                      fontSize: RFont.size(
                        context,
                        12,
                        tablet: 13,
                        desktop: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                /// TITLE
                Text(
                  "Empowering Students\nWith Smart Learning",

                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1.2,

                    fontSize: RFont.size(
                      context,
                      32,
                      tablet: 42,
                      desktop: 56,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// DESCRIPTION
                Text(
                  "Class Champion helps students prepare for exams, "
                      "practice mock tests, improve rankings and unlock "
                      "new learning opportunities through smart digital education.",

                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    height: 1.8,

                    fontSize: RFont.size(
                      context,
                      14,
                      tablet: 15,
                      desktop: 17,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                /// FEATURES
                _buildFeature(
                  context,
                  Icons.check_circle,
                  "Live Practice Tests",
                ),

                const SizedBox(height: 18),

                _buildFeature(
                  context,
                  Icons.check_circle,
                  "Real-Time Rankings",
                ),

                const SizedBox(height: 18),

                _buildFeature(
                  context,
                  Icons.check_circle,
                  "Scholarship Opportunities",
                ),

                const SizedBox(height: 40),

                /// BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B66F5),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Learn More",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ===============================
/// MOBILE VIEW
/// ===============================
class _MobileView extends StatelessWidget {
  const _MobileView();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// IMAGE
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                image: const DecorationImage(
                  image: AssetImage(
                    "assets/image/shoolboy.jpg",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// TAG
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),

              decoration: BoxDecoration(
                color: const Color(0xFF3B66F5),
                borderRadius: BorderRadius.circular(30),
              ),

              child: Text(
                "About Us",

                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,

                  fontSize: RFont.size(
                    context,
                    12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// TITLE
            Text(
              "Empowering Students\nWith Smart Learning",

              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                height: 1.2,

                fontSize: RFont.size(
                  context,
                  34,
                ),
              ),
            ),

            const SizedBox(height: 18),

            /// DESCRIPTION
            Text(
              "Class Champion helps students prepare for exams, "
                  "practice tests and improve performance with "
                  "smart digital learning.",

              style: GoogleFonts.poppins(
                color: Colors.black54,
                height: 1.7,

                fontSize: RFont.size(
                  context,
                  14,
                ),
              ),
            ),

            const SizedBox(height: 30),

            _buildFeature(
              context,
              Icons.check_circle,
              "Live Practice Tests",
            ),

            const SizedBox(height: 15),

            _buildFeature(
              context,
              Icons.check_circle,
              "Real-Time Rankings",
            ),

            const SizedBox(height: 15),

            _buildFeature(
              context,
              Icons.check_circle,
              "Scholarship Opportunities",
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B66F5),
                  foregroundColor: Colors.white,
                  elevation: 0,

                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                onPressed: () {},

                child: Text(
                  "Learn More",

                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// FEATURE TILE
/// ===============================
Widget _buildFeature(
    BuildContext context,
    IconData icon,
    String title,
    ) {
  return Row(
    children: [

      Icon(
        icon,
        color: const Color(0xFF3B66F5),
        size: 24,
      ),

      const SizedBox(width: 12),

      Expanded(
        child: Text(
          title,

          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontWeight: FontWeight.w500,

            fontSize: RFont.size(
              context,
              14,
              tablet: 15,
              desktop: 16,
            ),
          ),
        ),
      ),
    ],
  );
}