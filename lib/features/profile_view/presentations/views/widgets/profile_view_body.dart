import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/core/utils/app_router.dart';
import 'package:shoping_app/features/profile_view/presentations/views/widgets/profile_header.dart';
import 'package:shoping_app/features/profile_view/presentations/views/widgets/profile_info_row.dart';
import 'package:shoping_app/features/profile_view/presentations/views/widgets/profile_password_row.dart';
import '../../../../auth/data/save_data.dart';
import 'custom_app_bar_profile.dart'; //

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}
class _ProfileViewBodyState extends State<ProfileViewBody> {
  Map<String, String?> userData = {};
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  Future<void> _loadUserData() async {
    try {
      final data = await getUserData();
      setState(() {
        userData = data;
      });
    } catch (e) {
      log('Error loading user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBarProfile(),
      body: userData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _buildProfileContent(),
    );
  }

  Widget _buildProfileContent() {
    final userName = userData['name'] ?? 'User Name';
    final initials = _getInitials(userName);

    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(userName: userName, initials: initials),
          const SizedBox(height: 60),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ProfileInfoRow(
              icon: Icons.email,
              label: 'Email',
              value: userData['email'] ?? 'N/A',
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),

            child: ProfileInfoRow(
              icon: Icons.phone,
              label: 'Phone Number',
              value: userData['phoneNumber'] ?? 'N/A',
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),

            child: ProfileInfoRow(
              icon: Icons.link,
              label: 'Website',
              value: 'www.${_extractEmailPartFromUserData(userData['email'])}',
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ProfilePasswordRow(
              label: 'Password',
              value: userData['password'] ?? 'N/A',
              isVisible: isVisible,
              onToggleVisibility: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLogin);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Helper to get initials
  String _getInitials(String name) {
    final parts = name.split(' ');
    final initials = parts.map((part) => part.isNotEmpty ? part[0] : '').take(2).join();
    return initials.toUpperCase();
  }

  // Helper to extract the part after @ in email
  String _extractEmailPartFromUserData(String? email) {
    if (email == null || !email.contains('@')) return 'N/A';
    return email.split('@').last;
  }
}
