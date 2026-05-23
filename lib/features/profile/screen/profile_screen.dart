import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktopOrTablet =
        ScreenHelper.isTablet(context) || ScreenHelper.isDesktop(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      appBar: AppBar(
        title: Text(
          "Student Profile",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: RFont.size(context, 12,tablet: 14,desktop: 16)),
        ),
        backgroundColor: const Color(0xFF3B66F5),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: isDesktopOrTablet
            ? _desktopLayout(context)
            : _mobileLayout(context),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  LAYOUTS
  // ─────────────────────────────────────────────

  Widget _mobileLayout(BuildContext context) {
    return Column(
      children: [
        _profileCard(context),
        const SizedBox(height: 16),
        _statsRow(context),
        const SizedBox(height: 16),
        _rankCard(context),
        const SizedBox(height: 16),
        _registrationCard(context),
        const SizedBox(height: 16),
        _subjectsCard(context),
        const SizedBox(height: 16),
        _documentsCard(context),
      ],
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column
        SizedBox(
          width: 300,
          child: Column(
            children: [
              _profileCard(context),
              const SizedBox(height: 16),
              _rankCard(context),
              const SizedBox(height: 16),
              _documentsCard(context),
            ],
          ),
        ),

        const SizedBox(width: 16),

        // Right column
        Expanded(
          child: Column(
            children: [
              _statsRow(context),
              const SizedBox(height: 16),
              _registrationCard(context),
              const SizedBox(height: 16),
              _subjectsCard(context),
            ],
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  PROFILE CARD
  // ─────────────────────────────────────────────

  Widget _profileCard(BuildContext context) {
    return _card(
      child: Column(
        children: [
          // Avatar
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEEF1FF),
                  border: Border.all(
                      color: const Color(0xFF3B66F5), width: 2.5),
                ),
                child: const Icon(Icons.person,
                    size: 48, color: Color(0xFF3B66F5)),
              ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: const Color(0xFF3B66F5),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.camera_alt,
                    size: 13, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            "Rahul Sharma",
            style: GoogleFonts.poppins(
              fontSize: RFont.size(context, 12, tablet: 16, desktop: 18),
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1D2E),
            ),
          ),

          const SizedBox(height: 4),

          _badge("Class 8 – Science"),

          const SizedBox(height: 12),
          const Divider(color: Color(0xFFE6EAF5)),
          const SizedBox(height: 12),

          // Info rows
          _infoRow(Icons.email_outlined, "rahul.sharma@email.com"),
          _infoRow(Icons.phone_outlined, "+91 98765 43210"),
          _infoRow(Icons.cake_outlined, "12 March 2008"),
          _infoRow(Icons.school_outlined, "Delhi Public School"),
          _infoRow(Icons.location_on_outlined,
              "Sector 21, New Delhi – 110001"),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  STATS ROW
  // ─────────────────────────────────────────────

  Widget _statsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _statBox(context, "92%", "Attendance", Icons.event_available,
                const Color(0xFF22C55E))),
        const SizedBox(width: 12),
        Expanded(
            child: _statBox(context, "87%", "Avg Marks", Icons.bar_chart,
                const Color(0xFF3B66F5))),
        const SizedBox(width: 12),
        Expanded(
            child: _statBox(context, "#3", "Class Rank",
                Icons.emoji_events_outlined, const Color(0xFFF59E0B))),
      ],
    );
  }

  Widget _statBox(BuildContext context, String value, String label,
      IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: RFont.size(context, 14, tablet: 16, desktop: 18),
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  RANK CARD
  // ─────────────────────────────────────────────

  Widget _rankCard(BuildContext context) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(Icons.emoji_events_outlined, "Dashboard Rank"),
          const SizedBox(height: 14),

          _rankRow("Class Rank", "#3", "out of 42", const Color(0xFF3B66F5)),
          const SizedBox(height: 10),
          _rankRow("School Rank", "#12", "out of 380", const Color(0xFFF59E0B)),
          const SizedBox(height: 10),
          _rankRow(
              "District Rank", "#45", "out of 2400", const Color(0xFF22C55E)),

          const SizedBox(height: 16),

          // Progress bar
          Text(
            "Overall Performance",
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.87,
              minHeight: 10,
              backgroundColor: const Color(0xFFE6EAF5),
              valueColor:
              const AlwaysStoppedAnimation<Color>(Color(0xFF3B66F5)),
            ),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "87%",
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF3B66F5)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rankRow(String label, String rank, String sub, Color color) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.leaderboard_outlined, color: color, size: 18),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              rank,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            Text(
              sub,
              style: GoogleFonts.poppins(
                  fontSize: 10, color: Colors.grey.shade400),
            ),
          ],
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  REGISTRATION DATA CARD
  // ─────────────────────────────────────────────

  Widget _registrationCard(BuildContext context) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(Icons.assignment_outlined, "Registration Details"),
          const SizedBox(height: 14),

          _detailGrid(context, [
            ["Roll Number", "DPS-2024-1087"],
            ["Registration ID", "REG-2024-XJ99"],
            ["Admission Date", "01 April 2024"],
            ["Board", "CBSE"],
            ["Stream", "Science (PCM)"],
            ["Medium", "English"],
            ["Father's Name", "Anil Sharma"],
            ["Mother's Name", "Sunita Sharma"],
          ]),
        ],
      ),
    );
  }

  Widget _detailGrid(BuildContext context, List<List<String>> items) {
    final isWide =
        ScreenHelper.isTablet(context) || ScreenHelper.isDesktop(context);
    final rows = <Widget>[];

    for (var i = 0; i < items.length; i += (isWide ? 2 : 1)) {
      final rowItems = items.sublist(
          i, (i + (isWide ? 2 : 1)).clamp(0, items.length));
      rows.add(
        Row(
          children: rowItems.map((item) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item[0],
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      item[1],
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1D2E),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    return Column(children: rows);
  }

  // ─────────────────────────────────────────────
  //  SUBJECTS CARD
  // ─────────────────────────────────────────────

  Widget _subjectsCard(BuildContext context) {
    final subjects = [
      {"name": "Mathematics", "marks": 94, "max": 100},
      {"name": "Physics", "marks": 88, "max": 100},
      {"name": "Chemistry", "marks": 82, "max": 100},
      {"name": "English", "marks": 90, "max": 100},
      {"name": "Computer Science", "marks": 96, "max": 100},
    ];

    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(Icons.menu_book_outlined, "Subject Marks"),
          const SizedBox(height: 14),
          ...subjects.map((s) {
            final pct = (s["marks"] as int) / (s["max"] as int);
            final color = pct >= 0.9
                ? const Color(0xFF22C55E)
                : pct >= 0.75
                ? const Color(0xFF3B66F5)
                : const Color(0xFFF59E0B);

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        s["name"] as String,
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${s["marks"]} / ${s["max"]}",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: pct,
                      minHeight: 7,
                      backgroundColor: const Color(0xFFE6EAF5),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  DOCUMENTS CARD
  // ─────────────────────────────────────────────

  Widget _documentsCard(BuildContext context) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(Icons.folder_outlined, "Uploaded Documents"),
          const SizedBox(height: 14),
          _docItem(Icons.badge_outlined, "Aadhar Card", "Verified",
              const Color(0xFF22C55E)),
          _docItem(Icons.image_outlined, "Passport Photo", "Verified",
              const Color(0xFF22C55E)),
          _docItem(Icons.description_outlined, "Previous Marksheet", "Pending",
              const Color(0xFFF59E0B)),
        ],
      ),
    );
  }

  Widget _docItem(
      IconData icon, String title, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF1FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF3B66F5), size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  HELPERS
  // ─────────────────────────────────────────────

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _sectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF3B66F5), size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A1D2E),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade400),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF1FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF3B66F5),
        ),
      ),
    );
  }
}