import 'package:flutter/material.dart';
import 'package:project_raihan2/services/auth_service.dart';
import 'package:project_raihan2/page/auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Selamat datang di halaman Home!"),
      ),
    );
  }
}
