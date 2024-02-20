import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _currentIndex = 0; // 0 for "Clients", 1 for "Requests"

  List<ChatInfo> clientChats = [
    ChatInfo(name: 'Client 1', message: 'Hello, how are you?'),
    ChatInfo(name: 'Client 2', message: 'Hi! I need help.'),
    // Add more client chat information as needed
  ];

  List<ChatInfo> requestChats = [
    ChatInfo(name: 'Request 1', message: 'Can I make a reservation?'),
    ChatInfo(name: 'Request 2', message: 'I need information about a product.'),
    // Add more request chat information as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F4F2),
        toolbarHeight: 1, // Adjust the height of the AppBar
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: _currentIndex == 0 ? Color(0xE8DBD3).withOpacity(0.75) : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0, // Elimina la elevación
                      shadowColor: Colors.transparent, // Elimina la sombra
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Clients',
                      style: TextStyle(
                        color: _currentIndex == 0 ? Colors.black : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: _currentIndex == 1 ? Color(0xE8DBD3).withOpacity(0.75) : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0, // Elimina la elevación
                      shadowColor: Colors.transparent, // Elimina la sombra
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Requests',
                      style: TextStyle(
                        color: _currentIndex == 1 ? Colors.black : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _currentIndex == 0 ? clientChats.length : requestChats.length,
              itemBuilder: (context, index) {
                final chatInfo = _currentIndex == 0 ? clientChats[index] : requestChats[index];
                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Text(chatInfo.name),
                    subtitle: Text(chatInfo.message),
                    // Add more elements as needed
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatInfo {
  final String name;
  final String message;

  ChatInfo({required this.name, required this.message});
}
