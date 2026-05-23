import 'package:class_champion/core/widget/responsive_font.dart';
import 'package:class_champion/core/widget/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {

  bool _register = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        /// DESKTOP + TABLET
        if (ScreenHelper.isDesktop(context) ||
            ScreenHelper.isTablet(context)) {
          return _DesktopTabletView(
            register: _register,
            onToggle: () {
              setState(() {
                _register = !_register;
              });
            },
          );
        }

        /// MOBILE
        return _MobileView(
          register: _register,
          onToggle: () {
            setState(() {
              _register = !_register;
            });
          },
        );
      },
    );
  }
}

/// ================= DESKTOP + TABLET =================
class _DesktopTabletView extends StatelessWidget {

  final bool register;
  final VoidCallback onToggle;

  const _DesktopTabletView({
    required this.register,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFF),

      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 60,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// LEFT SIDE
          Expanded(
            flex: 1,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    register ? "Register Now" : "Apply Now",

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

                Text(
                  register
                      ? "Create Your\nStudent Account"
                      : "Start Your\nScholarship Journey",

                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1.2,

                    fontSize: RFont.size(
                      context,
                      34,
                      tablet: 42,
                      desktop: 56,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  register
                      ? "Join Class Champion and start your scholarship journey with smart learning and mock tests."
                      : "Login and continue your scholarship journey with Class Champion platform.",

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

                Container(
                  height: 350,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "assets/image/shoolboy.jpg",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 60),

          /// RIGHT SIDE
          Expanded(
            flex: 1,
            child: register
                ? _RegisterForm(onToggle: onToggle)
                : _LoginForm(onToggle: onToggle),
          ),
        ],
      ),
    );
  }
}

/// ================= MOBILE VIEW =================
class _MobileView extends StatelessWidget {

  final bool register;
  final VoidCallback onToggle;

  const _MobileView({
    required this.register,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFF),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            decoration: BoxDecoration(
              color: const Color(0xFFF07E3F),
              borderRadius: BorderRadius.circular(30),
            ),

            child: Text(
              register ? "Register Now" : "Apply Now",

              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 25),

          Text(
            register
                ? "Create Your\nStudent Account"
                : "Start Your\nScholarship Journey",

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

          const SizedBox(height: 20),

          Text(
            register
                ? "Join Class Champion and start your scholarship journey."
                : "Login and continue your scholarship journey.",

            style: GoogleFonts.poppins(
              color: Colors.black54,
              height: 1.7,

              fontSize: RFont.size(
                context,
                14,
              ),
            ),
          ),

          const SizedBox(height: 35),

          Container(
            height: 220,
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),

              image: const DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  "assets/image/shoolboy.jpg",
                ),
              ),
            ),
          ),

          const SizedBox(height: 35),

          register
              ? _RegisterForm(onToggle: onToggle)
              : _LoginForm(onToggle: onToggle),
        ],
      ),
    );
  }
}

/// ================= LOGIN FORM =================
class _LoginForm extends StatefulWidget {

  final VoidCallback onToggle;

