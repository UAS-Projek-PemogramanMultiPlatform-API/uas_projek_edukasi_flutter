import 'package:flutter/material.dart';

class ForumDiscussionPage extends StatefulWidget {
  const ForumDiscussionPage({super.key});

  @override
  _ForumDiscussionPageState createState() => _ForumDiscussionPageState();
}

class _ForumDiscussionPageState extends State<ForumDiscussionPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'sender': 'user',
          'timestamp': DateTime.now().toIso8601String(),
        });
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum Diskusi'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: message['sender'] == 'user' ? Colors.blue : Colors.green,
                    child: Text(message['sender'] == 'user' ? 'U' : 'M'),
                  ),
                  title: Text(message['text'] ?? ''),
                  subtitle: Text(
                    _formatTimestamp(message['timestamp'] ?? ''),
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    final DateTime dateTime = DateTime.parse(timestamp);
    final String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    return formattedDate;
  }
}
