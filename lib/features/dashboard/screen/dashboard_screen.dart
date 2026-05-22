import 'package:class_champion/core/widget/responsive_font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/widget/screen_helper.dart';
import '../../apply/screen/apply_screen.dart';
import '../../footer/screen/footer_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../practice_overview/screen/practice_overview_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int selectedIndex = 0;

  /// MOBILE MENU
  bool isMenuOpen = false;

  /// SCROLL CONTROLLER
  final ScrollController _scrollController = ScrollController();

  /// FOOTER KEY
  final GlobalKey footerKey = GlobalKey();

  final List<Widget> navScreen = [
    const HomeScreen(),
    const PracticeOverviewScreen(),
    const ApplyScreen(),
  ];

  /// SCROLL TO TOP
  void scrollTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  /// SCROLL TO FOOTER
  void scrollToFooter() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = footerKey.currentContext;

      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  /// NAVIGATION BUTTON
  Widget navButton(
      String title,
      VoidCallback onTap,
      ) {
    return TextButton(
      onPressed: onTap,

      child: Text(
        title,

        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final bool isDesktop = ScreenHelper.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        controller: _scrollController,

        slivers: [

          /// APP BAR
          SliverAppBar(
            floating: true,
            // pinned: true,
            toolbarHeight: isMenuOpen && !isDesktop ? 300 : 80,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 100 : 12, vertical: 10,),

                padding: const EdgeInsets.symmetric(horizontal: 20,),

                decoration: BoxDecoration(
                  color: Color(0xFF3B66F5),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  mainAxisAlignment: isMenuOpen ? MainAxisAlignment.start :MainAxisAlignment.center,

                  children: [

                    if(isMenuOpen)
                    SizedBox(height: 14,),

                    /// TOP NAVBAR
                    Row(
                      mainAxisAlignment:
                      isDesktop
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.spaceBetween,

                      children: [

                        /// LOGO
                        Row(
                          children: [

                            const Icon(
                              Icons.school,
                              color: Colors.white,
                            ),

                            const SizedBox(width: 10),

                            Text(
                              'Class Champion',

                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: RFont.size(context, 14,tablet: 14,desktop: 16),
                              ),
                            ),
                          ],
                        ),

                        /// DESKTOP MENU
                        if (isDesktop)
                          Row(
                            children: [

                              navButton(
                                "Home",
                                    () {
                                  setState(() {
                                    selectedIndex = 0;
                                  });

                                  scrollTop();
                                },
                              ),

                              navButton(
                                "Practice Overview",
                                    () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });

                                  scrollTop();
                                },
                              ),

                              navButton(
                                "Contact Us",
                                    () {
                                  setState(() {
                                    selectedIndex = 0;
                                  });

                                  scrollToFooter();
                                },
                              ),

                              navButton(
                                "Apply",
                                    () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });

                                  scrollTop();
                                },
                              ),

                              const SizedBox(width: 20),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue,
                                ),

                                onPressed: () {},

                                child: Text(
                                  "Language",

                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF3B66F5),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        /// MOBILE MENU ICON
                        if (!isDesktop)
                          Row(
                            children: [

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue,
                                ),

                                onPressed: () {},

                                child: Text(
                                  "Language",

                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: RFont.size(context, 12,tablet: 14,desktop: 16)
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isMenuOpen = !isMenuOpen;
                                  });
                                },

                                child: Icon(
                                  isMenuOpen
                                      ? Icons.close
                                      : Icons.menu,
                                  color: Colors.blue,
                                ),
                              ),


                            ],
                          ),
                      ],
                    ),

                    /// MOBILE DROPDOWN MENU
                    if (!isDesktop && isMenuOpen)
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(vertical: 10,),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: Column(
                          children: [

                            /// HOME
                            mobileMenuButton(
                              title: "Home",
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                  isMenuOpen = false;
                                });

                                scrollTop();
                              },
                            ),

                            /// PRACTICE
                            mobileMenuButton(
                              title: "Practice Overview",
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                  isMenuOpen = false;
                                });

                                scrollTop();
                              },
                            ),

                            /// CONTACT
                            mobileMenuButton(
                              title: "Contact Us",
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                  isMenuOpen = false;
                                });

                                scrollToFooter();
                              },
                            ),

                            /// APPLY
                            mobileMenuButton(
                              title: "Apply",
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                  isMenuOpen = false;
                                });

                                scrollTop();
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          /// BODY
          SliverToBoxAdapter(
            child: Column(
              children: [

                navScreen[selectedIndex],

                /// FOOTER
                Container(
                  key: footerKey,
                  child: const FooterScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// MOBILE MENU BUTTON
  Widget mobileMenuButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),

        child: Text(
          title,

          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}