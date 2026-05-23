import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';

class ResponseScreen extends StatefulWidget {
  const ResponseScreen({super.key});

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  // Current active tab index track karne ke liye
  int _selectedTabIndex = 0;

  // Mock Data Structure: Har tab ke liye alag data render karne ke liye
  final List<Map<String, dynamic>> _tabsData = [
    {
      "title": "Mock Test",
      "mainScore": 8,
      "maxScore": 12,
      "status": "Excellent and clear",
      "description": "The response addresses all requirements with clear organization, varied vocabulary, and proper language use.",
      "coherence": 7,
      "vocabulary": 9,
      "readability": 10,
      "fulfillment": 6,
    },
    {
      "title": "Practice & Submit",
      "mainScore": 6,
      "maxScore": 12,
      "status": "Good Progress",
      "description": "Good structure overall, but structure could be more cohesive. Focus on linking words and smoother sentence transitions.",
      "coherence": 6,
      "vocabulary": 7,
      "readability": 8,
      "fulfillment": 5,
    },
    {
      "title": "AI Review",
      "mainScore": 9,
      "maxScore": 12,
      "status": "Highly Structured",
      "description": "AI analysis shows strong vocabulary usage and complex grammar structures. Minor punctuation errors detected.",
      "coherence": 9,
      "vocabulary": 10,
      "readability": 9,
      "fulfillment": 8,
    },
    {
      "title": "Improve",
      "mainScore": 5,
      "maxScore": 12,
      "status": "Needs Attention",
      "description": "Try expanding your arguments. Work on grammar consistency and spelling accuracy to improve the band score.",
      "coherence": 5,
      "vocabulary": 6,
      "readability": 6,
      "fulfillment": 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Current tab ka data extract kar rahe hain
    final currentData = _tabsData[_selectedTabIndex];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (ScreenHelper.isDesktop(context)) {
          return _DesktopView(
            selectedTabIndex: _selectedTabIndex,
            currentData: currentData,
            onTabChanged: (index) => setState(() => _selectedTabIndex = index),
          );
        }
        if (ScreenHelper.isTablet(context)) {
          return _TabletView(
            selectedTabIndex: _selectedTabIndex,
            currentData: currentData,
            onTabChanged: (index) => setState(() => _selectedTabIndex = index),
          );
        }
        return _MobileView(
          selectedTabIndex: _selectedTabIndex,
          currentData: currentData,
          onTabChanged: (index) => setState(() => _selectedTabIndex = index),
        );
      },
    );
  }
}

/// ================= DESKTOP VIEW =================
class _DesktopView extends StatelessWidget {
  final int selectedTabIndex;
  final Map<String, dynamic> currentData;
  final ValueChanged<int> onTabChanged;

  const _DesktopView({
    required this.selectedTabIndex,
    required this.currentData,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get Real-Time Insights on Your Responses",
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: RFont.size(context, 24, desktop: 32),
            ),
          ),
          const SizedBox(height: 30),
          _CustomSegmentedTabBar(
            selectedIndex: selectedTabIndex,
            onTabTap: onTabChanged,
          ),
          const SizedBox(height: 40),
          _MainScoreReportCard(isDesktop: true, data: currentData),
        ],
      ),
    );
  }
}

/// ================= TABLET VIEW =================
class _TabletView extends StatelessWidget {
  final int selectedTabIndex;
  final Map<String, dynamic> currentData;
  final ValueChanged<int> onTabChanged;

  const _TabletView({
    required this.selectedTabIndex,
    required this.currentData,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get Real-Time Insights",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: RFont.size(context, 24, tablet: 28),
            ),
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _CustomSegmentedTabBar(
              selectedIndex: selectedTabIndex,
              onTabTap: onTabChanged,
            ),
          ),
          const SizedBox(height: 35),
          _MainScoreReportCard(isDesktop: false, data: currentData),
        ],
      ),
    );
  }
}

/// ================= MOBILE VIEW =================
class _MobileView extends StatelessWidget {
  final int selectedTabIndex;
  final Map<String, dynamic> currentData;
  final ValueChanged<int> onTabChanged;

  const _MobileView({
    required this.selectedTabIndex,
    required this.currentData,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get Real-Time Insights",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: RFont.size(context, 20),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _CustomSegmentedTabBar(
              selectedIndex: selectedTabIndex,
              onTabTap: onTabChanged,
            ),
          ),
          const SizedBox(height: 25),
          _MainScoreReportCard(isDesktop: false, data: currentData),
        ],
      ),
    );
  }
}

