import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/shared/index.dart' show BottomSheets;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/delete_account_bottom_sheet.dart';
import 'components/edit_personal_data_bottom_sheet.dart';
import 'components/edit_school_data_bottom_sheet.dart';
import 'components/update_password_bottom_sheet.dart';
import 'widgets/logout_button.dart';
import 'widgets/notificactions_list_tile.dart';
import 'widgets/profile_picture.dart';

class ProfileScreen extends StatelessWidget with PlatformFunctions {
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
          if (isMobile())
            const NotificactionsListTile(),
          ListTile(
            onTap: () => BottomSheets.openBottomSheet(context, const UpdatePasswordBottomSheet(), isDesktop()),
            leading: const Icon(Icons.key_rounded, color: Colors.blueAccent),
            title: const Text('Cambiar contraseña'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () => context.pushNamed('forgot-password-home'),
            leading: const Icon(Icons.password_rounded, color: Colors.pinkAccent),
            title: const Text('Reestablecer contraseña'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(thickness: 3),
          ListTile(
            onTap: () => BottomSheets.openBottomSheet(context, const EditPersonalDataBottomSheet(), isDesktop()),
            leading: const Icon(Icons.person_rounded, color: Colors.deepOrange),
            title: const Text('Datos personales'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () => BottomSheets.openBottomSheet(context, const EditSchoolDataBottomSheet(), isDesktop()),
            leading: const Icon(Icons.school_rounded, color: Colors.teal),
            title: const Text('Datos escolares'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(thickness: 3),
          ListTile(
            onTap: () => BottomSheets.openBottomSheet(context, const DeleteAccountBottomSheet(), isDesktop()),
            leading: const Icon(Icons.person_off_rounded, color: Colors.redAccent),
            title: const Text('Borrar cuenta'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      )
    );
  }
}