  const _LoginForm({
    required this.onToggle,
  });

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {

  bool isPasswordVisible = false;
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(35),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(30),

        border: Border.all(
          color: Colors.black12,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Sign In",

            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,

              fontSize: RFont.size(
                context,
                22,
                tablet: 24,
                desktop: 28,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Login to continue your scholarship journey",

            style: GoogleFonts.poppins(
              color: Colors.black54,

              fontSize: RFont.size(
                context,
                13,
                tablet: 14,
                desktop: 15,
              ),
            ),
          ),

          const SizedBox(height: 30),

          _buildField(
            context,
            "Email Address",
            Icons.email_outlined,
          ),

          const SizedBox(height: 20),

          TextFormField(
            obscureText: !isPasswordVisible,

            decoration: _inputDecoration(
              context,
              "Password",
              Icons.lock_outline,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },

                icon: Icon(
                  isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          /// TERMS
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Checkbox(
                value: isChecked,
                activeColor: const Color(0xFF3B66F5),

                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),

                  child: RichText(
                    text: TextSpan(
                      text: "I agree to the ",

                      style: GoogleFonts.poppins(
                        color: Colors.black54,

                        fontSize: RFont.size(
                          context,
                          12,
                          tablet: 13,
                          desktop: 14,
                        ),
                      ),

                      children: [

                        TextSpan(
                          text: "Terms & Conditions",

                          style: GoogleFonts.poppins(
                            color: const Color(0xFF3B66F5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        TextSpan(
                          text: " and ",

                          style: GoogleFonts.poppins(
                            color: Colors.black54,
                          ),
                        ),

                        TextSpan(
                          text: "Privacy Policy",

                          style: GoogleFonts.poppins(
                            color: const Color(0xFF3B66F5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B66F5),
                foregroundColor: Colors.white,
                elevation: 0,

                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),

              onPressed: () {},

              child: Text(
                "Sign In",

                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Center(
            child: InkWell(
              onTap: widget.onToggle,

              child: RichText(
                text: TextSpan(
                  text: "Don’t have an account? ",

                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                  ),

                  children: [
                    TextSpan(
                      text: "Register Now",

                      style: GoogleFonts.poppins(
                        color: const Color(0xFF3B66F5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= REGISTER FORM =================
class _RegisterForm extends StatefulWidget {

  final VoidCallback onToggle;

  const _RegisterForm({
    required this.onToggle,
  });

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(35),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),

        border: Border.all(
          color: Colors.black12,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Sign Up",

            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,

              fontSize: RFont.size(
                context,
                22,
                tablet: 24,
                desktop: 28,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Sign Up to continue your scholarship journey",

            style: GoogleFonts.poppins(
              color: Colors.black54,

              fontSize: RFont.size(
                context,
                13,
                tablet: 14,
                desktop: 15,
              ),
            ),
          ),

          const SizedBox(height: 30),

          _buildField(
            context,
            "Full Name",
            Icons.person_outline_rounded,
          ),

          const SizedBox(height: 20),

          _buildField(
            context,
            "Email Address",
            Icons.email_outlined,
          ),

          const SizedBox(height: 20),

          _buildField(
            context,
            "Phone Number",
            Icons.phone_outlined,
          ),

          const SizedBox(height: 20),

          TextFormField(
            obscureText: !isPasswordVisible,

            decoration: _inputDecoration(
              context,
              "Password",
              Icons.lock_outline_rounded,

              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },

                icon: Icon(
                  isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          TextFormField(
            obscureText: !isConfirmPasswordVisible,

            decoration: _inputDecoration(
              context,
              "Confirm Password",
              Icons.lock_outline_rounded,

              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isConfirmPasswordVisible =
                    !isConfirmPasswordVisible;
                  });
                },

                icon: Icon(
                  isConfirmPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          /// TERMS & CONDITIONS
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Checkbox(
                value: isChecked,
                activeColor: const Color(0xFF3B66F5),

                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),

                  child: RichText(
                    text: TextSpan(
                      text: "I agree to the ",

                      style: GoogleFonts.poppins(
                        color: Colors.black54,

                        fontSize: RFont.size(
                          context,
                          12,
                          tablet: 13,
                          desktop: 14,
                        ),
                      ),

                      children: [

                        TextSpan(
                          text: "Terms & Conditions",

                          style: GoogleFonts.poppins(
                            color: const Color(0xFF3B66F5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        TextSpan(
                          text: " and ",

                          style: GoogleFonts.poppins(
                            color: Colors.black54,
                          ),
                        ),

                        TextSpan(
                          text: "Privacy Policy",

                          style: GoogleFonts.poppins(
                            color: const Color(0xFF3B66F5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B66F5),
                foregroundColor: Colors.white,
                elevation: 0,

                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),

              onPressed: () {},

              child: Text(
                "Create Account",

                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Center(
            child: InkWell(
              onTap: widget.onToggle,

              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",

                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                  ),

                  children: [
                    TextSpan(
                      text: "Sign In",

                      style: GoogleFonts.poppins(
                        color: const Color(0xFF3B66F5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= COMMON FIELD =================
Widget _buildField(
    BuildContext context,
    String hint,
    IconData icon,
    ) {
  return TextFormField(
    decoration: _inputDecoration(
      context,
      hint,
      icon,
    ),
  );
}

/// ================= INPUT DECORATION =================
InputDecoration _inputDecoration(
    BuildContext context,
    String hint,
    IconData icon, {
      Widget? suffixIcon,
    }) {
  return InputDecoration(
    hintText: hint,

    hintStyle: GoogleFonts.poppins(
      color: Colors.black45,

      fontSize: RFont.size(
        context,
        13,
        tablet: 14,
        desktop: 15,
      ),
    ),

    prefixIcon: Icon(
      icon,
      color: Colors.black54,
    ),

    suffixIcon: suffixIcon,

    filled: true,
    fillColor: Colors.grey.shade100,

    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
  );
}