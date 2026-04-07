import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/contact_tile.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';

/// Écran d'accueil : liste des conversations avec onglets.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color rougeFonce = Color(0xFFC62828);
  static const Color rougeVif = Color(0xFFFF5252);

  static final List<Map<String, dynamic>> _contacts = [
    {
      'name': 'Aminata Kouamé',
      'message': 'Salut 👋, on se voit cet après-midi ?',
      'time': '09:42',
      'unread': 2,
      'initials': 'AK',
      'avatarColor': const Color(0xFF8E24AA),
      'online': true,
    },
    {
      'name': 'Koffi Yao',
      'message': 'J’ai envoyé les documents du projet.',
      'time': '08:15',
      'unread': 0,
      'initials': 'KY',
      'avatarColor': const Color(0xFF1565C0),
      'online': true,
    },
    {
      'name': 'Sarah N’Guessan',
      'message': 'Merci pour ton retour, c’est parfait 😊',
      'time': 'Hier',
      'unread': 5,
      'initials': 'SN',
      'avatarColor': const Color(0xFF00897B),
      'online': false,
    },
    {
      'name': 'Groupe Flutter CI',
      'message': 'Réunion technique déplacée à 16h.',
      'time': 'Hier',
      'unread': 1,
      'initials': 'GF',
      'avatarColor': const Color(0xFFF57C00),
      'online': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: rougeFonce,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('ChatApp'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_outline),
                tooltip: 'Profil',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xFFFFCDD2),
              tabs: [
                Tab(text: 'Statuts'),
                Tab(text: 'Discussions'),
                Tab(text: 'Appels'),
              ],
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 14),
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        'Rechercher une conversation...',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _PlaceholderTab(icon: Icons.timelapse, label: 'Aucun statut récent'),
                    ListView.separated(
                      itemCount: _contacts.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final contact = _contacts[index];
                        return ContactTile(
                          name: contact['name'] as String,
                          lastMessage: contact['message'] as String,
                          time: contact['time'] as String,
                          unreadCount: contact['unread'] as int,
                          initials: contact['initials'] as String,
                          avatarColor: contact['avatarColor'] as Color,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChatScreen(contact: contact),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    _PlaceholderTab(icon: Icons.call_outlined, label: 'Aucun appel récent'),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: rougeVif,
            foregroundColor: Colors.white,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 52, color: Colors.grey.shade400),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}
