import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: profileAsync.when(
        data: (profile) {
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${profile.name.firstname} ${profile.name.lastname}'.toUpperCase(),
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    _buildInfoCard(
                      context,
                      title: 'Contact Information',
                      children: [
                        _buildInfoRow(Icons.email, 'Email', profile.email),
                        const Divider(),
                        _buildInfoRow(Icons.phone, 'Phone', profile.phone),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard(
                      context,
                      title: 'Address',
                      children: [
                        _buildInfoRow(
                          Icons.location_on,
                          'Location',
                          '${profile.address.number} ${profile.address.street}\n${profile.address.city}, ${profile.address.zipcode}',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.red[50],
                        foregroundColor: Colors.red,
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout'),
                      onPressed: () async {
                        await ref.read(authProvider.notifier).logout();
                        if (!context.mounted) return;
                        
                        if (ref.read(authProvider).hasError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed to logout. Please try again.')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) {
          final message = error is Failure ? error.message : error.toString();
          return CustomErrorWidget(
            message: message,
            onRetry: () {
              ref.invalidate(profileNotifierProvider);
            },
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, {required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
