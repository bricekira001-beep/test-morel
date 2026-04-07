import 'package:flutter/material.dart';

import '../widgets/message_bubble.dart';

/// Écran de conversation entre l'utilisateur et un contact.
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.contact});

  final Map<String, dynamic> contact;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static const Color rougeFonce = Color(0xFFC62828);
  static const Color rougeVif = Color(0xFFFF5252);
  static const Color fondChat = Color(0xFFFDECEA);

  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> _messages = [
    {'text': 'Salut, tu vas bien ?', 'time': '09:30', 'isMe': false},
    {'text': 'Oui super, et toi ?', 'time': '09:31', 'isMe': true},
    {'text': 'Très bien 😊 On finalise la maquette ce matin ?', 'time': '09:33', 'isMe': false},
    {'text': 'Parfait, je t’envoie tout dans 15 minutes.', 'time': '09:34', 'isMe': true},
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isEmpty) return;

    setState(() {
      _messages.add({
        'text': message,
        'time': TimeOfDay.now().format(context),
        'isMe': true,
      });
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondChat,
      appBar: AppBar(
        backgroundColor: rougeFonce,
        leadingWidth: 32,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: widget.contact['avatarColor'] as Color,
              child: Text(
                widget.contact['initials'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contact['name'] as String,
                  style: const TextStyle(fontSize: 16),
                ),
                const Text(
                  'en ligne',
                  style: TextStyle(fontSize: 12, color: Color(0xFFFFCDD2)),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(
                  text: message['text'] as String,
                  time: message['time'] as String,
                  isMe: message['isMe'] as bool,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
            color: Colors.white,
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    color: Colors.grey.shade700,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                hintText: 'Écrire un message...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt_outlined),
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: rougeVif,
                    child: IconButton(
                      onPressed: _sendMessage,
                      icon: const Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
