import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileCardApp());
}

// ---- Simple color palette so everything stays consistent ----
class AppColors {
  static const primary = Color(0xFF2563EB); // deep blue
  static const primaryDark = Color(0xFF1E40AF);
  static const accent = Color(0xFF60A5FA); // lighter blue
  static const background = Color(0xFFF3F6FB);
  static const cardWhite = Colors.white;
  static const textDark = Color(0xFF1F2937);
  static const textGrey = Color(0xFF6B7280);
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ---- Gradient header replaces the plain AppBar ----
          SliverAppBar(
            expandedHeight: 90,
            pinned: true,
            elevation: 0,
            backgroundColor: AppColors.primary,
            centerTitle: true,
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryDark, AppColors.primary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
              child: Column(
                children: [
                  _ProfileCard(),
                  const SizedBox(height: 20),
                  _EditProfileButton(),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textGrey,
        backgroundColor: Colors.white,
        elevation: 8,
        iconSize: 26,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.10),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // ---- Avatar with a subtle ring + online badge ----
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.accent, AppColors.primaryDark],
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 56,
                    backgroundImage: AssetImage("assets/images/bule.jpg"),
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            "Blessings Mtonga",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 6),

          // ---- Role shown as a pill/chip instead of plain text ----
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Flutter Developer",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            "Passionate about building beautiful and meaningful mobile applications.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: 14,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 20),
          const Divider(height: 1, color: Color(0xFFE5E7EB)),
          const SizedBox(height: 12),

          _ContactTile(
            icon: Icons.email_rounded,
            title: "Email",
            subtitle: "blessingsmtonga362@gmail.com",
          ),
          _ContactTile(
            icon: Icons.phone_rounded,
            title: "Phone",
            subtitle: "+265 992 708 855",
          ),
          _ContactTile(
            icon: Icons.location_on_rounded,
            title: "Location",
            subtitle: "Blantyre, Malawi",
          ),
          _ContactTile(
            icon: Icons.calendar_month_rounded,
            title: "Joined",
            subtitle: "July 2025",
            showDivider: false,
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showDivider;

  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.primary, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(height: 1, color: Color(0xFFF1F1F1)),
      ],
    );
  }
}

class _EditProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.edit_rounded, size: 20),
        label: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: AppColors.primary.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}