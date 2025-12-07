import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          /// Top curved image
          ClipPath(
            clipper: TopCurveClipper(),
            child: Image.asset(
              "assets/onboarding2.jpg",
              width: screenWidth,
              height: screenHeight * 0.5,
              fit: BoxFit.cover,
            ),
          ),

          /// Logo above the image
          Positioned(
            top: screenHeight * 0.35,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/mersoul.png",
                width: screenWidth * 0.09,
                height: screenHeight * 0.035,
              ),
            ),
          ),

          /// Buttons section
          Column(
            children: [
              SizedBox(height: screenHeight * 0.57),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
                child: Column(
                  children: [
                    // ======== Se Connecter ========
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.login,
                        size: screenWidth * 0.06,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Se Connecter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.040,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFED4B28),
                        minimumSize: Size(double.infinity, screenHeight * 0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // ======== S'inscrire ========
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.person_add,
                        size: screenWidth * 0.06,
                        color: Colors.white,
                      ),
                      label: Text(
                        "S'inscrire",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.040,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFED4B28),
                        minimumSize: Size(double.infinity, screenHeight * 0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: screenHeight * 0.035),

                    Image.asset("assets/logo.png", width: screenWidth * 0.25),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - size.height * 0.19);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - size.height * 0.19,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
