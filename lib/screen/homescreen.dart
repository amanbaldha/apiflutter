import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart ';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Rest API Call")),
        backgroundColor: Colors.grey.shade400,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          final user = users[index];
          final email = user['email'];
          return ListTile(
            title: Text(email),
          );
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
      ),
    );
  }


  void fetchUser() async {
    print('fetchUser Called');
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('fatchUser Completed');
  }
}