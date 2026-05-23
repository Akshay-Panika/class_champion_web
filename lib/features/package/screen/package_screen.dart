import 'package:class_champion/core/widget/responsive_font.dart';
import 'package:class_champion/core/widget/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);
    final double horizontalPadding = isDesktop ? 100.0 : 20.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 100,),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 50.0 : 14.0,
                    vertical: isDesktop ? 50.0 : 16.0,
                  ),
                  decoration: BoxDecoration(
                    color:Color(0xFF3B66F5),
                    borderRadius: BorderRadius.circular(24), // Smooth layout curves
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLeftContent(context, isDesktop),
                      const Spacer(flex: 4),

                    ],
                  ),
                ),
              ],
            )
          ),
         Positioned(
            right: isDesktop ? 40:0,
            bottom: -12,
            top: -40,
            child: Image.asset(
              'assets/image/shoolboy.jpg',
              fit: BoxFit.contain,
              errorBuilder: (c, e, s) => const _MascotPlaceholder(),
            ),
          )

        ],
      ),
    );
  }

  Widget _buildLeftContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Heading Text
        Text(
          "The Best Practice Exercises for\nClass Champion Exam Preparation",
          textAlign:  TextAlign.start,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: RFont.size(context, 12,tablet: 14,desktop: 16),
          ),
        ),
        const SizedBox(height: 35),

        Flex(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: ScreenHelper.isDesktop(context) ?Axis.horizontal:Axis.vertical,
          children: [
            // Start Your Free Practice Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Color(0xFFFA5222), size: 18),
                  SizedBox(width: 6),
                  Text(
                    "Start Your Free Practice",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF1E293B),
                      fontWeight: FontWeight.w600,
                      fontSize: RFont.size(context, 12,tablet: 14,desktop: 14),
                    ),
                  ),
                ],
              ),
            ),

            // No Credit Card Required Text
             Text(
              "No credit card required",
              style: GoogleFonts.poppins(
                color: Colors.white, // Slightly soft faded look like web mockup
                fontSize: RFont.size(context, 12,tablet: 14,desktop: 16),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Fallback error placeholder widget
class _MascotPlaceholder extends StatelessWidget {
  const _MascotPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration:  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: const Icon(Icons.face, size: 60, color: Colors.white),
    );
  }
}