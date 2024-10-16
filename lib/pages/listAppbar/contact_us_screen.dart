import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hazem Abdelhamed Shohoud"),
                Text("Hazemabdelhammed@gmail.comn"),
                Text("01090585287"),
                const Divider(),
                Text("Mahmoud Elrobey"),
                Text("hodaroby1987@gmail.comn"),
                Text("01228730810"),
                const Divider(),
                Text("Amin Mamdouh"),
                Text("mamdouhahmed010678@gmail.comn"),
                Text("01090585287"),
                const Divider(),
                Text("Mahmoud al azazy"),
                Text("malazy101@gmail.comn"),
                Text("01090585287"),
                const Divider(),
                Text("ahmed elkazaz"),
                Text("ahmedelkazaz39@gmail.comn"),
                Text("01090585287"),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
