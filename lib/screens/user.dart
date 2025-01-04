import 'package:agrisense/main.dart';
import 'package:flutter/material.dart';
import 'package:agrisense/screens/login.dart'; // Import your login.dart file

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserData userData = UserData();
    return Scaffold(
      backgroundColor: Color(0xFF3E2723), // Dark brown background
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "${userData.username}",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,  // Light text on dark background
                      ),
                    ),
                    const SizedBox(height: 8),
                    _ProfileInfoCard(
                      icon: Icons.email,
                      label: "Email",
                      value: "${userData.email}",
                    ),
                    const SizedBox(height: 8),
                    _ProfileInfoCard(
                      icon: Icons.account_circle,
                      label: "Account Type",
                      value: "Admin",
                    ),
                    const SizedBox(height: 8),
                    _ProfileInfoCard(
                      icon: Icons.phone,
                      label: "Contact Number",
                      value: "${userData.number}",
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Show logout success dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color(0xFF3E2723),  // Dark brown dialog
                              title: const Text("Logout Successful", style: TextStyle(color: Colors.white)),
                              content: const Text("You have successfully logged out.", style: TextStyle(color: Colors.white)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                    // Navigate to the login screen
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage1()),
                                    );
                                  },
                                  child: const Text("OK", style: TextStyle(color: Color(0xFFB57C55))),  // Peach color for the button text
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Log Out',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFB57C55),  // Peach color for the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
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

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipPath(
          clipper: _TopClipper(),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF6D4C41),  // Light brown background for the top portion
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF3E2723),  // Dark brown circle for profile picture
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/userProf.png')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFB57C55),  // Peach color for the edit icon
                    child: Icon(Icons.edit, color: Colors.white),  // Edit icon for user profile
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.85);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileInfoCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF4E342E),  // Dark brown card to match the theme
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFFB57C55)),  // Peach color icons
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.white,  // White text color
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[400],  // Lighter text for value
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
