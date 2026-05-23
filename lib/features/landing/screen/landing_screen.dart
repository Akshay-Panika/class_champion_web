import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        /// DESKTOP
        if (ScreenHelper.isDesktop(context)) {
          return const _DesktopView();
        }

        /// TABLET
        if (ScreenHelper.isTablet(context)) {
          return const _TabletView();
        }

        /// MOBILE
        return const _MobileView();
      },
    );
  }
}


final List<Map<String, dynamic>> features = [
  {
    "icon": Icons.calendar_today_outlined,
    "title": "50 mock exams",
  },
  {
    "icon": Icons.school_outlined,
    "title": "Guide & Tips",
  },
  {
    "icon": Icons.assignment_outlined,
    "title": "3,000+ sample tests",
  },
  {
    "icon": Icons.smart_toy_outlined,
    "title": "AI-powered scoring",
  },
];

final List<Map<String, dynamic>> tabs = [
  {
    "icon": Icons.hearing,
    "title": "Listening",
    "color": const Color(0xFFECEFFB),
  },
  {
    "icon": Icons.mic_none,
    "title": "Speaking",
    "color": const Color(0xFFFDF2EB),
  },
  {
    "icon": Icons.edit_outlined,
    "title": "Writing",
    "color": const Color(0xFFE6F7F4),
  },
  {
    "icon": Icons.menu_book_outlined,
    "title": "Reading",
    "color": const Color(0xFFFCEEF3),
  },
  {
    "icon": Icons.analytics_outlined,
    "title": "Mock Exams",
    "color": const Color(0xFFF3EBF9),
  },
];


class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 80,
      ),
      child: Column(
        children: [

          /// TOP SECTION
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// LEFT
              Expanded(
                flex: 6,
                child: const LandingContent(
                  isCenter: false,
                ),
              ),

              const SizedBox(width: 50),

              /// RIGHT
              Expanded(
                flex: 5,
                child: Row(
                  children: [

                    /// FEATURES
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: features.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: FeatureItem(
                              icon: e["icon"],
                              title: e["title"],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    /// IMAGE
                    const Expanded(
                      child: HeroImage(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          /// BOTTOM CARDS
          Row(
            children: tabs.map((e) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BottomTabCard(
                    icon: e["icon"],
                    title: e["title"],
                    color: e["color"],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _TabletView extends StatelessWidget {
  const _TabletView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 50,
      ),
      child: Column(
        children: [

          const LandingContent(
            isCenter: true,
          ),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              /// FEATURES
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: FeatureItem(
                        icon: e["icon"],
                        title: e["title"],
                      ),
                    );
                  }).toList(),
                ),
              ),

              /// IMAGE
              Expanded(child: HeroImage()),
            ],
          ),

          const SizedBox(height: 40),

          GridView.builder(
            shrinkWrap: true,
            itemCount: tabs.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.4,
            ),
            itemBuilder: (context, index) {
              return BottomTabCard(
                icon: tabs[index]["icon"],
                title: tabs[index]["title"],
                color: tabs[index]["color"],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [

          const LandingContent(
            isCenter: true,
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              /// FEATURES
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: FeatureItem(
                        icon: e["icon"],
                        title: e["title"],
                      ),
                    );
                  }).toList(),
                ),
              ),

              /// IMAGE
              Expanded(child: HeroImage()),
            ],
          ),

          const SizedBox(height: 40),

          GridView.builder(
            shrinkWrap: true,
            itemCount: tabs.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              return BottomTabCard(
                icon: tabs[index]["icon"],
                title: tabs[index]["title"],
                color: tabs[index]["color"],
              );
            },
          ),
        ],
      ),
    );
  }
}

class LandingContent extends StatelessWidget {
  final bool isCenter;

  const LandingContent({
    super.key,
    required this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isCenter
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [

        /// BADGE
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF07E3F),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: List.generate(
                  3,
                      (index) => Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white24,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Trusted by 10k+ test-takers",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
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
        ),

        const SizedBox(height: 25),

        /// TITLE
        RichText(
          textAlign:
          isCenter
              ? TextAlign.center
              : TextAlign.start,
          text: TextSpan(
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
            children: const [
              TextSpan(
                text: "Reach Your Target\n",
              ),
              TextSpan(
                text: "Class Champion",
                style: TextStyle(
                  color: Color(0xFF3B66F5),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        /// BUTTON
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: const Text(
            "Start Your Free Practice",
          ),
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
        ),

        const SizedBox(height: 24),

        /// RATING
        Row(
          mainAxisAlignment:
          isCenter
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.workspace_premium,
              color: Colors.orange,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              "Top Rated Class Champion Resource 2026",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: RFont.size(
                  context,
                  12,
                  tablet: 14,
                  desktop: 13,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 22,
          color: Colors.black87,
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: RFont.size(
                context,
                14,
                tablet: 16,
                desktop: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.isMobile(context)
          ? 300
          : 350,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(
            'assets/image/shoolboy.jpg',
          ),
        ),
      ),
    );
  }
}

class BottomTabCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const BottomTabCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey,
          width: .3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /// ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 20,
            ),
          ),

          const SizedBox(height: 14),

          /// TITLE
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: RFont.size(
                context,
                12,
                tablet: 14,
                desktop: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}