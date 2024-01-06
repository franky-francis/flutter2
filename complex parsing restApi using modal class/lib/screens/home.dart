import 'package:flutter/material.dart';

import '../modal/user.dart';
import '../services/user_api.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(

            title: Text(user.fullName),
            subtitle: Text(user.location.postcode),


          );
        },

      ),

    );
  }

  Future<void> fetchUsers() async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}