/// ================= WIDGETS PARTS =================

class _CustomSegmentedTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabTap;

  const _CustomSegmentedTabBar({
    required this.selectedIndex,
    required this.onTabTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTabItem(context,0, "Mock Test"),
          _buildTabItem(context,1, "Practice & Submit"),
          _buildTabItem(context,2, "AI Review"),
          _buildTabItem(context,3, "Improve"),
        ],
      ),
    );
  }

  Widget _buildTabItem(BuildContext context,int index, String title) {
    final bool isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTabTap(index), // Tap hone par parent ko index notify karega
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF3B66F5) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey.shade600,
            fontWeight: FontWeight.w600,
            fontSize:  RFont.size(
              context,
              12,
              tablet: 14,
              desktop: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _MainScoreReportCard extends StatelessWidget {
  final bool isDesktop;
  final Map<String, dynamic> data; // Dynamic data receive karne ke liye

  const _MainScoreReportCard({
    required this.isDesktop,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header of Card (Mascot + Badges)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/image/shoolboy.jpg',
                height: 100,
                width: 100,
                errorBuilder: (c, e, s) => const Icon(Icons.face, size: 30, color: Colors.grey),
              ),
              Row(
                children: [
                  _buildStatusBadge("Mock Exam", const Color(0xFFFCEEF3), const Color(0xFFD84B83)),
                  const SizedBox(width: 10),
                  _buildStatusBadge("Score", const Color(0xFFE6F7F4), const Color(0xFF1EA48F)),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Class Champion Score Result - ${data['title']}",
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: RFont.size(context, 22, desktop: 28),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Receive feedback and estimated Class Champion scores for your writing and speaking tasks, aligned with official evaluation criteria",
            style: TextStyle(
              color: Colors.grey.shade600,
              height: 1.5,
              fontSize: RFont.size(context, 14, desktop: 16),
            ),
          ),
          const SizedBox(height: 35),

          // Core Assessment Block Bordered Box
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Highlight Box (Main Score)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildCircularIndicator(data['mainScore'], data['maxScore'], "Score", Colors.deepOrangeAccent),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['status'],
                              style: TextStyle(
                                color: AppColors.textDark,
                                fontWeight: FontWeight.bold,
                                fontSize: RFont.size(context, 16, desktop: 18),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data['description'],
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.4),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(height: 1, color: Colors.grey.shade200),

                // Bottom Detailed Parameters Breakdown
                isDesktop
                    ? Row(
                  children: [
                    Expanded(child: _buildSubScoreTile(data['coherence'], 12, "Coherence", Colors.orange)),
                    _buildVerticalDivider(),
                    Expanded(child: _buildSubScoreTile(data['vocabulary'], 12, "Vocabulary", Colors.teal)),
                    _buildVerticalDivider(),
                    Expanded(child: _buildSubScoreTile(data['readability'], 12, "Readability", Colors.black)),
                    _buildVerticalDivider(),
                    Expanded(child: _buildSubScoreTile(data['fulfillment'], 12, "Fulfillment", Colors.deepOrange)),
                  ],
                )
                    : GridView(
                  shrinkWrap: true, // Crucial inside Column
                  physics: const NeverScrollableScrollPhysics(), // Disables nested scroll conflicts
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3, // Prevents stretching items vertically
                  ),
                  children: [
                    _buildSubScoreTile(data['coherence'], 12, "Coherence", Colors.orange),
                    _buildSubScoreTile(data['vocabulary'], 12, "Vocabulary", Colors.teal),
                    _buildSubScoreTile(data['readability'], 12, "Readability", Colors.black),
                    _buildSubScoreTile(data['fulfillment'], 12, "Fulfillment", Colors.deepOrange),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String text, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 12)),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(height: 90, width: 1, color: Colors.grey.shade200);
  }

  Widget _buildSubScoreTile(int score, int max, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: _buildCircularIndicator(score, max, label, color),
    );
  }

  Widget _buildCircularIndicator(int score, int max, String label, Color arcColor) {
    double progress = score / max;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 4.5,
                backgroundColor: Colors.grey.shade100,
                valueColor: AlwaysStoppedAnimation<Color>(arcColor),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$score", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87)),
                Text("/$max", style: TextStyle(fontSize: 10, color: Colors.grey.shade500, height: 0.9)),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(label, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w500, fontSize: 12)),
      ],
    );
  }
}