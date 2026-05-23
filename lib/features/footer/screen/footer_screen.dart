import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);

    return Container(
      width: double.infinity,
      color: Colors.blue.shade50,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100.0 : 24.0,
        vertical: 50.0,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Main Content Row/Column Split ---
              isDesktop
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Brand Statement
                  const Expanded(flex: 5, child: _BrandDescriptionBlock()),
                  const Spacer(flex: 1),
                  // Right Side Categorized Navigation Links
                  Expanded(flex: 4, child: _buildLinksGrid(context)),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _BrandDescriptionBlock(),
                  const SizedBox(height: 40),
                  _buildLinksGrid(context),
                ],
              ),

              const SizedBox(height: 50),
              Divider(color: Colors.grey.shade300, height: 1, thickness: 0.8),
              const SizedBox(height: 25),

              // --- Bottom Copyright Line ---
              Center(
                child: Text(
                  "© 2026 Class Champion All rights reserved.",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Right Side Links Component Matrix Layout
  Widget _buildLinksGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Links",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Column 1
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterLink("Instagram",FontAwesomeIcons.instagram),
                  const SizedBox(height: 14),
                  _buildFooterLink("Facebook", FontAwesomeIcons.facebook),
                  const SizedBox(height: 14),
                  _buildFooterLink("Youtube", FontAwesomeIcons.youtube),
                ],
              ),
            ),
            // Column 2
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterLink("linkedin",FontAwesomeIcons.linkedin),
                  const SizedBox(height: 14),
                  _buildFooterLink("Others",FontAwesomeIcons.circle), // As spelled on image wireframe
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildFooterLink(String label, FaIconData icon) {
    return InkWell(
      onTap: () {},
      mouseCursor: SystemMouseCursors.click,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            size: 16,
            color: Colors.grey.shade700,
          ),

          const SizedBox(width: 8),

          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= LEFT SIDE COMPONENT =================
class _BrandDescriptionBlock extends StatelessWidget {
  const _BrandDescriptionBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo Structure Row
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.blue.shade100,
              child:  Icon(Icons.school, size: 14, color: Colors.blue),
            ),
            const SizedBox(width: 8),
             Text(
              "Class Champion",
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 16),
            ),
            const Text(
              "",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Independent Platform Disclaimer Text Paragraph
        Text(
          "Class Champion is an independent platform and is not affiliated with, endorsed by, or associated with Paragon Testing Enterprises or the official CELPIP test",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: RFont.size(context, 13, desktop: 14),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),

        // Legal Navigation Inline Actions Row
        Row(
          children: [
            _buildLegalAction("Terms of Service"),
            const SizedBox(width: 20),
            _buildLegalAction("Privacy Policy"),
          ],
        )
      ],
    );
  }

  Widget _buildLegalAction(String text) {
    return InkWell(
      onTap: () {},
      mouseCursor: SystemMouseCursors.click,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}