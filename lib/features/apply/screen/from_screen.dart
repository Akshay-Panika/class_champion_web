import 'package:class_champion/core/widget/responsive_font.dart';
import 'package:class_champion/core/widget/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),

      appBar: AppBar(
        title: Text(
          "Student Application",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: RFont.size(context, 12,tablet: 14,desktop: 16)),
        ),
        backgroundColor: const Color(0xFF3B66F5),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              // ── Basic Details ──────────────────────────────────────────
              _sectionCard(
                icon: Icons.person_outline_rounded,
                title: "Basic Details",
                children: [

                  // Photo + Fields side by side (tablet/desktop)
                  // Stacked on mobile
                  ScreenHelper.isMobile(context)
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _photoPlaceholder(),
                      const SizedBox(height: 12),
                      _field(Icons.person, "Full Name"),
                      _field(Icons.email_outlined, "Email"),
                      _responsiveRow(
                        context,
                        _field(Icons.phone_outlined, "Phone Number"),
                        _field(Icons.calendar_today, "Date of Birth"),
                      ),
                      _field(Icons.school_outlined, "School / College Name"),

                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Left: fields
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _responsiveRow(
                              context,
                              _field(Icons.person, "Full Name"),
                              _field(Icons.email_outlined, "Email"),
                            ),
                            _responsiveRow(
                              context,
                              _field(Icons.phone_outlined, "Phone Number"),
                              _field(Icons.calendar_today, "Date of Birth"),
                            ),
                            _field(Icons.school_outlined, "School / College Name"),

                          ],
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Right: photo placeholder — aligned to top
                      _photoPlaceholder(),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ── Address Details ────────────────────────────────────────
              _sectionCard(
                icon: Icons.location_on_outlined,
                title: "Address Details",
                children: [

                  _responsiveRow(
                    context,
                    _field(Icons.home_outlined, "Address Line 1"),
                    _field(Icons.location_city_outlined, "City"),
                  ),

                  _responsiveRow(
                    context,
                    _field(Icons.map_outlined, "State"),
                    _field(Icons.pin_drop_outlined, "Pincode"),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ── Upload Documents ───────────────────────────────────────
              _sectionCard(
                icon: Icons.upload_file_rounded,
                title: "Upload Documents",
                children: [
                  _docCard(Icons.badge_outlined, "Aadhar Card"),
                  _docCard(Icons.image_outlined, "Passport Photo"),
                  _docCard(Icons.description_outlined, "Previous Marksheet"),
                ],
              ),

              const SizedBox(height: 30),

              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  // ── Photo Placeholder ──────────────────────────────────────────────────
  Widget _photoPlaceholder() {
    return Column(
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F3FF),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFD0D8F5), width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_a_photo_outlined,
                  size: 36, color: Colors.grey.shade500),
              const SizedBox(height: 8),
              Text(
                "Upload Photo",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),

        Text(
          "Max size: 2MB\nJPG, PNG only",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: Colors.grey.shade400,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // ── Section Card ───────────────────────────────────────────────────────
  Widget _sectionCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(icon, color: const Color(0xFF3B66F5)),
              const SizedBox(width: 8),

              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: RFont.size(context, 12, tablet: 14, desktop: 14),
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1D2E),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),
          Divider(color: const Color(0xFFE6EAF5), thickness: 1),
          const SizedBox(height: 10),

          ...children,
        ],
      ),
    );
  }

  // ── Responsive Row ─────────────────────────────────────────────────────
  Widget _responsiveRow(BuildContext context, Widget a, Widget b) {
    return ScreenHelper.isMobile(context)
        ? Column(children: [a, b])
        : Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: a),
        const SizedBox(width: 12),
        Expanded(child: b),
      ],
    );
  }

  // ── Text Field ─────────────────────────────────────────────────────────
  Widget _field(IconData icon, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: TextFormField(
        style: GoogleFonts.poppins(fontSize: 14),

        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.grey.shade400,
          ),

          prefixIcon: Icon(icon, color: Colors.grey.shade500, size: 20),

          filled: true,
          fillColor: const Color(0xFFF8FAFF),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE6EAF5)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
            const BorderSide(color: Color(0xFF3B66F5), width: 1.5),
          ),
        ),
      ),
    );
  }

  // ── Document Upload Card ───────────────────────────────────────────────
  Widget _docCard(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),

      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF5)),
      ),

      child: Row(
        children: [

          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF1FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF3B66F5), size: 20),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: const Color(0xFF1A1D2E),
                  ),
                ),
                Text(
                  "PDF, JPG, PNG up to 5MB",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B66F5),
              foregroundColor: Colors.white,
              padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            onPressed: () {},
            icon: const Icon(Icons.upload, size: 16),
            label: Text(
              "Upload",
              style: GoogleFonts.poppins(
                fontSize: RFont.size(context, 12,tablet: 14,desktop: 14),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Submit Button ──────────────────────────────────────────────────────
  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B66F5),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),

        onPressed: () {},

        icon: const Icon(Icons.check_circle_outline,
            color: Colors.white, size: 20),
        label: Text(
          "Submit Application",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: RFont.size(context, 14,tablet: 14,desktop: 16),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}