import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';

import 'widgets/logout_button.dart';
import 'widgets/profile_picture.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de usuario'),
        actions: [
          const LogoutButton()
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding
            ),
            child: Hero(
              tag: 'profile',
              child: const ProfilePicture()
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.key_rounded, color: Colors.blueAccent),
            title: const Text('Cambiar contraseña'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.person_rounded, color: Colors.amberAccent),
            title: const Text('Datos personales'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.school_rounded, color: Colors.teal),
            title: const Text('Datos escolares'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(thickness: 3),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.person_off_rounded, color: Colors.redAccent),
            title: const Text('Borrar cuenta'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      )
    );
  }
}