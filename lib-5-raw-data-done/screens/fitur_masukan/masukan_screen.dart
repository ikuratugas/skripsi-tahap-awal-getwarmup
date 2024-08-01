import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';

class MasukanScreen extends StatelessWidget {
  const MasukanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PelangganProvider>(
        builder: (context, pelangganProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Customer Feedback'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: pelangganProvider.chatDariUser.length,
          itemBuilder: (context, index) {
            final chatDariUser = pelangganProvider.chatDariUser[index];
            return ChatBubble(message: chatDariUser.isiChat);
          },
        ),
      );
    });
  }
}

class ChatBubble extends StatelessWidget {
  final String message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 254, 180),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Positioned(
              left: 0,
              top: 15,
              child: CustomPaint(
                painter: ChatBubbleArrowPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubbleArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 254, 180)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(10, 10)
      ..lineTo(20, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
