import 'package:class_champion/core/widget/responsive_font.dart';
import 'package:class_champion/core/widget/screen_helper.dart';
import 'package:class_champion/features/footer/screen/footer_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PracticeOverviewScreen extends StatelessWidget {
  const PracticeOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context, constraints) {

        /// DESKTOP + TABLET SAME LAYOUT
        if (ScreenHelper.isDesktop(context) || ScreenHelper.isTablet(context)) {
          return const _DesktopView();
        }

        /// MOBILE LAYOUT
        return const _MobileView();
      },
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 60,
        ),

        child: Row(
          children: [

            /// LEFT SIDE
            Expanded(
              flex: 2,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  /// TAG
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
                      "Practice Overview",

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

                  const SizedBox(height: 25),

                  /// TITLE
                  Text(
                    "Prepare For\nYour Next Exam",

                    style: GoogleFonts.poppins(
                      color: Colors.black,

                      fontSize: RFont.size(
                        context,
                        34,
                        tablet: 42,
                        desktop: 58,
                      ),

                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  SizedBox(
                    width: 600,

                    child: Text(
                      "Practice class-wise exams, improve your ranking "
                          "and unlock free education opportunities "
                          "by scoring high in competitive tests.",

                      style: GoogleFonts.poppins(
                        color: Colors.black54,

                        fontSize: RFont.size(
                          context,
                          14,
                          tablet: 15,
                          desktop: 17,
                        ),

                        height: 1.8,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// BUTTONS
                  Row(
                    children: [
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
                          "Start Practice",
                        ),
                      ),

                      const SizedBox(width: 20),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.black12,
                          ),
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
                          "View Results",

                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,

                            fontSize: RFont.size(
                              context,
                              12,
                              tablet: 14,
                              desktop: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  /// STATS
                  Row(
                    children: [

                      Expanded(
                        child: _buildStatCard(
                          context,
                          "15K+",
                          "Students",
                        ),
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: _buildStatCard(
                          context,
                          "120+",
                          "Practice Tests",
                        ),
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: _buildStatCard(
                          context,
                          "98%",
                          "Success Rate",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 60),

            /// RIGHT SIDE
            Expanded(
              child: Container(
                height: 550,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      'assets/image/shoolboy.jpg',
                    ),
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

class _MobileView extends StatelessWidget {
  const _MobileView();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// TAG
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),

                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.10),
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Text(
                  "Practice Overview",

                  style: GoogleFonts.poppins(
                    color: Colors.blue,
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

              const SizedBox(height: 25),

              /// TITLE
              Text(
                "Prepare For\nYour Next Exam",

                style: GoogleFonts.poppins(
                  color: Colors.black,

                  fontSize: RFont.size(
                    context,
                    34,
                    tablet: 42,
                    desktop: 58,
                  ),

                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 20),

              /// DESCRIPTION
              Text(
                "Practice exams, improve your rank and unlock "
                    "free education opportunities.",

                style: GoogleFonts.poppins(
                  color: Colors.black54,

                  fontSize: RFont.size(
                    context,
                    14,
                    tablet: 15,
                    desktop: 17,
                  ),

                  height: 1.7,
                ),
              ),

              const SizedBox(height: 35),

              /// IMAGE BOX
              Container(
                height: 250,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),

                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff2563EB),
                      Color(0xff7C3AED),
                    ],
                  ),
                ),

                child: Center(
                  child: Icon(
                    Icons.school_rounded,

                    size: RFont.size(
                      context,
                      100,
                      tablet: 140,
                      desktop: 180,
                    ),

                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              /// START BUTTON
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,

                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  onPressed: () {},

                  child: Text(
                    "Start Practice",

                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,

                      fontSize: RFont.size(
                        context,
                        12,
                        tablet: 15,
                        desktop: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// RESULT BUTTON
              SizedBox(
                width: double.infinity,

                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.black12,
                    ),

                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  onPressed: () {},

                  child: Text(
                    "View Results",

                    style: GoogleFonts.poppins(
                      color: Colors.black,

                      fontSize: RFont.size(
                        context,
                        12,
                        tablet: 15,
                        desktop: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              /// STATS
              Row(
                children: [

                  Expanded(
                    child: _buildStatCard(
                      context,
                      "15K+",
                      "Students",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _buildStatCard(
                      context,
                      "120+",
                      "Tests",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _buildStatCard(
                      context,
                      "98%",
                      "Success",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStatCard(
    BuildContext context,
    String value,
    String title,
    ) {

  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 22,
    ),

    decoration: BoxDecoration(
      // color: Colors.grey.shade100,

      borderRadius: BorderRadius.circular(20),

      border: Border.all(
        color: Colors.black12,
      ),
    ),

    child: Column(
      children: [

        Text(
          value,

          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,

            fontSize: RFont.size(
              context,
              18,
              tablet: 20,
              desktop: 24,
            ),
          ),
        ),

        const SizedBox(height: 8),

        Text(
          title,

          style: GoogleFonts.poppins(
            color: Colors.black54,

            fontSize: RFont.size(
              context,
              12,
              tablet: 13,
              desktop: 14,
            ),
          ),
        ),
      ],
    ),
  );
}