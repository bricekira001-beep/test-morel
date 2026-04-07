import 'package:flutter/material.dart';

/// Écran de profil utilisateur.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color rougeFonce = Color(0xFFC62828);
  static const Color rougeVif = Color(0xFFFF5252);

  bool notificationsActivees = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: rougeFonce,
        title: const Text('Mon profil'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: rougeFonce,
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: rougeVif,
                  child: Text(
                    'MO',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Mariam Ouattara',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Disponible',
                  style: TextStyle(color: Color(0xFFFFCDD2)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const ListTile(
                  leading: Icon(Icons.phone, color: rougeFonce),
                  title: Text('Téléphone'),
                  subtitle: Text('+225 07 00 00 00 00'),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.info_outline, color: rougeFonce),
                  title: Text('Statut'),
                  subtitle: Text('Disponible pour discuter'),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.notifications_active, color: rougeFonce),
                  title: const Text('Notifications'),
                  value: notificationsActivees,
                  activeColor: rougeVif,
                  onChanged: (value) {
                    setState(() {
                      notificationsActivees = value;
                    });
                  },
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.lock_outline, color: rougeFonce),
                  title: Text('Confidentialité'),
                  subtitle: Text('Contacts uniquement'),
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            minimum: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: rougeFonce,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text('Se déconnecter'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
