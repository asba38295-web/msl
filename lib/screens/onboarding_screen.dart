import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("assets/onboarding1.jpg", fit: BoxFit.cover),
          ),

          /// Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
          ),

          /// Animated Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              curve: Curves.easeOut,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Logo
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 30, end: 0),
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, value),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      "assets/logo_white.png",
                      width: 159,
                      height: 39,
                    ),
                  ),

                  SizedBox(height: 8),

                  /// Title
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 30, end: 0),
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, value),
                        child: child,
                      );
                    },
                    child: Text(
                      "Quick Delivery !",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 5),

                  /// Subtitle
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 30, end: 0),
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, value),
                        child: child,
                      );
                    },
                    child: Text(
                      "Packages across the world",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  ),

                  Spacer(),

                  /// Button Animation
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 40, end: 0),
                    duration: Duration(milliseconds: 900),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, value),
                        child: Opacity(opacity: opacity, child: child),
                      );
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            237,
                            76,
                            40,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 30,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => AuthScreen()),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Get Started",
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
